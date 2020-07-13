from django.contrib.auth.decorators import login_required
import math
from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from django.http import HttpResponse
from typing import Any
from django.template import Template,Context
from . models import temperature,temp_monitoring_automatic
from .forms import temperatureForm
from .forms import EraseForm
from .forms import DisplayForm
import datetime

from datetime import datetime, timedelta
import requests
from django.http import HttpResponse, JsonResponse
from django.utils.html import strip_tags
from background_task.models import Task
from background_task import background


@login_required
def index(request,template_name='main/home.html'):
    form=temperatureForm()
    obj = temperature.objects.all()
    if request.method == 'POST' and 'Showbutton' in request.POST:
        form = temperatureForm(request.POST or None)
        if form.is_valid():
            form.save()

    return render(request, template_name,{'form':form,'temperature':obj})


def tables(request):
    pass

    # table = homeTable(homeModel.objects.all())
    # RequestConfig(request).configure(table)
    # print(table)
    # return render(request, 'main/table1.html', {'table': table})

def delete(request,pk):

    temperature.objects.get(pk=pk).delete()
    return redirect('temp_monitoring:index')

def choose(request):

    return render(request,'main/result.html')


def live_temp_data(request):

    import subprocess
    results = subprocess.check_output(["netsh", "wlan", "show", "network"])
    results = results.decode("ascii") # needed in python 3
    results = results.replace("\r","")
    ls = results.split("\n")
    ls = ls[4:]
    ssids = []
    x = 0
    while x < len(ls):
        if x % 5 == 0:
            ssids.append(ls[x])
        x += 1
    print(ssids)
    return render(request,'main/live_temp_data.html')



def fetch_sensor_values_ajax(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_id = request.GET.get('id', None)
        
        now = datetime.now()
        ok_date = (str(now.strftime('%Y-%m-%d %H:%M:%S')))
        try:
            response = requests.get('http://' + str(sensor_id))
            sensor_val = strip_tags(response.text)

            if (sensor_val):

                temps=sensor_val.split(',')
                data = {'wbt':temps[0],'dbt':temps[1]}

                wbt_object = temperature(wbt=float(data['wbt']),
                                         dbt=float(data['dbt']))

                analysis=wbt_object.analysis()
                print('analysiss',analysis)

                sensor_data = {'date': str(ok_date),
                               'wbt': str(temps[0]),
                               'dbt': str(temps[1]),
                               'relativeHumidity': str(analysis['relativeHumidity']),
                               'dewPointTemp': str(analysis['dewpoint']),
                               'moistureContent': str(analysis['moistureContent']),
                               'sigmaHeat': str(analysis['sigmaHeat']),
                               'enthalpy': str(analysis['enthalpy']),
                               'rel_hum_status': str(analysis['relativeHumidity_msg']),
                               'dew_status': str(analysis['dewpoint_msg'])}

                    
            else:
                 sensor_data = {'date': str(ok_date),
                               'wbt': 0.0,
                               'dbt': 0.0,
                               'relativeHumidity': 0.0,
                               'dewPointTemp': 0.0,
                               'moistureContent': 0.0,
                               'sigmaHeat': 0.0,
                               'enthalpy': 0.0,
                               'rel_hum_status': "Not Found",
                               'dew_status': "Not Found"}
        except Exception as e:
            print(e)
            sensor_data = {'date': str(ok_date),
                               'wbt': 0.0,
                               'dbt': 0.0,
                               'relativeHumidity': 0.0,
                               'dewPointTemp': 0.0,
                               'moistureContent': 0.0,
                               'sigmaHeat': 0.0,
                               'enthalpy': 0.0,
                               'rel_hum_status': "Network Error"+str(e),
                               'dew_status': "Network Error"}
        data['result'] = sensor_data
    else:
        data['result'] = "Not Ajax"
    # print(data)
    return JsonResponse(data)



@background(schedule=15)
def run_back_save(sensor_id): ## sensor_id means here ip address
    sdbt = swbt = vp = asv = asd = tsd = enthalpy = relativeHumidity = moistureContent = sigmaHeat = dewPointTemp = 0.0
    enthalpym = relativeHumiditym = moistureContentm = sigmaHeatm = dewPointTempm = " "
    data = {}
    print("===============Temp data background start=========================")



    try:
        response = requests.get('http://' + str(sensor_id))
        sensor_val = strip_tags(response.text)

        now = datetime.now()
        ok_date = (str(now.strftime('%Y-%m-%d %H:%M:%S')))
        if (sensor_val):
            temps = sensor_val.split(',')
            data = {'wbt': temps[0], 'dbt': temps[1]}

            wbt_object = temperature(wbt=float(data['wbt']),
                                     dbt=float(data['dbt']))

            analysis = wbt_object.analysis()

            inst = temp_monitoring_automatic(
                           ip_address = str(sensor_id),
                           wbt= float(temps[0]),
                           dbt= float(temps[1]),
                           relativeHumidity= float(analysis['relativeHumidity']),
                           dewPointTemp= float(analysis['dewpoint']),
                           moistureContent= float(analysis['moistureContent']),
                           sigmaHeat= float(analysis['sigmaHeat']),
                           enthalpy= float(analysis['enthalpy']),
                           rel_hum_status= str(analysis['relativeHumidity_msg']),
                           dew_status= str(analysis['dewpoint_msg']))
            inst.save()
            # wbt_object.save()
            
        else:
            pass
            # inst.wbt = 0.0
    except Exception as e:
        print('exeetion',str(e))
        pass
        # inst.wbt = 0.0
    # inst.save()

    print(inst.sensor_value)
    print("***** Data Saved temp background *****")






@login_required
def start_save_sensor(request, template_name='temp_monitoring/live_temp_data.html'):
    data = {}
    stats=""
    if request.is_ajax():

        try:
            sensor_id = request.GET.get('id', None)
            print(sensor_id)
            # task_params="[["+f'"{str(sensor_id)}"' +"], {}]"
            # print(task_params)
            task = Task.objects.filter(task_name='temp_monitoring.views.run_back_save',
                                       task_params="[["+f'"{str(sensor_id)}"' +"], {}]",
                                       locked_at__isnull=True)
            print(task)
            if task:
                task.delete()
                stats="on"
            else:
                run_back_save(sensor_id, repeat=15)
                stats="off"
            data['result'] = "success"
            data['status']=stats
            data['ip']=sensor_id
        except Exception as e:
            data['error'] = "error"
            print(e)
            pass
        return JsonResponse(data)

    data['error'] = "Not Ajax"
    return JsonResponse(data)