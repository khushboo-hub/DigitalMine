import datetime

from datetime import datetime, timedelta
import requests
from django.contrib import messages

from django.contrib.auth.decorators import login_required
from django.core.mail import EmailMessage
from django.core.serializers import json
from django.db import connection
from django.db.models import Max
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, get_object_or_404
from django.utils.html import strip_tags
# from gtts import gTTS
from matplotlib._cm_listed import data
# from past.builtins import apply
from pyparsing import Group
from apps.settings import MEDIA_ROOT
from setting.models import setting
from water_level_monitoring.models import water_level_monitoring_model, water_level_monitoring_data_acquisition_model
from .forms import Slope_location_Form, Slope_sensor_Form, Live_data_tabular, Slope_sensor_flag_Form
from .models import Slope_location, MineDetails, Slope_sensor, Slope_sensor_data, Slope_sensor_flag
from background_task import background
# from pygame import mixer  # Load the required library
from django.shortcuts import render, redirect
from background_task.models import Task
from background_task.models_completed import CompletedTask
from django.utils import timezone

# from annoying.functions import get_object_or_None

# ====================================================================================================
# Function : (1) slope_add_location,
#            (2) slope_manage_location
#            (3) slope_edit_location
#            (4) slope_delete_location
#
# Purpose : CRUD functionality of location in Slope module

hcount = 1
mcount = 1
lcount = 1


@login_required
def convergence_add_location(request, template_name='Convergence1/add_location.html'):
    if request.method == 'POST':
        form = Slope_location_Form(request.POST)
        # print(form)
        if form.is_valid():
            ##attempting to add instances to our database
            mine_name = form.cleaned_data['mine_name']
            location_name = form.cleaned_data['location_name']
            tag_no = form.cleaned_data['tag_no']
            x_axis = form.cleaned_data['x_axis']
            y_axis = form.cleaned_data['y_axis']
            json_url = form.cleaned_data['json_url']
            description = form.cleaned_data['description']
            created_date = form.cleaned_data['created_date']

            Slope_location_inst = Slope_location()
            Slope_location_inst.mine_name = mine_name
            Slope_location_inst.location_name = location_name
            Slope_location_inst.tag_no = tag_no
            Slope_location_inst.x_axis = x_axis
            Slope_location_inst.y_axis = y_axis
            Slope_location_inst.json_url=json_url
            Slope_location_inst.description = description
            Slope_location_inst.created_date = created_date
            print(Slope_location_inst)

            Slope_location_inst.save()
            return redirect('Slope:convergence_manage_location')
        else:
            print("form is not valid")
    else:
        form = Slope_location_Form()
    return render(request, template_name, {'form': form})


@login_required
def convergence_manage_location(request, template_name='Convergence1/manage_location.html'):
    locations = Slope_location.objects.all()
    data = {}
    data['object_list'] = locations
    return render(request, template_name, data)


@login_required
def convergence_edit_location(request, pk, template_name='Convergence1/add_location.html'):
    book = get_object_or_404(Slope_location, pk=pk)
    form = Slope_location_Form(request.POST or None, instance=book)
    if form.is_valid():
        form.save()
        return redirect('Slope:convergence_manage_location')
    return render(request, template_name, {'form': form})


@login_required
def convergence_delete_location(request, pk):
    book = get_object_or_404(Slope_location, pk=pk)
    book.delete()
    return redirect('Slope:convergence_manage_location')


# =====================================================================================================

# =====================================================================================================
# Function : (1) add_sensor_in_location
#            (2) manage_sensor_in_location
#            (3) manage_sensor_in_location
#            (4) edit_sensor_in_location
#            (5) delete_sensor
# Purpose : CRUD functionality of sensor information in Slope module
# -----------------------------------------------------------------------------
@login_required
def add_sensor_in_location(request, template_name='Convergence1/add_sensor_in_location.html'):
    if request.method == 'POST':
        form = Slope_sensor_Form(request.POST, request.FILES)
        # print(form)
        if form.is_valid():
            form.save()
            return redirect('Slope:manage_sensor_in_location')
        else:
            print("form is not valid")
    else:
        form = Slope_sensor_Form()
    return render(request, template_name, {'form': form})


@login_required
def manage_sensor_in_location(request, template_name='Convergence1/manage_sensor_in_location.html'):
    sensors = Slope_sensor.objects.all()
    # print(sensors)
    data = {}
    prepared_data = []
    background_task = 0
    for s in sensors:
        background_task = 0
        try:
            task = Task.objects.get(task_name='Slope.views.run_back_save', task_params="[[" + str(s.id) + "], {}]",
                                    locked_at__isnull=True)
            background_task = 1
        except:
            pass

        # background_task.append({'id':task.id})
        try:
            location_table = Slope_location.objects.get(id=s.location_id_id)
            mine_table = MineDetails.objects.get(id=s.mine_name_id)
            prepared_data.append({'id': s.id,
                                  'mine': mine_table.name,
                                  'location': location_table.location_name,
                                  'sensor': s.sensor_name,
                                  'unit': s.sensor_unit,
                                  'tag': s.tag_no,
                                  'ip': s.ip_address,
                                  'background': background_task
                                  })
        except:
            pass

    data['result'] = prepared_data
    data['background'] = background_task

    return render(request, template_name, data)


@login_required
def edit_sensor_in_location(request, sensor_id):
    data = get_object_or_404(Slope_sensor, id=sensor_id)
    form = Slope_sensor_Form(request.POST or None, request.FILES or None, instance=data)

    if request.method == 'POST':
        if form.is_valid():
            form.save()
            return redirect('Slope:manage_sensor_in_location')
    return render(request, "Convergence1/edit_sensor_in_location.html", {'form': form})


