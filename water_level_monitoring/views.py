#from turtledemo import clock

# from pygame import mixer

import requests
from datetime import datetime
from django.core.mail import EmailMessage
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
#####################

# Create your views here.
from django.utils.html import strip_tags
from background_task import background

from apps.settings import MEDIA_ROOT
from employee.models import MineDetails
from water_level_monitoring.forms import add_water_sensor_form
from water_level_monitoring.models import water_level_monitoring_model, water_level_monitoring_data_acquisition_model
from background_task.models import Task

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
    # water_level_sensor_details = water_level_monitoring_model.objects.all().order_by('-id')

    sensors = water_level_monitoring_model.objects.all().order_by('-id')
    # print(sensors)
    data = {}
    prepared_data = []
    background_task = 0
    for s in sensors:
        background_task = 0
        try:
            task = Task.objects.get(task_name='water_level_monitoring.views.run_back_save',
                                    task_params="[[" + str(s.id) + "], {}]",
                                    locked_at__isnull=True)
            background_task = 1
        except:
            pass

        # background_task.append({'id':task.id})
        try:
            mine_table = MineDetails.objects.get(id=s.mine_id_id)
            prepared_data.append({'id': s.id,
                                  'mine': mine_table.name,
                                  'area_name': s.area_name,
                                  'ip': s.ip_address,
                                  'desc': s.desc,
                                  'background': background_task
                                  })
        except:
            pass

    data['result'] = prepared_data
    return render(request, "manage_water_sensor.html", data)


def edit_water_sensor(request, id):
    data = get_object_or_404(water_level_monitoring_model, id=id)
    form = add_water_sensor_form(request.POST or None, request.FILES or None, instance=data)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            return redirect('water_level_monitoring:manage_water_sensor')
    return render(request, "edit_water_sensor.html", {'form': form})


def delete_water_sensor(request, id):
    delete_water_sensor_data = water_level_monitoring_model.objects.filter(id=id)
    delete_water_sensor_data.delete()

    return redirect('water_level_monitoring:manage_water_sensor')


def fetch_location_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        location_details = water_level_monitoring_model.objects.filter(mine_id=mine_id)

        data = {}
        location_data = []
        for r in location_details:
            location_data.append({'id':r.id,'name':r.area_name})
        data['result'] = location_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def show_graph_water_sensor(request):
    form = add_water_sensor_form()
    return render(request, "show_graph_water_sensor.html", {"form": form})


def iframe_show_graph_water_sensor(request, mine_id, location):
    # print('mine_id',mine_id)
    # print('lcoation',location)
    availability = 0
    IpAddress = '0'
    try:
        IpAddress = get_object_or_404(water_level_monitoring_model, mine_id=mine_id, id=location)
        IpAddress = IpAddress.ip_address
        availability = 1
    except:
        availability = 0
        pass

    return render(request, "iframe_show_graph_water_sensor.html",
                  {'address': IpAddress, 'location': location, 'availability': availability})


def fetch_sensor_details(request):  # fetch IP address and water level only (For graph)
    data = {}
    if request.is_ajax():
        id = request.GET.get('id', None)
        water_sensor = water_level_monitoring_model.objects.filter(id=id)
        data = {}
        i = 0

        for sensor in water_sensor:
            data['result'] = {'ip': sensor.ip_address,
                              'level1': sensor.alarm_water_level_1,
                              'level2': sensor.alarm_water_level_2,
                              'level3': sensor.alarm_water_level_3,
                              'total_height': sensor.distance_bet_roof_and_water,
                              'level1_msg': sensor.level_1_msg,
                              'level2_msg': sensor.level_2_msg,
                              'level3_msg': sensor.level_3_msg,
                              'level1_audio': str(sensor.level_1_audio),
                              'level2_audio': str(sensor.level_2_audio),
                              'level3_audio': str(sensor.level_3_audio),
                              'audio_type': sensor.audio_play_type,
                              'moter_start_level': sensor.moter_start_level,
                              'moter_stop_level': sensor.moter_stop_level

                              }
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


