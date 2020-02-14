from datetime import datetime, timedelta
from email.message import EmailMessage

from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect

# Create your views here.
import requests

from Strata.models import Strata_sensor_data, Strata_sensor
from setting.forms import setting_form
from setting.models import setting
from django.shortcuts import get_list_or_404, get_object_or_404
from django.http import HttpResponse, JsonResponse
from django.db.models import Max
from django.utils.html import strip_tags

from water_level_monitoring.models import water_level_monitoring_model, water_level_monitoring_data_acquisition_model


@login_required
def add_constant(request):
    if request.method == "POST":
        form = setting_form(request.POST)
        if form.is_valid():
            form.save()
            return redirect('setting:manage_constant')
        else:
            print("Form Invalid")
    else:
        form = setting_form()
    return render(request, "add_constant.html", {'form': form})


@login_required
def manage_constant(request):
    return_data = setting.objects.all().order_by('-id')
    return render(request, "manage_constant.html", {'return_data': return_data})


def edit_constant(request, id):
    base_data = get_object_or_404(setting, id=id)
    form = setting_form(request.POST or None, request.FILES or None, instance=base_data)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('setting:manage_constant')
    return render(request, "edit_constant.html", {'form': form})


def delete_constant(request, id):
    base_column = setting.objects.get(id=id)
    base_column.delete()
    return redirect('setting:manage_constant')


# =====================  Hit URL on each times  =========================================================================