@login_required
def delete_sensor(request, pk):
    book = get_object_or_404(Slope_sensor, pk=pk)
    book.delete()
    return redirect('Slope:manage_sensor_in_location')


# =======================================================================================================

# =======================================================================================================
# Function : fetch_location_ajax
# Purpose : choose location based on mine selection on add/edit sensor page.
# ----------------------------------------------------------------------------
def fetch_location_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        location = Slope_location.objects.filter(mine_name_id=mine_id)
        location_data = []
        for l in location:
            location_data.append({'id': l.id, 'name': l.location_name})
        data['result'] = location_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


# =======================================================================================================

# =======================================================================================================
# Function
@login_required
def live_data_tabular(request, template_name='Convergence1/live_data_tabular.html'):
    form = Live_data_tabular(request.POST)
    return render(request, template_name, {'form': form})


@login_required
def show_Slope_location(request, template_name='Convergence1/show_location.html'):
    form = Live_data_tabular(request.POST)
    return render(request, template_name, {'form': form})


def fetch_sensor_ajax(request):
    data = {}
    if request.is_ajax():
        location_id = request.GET.get('id', None)
        sensor = Slope_sensor.objects.filter(location_id=location_id)
        sensor_data = []
        for s in sensor:
            sensor_data.append({'id': s.id, 'name': s.sensor_name})
        data['result'] = sensor_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def get_data_from_node_mcu(request):
    data = {}
    sensor_data = []
    sensor_id = 2  ## hardcoded
    # sensor_id = request.GET.get('id', None)
    sensor_details = Slope_sensor.objects.get(id=sensor_id)
    print(sensor_details.ip_address)
    now = datetime.datetime.now()
    ok_date = (str(now.strftime('%Y-%m-%d %H:%M')))
    try:
        response = requests.get('http://' + str(sensor_details.ip_address))
        sensor_val = strip_tags(response.text)
        print(sensor_val)
        if (sensor_val):
            sensor_data.append(
                ok_date + ',' + str(sensor_details.mine_name_id) + ',' + str(sensor_details.location_id) + ',' + str(
                    sensor_details.id) + ',' + str(sensor_details.sensor_name) + ',' + str(
                    sensor_details.sensor_unit) + ',' + str(sensor_details.tag_no) + ',' + str(
                    sensor_details.ip_address) + ',' + str(float(sensor_val)))
        else:
            sensor_data.append(str(sensor_details.id) + ',' + str(sensor_details.ip_address) + ',' + 'No Data')
    except Exception as x:
        # print("catch me he " + str(x))
        sensor_data.append(str(sensor_details.id) + ',' + str(sensor_details.ip_address) + ',' + 'Network Error')
    data['result'] = sensor_data
    return JsonResponse(data)


def fetch_sensor_common_values_ajax(request):
    data = {}
    sensor_data = []
    if request.is_ajax():
        sensor_id = request.GET.get('id', None)
        # sensor_id = 13
        sensor_details = Slope_sensor.objects.get(id=sensor_id)
        if (sensor_details):
            sensor_data = {'id': str(sensor_details.id),
                           'unit': str(sensor_details.sensor_unit),
                           'ip': str(sensor_details.ip_address),
                           'level1': str(sensor_details.level_1_warning_unit),
                           'level2': str(sensor_details.level_2_warning_unit),
                           'level3': str(sensor_details.level_3_warning_unit),
                           'level1_color': str(sensor_details.level_1_color),
                           'level2_color': str(sensor_details.level_2_color),
                           'level3_color': str(sensor_details.level_3_color),
                           'level1_msg': str(sensor_details.level_1_msg),
                           'level2_msg': str(sensor_details.level_2_msg),
                           'level3_msg': str(sensor_details.level_3_msg),
                           'level1_audio': str(sensor_details.level_1_audio),
                           'level2_audio': str(sensor_details.level_2_audio),
                           'level3_audio': str(sensor_details.level_3_audio),
                           'audio_type': str(sensor_details.audio_play_type)
                           }
            # sensor_data.append(str(sensor_details.id) + '@#' +
            #                    str(sensor_details.sensor_unit) + '@#' +
            #                    str(sensor_details.level_1_warning_unit) + '@#' +
            #                    str(sensor_details.level_2_warning_unit) + '@#' +
            #                    str(sensor_details.level_3_warning_unit) + '@#' +
            #                    str(sensor_details.level_1_color) + '@#' +
            #                    str(sensor_details.level_2_color) + '@#' +
            #                    str(sensor_details.level_3_color) + '@#' +
            #                    str(sensor_details.ip_address) + '@#' +
            #                    str(sensor_details.level_1_msg) + '@#' +
            #                    str(sensor_details.level_2_msg) + '@#' +
            #                    str(sensor_details.level_3_msg) + '@#' +
            #                    str(sensor_details.level_1_audio) + '@#' +
            #                    str(sensor_details.level_2_audio) + '@#' +
            #                    str(sensor_details.level_3_audio) + '@#' +
            #                    str(sensor_details.audio_play_type) + '@#'
            #                    )
            data['result'] = sensor_data
        else:
            data['result'] = "No Data"
    else:
        data['result'] = "Not Ajax"

    return JsonResponse(data)


