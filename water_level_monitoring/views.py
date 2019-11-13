from turtledemo import clock

from pygame import mixer

import requests
import datetime

from django.contrib import messages
from django.core.mail import EmailMessage
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect, get_object_or_404

#####################

# Create your views here.
from django.utils.html import strip_tags
from background_task import background
from gtts import gTTS


from apps.settings import MEDIA_ROOT
from employee1.models import MineDetails
from water_level_monitoring.forms import add_water_sensor_form
from water_level_monitoring.models import water_level_monitoring_model, water_level_monitoring_data_acquisition_model

whcount = 1
wmcount = 1
wlcount = 1
def add_water_sensor(request):

    if request.method == 'POST':
        form = add_water_sensor_form(request.POST)
        if form.is_valid():
            form.save()
            return redirect('water_level_monitoring:manage_water_sensor')
    else:
        form = add_water_sensor_form()
    return render(request, "add_water_sensor.html", {'form': form})

def manage_water_sensor(request):
    water_level_sensor_details = water_level_monitoring_model.objects.all().order_by('-id')
    return render(request, "manage_water_sensor.html",{"water_level_sensor_details":water_level_sensor_details})

def edit_water_sensor(request,id):
    data = get_object_or_404(water_level_monitoring_model, id=id)
    form = add_water_sensor_form(request.POST or None, request.FILES or None, instance=data)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            return redirect('water_level_monitoring:manage_water_sensor')
    return render(request, "edit_water_sensor.html", {'form': form})

def delete_water_sensor(request,id):
    delete_water_sensor_data = water_level_monitoring_model.objects.filter(id=id)
    delete_water_sensor_data.delete()

    return redirect('water_level_monitoring:manage_water_sensor')

def fetch_location_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        location_details = water_level_monitoring_model.objects.values_list().filter(mine_id=mine_id)

        data = {}
        i = 0
        location_data = []
        for r in location_details:
            location_data.append(str(r[0]) + ',' + str(r[2]))
            i = i + 1
        data['result'] = location_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)

def show_graph_water_sensor(request):
    form = add_water_sensor_form()
    return render(request, "show_graph_water_sensor.html",{"form":form})

def fetch_sensor_details(request):# fetch IP address and water level only (For graph)
    data = {}
    if request.is_ajax():
        id = request.GET.get('id', None)
        location_details = water_level_monitoring_model.objects.values_list().filter(id=id)
        data = {}
        i = 0
        location_data = []
        for r in location_details:
            print(r)
            location_data.append(str(r[13])+','+str(r[4])+','+str(r[5])+','+str(r[6])+','+str(r[3]))
            i = i + 1
        data['result'] = location_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)

def fetch_water_level_ajax(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        id = request.POST.get('id', None)
        sensor_details = water_level_monitoring_model.objects.get(id=id)
        mine_details = MineDetails.objects.get(id=sensor_details.mine_id_id)

        ok_date = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        try:
            response = requests.get('http://' + str(sensor_details.ip_address))
            sensor_val = strip_tags(response.text)
            # sensor_val=0.3
            if (sensor_val):
                sensor_data.append(str(sensor_details.id) + ',' + str(sensor_details.ip_address) + ',' + ok_date + ',' + str(
                        mine_details.name) + ',' + str(sensor_details.area_name) + ','  + str(float(sensor_val)) )
            else:
                sensor_data.append(
                    str(sensor_details.id) + ',' + str(sensor_details.ip_address) + ',' + ok_date + ',' + str(
                        mine_details.name) + ',' + str(sensor_details.area_name) +  ',' + 'No Data' )

        except Exception as x:
            sensor_data.append(
                str(sensor_details.id) + ',' + str(sensor_details.ip_address) + ',' + ok_date + ',' + str(
                    mine_details.name) + ',' + str(sensor_details.area_name) + ',' + 'Error')
        data['result'] = sensor_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)

def start_save_water_data(request,id):
    run_back_save(id, repeat=5)
    messages.success(request, 'Sensor data acquisition has been started')
    return redirect('water_level_monitoring:manage_water_sensor')

def push_mail(mail_subject="",mail_html_content=""):
    email = EmailMessage(mail_subject, mail_html_content, "", ['shyamd148@gmail.com'])
    email.content_subtype = "html"
    #res = email.send()