def globalWarningFunction(request):
    return_data = []
    """===============================Strata monitoring================================================="""
    try:
        is_strata_display_warning = setting.objects.get(name="is_strata_display_warning").value
    except setting.DoesNotExist:
        is_strata_display_warning = 0

    try:
        is_strata_audio = setting.objects.get(name="is_strata_audio").value
    except setting.DoesNotExist:
        is_strata_audio = 0

    try:
        is_strata_light = setting.objects.get(name='is_strata_light').value
    except setting.DoesNotExist:
        is_strata_light = 0

    try:
        is_strata_sms = setting.objects.get(name='is_strata_sms').value
    except setting.DoesNotExist:
        is_strata_sms = 0

    try:
        is_strata_email = setting.objects.get(name='is_strata_email').value
    except setting.DoesNotExist:
        is_strata_email = 0


    strata_mail_subject = "Strata Monitoring "

    sensor_table_details = Strata_sensor.objects.all().order_by("id")

    if (sensor_table_details):
        for strata_data in sensor_table_details:
            strata_data_current = []
            sensor_data = Strata_sensor_data.objects.filter(sensor_id=strata_data.id).order_by("-id").first()
            current_sensor_value = 0
            current_date_time = datetime.now()
            if (sensor_data):  # Alteast one data should be save in database
                if ((sensor_data.created_date >= (datetime.now() - timedelta(minutes=15))) and (
                        sensor_data.sensor_value != "Network Error")):
                    current_sensor_value = sensor_data.sensor_value
                    current_date_time = sensor_data.created_date
                else:
                    try:
                        response = requests.get('http://' + str(strata_data.ip_address))
                        sensor_val = strip_tags(response.text)
                        if (sensor_val):
                            current_sensor_value = str(float(sensor_val))

                    except Exception as x:
                        pass
            else:
                try:
                    response = requests.get('http://' + str(strata_data.ip_address))
                    sensor_val = strip_tags(response.text)
                    if (sensor_val):
                        current_sensor_value = str(float(sensor_val))

                except Exception as x:
                    pass
            # === Validate sensor value from thresold value ========
            if ((float(strata_data.level_1_warning_unit) < float(current_sensor_value)) and (
                    float(current_sensor_value) < float(strata_data.level_2_warning_unit))):  # low level
                is_strata_light = 0
                strata_data_current.append(
                    {"module_type": "strata","is_strata_display_warning": is_strata_display_warning,"is_strata_audio":is_strata_audio,"is_strata_light":is_strata_light,
                     "datetime": str(current_date_time.strftime("%d-%m-%Y %H:%M:%S")),"location": str(strata_data.location_id), "sensor_name": strata_data.sensor_name, "warning_level": "Low",
                     "value": current_sensor_value, "audio_text": strata_data.level_1_msg,
                     "audio_song": str(strata_data.level_1_audio), "audio_play_type": strata_data.audio_play_type})
                if (is_strata_email):
                    strata_mail_subject = strata_mail_subject + "- Low"
                    mail_html_content = "Location" + str(strata_data.location_id) + "has cross low warning level"
                    push_mail(strata_mail_subject, mail_html_content)

            elif ((float(strata_data.level_2_warning_unit) < float(current_sensor_value)) and (
                    float(current_sensor_value) < float(strata_data.level_3_warning_unit))):  # medium level
                print("Medium")
                strata_data_current.append(
                    {"module_type": "strata","is_strata_display_warning": is_strata_display_warning,"is_strata_audio":is_strata_audio,"is_strata_light":is_strata_light,"datetime": str(current_date_time.strftime("%d-%m-%Y %H:%M:%S")),"location": str(strata_data.location_id),"sensor_name": strata_data.sensor_name,
                     "warning_level": "Medium",
                     "value": current_sensor_value, "audio_text": strata_data.level_2_msg,
                     "audio_song": str(strata_data.level_2_audio), "audio_play_type": strata_data.audio_play_type})

                if (is_strata_email):
                    strata_mail_subject = strata_mail_subject + "- Medium"
                    mail_html_content = "Location" + str(strata_data.location_id) + "has cross medium warning level"
                    push_mail(strata_mail_subject, mail_html_content)

            elif (float(current_sensor_value) > float(strata_data.level_3_warning_unit)):  # high level
                print("High")
                strata_data_current.append(
                    {"module_type": "strata","is_strata_display_warning": is_strata_display_warning,"is_strata_audio":is_strata_audio,"is_strata_light":is_strata_light,"datetime": str(current_date_time.strftime("%d-%m-%Y %H:%M:%S")),"location": str(strata_data.location_id),"sensor_name": strata_data.sensor_name, "warning_level": "High",
                     "value": current_sensor_value, "audio_text": strata_data.level_3_msg,
                     "audio_song": str(strata_data.level_3_audio),
                     "audio_play_type": strata_data.audio_play_type})
                if (is_strata_email):
                    strata_mail_subject = strata_mail_subject + "- High"
                    mail_html_content = "Location" + str(strata_data.location_id) + "has cross high warning level"
                    push_mail(strata_mail_subject, mail_html_content)
            else:
                is_strata_light_off = 1
                strata_data_current.append(
                    {"module_type": "strata","is_strata_light_off": is_strata_light_off})
            # === Validation end =======================================
            return_data.append(strata_data_current)
            # if condition end which check data have exist or not in Database
        # loop end
        """==================================Strata monitoring End================================================="""
        """==================================Water monitoring Start================================================="""
        water_sensor_details = water_level_monitoring_model.objects.all().order_by("id")

        try:
            is_water_display_warning = setting.objects.get(name='is_water_display_warning').value
        except setting.DoesNotExist:
            is_water_display_warning = 0

        try:
            is_water_audio = setting.objects.get(name='is_water_audio').value
        except setting.DoesNotExist:
            is_water_audio = 0

        try:
            is_water_light = setting.objects.get(name='is_water_light').value
        except setting.DoesNotExist:
            is_water_light = 0

        try:
            is_water_sms = setting.objects.get(name='is_water_sms').value
        except setting.DoesNotExist:
            is_water_sms = 0

        try:
            is_water_email = setting.objects.get(name='is_water_email').value
        except setting.DoesNotExist:
            is_water_email = 0


        water_mail_subject = "Water Level Monitoring"

        if (water_sensor_details):

            for water_data in water_sensor_details:
                water_data_current = []
                water_sensor_data = water_level_monitoring_data_acquisition_model.objects.filter(
                    sensor_id=water_data.id).order_by("-id").first()
                water_current_sensor_value = water_data.distance_bet_roof_and_water
                current_water_date_time = datetime.now()

                if (water_sensor_data):  # Alteast one data should be save in database
                    if ((water_sensor_data.created_date >= (datetime.now() - timedelta(minutes=15))) and (
                            water_sensor_data.sensor_value != "Network Error")):
                        water_current_sensor_value = water_sensor_data.sensor_value
                        current_water_date_time = water_sensor_data.created_date
                    else:
                        try:
                            response = requests.get('http://' + str(water_data.ip_address))
                            water_sensor_val = strip_tags(response.text)
                            if (water_sensor_val):
                                water_current_sensor_value = str(float(water_sensor_val))
                        except Exception as x:
                            pass
                else:
                    try:
                        response = requests.get('http://' + str(water_data.ip_address))
                        water_sensor_val = strip_tags(response.text)
                        if (water_sensor_val):
                            water_current_sensor_value = str(float(water_sensor_val))

                    except Exception as x:
                        pass

                # === Validate sensor value from thresold value ========

                h_range = float(water_data.distance_bet_roof_and_water) - float(water_data.alarm_water_level_3)
                m_range = float(water_data.distance_bet_roof_and_water) - float(water_data.alarm_water_level_2)
                l_range = float(water_data.distance_bet_roof_and_water) - float(water_data.alarm_water_level_1)
                water_value = float(water_data.distance_bet_roof_and_water) - float(water_current_sensor_value)# current value show in graph

                if (float(h_range) > float(water_current_sensor_value)):  # high
                    water_data_current.append(
                        {"module_type": "water","is_water_display_warning": is_water_display_warning, "is_water_audio":is_water_audio, "is_water_light":is_water_light,
                         "datetime": str(current_water_date_time.strftime("%d-%m-%Y %H:%M:%S")),"location": str(water_data.area_name),"sensor_name": "Water Level Monitoring",
                         "warning_level": "High",
                         "value": water_value, "audio_text": water_data.level_3_msg,
                         "audio_song": str(water_data.level_3_audio),
                         "audio_play_type": water_data.audio_play_type,
                         "pump_start":water_data.moter_start_level,"pump_end":water_data.moter_stop_level})
                    if(is_water_email):
                        water_mail_subject =water_mail_subject+ "- High"
                        mail_html_content = "Location" + str(water_data.area_name) + "has cross high warning level"
                        push_mail(water_mail_subject, mail_html_content)
                elif ((float(m_range) > (float(water_current_sensor_value))) and ((float(water_current_sensor_value)) > float(h_range))):  # medium
                    water_data_current.append(
                        {"module_type": "water","is_water_display_warning": is_water_display_warning,"is_water_audio":is_water_audio,"is_water_light":is_water_light,"datetime": str(current_water_date_time.strftime("%d-%m-%Y %H:%M:%S")), "location": str(water_data.area_name),"sensor_name": "Water Level Monitoring",
                         "warning_level": "Medium",
                         "value": water_value, "audio_text": water_data.level_2_msg,
                         "audio_song": str(water_data.level_2_audio),
                         "audio_play_type": water_data.audio_play_type,
                         "pump_start":water_data.moter_start_level,"pump_end":water_data.moter_stop_level})
                    if (is_water_email):
                        water_mail_subject = water_mail_subject + "- Medium"
                        mail_html_content = "Location" + str(water_data.area_name) + "has cross medium warning level"
                        push_mail(water_mail_subject, mail_html_content)
                elif ((float(l_range) > (float(water_current_sensor_value))) and ((float(water_current_sensor_value)) < float(l_range))):  # low
                    water_data_current.append(
                        {"module_type": "water","is_water_display_warning": is_water_display_warning,"is_water_audio":is_water_audio,"is_water_light":is_water_light,"datetime": str(current_water_date_time.strftime("%d-%m-%Y %H:%M:%S")), "location": str(water_data.area_name),"sensor_name": "Water Level Monitoring",
                         "warning_level": "High",
                         "value": water_value, "audio_text": water_data.level_1_msg,
                         "audio_song": str(water_data.level_1_audio),
                         "audio_play_type": water_data.audio_play_type,
                         "pump_start":water_data.moter_start_level,"pump_end":water_data.moter_stop_level})
                    if (is_water_email):
                        water_mail_subject = water_mail_subject + "- Low"
                        mail_html_content = "Location" + str(water_data.area_name) + "has cross low warning level"
                        push_mail(water_mail_subject, mail_html_content)
                else: # for pump start end because pump start and end
                    is_pump_stop = 1
                    water_data_current.append({"module_type": "water", "pump_start": water_data.moter_start_level, "pump_end": water_data.moter_stop_level,
                         "is_pump_stop": is_pump_stop})
                # === Validation end =======================================
                return_data.append(water_data_current)
            # loop end
    return JsonResponse(return_data, safe=False)
#==========================Mail function ===============================================================================
def push_mail(mail_subject="", mail_html_content=""):
    receiver_data = setting.objects.values_list().filter(name="receiver_email")
    for share in receiver_data:
        total_receiver = share[2].split(',')
        for loop_data in total_receiver:
            email = EmailMessage(mail_subject, mail_html_content, "", [loop_data])
            email.content_subtype = "html"
            res = email.send()



def change_language(request,lang):
    request.session['lang'] = str(lang)
    return redirect(request.META.get('HTTP_REFERER'))