def fetch_sensor_values_ajax(request):
    data = {}
    sensor_data = []
    if request.is_ajax():

        sensor_id = request.GET.get('id', None)
        sensor_details = Slope_sensor.objects.get(id=sensor_id)
        mine_details = MineDetails.objects.get(id=sensor_details.mine_name_id)
        now = datetime.now()
        ok_date = (str(now.strftime('%Y-%m-%d %H:%M:%S')))

        try:
            response = requests.get('http://' + str(sensor_details.ip_address))
            sensor_val = strip_tags(response.text)
            if sensor_val:
                sensor_data = {'id': str(sensor_details.id),
                               'ip': str(sensor_details.ip_address),
                               'date': str(ok_date),
                               'mine': str(mine_details.name),
                               'location': str(sensor_details.location_id),
                               'sensor_name': str(sensor_details.sensor_name),
                               'unit': str(sensor_details.sensor_unit),
                               'sensor_value': str(sensor_val),
                               'tag': str(sensor_details.tag_no),
                               'audio_type': str(sensor_details.audio_play_type),
                               'first_warning_msg': str(sensor_details.level_1_msg),
                               'second_warning_msg': str(sensor_details.level_2_msg),
                               'third_warning_msg': str(sensor_details.level_3_msg),
                               'first_warning_audio': str(sensor_details.level_1_audio),
                               'second_warning_audio': str(sensor_details.level_2_audio),
                               'third_warning_audio': str(sensor_details.level_3_audio)}
            else:
                sensor_data = {'id': str(sensor_details.id),
                               'ip': str(sensor_details.ip_address),
                               'date': str(ok_date),
                               'mine': str(mine_details.name),
                               'location': str(sensor_details.location_id),
                               'sensor_name': str(sensor_details.sensor_name),
                               'unit': str(sensor_details.sensor_unit),
                               'sensor_value': 'No data',
                               'tag': str(sensor_details.tag_no),
                               'audio_type': str(sensor_details.audio_play_type),
                               'first_warning_msg': str(sensor_details.level_1_msg),
                               'second_warning_msg': str(sensor_details.level_2_msg),
                               'third_warning_msg': str(sensor_details.level_3_msg),
                               'first_warning_audio': str(sensor_details.level_1_audio),
                               'second_warning_audio': str(sensor_details.level_2_audio),
                               'third_warning_audio': str(sensor_details.level_3_audio)}


        except Exception as x:
            sensor_data = {'id': str(sensor_details.id),
                           'ip': str(sensor_details.ip_address),
                           'date': str(ok_date),
                           'mine': str(mine_details.name),
                           'location': str(sensor_details.location_id),
                           'sensor_name': str(sensor_details.sensor_name),
                           'unit': str(sensor_details.sensor_unit),
                           'sensor_value': 'Network Error',
                           'tag': str(sensor_details.tag_no),
                           'audio_type': str(sensor_details.audio_play_type),
                           'first_warning_msg': str(sensor_details.level_1_msg),
                           'second_warning_msg': str(sensor_details.level_2_msg),
                           'third_warning_msg': str(sensor_details.level_3_msg),
                           'first_warning_audio': str(sensor_details.level_1_audio),
                           'second_warning_audio': str(sensor_details.level_2_audio),
                           'third_warning_audio': str(sensor_details.level_3_audio)}

        data['result'] = sensor_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


# =======================================================================================================================
def fetch_sensor_details(request):
    data = {}
    sensor_data = []
    if request.is_ajax():
        sensor_id = request.GET.get('sensor_id', None)
        sensor_details = Slope_sensor.objects.get(id=sensor_id)
        if sensor_details:
            sensor_data = {'id': str(sensor_details.id),
                           'unit': str(sensor_details.sensor_unit),
                           'ip': str(sensor_details.ip_address),
                           'level1': str(sensor_details.level_1_warning_unit),
                           'level2': str(sensor_details.level_2_warning_unit),
                           'level3': str(sensor_details.level_3_warning_unit),
                           'level1_color': str(sensor_details.level_1_color),
                           'level2_color': str(sensor_details.level_2_color),
                           'level3_color': str(sensor_details.level_3_color),
                           'level1_msg': str(sensor_details.level_1_msg),
                           'level2_msg': str(sensor_details.level_2_msg),
                           'level3_msg': str(sensor_details.level_3_msg),
                           'level1_audio': str(sensor_details.level_1_audio),
                           'level2_audio': str(sensor_details.level_2_audio),
                           'level3_audio': str(sensor_details.level_3_audio),
                           'audio_type': str(sensor_details.audio_play_type)
                           }
            data['result'] = sensor_data

        else:
            data['result'] = "No Data!"
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


# =======================================================================================================================
@login_required
def show_sensor_graph(request, template_name='Convergence1/live_data_graph.html'):
    form = Live_data_tabular(request.POST)
    return render(request, template_name, {'form': form})


@login_required
def iframe_show_sensor_graph(request, mine_id, location_id, sensors_id,
                             template_name='Convergence1/iframe_live_data_graph.html'):
    availability = 0
    sensor_id = ""
    try:
        Slope = get_object_or_404(Slope_sensor, id=sensors_id, mine_name=mine_id, location_id=location_id)
        print(Slope)
        sensor_id = Slope.id
        availability = 1
    except:
        pass

    return render(request, template_name, {'availability': availability, 'sensor_id': sensor_id})


@background(schedule=5)
def run_back_save(sensor_id):
    print("===============Slope message start=========================")
    global hcount
    global mcount
    global lcount
    inst = Slope_sensor_data()
    inst.sensor_id = sensor_id
    inst.sensor_value = '0.00'
    sensor_details = Slope_sensor.objects.get(id=sensor_id)

    try:
        response = requests.get('http://' + str(sensor_details.ip_address))
        sensor_val = strip_tags(response.text)
        if (sensor_val):
            inst.sensor_value = str(float(sensor_val))
        else:
            inst.sensor_value = 'No Data'
    except Exception as x:
        inst.sensor_value = 'Network Error'
    inst.save()

    print(inst.sensor_value)
    # print("***** Data Saved *****")
    print("===============Slope message end=========================")