# *****************************************************************************************************************************************************************************************************
@login_required
def fetch_water_level_ajax(request):
    data = {}
    sensor_data = []
    if request.is_ajax():

        sensor_id = request.GET.get('id', None)
        sensor_details = water_level_monitoring_model.objects.get(id=sensor_id)


        mine_details = MineDetails.objects.get(id=sensor_details.mine_id_id)
        now = datetime.now()
        ok_date = (str(now.strftime('%Y-%m-%d %H:%M:%S')))

        try:
            response = requests.get('http://' + str(sensor_details.ip_address))
            sensor_val = strip_tags(response.text)
            if sensor_val:
                sensor_data = {'id': str(sensor_details.id),
                               # 'ip': str(sensor_details.ip_address),
                               'date': str(ok_date),
                               'mine': str(mine_details.name),
                               # 'location': str(sensor_details.location_id),
                               # 'sensor_name': str(sensor_details.sensor_name),
                               # 'unit': str(sensor_details.sensor_unit),
                               'sensor_value': str(sensor_val),
                               # 'tag': str(sensor_details.tag_no),
                               # 'audio_type': str(sensor_details.audio_play_type),
                               # 'first_warning_msg': str(sensor_details.level_1_msg),
                               # 'second_warning_msg': str(sensor_details.level_2_msg),
                               # 'third_warning_msg': str(sensor_details.level_3_msg),
                               # 'first_warning_audio': str(sensor_details.level_1_audio),
                               # 'second_warning_audio': str(sensor_details.level_2_audio),
                               # 'third_warning_audio': str(sensor_details.level_3_audio)}
                               }
            else:
                sensor_data = {'id': str(sensor_details.id),
                               # 'ip': str(sensor_details.ip_address),
                               'date': str(ok_date),
                               'mine': str(mine_details.name),
                               # 'location': str(sensor_details.location_id),
                               # 'sensor_name': str(sensor_details.sensor_name),
                               # 'unit': str(sensor_details.sensor_unit),
                               'sensor_value': 'No data',
                               # 'tag': str(sensor_details.tag_no),
                               # 'audio_type': str(sensor_details.audio_play_type),
                               # 'first_warning_msg': str(sensor_details.level_1_msg),
                               # 'second_warning_msg': str(sensor_details.level_2_msg),
                               # 'third_warning_msg': str(sensor_details.level_3_msg),
                               # 'first_warning_audio': str(sensor_details.level_1_audio),
                               # 'second_warning_audio': str(sensor_details.level_2_audio),
                               # 'third_warning_audio': str(sensor_details.level_3_audio)}
                               }


        except Exception as x:
            sensor_data = {'id': str(sensor_details.id),
                           # 'ip': str(sensor_details.ip_address),
                           'date': str(ok_date),
                           'mine': str(mine_details.name),
                           # 'location': str(sensor_details.location_id),
                           # 'sensor_name': str(sensor_details.sensor_name),
                           # 'unit': str(sensor_details.sensor_unit),
                           'sensor_value': 'Network Error',
                           # 'tag': str(sensor_details.tag_no),
                           # 'audio_type': str(sensor_details.audio_play_type),
                           # 'first_warning_msg': str(sensor_details.level_1_msg),
                           # 'second_warning_msg': str(sensor_details.level_2_msg),
                           # 'third_warning_msg': str(sensor_details.level_3_msg),
                           # 'first_warning_audio': str(sensor_details.level_1_audio),
                           # 'second_warning_audio': str(sensor_details.level_2_audio),
                           # 'third_warning_audio': str(sensor_details.level_3_audio)}
                           }

        data['result'] = sensor_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def start_save_water_data(request, sensor_id):
    task = Task.objects.filter(task_name='water_level_monitoring.views.run_back_save',
                               task_params="[[" + str(sensor_id) + "], {}]",
                               locked_at__isnull=True)
    if task:
        task.delete()
    else:
        run_back_save(sensor_id, repeat=5)

    return redirect(request.META.get('HTTP_REFERER'))


def push_mail(mail_subject="", mail_html_content=""):
    email = EmailMessage(mail_subject, mail_html_content, "", ['shyamd148@gmail.com'])
    email.content_subtype = "html"
    # res = email.send()


