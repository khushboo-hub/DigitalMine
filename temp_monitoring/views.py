from django.contrib.auth.decorators import login_required
import math
from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.http import HttpResponse
from typing import Any
from django.template import Template,Context
from . models import homeModel,temp_monitoring_automatic
from .forms import homeForm
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
def index(request):
    sdbt = swbt = vp = asv = asd = tsd = enthalpy = relativeHumidity = moistureContent = sigmaHeat = dewPointTemp = 0.0
    enthalpym = relativeHumiditym = moistureContentm = sigmaHeatm = dewPointTempm = " "

    if request.method == 'POST' and 'Showbutton' in request.POST:
        form1 = EraseForm()
        form2 = DisplayForm()
        form = homeForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            wbt_object = homeModel()
            wbt_object.wbt = data['wbt1']
            swbt = 610.5 * (2.713**((float(data['wbt1']) * 17.27) / (float(data['wbt1'])+273.3)))

            wbt_object.dbt = data['dbt1']
            sdbt = 610.5 * (2.713**((float(data['dbt1']) * 17.27) / (float(data['dbt1'])+273.3)))

            vp = swbt - ((0.000644*101000.00)*(float(data['dbt1'])-float(data['wbt1'])))

            wbt_object.relativeHumidity = (vp/sdbt) * 100
            relativeHumidity=wbt_object.relativeHumidity
            wbt_object.moistureContent = 622 * (vp/(101000.00-vp))
            moistureContent=wbt_object.moistureContent

            wbt_object.enthalpy = (1.005 * float(data['dbt1'])) + (wbt_object.moistureContent * (2.5016 + (0.0018 * float(data['dbt1']))))
            enthalpy=wbt_object.enthalpy
            wbt_object.sigmaHeat = wbt_object.enthalpy - (0.004187 * wbt_object.moistureContent * float(data['wbt1']))
            sigmaHeat=wbt_object.sigmaHeat
            wbt_object.dewPointTemp = ((237.3 * math.log(vp/610.5))/17.27) - math.log(vp/610.5)
            dewPointTemp=wbt_object.dewPointTemp

            if (dewPointTemp <= 30.5):
                wbt_object.dew_status = "Normal"
            else:
                wbt_object.dew_status = "Danger"

            if (relativeHumidity > 99):
                wbt_object.rel_hum_status = "Safe"
            else:
                wbt_object.rel_hum_status = "Danger"

            wbt_object.save()

            if (dewPointTemp <= 30.5):
                dewPointTempm = "Normal"
            else:
                dewPointTempm = "Danger"
            if (relativeHumidity >99):
                relativeHumiditym = "Safe"
            else:
                relativeHumiditym = "Danger"


    elif request.method == 'POST' and 'erasebutton' in request.POST:

        form1 = EraseForm()
        form = homeForm()
        form2 = DisplayForm()

    elif request.method == 'POST' and 'displaybutton' in request.POST:

        form = homeForm()
        form1 = EraseForm()
        form2 = DisplayForm()
        return HttpResponseRedirect('/temp_monitoring/show/')

    elif request.method == 'POST' and 'deleteButton' in request.POST:

        form = homeForm()
        form1 = EraseForm()
        form2 = DisplayForm()
        return HttpResponseRedirect('/temp_monitoring/delete/')

    else:

        form = homeForm()
        form1 = EraseForm()
        form2 = DisplayForm()


    resultdict = {'form': form, 'form1': form1, 'form2': form2, 'relativeHumidity': relativeHumidity, 'dewPointTemp': dewPointTemp, 'enthalpy': enthalpy, 'moistureContent': moistureContent, 'sigmaHeat': sigmaHeat,'relativeHumiditym':relativeHumiditym,'dewPointTempm':dewPointTempm}
    return render(request, 'main/home.html', resultdict)


def tables(request):
    pass

    # table = homeTable(homeModel.objects.all())
    # RequestConfig(request).configure(table)
    # print(table)
    # return render(request, 'main/table1.html', {'table': table})