# =======================================================================================================================
# Function name : warning_level_information
# Purpose : Display alert message. this function call from ajax(base.py)
# =======================================================================================================================
def warning_level_information(request):  # for 1 for Slope 2 for water 3 for all+++++++++++++++++++++++ from front enf

    return_string = ""
    table = ""
    high = ""
    data = {}
    validation = request.GET.get('validation', None)

    if request.is_ajax():
        sensor_table_details = Slope_sensor_data.objects.values('sensor_id').order_by("sensor_id").annotate(
            max_id=Max('id'))
        table = '<table class="table table-striped"><thead><tr><th>Date-Time</th><th>Sensor Name / Type</th><th>Warning Level</th><th>Sensor value</th></tr></thead><tbody>'
        if (validation == 2):  # 2 means only  water should be display
            sensor_table_details = ""
        if (sensor_table_details):  # for Slope managemenet
            for loop in sensor_table_details:
                with connection.cursor() as cursor:
                    cursor.execute(
                        "select a.sensor_name,a.level_1_warning_unit,a.level_2_warning_unit,a.level_3_warning_unit, b.sensor_value,b.created_date,a.level_1_color,a.level_2_color,a.level_3_color,a.level_1_warning_unit,a.level_2_warning_unit,a.level_3_warning_unit,c.pause_waring_duration_end_datetime from Slope_sensor as a join Slope_sensor_data as b on a.id = b.sensor_id join Slope_sensor_flag as c on a.id = c.sensor_id where c.limit > 2 and b.id = %s",
                        [loop["max_id"]])
                    row = cursor.fetchone()
                    # print("select a.sensor_name,a.level_1_warning_unit,a.level_2_warning_unit,a.level_3_warning_unit, b.sensor_value,b.created_date,a.level_1_color,a.level_2_color,a.level_3_color,a.level_1_warning_unit,a.level_2_warning_unit,a.level_3_warning_unit,c.pause_waring_duration_end_datetime from Slope_sensor as a join Slope_sensor_data as b on a.id = b.sensor_id join Slope_sensor_flag as c on a.id = c.sensor_id where c.limit > 2 and b.id = %s",[loop["max_id"]])

                    if (row):
                        if (datetime.now() >= row[12]) and (row[5] >= (datetime.now() - timedelta(minutes=15))):
                            if (row[4] != "Network Error"):
                                if (row[3] < float(row[4])):  # for high
                                    return_string = return_string + "<tr class='danger'><td>" + str(
                                        row[5].strftime("%d-%m-%Y %H:%M:%S")) + "</td><td>" + str(
                                        row[0]) + "</td><td>HIGH</td><td>" + str(row[4]) + "</td></tr>"
                                    high = "high"
                                elif ((row[2] < float(row[4])) and (float(row[4]) < row[3])):  # for medium
                                    return_string = return_string + "<tr class='warning'><td>" + str(
                                        row[5].strftime("%d-%m-%Y %H:%M:%S")) + "</td><td>" + str(
                                        row[0]) + "</td><td>Medium</td><td>" + str(row[4]) + "</td></tr>"
                                elif ((row[1] < float(row[4])) and (float(row[4]) < row[2])):  # for low
                                    return_string = return_string + "<tr class='success'><td>" + str(
                                        row[5].strftime("%d-%m-%Y %H:%M:%S")) + "</td><td>" + str(
                                        row[0]) + "</td><td>Low</td><td>" + str(row[4]) + "</td></tr>"
                            elif (row[4] == "Network Error"):
                                return_string = return_string + "<tr class='Success'><td>" + str(
                                    row[5].strftime("%d-%m-%Y %H:%M:%S")) + "</td><td>" + str(
                                    row[0]) + "</td><td>" + str(row[4]) + "</td><td></td></tr>"
                    # else:
                    #    return_string = return_string + "<tr class='success'><td><b>Slope monitoing : </b>Data not saved from more then 15 minutes.</td><td></td><td></td><td></td></tr>"
        water_sensor_details = water_level_monitoring_model.objects.all().order_by("id")
        if (validation == 1):
            water_sensor_details = ""
        if (water_sensor_details):
            for water_data in water_sensor_details:
                sensor_data = water_level_monitoring_data_acquisition_model.objects.filter(
                    sensor_id=water_data.id).order_by("-id").first()
                if (sensor_data):
                    if (sensor_data.sensor_value == "Network Error"):
                        sensor_value = 0
                    else:
                        sensor_value = sensor_data.sensor_value
                else:
                    sensor_value = 0
                h_range = float(water_data.distance_bet_roof_and_water) - float(water_data.alarm_water_level_3)
                m_range = float(water_data.distance_bet_roof_and_water) - float(water_data.alarm_water_level_2)
                l_range = float(water_data.distance_bet_roof_and_water) - float(water_data.alarm_water_level_1)
                water = float(water_data.distance_bet_roof_and_water) - float(sensor_value)
                if (sensor_value != "Network Error"):
                    if (sensor_data.created_date):
                        if (datetime.now() >= sensor_data.created_date) and (
                                sensor_data.created_date >= (datetime.now() - timedelta(minutes=15))):
                            if ((float(water_data.moter_start_level) < float(water))):
                                high = "high"
                            if (float(h_range) > float(sensor_value)):  # high
                                return_string = return_string + "<tr class='danger'><td>" + str(
                                    sensor_data.created_date.strftime(
                                        "%d-%m-%Y %H:%M:%S")) + "</td><td>Water Level Monitoring</td><td>HIGH</td><td>" + str(
                                    water) + "</td></tr>"
                            elif ((float(m_range) > (float(sensor_value))) and (
                                    (float(sensor_value)) > float(h_range))):  # medium
                                return_string = return_string + "<tr class='warning'><td>" + str(
                                    sensor_data.created_date.strftime(
                                        "%d-%m-%Y %H:%M:%S")) + "</td><td>Water Level Monitoring</td><td>HIGH</td><td>" + str(
                                    water) + "</td></tr>"
                            elif ((float(l_range) > (float(sensor_value))) and (
                                    (float(sensor_value)) < float(l_range))):  # low
                                return_string = return_string + "<tr class='success'><td>" + str(
                                    sensor_data.created_date.strftime(
                                        "%d-%m-%Y %H:%M:%S")) + "</td><td>Water Level Monitoring</td><td>LOW</td><td>" + str(
                                    water) + "</td></tr>"
                        # else:
                        #    return_string = return_string + "<tr class='success'><td><b>Water monitoing : </b>Data not saved from more then 15 minutes</td><td></td><td></td><td></td></tr>"

        table += return_string + '</tbody></table>'
        # print(high)
    if (return_string):
        data['result'] = table
        data["light_result"] = high
    else:
        data['result'] = ""
        data["light_result"] = ""
    return JsonResponse(data)