def live_data_water_sensor(request):
    form = add_water_sensor_form()
    return render(request, "live_data_water_sensor.html", {"form": form})


def water_data_bet_two_datetime(request):
    form = add_water_sensor_form()
    return render(request, "water_data_bet_two_datetime.html", {"form": form})


def fetch_water_data_bet_two_datetime(request):
    prepared_data = []
    data = {}
    if request.is_ajax():
        location = request.GET.get('id', None)
        date_from = request.GET.get('date_from', None)
        date_to = request.GET.get('date_to', None)

        date_from = datetime.strptime(date_from, '%Y-%m-%d %H:%M:%S')
        date_to = datetime.strptime(date_to, '%Y-%m-%d %H:%M:%S')

        water_level_data_details = water_level_monitoring_model.objects.get(id=location)
        mine_details = MineDetails.objects.get(id=water_level_data_details.mine_id_id)

        water_data_details = water_level_monitoring_data_acquisition_model.objects.filter(
            sensor_id=location).filter(created_date__range=(date_from, date_to)).order_by('-id')

        for water in water_data_details:

            prepared_data.append({'date':water.created_date,'mine':mine_details.name,'area':water_level_data_details.area_name,'sensor_value':water.sensor_value})

        data['result'] = prepared_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def graph_water_data_bet_two_datetime(request):
    form = add_water_sensor_form()
    return render(request, "graph_water_data_bet_two_datetime.html", {"form": form})


def warning_water_data_bet_two_datetime(request):
    form = add_water_sensor_form()
    return render(request, "warning_water_data_bet_two_datetime.html", {"form": form})


def warning_fetch_water_data_bet_two_datetime(request):
    prepared_data = []
    data = {}
    if request.is_ajax():
        location = request.GET.get('id', None)
        date_from = request.GET.get('date_from', None)
        date_to = request.GET.get('date_to', None)
        warning_value = request.GET.get('warning_value', None)

        a = date_from + '.000000'
        b = date_to + '.000000'
        from_d = datetime.strptime(a, '%Y-%m-%d %H:%M:%S.%f')
        from_t = datetime.strptime(b, '%Y-%m-%d %H:%M:%S.%f')
        from_d = from_d.replace(microsecond=000000)
        from_t = from_t.replace(microsecond=999999)

        water_level_data_details = water_level_monitoring_model.objects.get(id=location)
        mine_details = MineDetails.objects.get(id=water_level_data_details.mine_id_id)

        if (int(warning_value) == 3):
            range_from = int(water_level_data_details.distance_bet_roof_and_water) - int(
                water_level_data_details.alarm_water_level_1)
            range_to = int(water_level_data_details.distance_bet_roof_and_water)
        elif (int(warning_value) == 2):
            range_from = int(water_level_data_details.distance_bet_roof_and_water) - int(
                water_level_data_details.alarm_water_level_2)
            range_to = int(water_level_data_details.distance_bet_roof_and_water) - int(
                water_level_data_details.alarm_water_level_1)
        else:
            range_from = 0
            range_to = int(water_level_data_details.distance_bet_roof_and_water) - int(
                water_level_data_details.alarm_water_level_3)

        print('range from',range_from,'to',range_to)
        water_data_details = water_level_monitoring_data_acquisition_model.objects.filter(
            sensor_id=location).filter(sensor_value__range=(range_from, range_to)).filter(
            created_date__range=(from_d, from_t)).order_by('-id')

        for water in water_data_details:
            prepared_data.append({'date': water.created_date, 'mine': mine_details.name ,'area':water_level_data_details.area_name ,'sensor_value':water.sensor_value})

        data['result'] = prepared_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def warning_report(request):
    return HttpResponse("development")
#======================== Background task only==================================

@background(schedule=5)
def run_back_save(id):
    new_inst = water_level_monitoring_data_acquisition_model()
    new_inst.sensor_id = id
    new_inst.sensor_value = '0.00'
    sensor_details = water_level_monitoring_model.objects.get(id=id)
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
    print("# water  saved value is " + new_inst.sensor_value)