@background(schedule=5)
def  run_back_save(id):
    print("===============Water message start=========================")
    new_inst = water_level_monitoring_data_acquisition_model()
    new_inst.sensor_id = id
    new_inst.sensor_value = '0.00'
    sensor_details = water_level_monitoring_model.objects.get(id=id)
    global whcount
    global wmcount
    global wlcount
    try:
        response = requests.get('http://' + str(sensor_details.ip_address))
        sensor_val = strip_tags(response.text)
        if (sensor_val):
            new_inst.sensor_value = str(float(sensor_val))
        else:
            new_inst.sensor_value = 'No Data'
    except Exception as x:
        new_inst.sensor_value = 'Network Error'
    new_inst.save()
    print(new_inst.sensor_value)
    h_range = float(sensor_details.distance_bet_roof_and_water) - float(sensor_details.alarm_water_level_3)
    m_range = float(sensor_details.distance_bet_roof_and_water) - float(sensor_details.alarm_water_level_2)
    l_range = float(sensor_details.distance_bet_roof_and_water) - float(sensor_details.alarm_water_level_1)
    water = float(sensor_details.distance_bet_roof_and_water) - float(sensor_val)
    if (new_inst.sensor_value != "Network Error"):
        if (float(h_range) > float(new_inst.sensor_value)):#high
            mail_subject = "WATER WARNING MESSAGES - High"
            mail_html_content = "Water Level Warning : High Warning level. current value is " + str(water)
            push_mail(mail_subject, mail_html_content)
            mixer.init()
            if (sensor_details.audio_play_type == "mp3only"):
                mixer.music.load(MEDIA_ROOT + "/" + str(sensor_details.level_3_audio))
            else:
                msg = sensor_details.level_3_msg
                tts = gTTS(text=msg, lang='en')
                tts.save(f"media/water_warning_audio/highTextWarning{whcount%2}.mp3")
                mixer.music.load(MEDIA_ROOT + f"/water_warning_audio/highTextWarning{whcount%2}.mp3")
            mixer.music.play()
            whcount += 1

        elif ((float(m_range) > (float(new_inst.sensor_value))) and ((float(new_inst.sensor_value)) > float(h_range))):#medium
            mail_subject = "WATER WARNING MESSAGES - Medium"
            mail_html_content = "Water Level Warning : Medium Warning level. current value is " + str(water)
            push_mail(mail_subject, mail_html_content)
            mixer.init()
            if (sensor_details.audio_play_type == "mp3only"):
                mixer.music.load(MEDIA_ROOT + "/" + str(sensor_details.level_2_audio))
            else:
                msg = sensor_details.level_2_msg
                tts = gTTS(text=msg, lang='en')
                tts.save(f"media/water_warning_audio/mediumTextWarning{wmcount%2}.mp3")
                mixer.music.load(MEDIA_ROOT + f"/water_warning_audio/mediumTextWarning{wmcount%2}.mp3")
            mixer.music.play()
            wmcount += 1

        elif ((float(l_range) > (float(new_inst.sensor_value))) and ((float(new_inst.sensor_value)) < float(l_range))):#low
            mail_subject = "WATER WARNING MESSAGES - Low"
            mail_html_content = "Water Level Warning : Low Warning level. current value is " + str(water)
            push_mail(mail_subject, mail_html_content)
            mixer.init()
            if (sensor_details.audio_play_type == "mp3only"):
                mixer.music.load(MEDIA_ROOT + "/" + str(sensor_details.level_2_audio))
            else:
                msg = sensor_details.level_1_msg
                tts = gTTS(text=msg, lang='en')
                tts.save(f"media/water_warning_audio/lowTextWarning{wlcount%2}.mp3")
                mixer.music.load(MEDIA_ROOT + f"/water_warning_audio/lowTextWarning{wlcount%2}.mp3")
            mixer.music.play()
            wlcount += 1
    else:
        print("error")
    print("====================Water end=======")

def live_data_water_sensor(request):
    form = add_water_sensor_form()
    return render(request, "live_data_water_sensor.html", {"form": form})

def water_data_bet_two_datetime(request):
    form = add_water_sensor_form()
    return render(request,"water_data_bet_two_datetime.html",{"form":form})

def fetch_water_data_bet_two_datetime(request):
    prepared_data = []
    data = {}
    if request.is_ajax():
        #id=6&date_from=2019-08-06+12%3A00%3A00&date_to=2019-08-07+12%3A00%3A00 500 (Internal Server Error)
        location = request.GET.get('id', None)
        date_from = request.GET.get('date_from', None)
        date_to = request.GET.get('date_to', None)
        # location = 6
        # date_from = "2019-08-06 12:00:00"
        # date_to = "2019-08-07 12:00:00"

        a = date_from + '.000000'
        b = date_to + '.000000'
        from_d = datetime.datetime.strptime(a, '%Y-%m-%d %H:%M:%S.%f')
        from_t = datetime.datetime.strptime(b, '%Y-%m-%d %H:%M:%S.%f')
        from_d = from_d.replace(microsecond=000000)
        from_t = from_t.replace(microsecond=999999)


        water_level_data_details = water_level_monitoring_model.objects.get(id=location)
        mine_details = MineDetails.objects.get(id=water_level_data_details.mine_id_id)
        # print("============================================================================================================")
        # print(water_level_data_details)
        # print("============================================================================================================")
        # print(mine_details)


        water_data_details = water_level_monitoring_data_acquisition_model.objects.values_list().filter(sensor_id=location).filter(created_date__range=(from_d, from_t)).order_by('-id')
        #print(water_data_details.query)
        #
        for r in water_data_details:
            #print(r[3])
            # c_date = datetime.datetime.strptime(str(r[3], '%Y-%m-%d %H:%M:%S'))
            prepared_data.append(str(r[3]) + ',' + mine_details.name + ',' + water_level_data_details.area_name + ',' + str(r[2]))

        data['result'] = prepared_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)
def graph_water_data_bet_two_datetime(request):
    form = add_water_sensor_form()
    return render(request, "graph_water_data_bet_two_datetime.html", {"form": form})