def push_mail(mail_subject="", mail_html_content=""):
    receiver_data = setting.objects.values_list().filter(name="receiver_email")
    for share in receiver_data:
        total_receiver = share[2].split(',')
        for loop_data in total_receiver:
            email = EmailMessage(mail_subject, mail_html_content, "", [loop_data])
            email.content_subtype = "html"
            res = email.send()


def start_save_sensor(request, sensor_id, template_name='Convergence1/manage_sensor_in_location.html'):
    data = {}
    if request.is_ajax():
        try:
            task = Task.objects.filter(task_name='Slope.views.run_back_save',
                                       task_params="[[" + str(sensor_id) + "], {}]",
                                       locked_at__isnull=True)
            if task:
                task.delete()
            else:
                run_back_save(sensor_id, repeat=5)
            sensors = Slope_sensor.objects.all()
            data['result'] = "success"
        except:
            data['error'] = "error"
            pass
        return JsonResponse(data)

    data['error'] = "Not Ajax"
    return JsonResponse(data)
    #
    # data = {}
    # prepared_data = []
    # for s in sensors:
    #     location_table = Slope_location.objects.get(id=s.location_id_id)
    #     mine_table = MineDetails.objects.get(id=s.mine_name_id)
    #     prepared_data.append({'id': s.id,
    #                           'mine': mine_table.name,
    #                           'location': location_table.location_name,
    #                           'sensor': s.sensor_name,
    #                           'unit': s.sensor_unit,
    #                           'tag': s.tag_no,
    #                           'ip': s.ip_address,
    #                           })
    #
    # data['result'] = prepared_data
    # return redirect(request.META.get('HTTP_REFERER'))


@login_required
def date_range_tabular(request, template_name='Convergence1/date_range_tabular.html'):
    form = Live_data_tabular(request.POST)
    return render(request, template_name, {'form': form})


def fetch_sensor_date_range(request):
    data = {}
    if request.is_ajax():
        sensor_id = request.GET.get('id', None)
        date_from = request.GET.get('date_from', None)
        date_to = request.GET.get('date_to', None)
        # print("B Form Date:" + date_from + "B To Date:" + date_to)

        # data['result']=date_from
        # from_d = datetime.strptime('2018-12-26 00:00:00.000000', '%Y-%m-%d %H:%M:%S.%f')
        # from_t = datetime.strptime('2018-12-26 23:59:59.000000', '%Y-%m-%d %H:%M:%S.%f')
        # from_d = datetime.strptime(date_from+' 00:00:00.000000', '%Y-%m-%d %H:%M:%S.%f')
        # from_t = datetime.strptime(date_to+' 23:59:59.000000', '%Y-%m-%d %H:%M:%S.%f')

        from_d = datetime.strptime(date_from + '.000000', '%Y-%m-%d %H:%M:%S.%f')
        from_t = datetime.strptime(date_to + '.000000', '%Y-%m-%d %H:%M:%S.%f')
        from_d = from_d.replace(microsecond=000000)
        from_t = from_t.replace(microsecond=999999)

        sensor_details = Slope_sensor.objects.get(id=sensor_id)
        location_details = Slope_location.objects.get(id=sensor_details.location_id_id)
        mine_details = MineDetails.objects.get(id=sensor_details.mine_name_id)
        sensor_table_details = Slope_sensor_data.objects.filter(sensor_id=sensor_id).filter(
            created_date__range=(from_d, from_t)).order_by('-id')
        prepared_data = []
        for s in sensor_table_details:
            prepared_data.append({'date': str(s.created_date),
                                  'mine': str(mine_details.name),
                                  'location': str(location_details.location_name),
                                  'sensor': str(sensor_details.sensor_name),
                                  'sensor_value': str(s.sensor_value),
                                  'unit': str(sensor_details.sensor_unit),
                                  'tag': str(sensor_details.tag_no)})

        data['result'] = prepared_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def show_graph_date_range(request, template_name='Convergence1/date_range_graph.html'):
    form = Live_data_tabular(request.POST)
    return render(request, template_name, {'form': form})