def delete(request):

    homeModel.objects.all().delete()
    return tables(request)

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
    sdbt = swbt = vp = asv = asd = tsd = enthalpy = relativeHumidity = moistureContent = sigmaHeat = dewPointTemp = 0.0
    enthalpym = relativeHumiditym = moistureContentm = sigmaHeatm = dewPointTempm = " "
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
                data = {'wbt1':temps[0],'dbt1':temps[1]}
                wbt_object = homeModel()
                wbt_object.wbt = data['wbt1']
                swbt = 610.5 * (2.713**((float(data['wbt1']) * 17.27) / (float(data['wbt1'])+273.3)))

                wbt_object.dbt = data['dbt1']
                sdbt = 610.5 * (2.713**((float(data['dbt1']) * 17.27) / (float(data['dbt1'])+273.3)))

                vp = swbt - ((0.000644*101000.00)*(float(data['dbt1'])-float(data['wbt1'])))

                wbt_object.relativeHumidity = (vp/sdbt) * 100
                relativeHumidity=wbt_object.relativeHumidity
                wbt_object.moistureContent = 622 * (vp/(101000.00-vp))
                moistureContent=wbt_object.moistureContent

                wbt_object.enthalpy = (1.005 * float(data['dbt1'])) + (wbt_object.moistureContent * (2.5016 + (0.0018 * float(data['dbt1']))))
                enthalpy=wbt_object.enthalpy
                wbt_object.sigmaHeat = wbt_object.enthalpy - (0.004187 * wbt_object.moistureContent * float(data['wbt1']))
                sigmaHeat=wbt_object.sigmaHeat
                wbt_object.dewPointTemp = ((237.3 * math.log(vp/610.5))/17.27) - math.log(vp/610.5)
                dewPointTemp=wbt_object.dewPointTemp

                if (dewPointTemp <= 30.5):
                    wbt_object.dew_status = "Normal"
                else:
                    wbt_object.dew_status = "Danger"

                if (relativeHumidity > 99):
                    wbt_object.rel_hum_status = "Safe"
                else:
                    wbt_object.rel_hum_status = "Danger"

                # wbt_object.save()

                if (dewPointTemp <= 30.5):
                    dewPointTempm = "Normal"
                else:
                    dewPointTempm = "Danger"
                if (relativeHumidity >99):
                    relativeHumiditym = "Safe"
                else:
                    relativeHumiditym = "Danger"

                    

                    # sensor_data.append(str(ok_date) + ',' +str(temps[0])+ ',' +str(temps[1])+','
                    # +str(wbt_object.relativeHumidity)+','+str(wbt_object.dewPointTemp)
                    # +','+str(wbt_object.moistureContent)+','+str(wbt_object.sigmaHeat)
                    # +','+str(wbt_object.enthalpy)+','+str(wbt_object.rel_hum_status)+','+str(wbt_object.dew_status)) 

                sensor_data = {'date': str(ok_date),
                               'wbt': str(temps[0]),
                               'dbt': str(temps[1]),
                               'relativeHumidity': str(wbt_object.relativeHumidity),
                               'dewPointTemp': str(wbt_object.dewPointTemp),
                               'moistureContent': str(wbt_object.moistureContent),
                               'sigmaHeat': str(wbt_object.sigmaHeat),
                               'enthalpy': str(wbt_object.enthalpy),
                               'rel_hum_status': str(wbt_object.rel_hum_status),
                               'dew_status': str(wbt_object.dew_status)}

                    
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
        except Exception as x:
            sensor_data = {'date': str(ok_date),
                               'wbt': 0.0,
                               'dbt': 0.0,
                               'relativeHumidity': 0.0,
                               'dewPointTemp': 0.0,
                               'moistureContent': 0.0,
                               'sigmaHeat': 0.0,
                               'enthalpy': 0.0,
                               'rel_hum_status': "Network Error",
                               'dew_status': "Network Error"}
        data['result'] = sensor_data
    else:
        data['result'] = "Not Ajax"
    print(data)
    return JsonResponse(data)



@background(schedule=15)
def run_back_save(sensor_id): ## sensor_id means here ip address
    sdbt = swbt = vp = asv = asd = tsd = enthalpy = relativeHumidity = moistureContent = sigmaHeat = dewPointTemp = 0.0
    enthalpym = relativeHumiditym = moistureContentm = sigmaHeatm = dewPointTempm = " "
    data = {}
    print("===============Temp data background start=========================")
    inst = temp_monitoring_automatic()
    inst.ip_address = sensor_id

    try:
        response = requests.get('http://' + str(sensor_id))
        sensor_val = strip_tags(response.text)
        if (sensor_val):
                temps=sensor_val.split(',')
                data = {'wbt1':temps[0],'dbt1':temps[1]}
                inst.wbt = data['wbt1']
                swbt = 610.5 * (2.713**((float(data['wbt1']) * 17.27) / (float(data['wbt1'])+273.3)))

                inst.dbt = data['dbt1']
                sdbt = 610.5 * (2.713**((float(data['dbt1']) * 17.27) / (float(data['dbt1'])+273.3)))

                vp = swbt - ((0.000644*101000.00)*(float(data['dbt1'])-float(data['wbt1'])))

                inst.relativeHumidity = (vp/sdbt) * 100
                relativeHumidity=inst.relativeHumidity
                inst.moistureContent = 622 * (vp/(101000.00-vp))
                moistureContent=inst.moistureContent

                inst.enthalpy = (1.005 * float(data['dbt1'])) + (inst.moistureContent * (2.5016 + (0.0018 * float(data['dbt1']))))
                enthalpy=inst.enthalpy
                inst.sigmaHeat = inst.enthalpy - (0.004187 * inst.moistureContent * float(data['wbt1']))
                sigmaHeat=inst.sigmaHeat
                inst.dewPointTemp = ((237.3 * math.log(vp/610.5))/17.27) - math.log(vp/610.5)
                dewPointTemp=inst.dewPointTemp

                if (dewPointTemp <= 30.5):
                    inst.dew_status = "Normal"
                else:
                    inst.dew_status = "Danger"

                if (relativeHumidity > 99):
                    inst.rel_hum_status = "Safe"
                else:
                    inst.rel_hum_status = "Danger"

                # wbt_object.save()

                if (dewPointTemp <= 30.5):
                    dewPointTempm = "Normal"
                else:
                    dewPointTempm = "Danger"
                if (relativeHumidity >99):
                    relativeHumiditym = "Safe"
                else:
                    relativeHumiditym = "Danger" 
                inst.save()  
            
        else:
            pass
            # inst.wbt = 0.0
    except Exception as x:
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