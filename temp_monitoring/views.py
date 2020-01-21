from django.contrib.auth.decorators import login_required
import math
from django_tables2 import RequestConfig
from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.http import HttpResponse
from typing import Any
from django.template import Template,Context
from .tables import homeTable
from . models import homeModel
from .forms import homeForm
from .forms import EraseForm
from .forms import DisplayForm
import datetime

from datetime import datetime, timedelta
import requests
from django.http import HttpResponse, JsonResponse
from django.utils.html import strip_tags


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

    table = homeTable(homeModel.objects.all())
    RequestConfig(request).configure(table)
    return render(request, 'main/table1.html', {'table': table})

def delete(request):

    homeModel.objects.all().delete()
    return tables(request)

def choose(request):

    return render(request,'main/result.html')


def live_temp_data(request):

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
                sensor_data.append(str(ok_date) + ',' +str(sensor_val)) ##format(id,ip,datetime,minename,location,sensor,value,unit,tag)
            else:
                 sensor_data.append(str(ok_date) + ',' +'No Data')
        except Exception as x:
            print("catch me he "+str(x))
            sensor_data.append(str(ok_date) + ',' +'Network Error')
        data['result'] = sensor_data
    else:
        data['result'] = "Not Ajax"
        print(data)
    return JsonResponse(data)