def ajx_sensor_graph_date_range(request):
    data = {}
    if request.is_ajax():
        sensor_id = request.GET.get('id', None)
        date_from = request.GET.get('date_from', None)
        date_to = request.GET.get('date_to', None)
        from_d = datetime.strptime(date_from + ' 00:00:00.000000', '%Y-%m-%d %H:%M:%S.%f')
        from_t = datetime.strptime(date_to + ' 23:59:59.000000', '%Y-%m-%d %H:%M:%S.%f')

        sensor_details = Slope_sensor.objects.get(id=sensor_id)

        sensor_table_details = Slope_sensor_data.objects.values_list().filter(sensor_id=sensor_id).filter(
            created_date__range=(from_d, from_t))
        # print(sensor_table_details)
        prepared_data = []
        i = 0
        for r in sensor_table_details:
            # prepared_data.append([])
            # prepared_data.append(str(r[3]) + ',' + mine_details.name + ',' + location_details.location_name + ',' + sensor_details.sensor_name + ',' + str(r[2]) + ',' + sensor_details.sensor_unit + ',' + sensor_details.tag_no)
            if (str(r[2]) == 'Network Error'):
                pass
            else:
                import dateutil
                dt = dateutil.parser.parse(str(r[3])).date()
                prepared_data.append(str(dt) + ',' + str(r[2]))
            i = i + 1

        data['result'] = prepared_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def multi_sensor_warning(request):
    run_multi_sensor_validation(repeat=10)
    return HttpResponse("Multi sensor validation testing start")


@background(schedule=10)
def run_multi_sensor_validation():
    location_data = Slope_location.objects.all()
    if (location_data):
        for location in location_data:
            sensor_details = Slope_sensor.objects.filter(location_id=location.id)
            if (sensor_details):
                total_sensor = sensor_details.count()
                wherein_data = ""
                for sensor in sensor_details:
                    if (wherein_data):
                        wherein_data = wherein_data + "," + str(sensor.id)
                    else:
                        wherein_data = str(sensor.id)
                with connection.cursor() as cursor:
                    sql_query = 'select a.type as type,count(a.type) as total from Slope_sensor_flag as a where a.sensor_id in (' + wherein_data + ') group by a.type'
                    cursor.execute(sql_query)
                    row = cursor.fetchall()
                    if (row):
                        for base in row:
                            if (base[1] > (total_sensor / 2)):
                                if (str(base[0]) == "High"):
                                    mail_subject = "Slope WARNING MESSAGES - High"
                                    mail_html_content = "Location" + location.name + "has cross high warning level"
                                    push_mail(mail_subject, mail_html_content)
                                    # mixer.init()
                                # mixer.music.load(MEDIA_ROOT + "/" + str(sensor_details.level_3_audio))
                                # mixer.music.play()
                                if (base[0] == "Low"):
                                    mail_subject = "Slope WARNING MESSAGES - Low"
                                    mail_html_content = "Location" + location.name + "has cross low warning level"
                                    push_mail(mail_subject, mail_html_content)
                                    # mixer.init()
                                    # mixer.music.load(MEDIA_ROOT + "/" + str(sensor_details.level_1_audio))
                                    # mixer.music.play()
                                if (str(base[0]) == "Medium"):
                                    mail_subject = "Slope WARNING MESSAGES - Medium"
                                    mail_html_content = "Location" + location.name + "has cross medium warning level"
                                    push_mail(mail_subject, mail_html_content)
                                    # mixer.init()
                                    # mixer.music.load(MEDIA_ROOT + "/" + str(sensor_details.level_2_audio))
                                    # mixer.music.play()


def edit_sensor_in_location(request, sensor_id):
    data = get_object_or_404(Slope_sensor, id=sensor_id)
    form = Slope_sensor_Form(request.POST or None, request.FILES or None, instance=data)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            return redirect('Slope:manage_sensor_in_location')
    return render(request, "Convergence1/edit_sensor_in_location.html", {'form': form})


def audio_setting(request, sensor_id):
    sensor_details = Slope_sensor_flag.objects.filter(sensor_id=sensor_id)
    if sensor_details:
        data = get_object_or_404(Slope_sensor_flag, sensor_id=sensor_id)
        form = Slope_sensor_flag_Form(request.POST or None, instance=data)

        if request.method == 'POST':
            if form.is_valid():
                form.save()
            return redirect('Slope:manage_sensor_in_location')
    else:
        messages.info(request, 'First start data acquisition then you can set pause duration')
        return redirect('Slope:manage_sensor_in_location')
    return render(request, "Convergence1/audio_setting.html", {'form': form})


def fetch_map_image(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        mine_details = MineDetails.objects.values_list().filter(id=mine_id)

        data = {}
        mine_data = {}
        for r in mine_details:
            mine_data['id'] = str(r[0])
            mine_data['name'] = str(r[1])
            mine_data['image_url'] = str(r[6])
            mine_data['test1'] = str(r[7])

        data['result'] = mine_data
    # print(mine_data)
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)

def daily_report(request):
    return HttpResponse("Under Development")

def warning_report(request):
    return HttpResponse("Under Development")

#### Dewangshu Pandit -- for read JSON/MQTT files and display
# def show_json(request):
#     import urllib.request
#     import json

#     mydata={}
#     prepared_data=[]
#     with urllib.request.urlopen("http://www.json-generator.com/api/json/get/bVmyHPTRcO?indent=2") as url:
#         s = url.read()
#         # I'm guessing this would output the html source code ?
#         # print(s)
#         data = json.loads(s)
#         # data = json.dumps(s)
#         # print(data)

#         tm=data['tiltmeter']
#         prepared_data.append("http://www.json-generator.com/api/json/get/bVmyHPTRcO?indent=2")
#         prepared_data.append(tm)
#         prepared_data.append(data['inclinometer'])
#         prepared_data.append(data['pizometer'])
#         prepared_data.append(data['rainguage'])
#         mydata['all_sensor_data']=prepared_data
#     # return HttpResponse("ok")
#     return render(request, "Convergence1/show_json.html", mydata)



def show_json(request):
    import urllib.request
    import json

    mydata={}
    prepared_data=[]
    with urllib.request.urlopen("https://api.thingspeak.com/channels/695213/feeds.json?api_key=14VVLYUE1SWLQ76J&results=2") as url:
        s = url.read()
        # I'm guessing this would output the html source code ?
        # print(s)
        data = json.loads(s)
        # data = json.dumps(s)
        # print(data)

        # tm=data['feeds'][1]['field1']
        # print(tm)
        prepared_data.append("https://api.thingspeak.com/channels/695213/feeds.json?api_key=14VVLYUE1SWLQ76J&results=2")
        prepared_data.append(data['feeds'][1]['field1']) ## field1 means Inclinometer
        prepared_data.append(data['feeds'][1]['field2']) ## field1 means Rain Gauge
        prepared_data.append(data['feeds'][1]['field3']) ## field1 means Pizometer
        prepared_data.append(data['feeds'][1]['field4']) ## field1 means Crack-o-mete
        prepared_data.append(data['feeds'][1]['field5']) ## field1 means Tiltmeter
        mydata['all_sensor_data']=prepared_data
    # return HttpResponse("ok")
    return render(request, "Convergence1/show_json.html", mydata)


@login_required
def slope_live_table(request, template_name='Convergence1/slope_live_table.html'):
    form = Live_data_tabular(request.POST)
    return render(request, template_name, {'form': form})


def slope_location_jsonurl(request):
    data = {}
    if request.is_ajax():
        location_id = request.GET.get('id', None)
        loc = Slope_location.objects.get(pk=location_id)
        sensor_data = []
        sensor_data.append({'id': loc.id, 'jsonurl': loc.json_url})
        data['result'] = sensor_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)



def fetch_datafrom_jsonurl(request):
    import urllib.request
    import json
    data = {}
    sensor_data = []
    if request.is_ajax():

        now = datetime.now()
        ok_date = (str(now.strftime('%Y-%m-%d %H:%M:%S')))

        sensor_id = request.GET.get('id', None)
        print(sensor_id)
        # prepared_data=[]
        # with urllib.request.urlopen(sensor_id) as url:
        #     s = url.read()
        #     # I'm guessing this would output the html source code ?
        #     # print(s)
        #     data = json.loads(s)
        #     # data = json.dumps(s)
        #     # print(data)

        #     # tm=data['feeds'][1]['field1']
        #     # print(tm)
        #     prepared_data.append(sensor_id)
        #     prepared_data.append(data['feeds'][1]['field1']) ## field1 means Inclinometer
        #     prepared_data.append(data['feeds'][1]['field2']) ## field1 means Rain Gauge
        #     prepared_data.append(data['feeds'][1]['field3']) ## field1 means Pizometer
        #     prepared_data.append(data['feeds'][1]['field4']) ## field1 means Crack-o-mete
        #     prepared_data.append(data['feeds'][1]['field5']) ## field1 means Tiltmeter
            
            
        try:
                with urllib.request.urlopen(sensor_id) as url:
                    s = url.read()
                    data = json.loads(s)
                if data:
                    sensor_data = {
                                'date': str(ok_date),
                                'inclinometer': 'Inclinometer',
                                'inclinometer_val': data['feeds'][1]['field1'],
                                'rainguage': 'Rain Guage',
                                'rainguage_val': data['feeds'][1]['field2'],
                                'pizometer': 'Pizometer',
                                'pizometer_val': data['feeds'][1]['field3'],
                                'crackometer': 'Crack-o-meter',
                                'crackometer_val': data['feeds'][1]['field4'],
                                'tiltmeter': 'Tiltmeter',
                                'tiltmeter_val': data['feeds'][1]['field5'],}
                else:
                    sensor_data = {
                                'date': str(ok_date),
                                'inclinometer': 'Inclinometer',
                                'inclinometer_val': 'No Data',
                                'rainguage': 'Rain Guage',
                                'rainguage_val': 'No Data',
                                'pizometer': 'Pizometer',
                                'pizometer_val': 'No Data',
                                'crackometer': 'Crack-o-meter',
                                'crackometer_val': 'No Data',
                                'tiltmeter': 'Tiltmeter',
                                'tiltmeter_val': 'No Data',}
                            
        except Exception as x:
                sensor_data = {
                                'date': str(ok_date),
                                'inclinometer': 'Inclinometer',
                                'inclinometer_val': 'Network Error',
                                'rainguage': 'Rain Guage',
                                'rainguage_val': 'Network Error',
                                'pizometer': 'Pizometer',
                                'pizometer_val': 'Network Error',
                                'crackometer': 'Crack-o-meter',
                                'crackometer_val': 'Network Error',
                                'tiltmeter': 'Tiltmeter',
                                'tiltmeter_val': 'Network Error',}

        data['result'] = sensor_data
    else:
            data['result'] = "Not Ajax"
    return JsonResponse(data)


@login_required
def slope_live_table_dynamic(request, template_name='Convergence1/slope_live_table_dynamic.html'):
    form = Live_data_tabular(request.POST)
    return render(request, template_name, {'form': form})



def fetch_datafrom_jsonurl_dynamic(request):
    import urllib.request
    import json
    data = {}
    sensor_data = []
    if request.is_ajax():

        now = datetime.now()
        ok_date = (str(now.strftime('%Y-%m-%d %H:%M:%S')))

        sensor_id = request.GET.get('id', None)# sensor id means json_url
        location_id=request.GET.get('location_id', None)
        ## get all sensor in the location
        sensor = Slope_sensor.objects.filter(location_id=location_id)
        sensor_temp_data=[]
        sss={"inclinometer":[],"rainguage":[],"pizometer":[],"crackometer":[],"tiltmeter":[]}
        for s in sensor:
            sensor_temp_data.append({'id': s.id, 'name': s.sensor_name,'unit':s.sensor_unit})

        # print(sensor_temp_data)
        for i in range(0,5):
            row={}
            try:
                if(sensor_temp_data[i]['name']=='inclinometer'):
                    row['sensor_name']=sensor_temp_data[i]['name']
                    row['id']=sensor_temp_data[i]['id']
                    row['unit']=sensor_temp_data[i]['unit']
                    sss["inclinometer"].append(row)
               
                
                if(sensor_temp_data[i]['name']=='rainguage'):
                    row['sensor_name']=sensor_temp_data[i]['name']
                    row['id']=sensor_temp_data[i]['id']
                    row['unit']=sensor_temp_data[i]['unit']
                    sss["rainguage"].append(row)
                
                
                if(sensor_temp_data[i]['name']=='pizometer'):
                    row['sensor_name']=sensor_temp_data[i]['name']
                    row['id']=sensor_temp_data[i]['id']
                    row['unit']=sensor_temp_data[i]['unit']
                    sss["pizometer"].append(row)
                
              
                if(sensor_temp_data[i]['name']=='crackometer'):
                    row['sensor_name']=sensor_temp_data[i]['name']
                    row['id']=sensor_temp_data[i]['id']
                    row['unit']=sensor_temp_data[i]['unit']
                    sss["crackometer"].append(row)
                
               
                if(sensor_temp_data[i]['name']=='tiltmeter'):
                    row['sensor_name']=sensor_temp_data[i]['name']
                    row['id']=sensor_temp_data[i]['id']
                    row['unit']=sensor_temp_data[i]['unit']
                    sss["tiltmeter"].append(row)
                
            except Exception as x:
                pass
        # print(bool(sss['crackometer']))
        row1=row2=row3=row4=row5={}
        if(bool(sss['inclinometer'])==False):
            row1['sensor_name']='INCLINOMETER not added'
            row1['id']='0'
            row1['unit']='Not Added'
            sss["inclinometer"].append(row1)
            
        if(bool(sss['rainguage'])==False):
            row2['sensor_name']='RAINGUAGE not added'
            row2['id']='0'
            row2['unit']='Not Added'
            sss["rainguage"].append(row2)
        if(bool(sss['pizometer'])==False):
            row3['sensor_name']='PIZIMETER not added'
            row3['id']='0'
            row3['unit']='Not Added'
            sss["pizometer"].append(row3)
        if(bool(sss['crackometer'])==False):
            row4['sensor_name']='CRACKOMETER not added'
            row4['id']='0'
            row4['unit']='Not Added'
            sss["crackometer"].append(row4)
        if(bool(sss['tiltmeter'])==False):
            row5['sensor_name']='TILTMETER not added'
            row5['id']='0'
            row5['unit']='Not Added'
            sss["tiltmeter"].append(row5)

            # sss["data"].append(row)
        # print(sss)
        print(sss['inclinometer'][0]['sensor_name'])
            
            
            
        try:
                with urllib.request.urlopen(sensor_id) as url:
                    s = url.read()
                    data = json.loads(s)
                if data:
                    sensor_data = {
                                'date': str(ok_date),
                                'inclinometer': sss["inclinometer"][0]['sensor_name'],
                                'inclinometer_val': data['feeds'][1]['field1'],
                                'rainguage': sss["rainguage"][0]['sensor_name'],
                                'rainguage_val': data['feeds'][1]['field2'],
                                'pizometer': sss["pizometer"][0]['sensor_name'],
                                'pizometer_val': data['feeds'][1]['field3'],
                                'crackometer': sss["crackometer"][0]['sensor_name'],
                                'crackometer_val': data['feeds'][1]['field4'],
                                'tiltmeter': sss["tiltmeter"][0]['sensor_name'],
                                'tiltmeter_val': data['feeds'][1]['field5'],}
                else:
                    sensor_data = {
                                'date': str(ok_date),
                                'inclinometer': sss["inclinometer"][0]['sensor_name'],
                                'inclinometer_val': 'No Data',
                                'rainguage': sss["rainguage"][0]['sensor_name'],
                                'rainguage_val': 'No Data',
                                'pizometer': sss["pizometer"][0]['sensor_name'],
                                'pizometer_val': 'No Data',
                                'crackometer': sss["crackometer"][0]['sensor_name'],
                                'crackometer_val':'No Data',
                                'tiltmeter': sss["tiltmeter"][0]['sensor_name'],
                                'tiltmeter_val': 'No Data',}
                            
        except Exception as x:
                sensor_data = {
                                'date': str(ok_date),
                                'inclinometer': sss["inclinometer"][0]['sensor_name'],
                                'inclinometer_val': 'Network Error',
                                'rainguage': sss["rainguage"][0]['sensor_name'],
                                'rainguage_val': 'Network Error',
                                'pizometer': sss["pizometer"][0]['sensor_name'],
                                'pizometer_val': 'Network Error',
                                'crackometer': sss["crackometer"][0]['sensor_name'],
                                'crackometer_val': 'Network Error',
                                'tiltmeter': sss["tiltmeter"][0]['sensor_name'],
                                'tiltmeter_val': 'Network Error',}

        data['result'] = sensor_data
    else:
            data['result'] = "Not Ajax"
    # print(data)
    return JsonResponse(data)



