import datetime
from time import strftime

from django.contrib.auth.decorators import login_required
# from django.contrib.sites import requests
from django.db.models import Avg, Q, F
from django.http import HttpResponse, request, JsonResponse, response
from django.shortcuts import render, redirect, get_object_or_404
from background_task import background
import requests

global rain_gauge_data, pm2_5_data, pm10_data, humidity_data, temperature_data, ws_value_data, wd_value_data, so2_data, no2_data, count, current_time, to_time

# Create your views here.
from django.utils.html import strip_tags

from .models import Setting, AddSensor, Weather_data
from .forms import SensorForm, AddSensorForms


@login_required
def setting(request):
    form = SensorForm(request.POST, request.FILES)
    data = Setting.objects.all()
    # if form.is_valid():
    if(data):
        #(data)
        book = get_object_or_404(Setting, id=1)
        form = SensorForm(request.POST or None, instance=book)
        if form.is_valid():
            #print(form)
            form.save()
        return render(request, 'setting.html', {'form': form})
        ###edit wala code
        print("edit mode")
    else:
        print("here no data")
        ###save wal code 1st time
        if form.is_valid():
            form.save()
        return render(request, 'setting.html', {'form': form})
        # else:
        #     print("form is not valid")
        # return render(request, 'sensor_add.html', {'form': form})

@login_required
def add_sensor(request, template_name='add_sensor.html'):
    if request.method == "POST":
        # print(request.POST)
        form = AddSensorForms(request.POST)
        print(form)
        if form.is_valid():
            form.save()
            return redirect('wm_test:manage_sensor')
        else:
            print("Form Invalid")
    else:
        form =AddSensorForms()
    return render(request, template_name, {'form': form})

@login_required
def manage_sensor(request, template_name='manage_sensor.html'):
    book = AddSensor.objects.all() ### select * from AddSensorDetails
    data = {}
    data['object_list'] = book
    return render(request, template_name, data)

@login_required()
def edit(request, pk, template_name="add_sensor.html"):
    book = get_object_or_404(AddSensor, pk=pk)
    form = AddSensorForms(request.POST or None, request.FILES or None, instance=book)
    if form.is_valid():
        form.save()
        return redirect("wm_test:manage_sensor")
    return render(request, template_name, {'form': form})

def delete(request, pk, template_name='manage_sensor.html'):
    book= get_object_or_404(AddSensor, pk=pk)
    if request.method=='POST':
        book.delete()
        return redirect('wmtest:manage_sensor')
    return render(request, template_name, {'object':book})


# def get_data_from_node_mcu(request,template_name='home1.html'):
#     # data = {}
#     # sensor_data = []
#     sensor_id = 1  ## hardcoded
#     # sensor_id = request.GET.get('id', None)
#     sensor_details = Setting.objects.get(id=sensor_id)
#     # print(sensor_details.ip_address)
#     # now = datetime.datetime.now()
#     # ok_date = (str(now.strftime('%Y-%m-%d %H:%M')))
#     # try:
#     response = requests.get('http://' + str(sensor_details.ip_address))
#     sensor_val = strip_tags(response.text)
#     # print(sensor_val)
#     #     if (sensor_val):
#     #         print(ok_date)
#     #         sensor_data.append(ok_date + ',' + (sensor_val))
#     #     else:
#     #         sensor_data.append(str(sensor_details.ip_address) + ',' + 'No Data')
#     # except Exception as x:
#     #     # print("catch me he " + str(x))
#     #     sensor_data.append(str(sensor_details.ip_address) + ',' + 'Network Error')
#     # data['result'] = sensor_data
#     # print(data)
#     # return JsonResponse(data)
#     return(sensor_val)


@login_required
def get_data_from_node_mcu(request):

    # sensor_values = get_data_from_node_mcu(request)
    # print(sensor_values)
    data = {}
    sensor_data = []
    sensor_id=1
    sensor_details = Setting.objects.get(id=sensor_id)
    response = requests.get('http://' + str(sensor_details.ip_address))
    sensor_values = strip_tags(response.text)
    now = datetime.datetime.now()
    print(now)
    ok_date = (str(now.strftime('%Y-%m-%d %H:%M')))
    # print(ok_date)
    try:
        if(sensor_values):
            # print(sensor_values)
            # print(ok_date)
            sensor_data.append(ok_date + ',' + (sensor_values))
        else:
            sensor_data.append(str(sensor_details.ip_address) + ',' + 'No Data')
    except Exception as x:
        # print("catch me he " + str(x))
        sensor_data.append(str(sensor_details.ip_address) + ',' + 'Network Error')
    data['result'] = sensor_data
    # print(data)
    #  return HttpResponse('okkk')
    return JsonResponse(data)

@login_required
def live_report(request, template_name='live_report.html'):
    return render(request, template_name)


@background(schedule=10)
def run_back_save(setting_id):
    print("background calling...")
    inst = Weather_data()
    inst.setting_id = setting_id
    inst.rain_gauge = '0.00'
    inst.pm2_5 = '0.00'
    inst.pm10 = '0.00'
    inst.humidity = '0.00'
    inst.temperature = '0.00'
    inst.ws_value = '0.00'
    inst.wd_value = '0.00'
    inst.no2 = '0.00'
    inst.so2 = '0.00'
    # inst.save()

    setting_details = Setting.objects.get(id=setting_id)
    try:

        sensor_id = 1
        sensor_details = Setting.objects.get(id=sensor_id)
        response = requests.get('http://' + str(setting_details.ip_address))

        # response = requests.get('http://192.168.1.202')
        response = requests.get('http://' + str(sensor_details.ip_address))
        sensor_values = strip_tags(response.text)
        custom_array = sensor_values.split(',')
        print(custom_array[0])
        inst.rain_gauge = custom_array[0]
        print(custom_array[1])
        inst.pm2_5 = custom_array[1]
        print(custom_array[2])
        inst.pm10 = custom_array[2]
        print(custom_array[3])
        inst.humidity = custom_array[3]
        print(custom_array[4])
        inst.temperature = custom_array[4]
        print(custom_array[5])
        inst.ws_value = custom_array[5]
        print(custom_array[6])
        inst.wd_value = custom_array[6]
        print(custom_array)
        inst.no2 = custom_array[7]
        print(custom_array[7])
        inst.so2 = custom_array[8]
        print(custom_array)
        inst.save()
        print(custom_array[0])
    except Exception as x:
        inst.rain_gauge = 'Network Error'
        inst.pm2_5 = 'Network Error'
        inst.pm10 = 'Network Error'
        inst.humidity = 'Network Error'
        inst.temperature = 'Network Error'
        inst.ws_value = 'Network Error'
        inst.wd_value = 'Network Error'
        inst.no2 = 'Network Error'
        inst.so2 = 'Network Error'
        inst.save()


def start_save_sensor(request,template_name='home1.html'):
    print("before save")
    setting_id=1
    run_back_save(setting_id,repeat=10)
    return render(request, template_name)


# @login_required
# def weather_data(request, template_name='live_report.html'):
#     start = Setting.objects.all()
#     data = {}
#     data['object_list'] = start
#     return render(request, template_name, data)
#
# @login_required
# def weather_data_ajax(request):
#     data = {}
#
#     if request.is_ajax():
#         print("ajax")
#         start = Weather_data.objects.last()
#         print(start)
#         ttt=[]
#         ttt.append(str(start.modified_date) + ',' + str(start.modified_time) + ',' + start.rain_gauge + ',' + start.pm2_5+','+start.pm10+','+start.humidity+','+start.temperature +','+start.ws_value+','+start.wd_value)
#         data['result'] = ttt
#     else:
#         data['result'] = "Not Ajax"
#
#     return JsonResponse(data)

@login_required
def wind_hourly_report(request, template_name='wind_hourly_report.html'):

    return render(request, template_name)

def fetch_wind_hourly_report_ajax(request):
    if request.is_ajax():
        from_date = request.GET.get('from_date', None)
        to_date = request.GET.get('to_date', None)
        date1 = datetime.datetime.strptime(from_date, '%Y-%m-%d').date()
        date2 = datetime.datetime.strptime(to_date, '%Y-%m-%d').date()
        s_no = 0
        s=0
        data_value = []
        data = {}
        # date2 = datetime.date(2004, 10, 8)
        # print(date1)
        # print(date2)
        day = datetime.timedelta(days=1)

        while date1 <= date2:
            # print(date1)
            month_num = date1.month

            s_no = s_no + 1
            time = '00:00'
            val_a = Weather_data.objects.filter(date=date1, time='01:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value_1 = val_a
            else:
                wd_value_1 = 0
            avg_ws_1 = Weather_data.objects.filter(time__range=('00:00:00.000000', '01:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_1 = avg_ws_1["ws_value__avg"]
            # print(avg_ws)
            if (ws_avg_1 == None):
                ws_avg_1 = 0
            avg_wd_1 = Weather_data.objects.filter(time__range=('00:00:00.000000', '01:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_1 = avg_wd_1["wd_value__avg"]
            # print(wd_avg)
            if(wd_avg_1 == None):
                wd_avg_1 = 0
            i=0
            data1=[]
            data1.append([])
            data1[i].append(s_no)
            data1[i].append(month_num)
            data1[i].append(str(date1))
            data1[i].append(time)
            data1[i].append(round(wd_value_1,3))
            data1[i].append(round(ws_avg_1,3))
            data1[i].append(round(wd_avg_1,3))

            s_no = s_no + 1
            time = '01:00'
            val_a = Weather_data.objects.filter(date=date1, time='01:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value_2 = val_a
            else:
                wd_value_2 = 0
            avg_ws_2 = Weather_data.objects.filter(time__range=('01:00:00.000000', '02:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_2 = avg_ws_2["ws_value__avg"]
            # print(avg_ws_2)
            if (ws_avg_2 == None):
                ws_avg_2 = 0
            avg_wd_2 = Weather_data.objects.filter(time__range=('01:00:00.000000', '02:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_2 = avg_wd_2["wd_value__avg"]
            # print(wd_avg_2)
            if (wd_avg_2 == None):
                wd_avg_2 = 0
            i = 0
            data2 = []
            data2.append([])
            data2[i].append(s_no)
            data2[i].append(month_num)
            data2[i].append(date1)
            data2[i].append(time)
            data2[i].append(round(wd_value_2,3))
            data2[i].append(round(ws_avg_2,3))
            data2[i].append(round(wd_avg_2,3))

            s_no = s_no + 1
            time = '02:00'
            val_a = Weather_data.objects.filter(date=date1, time='02:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value_3 = val_a
            else:
                wd_value_3 = 0
            avg_ws_3 = Weather_data.objects.filter(time__range=('02:00:00.000000', '03:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_3 = avg_ws_3["ws_value__avg"]
            # print(avg_ws_3)
            if (ws_avg_3 == None):
                ws_avg_3 = 0
            avg_wd_3 = Weather_data.objects.filter(time__range=('02:00:00.000000', '03:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_3 = avg_wd_3["wd_value__avg"]
            # print(wd_avg_3)
            if (wd_avg_3 == None):
                wd_avg_3 = 0
            i = 0
            data3 = []
            data3.append([])
            data3[i].append(s_no)
            data3[i].append(month_num)
            data3[i].append(date1)
            data3[i].append(time)
            data3[i].append(round(wd_value_3,3))
            data3[i].append(round(ws_avg_3,3))
            data3[i].append(round(wd_avg_3,3))

            s_no = s_no + 1
            time = '03:00'
            val_a = Weather_data.objects.filter(date=date1, time='03:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value_4 = val_a
            else:
                wd_value_4 = 0
            avg_ws_4 = Weather_data.objects.filter(time__range=('03:00:00.000000', '04:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_4 = avg_ws_4["ws_value__avg"]
            # print(avg_ws_4)
            if (ws_avg_4 == None):
                ws_avg_4 = 0
            avg_wd_4 = Weather_data.objects.filter(time__range=('03:00:00.000000', '04:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_4 = avg_wd_4["wd_value__avg"]
            # print(wd_avg_4)
            if (wd_avg_4 == None):
                wd_avg_4 = 0
            i = 0
            data4 = []
            data4.append([])
            data4[i].append(s_no)
            data4[i].append(month_num)
            data4[i].append(date1)
            data4[i].append(time)
            data4[i].append(round(wd_value_4,3))
            data4[i].append(round(ws_avg_4,3))
            data4[i].append(round(wd_avg_4,3))

            s_no = s_no + 1
            time5 = '04:00'
            val_e = Weather_data.objects.filter(date=date1, time='04:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_e):
                wd_value5 = val_e
            else:
                wd_value5 = 0
            avg_ws_5 = Weather_data.objects.filter(time__range=('04:00:00.000000', '05:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg5 = avg_ws_5["ws_value__avg"]
            # print(avg_ws_5)
            if (ws_avg5 == None):
                ws_avg5 = 0
            avg_wd_5 = Weather_data.objects.filter(time__range=('04:00:00.000000', '05:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg5 = avg_wd_5["wd_value__avg"]
            # print(wd_avg5)
            if (wd_avg5 == None):
                wd_avg5 = 0
            i = 0
            data5 = []
            data5.append([])
            data5[i].append(s_no)
            data5[i].append(month_num)
            data5[i].append(date1)
            data5[i].append(time5)
            data5[i].append(round(wd_value5,3))
            data5[i].append(round(ws_avg5,3))
            data5[i].append(round(wd_avg5,3))

            s_no = s_no + 1
            time6 = '05:00'
            val_f = Weather_data.objects.filter(date=date1, time='05:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_f):
                wd_value6 = val_f
            else:
                wd_value6 = 0
            avg_ws_6 = Weather_data.objects.filter(time__range=('05:00:00.000000', '06:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg6 = avg_ws_6["ws_value__avg"]
            # print(avg_ws_6)
            if (ws_avg6 == None):
                ws_avg6 = 0
            avg_wd_6 = Weather_data.objects.filter(time__range=('05:00:00.000000', '06:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg6 = avg_wd_6["wd_value__avg"]
            # print(wd_avg6)
            if (wd_avg6 == None):
                wd_avg6 = 0
            i = 0
            data6 = []
            data6.append([])
            data6[i].append(s_no)
            data6[i].append(month_num)
            data6[i].append(date1)
            data6[i].append(time6)
            data6[i].append(round(wd_value6,3))
            data6[i].append(round(ws_avg6,3))
            data6[i].append(round(wd_avg6,3))

            s_no = s_no + 1
            time7 = '06:00'
            val_g = Weather_data.objects.filter(date=date1, time='06:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_g):
                wd_value7 = val_g
            else:
                wd_value7 = 0
            avg_ws_7 = Weather_data.objects.filter(time__range=('06:00:00.000000', '07:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg7 = avg_ws_7["ws_value__avg"]
            # print(avg_ws_7)
            if (ws_avg7 == None):
                ws_avg7 = 0
            avg_wd_7 = Weather_data.objects.filter(time__range=('06:00:00.000000', '07:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg7 = avg_wd_7["wd_value__avg"]
            # print(wd_avg7)
            if (wd_avg7 == None):
                wd_avg7 = 0
            i = 0
            data7 = []
            data7.append([])
            data7[i].append(s_no)
            data7[i].append(month_num)
            data7[i].append(date1)
            data7[i].append(time7)
            data7[i].append(round(wd_value7,3))
            data7[i].append(round(ws_avg7,3))
            data7[i].append(round(wd_avg7,3))

            s_no = s_no + 1
            time8 = '07:00'
            val_a = Weather_data.objects.filter(date=date1, time='07:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value8 = round(val_a,2)
            else:
                wd_value8 = 0
            avg_ws_8 = Weather_data.objects.filter(time__range=('07:00:00.000000', '08:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg8 = avg_ws_8["ws_value__avg"]
            # print(avg_ws_8)
            if (ws_avg8 == None):
                ws_avg8 = 0
            avg_wd_8 = Weather_data.objects.filter(time__range=('07:00:00.000000', '08:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg8 = avg_wd_8["wd_value__avg"]
            # print(wd_avg8)
            if (wd_avg8 == None):
                wd_avg8 = 0
            i = 0
            data8 = []
            data8.append([])
            data8[i].append(s_no)
            data8[i].append(month_num)
            data8[i].append(date1)
            data8[i].append(time8)
            data8[i].append(round(wd_value8,3))
            data8[i].append(round(ws_avg8,3))
            data8[i].append(round(wd_avg8,3))

            s_no = s_no + 1
            time9 = '08:00'
            val_a = Weather_data.objects.filter(date=date1, time='08:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value9 = val_a
            else:
                wd_value9 = 0
            avg_ws_9 = Weather_data.objects.filter(time__range=('08:00:00.000000', '09:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg9 = avg_ws_9["ws_value__avg"]
            # print(avg_ws_9)
            if (ws_avg9 == None):
                ws_avg9 = 0
            avg_wd_9 = Weather_data.objects.filter(time__range=('08:00:00.000000', '09:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg9 = avg_wd_9["wd_value__avg"]
            # print(wd_avg9)
            if (wd_avg9 == None):
                wd_avg9 = 0
            i = 0
            data9 = []
            data9.append([])
            data9[i].append(s_no)
            data9[i].append(month_num)
            data9[i].append(date1)
            data9[i].append(time9)
            data9[i].append(round(wd_value9,3))
            data9[i].append(round(ws_avg9,3))
            data9[i].append(round(wd_avg9,3))

            s_no = s_no + 1
            time10 = '09:00'
            val_a = Weather_data.objects.filter(date=date1, time='09:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value10 = val_a
            else:
                wd_value10 = 0
            avg_ws_10 = Weather_data.objects.filter(time__range=('09:00:00.000000', '10:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg10 = avg_ws_10["ws_value__avg"]
            # print(avg_ws_10)
            if (ws_avg10 == None):
                ws_avg10 = 0
            avg_wd_10 = Weather_data.objects.filter(time__range=('09:00:00.000000', '10:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg10 = avg_wd_10["wd_value__avg"]
            # print(wd_avg10)
            if (wd_avg10 == None):
                wd_avg10 = 0
            i = 0
            data10 = []
            data10.append([])
            data10[i].append(s_no)
            data10[i].append(month_num)
            data10[i].append(date1)
            data10[i].append(time10)
            data10[i].append(round(wd_value10,3))
            data10[i].append(round(ws_avg10,3))
            data10[i].append(round(wd_avg10,3))

            s_no = s_no + 1
            time11 = '10:00'
            val_a = Weather_data.objects.filter(date=date1, time='10:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value11 = val_a
            else:
                wd_value11 = 0
            avg_ws_11 = Weather_data.objects.filter(time__range=('10:00:00.000000', '11:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg11 = avg_ws_11["ws_value__avg"]
            # print(avg_ws_11)
            if (ws_avg11 == None):
                ws_avg11 = 0
            avg_wd_11 = Weather_data.objects.filter(time__range=('10:00:00.000000', '11:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg11 = avg_wd_11["wd_value__avg"]
            # print(wd_avg11)
            if (wd_avg11 == None):
                wd_avg11 = 0
            i = 0
            data11 = []
            data11.append([])
            data11[i].append(s_no)
            data11[i].append(month_num)
            data11[i].append(date1)
            data11[i].append(time11)
            data11[i].append(round(wd_value11,3))
            data11[i].append(round(ws_avg11,3))
            data11[i].append(round(wd_avg11,3))

            s_no = s_no + 1
            time12 = '11:00'
            val_a = Weather_data.objects.filter(date=date1, time='11:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value12 = val_a
            else:
                wd_value12 = 0
            avg_ws_12 = Weather_data.objects.filter(time__range=('11:00:00.000000', '12:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg12 = avg_ws_12["ws_value__avg"]
            # print(avg_ws_12)
            if (ws_avg12 == None):
                ws_avg12 = 0
            avg_wd_12 = Weather_data.objects.filter(time__range=('11:00:00.000000', '12:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg12 = avg_wd_12["wd_value__avg"]
            # print(wd_avg12)
            if (wd_avg12 == None):
                wd_avg12 = 0
            i = 0
            data12 = []
            data12.append([])
            data12[i].append(s_no)
            data12[i].append(month_num)
            data12[i].append(date1)
            data12[i].append(time12)
            data12[i].append(round(wd_value12,3))
            data12[i].append(round(ws_avg12,3))
            data12[i].append(round(wd_avg12,3))

            s_no = s_no + 1
            time13 = '12:00'
            val_a = Weather_data.objects.filter(date=date1, time='12:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value13 = val_a
            else:
                wd_value13 = 0
            avg_ws_13 = Weather_data.objects.filter(time__range=('12:00:00.000000', '13:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg13 = avg_ws_13["ws_value__avg"]
            # print(avg_ws_13)
            if (ws_avg13 == None):
                ws_avg13 = 0
            avg_wd_13 = Weather_data.objects.filter(time__range=('12:00:00.000000', '13:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg13 = avg_wd_13["wd_value__avg"]
            # print(wd_avg13)
            if (wd_avg13 == None):
                wd_avg13 = 0
            i = 0
            data13 = []
            data13.append([])
            data13[i].append(s_no)
            data13[i].append(month_num)
            data13[i].append(date1)
            data13[i].append(time13)
            data13[i].append(round(wd_value13,3))
            data13[i].append(round(ws_avg13,3))
            data13[i].append(round(wd_avg13,3))

            s_no = s_no + 1
            time14 = '13:00'
            val_a = Weather_data.objects.filter(date=date1, time='13:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value14 = val_a
            else:
                wd_value14 = 0
            avg_ws_14 = Weather_data.objects.filter(time__range=('13:00:00.000000', '14:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg14 = avg_ws_14["ws_value__avg"]
            # print(avg_ws_14)
            if (ws_avg14 == None):
                ws_avg14 = 0
            avg_wd_14 = Weather_data.objects.filter(time__range=('13:00:00.000000', '14:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg14 = avg_wd_14["wd_value__avg"]
            # print(wd_avg14)
            if (wd_avg14 == None):
                wd_avg14 = 0
            i = 0
            data14 = []
            data14.append([])
            data14[i].append(s_no)
            data14[i].append(month_num)
            data14[i].append(date1)
            data14[i].append(time14)
            data14[i].append(round(wd_value14,3))
            data14[i].append(round(ws_avg14,3))
            data14[i].append(round(wd_avg14,3))

            s_no = s_no + 1
            time15 = '14:00'
            val_a = Weather_data.objects.filter(date=date1, time='14:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value15 = val_a
            else:
                wd_value15 = 0
            avg_ws_15 = Weather_data.objects.filter(time__range=('14:00:00.000000', '15:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg15 = avg_ws_15["ws_value__avg"]
            # print(avg_ws_15)
            if (ws_avg15 == None):
                ws_avg15 = 0
            avg_wd_15 = Weather_data.objects.filter(time__range=('14:00:00.000000', '15:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg15 = avg_wd_15["wd_value__avg"]
            # print(wd_avg15)
            if (wd_avg15 == None):
                wd_avg15 = 0
            i = 0
            data15 = []
            data15.append([])
            data15[i].append(s_no)
            data15[i].append(month_num)
            data15[i].append(date1)
            data15[i].append(time15)
            data15[i].append(round(wd_value15,3))
            data15[i].append(round(ws_avg15,3))
            data15[i].append(round(wd_avg15,3))

            s_no = s_no + 1
            time16 = '15:00'
            val_a = Weather_data.objects.filter(date=date1, time='15:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value16 = val_a
            else:
                wd_value16 = 0
            avg_ws_16 = Weather_data.objects.filter(time__range=('15:00:00.000000', '16:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg16 = avg_ws_16["ws_value__avg"]
            # print(avg_ws_16)
            if (ws_avg16 == None):
                ws_avg16 = 0
            avg_wd_16 = Weather_data.objects.filter(time__range=('15:00:00.000000', '16:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg16 = avg_wd_16["wd_value__avg"]
            # print(wd_avg16)
            if (wd_avg16 == None):
                wd_avg16 = 0
            i = 0
            data16 = []
            data16.append([])
            data16[i].append(s_no)
            data16[i].append(month_num)
            data16[i].append(date1)
            data16[i].append(time16)
            data16[i].append(round(wd_value16,3))
            data16[i].append(round(ws_avg16,3))
            data16[i].append(round(wd_avg16,3))

            s_no = s_no + 1
            time17 = '16:00'
            val_a = Weather_data.objects.filter(date=date1, time='16:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value17 = val_a
            else:
                wd_value17 = 0
            avg_ws_17 = Weather_data.objects.filter(time__range=('16:00:00.000000', '17:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg17 = avg_ws_17["ws_value__avg"]
            # print(avg_ws_17)
            if (ws_avg17 == None):
                ws_avg17 = 0
            avg_wd_17 = Weather_data.objects.filter(time__range=('16:00:00.000000', '17:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg17 = avg_wd_17["wd_value__avg"]
            # print(wd_avg17)
            if (wd_avg17 == None):
                wd_avg17 = 0
            i = 0
            data17 = []
            data17.append([])
            data17[i].append(s_no)
            data17[i].append(month_num)
            data17[i].append(date1)
            data17[i].append(time17)
            data17[i].append(round(wd_value17,3))
            data17[i].append(round(ws_avg17,3))
            data17[i].append(round(wd_avg17,3))

            s_no = s_no + 1
            time18 = '17:00'
            val_a = Weather_data.objects.filter(date=date1, time='17:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value18 = val_a
            else:
                wd_value18 = 0
            avg_ws_18 = Weather_data.objects.filter(time__range=('17:00:00.000000', '18:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg18 = avg_ws_18["ws_value__avg"]
            # print(avg_ws_18)
            if (ws_avg18 == None):
                ws_avg18 = 0
            avg_wd_18 = Weather_data.objects.filter(time__range=('17:00:00.000000', '18:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg18 = avg_wd_18["wd_value__avg"]
            # print(wd_avg18)
            if (wd_avg18 == None):
                wd_avg18 = 0
            i = 0
            data18 = []
            data18.append([])
            data18[i].append(s_no)
            data18[i].append(month_num)
            data18[i].append(date1)
            data18[i].append(time18)
            data18[i].append(round(wd_value18,3))
            data18[i].append(round(ws_avg18,3))
            data18[i].append(round(wd_avg18,3))

            s_no = s_no + 1
            time19 = '18:00'
            val_a = Weather_data.objects.filter(date=date1, time='18:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value19 = val_a
            else:
                wd_value19 = 0
            avg_ws_19 = Weather_data.objects.filter(time__range=('18:00:00.000000', '19:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg19 = avg_ws_19["ws_value__avg"]
            # print(avg_ws_19)
            if (ws_avg19 == None):
                ws_avg19 = 0
            avg_wd_19 = Weather_data.objects.filter(time__range=('18:00:00.000000', '19:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg19 = avg_wd_19["wd_value__avg"]
            # print(wd_avg19)
            if (wd_avg19 == None):
                wd_avg19 = 0
            i = 0
            data19 = []
            data19.append([])
            data19[i].append(s_no)
            data19[i].append(month_num)
            data19[i].append(date1)
            data19[i].append(time19)
            data19[i].append(round(wd_value19,3))
            data19[i].append(round(ws_avg19,3))
            data19[i].append(round(wd_avg19,3))

            s_no = s_no + 1
            time20 = '19:00'
            val_a = Weather_data.objects.filter(date=date1, time='19:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value20 = val_a
            else:
                wd_value20 = 0
            avg_ws_20 = Weather_data.objects.filter(time__range=('19:00:00.000000', '20:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg20 = avg_ws_20["ws_value__avg"]
            # print(avg_ws_20)
            if (ws_avg20 == None):
                ws_avg20 = 0
            avg_wd_20 = Weather_data.objects.filter(time__range=('19:00:00.000000', '20:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg20 = avg_wd_20["wd_value__avg"]
            # print(wd_avg20)
            if (wd_avg20 == None):
                wd_avg20 = 0
            i = 0
            data20 = []
            data20.append([])
            data20[i].append(s_no)
            data20[i].append(month_num)
            data20[i].append(date1)
            data20[i].append(time20)
            data20[i].append(round(wd_value20,3))
            data20[i].append(round(ws_avg20,3))
            data20[i].append(round(wd_avg20,3))

            s_no = s_no + 1
            time21 = '20:00'
            val_a = Weather_data.objects.filter(date=date1, time='20:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value21 = val_a
            else:
                wd_value21 = 0
            avg_ws_21 = Weather_data.objects.filter(time__range=('20:00:00.000000', '21:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg21 = avg_ws_21["ws_value__avg"]
            # print(avg_ws_21)
            if (ws_avg21 == None):
                ws_avg21 = 0
            avg_wd_21 = Weather_data.objects.filter(time__range=('20:00:00.000000', '21:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg21 = avg_wd_21["wd_value__avg"]
            # print(wd_avg21)
            if (wd_avg21 == None):
                wd_avg21 = 0
            i = 0
            data21 = []
            data21.append([])
            data21[i].append(s_no)
            data21[i].append(month_num)
            data21[i].append(date1)
            data21[i].append(time21)
            data21[i].append(round(wd_value21,3))
            data21[i].append(round(ws_avg21,3))
            data21[i].append(round(wd_avg21,3))

            s_no = s_no + 1
            time22 = '21:00'
            val_a = Weather_data.objects.filter(date=date1, time='21:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value22 = val_a
            else:
                wd_value22 = 0
            avg_ws_22 = Weather_data.objects.filter(time__range=('21:00:00.000000', '22:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg22 = avg_ws_22["ws_value__avg"]
            # print(avg_ws_22)
            if (ws_avg22 == None):
                ws_avg22 = 0
            avg_wd_22 = Weather_data.objects.filter(time__range=('21:00:00.000000', '22:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg22 = avg_wd_22["wd_value__avg"]
            # print(wd_avg22)
            if (wd_avg22 == None):
                wd_avg22 = 0
            i = 0
            data22 = []
            data22.append([])
            data22[i].append(s_no)
            data22[i].append(month_num)
            data22[i].append(date1)
            data22[i].append(time22)
            data22[i].append(round(wd_value22,3))
            data22[i].append(round(ws_avg22,3))
            data22[i].append(round(wd_avg22,3))

            s_no = s_no + 1
            time23 = '22:00'
            val_a = Weather_data.objects.filter(date=date1, time='22:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value23 = val_a
            else:
                wd_value23 = 0
            avg_ws_23 = Weather_data.objects.filter(time__range=('22:00:00.000000', '23:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg23 = avg_ws_23["ws_value__avg"]
            # print(avg_ws_23)
            if (ws_avg23 == None):
                ws_avg23 = 0
            avg_wd_23 = Weather_data.objects.filter(time__range=('22:00:00.000000', '23:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg23 = avg_wd_23["wd_value__avg"]
            # print(wd_avg23)
            if (wd_avg23 == None):
                wd_avg23 = 0
            i = 0
            data23 = []
            data23.append([])
            data23[i].append(s_no)
            data23[i].append(month_num)
            data23[i].append(date1)
            data23[i].append(time23)
            data23[i].append(round(wd_value23,3))
            data23[i].append(round(ws_avg23,3))
            data23[i].append(round(wd_avg23,3))

            s_no = s_no + 1
            time24 = '23:00'
            val_a = Weather_data.objects.filter(date=date1, time='23:00:00.000000').values('ws_value')
            # print(month_num)
            if (val_a):
                wd_value24 = val_a
            else:
                wd_value24 = 0
            avg_ws_24 = Weather_data.objects.filter(time__range=('23:00:00.000000', '23:59:59.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg24 = avg_ws_24["ws_value__avg"]
            # print(avg_ws_24)
            if (ws_avg24 == None):
                ws_avg24 = 0
            avg_wd_24 = Weather_data.objects.filter(time__range=('23:00:00.000000', '23:59:59.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg24 = avg_wd_24["wd_value__avg"]
            # print(wd_avg24)
            if (wd_avg24 == None):
                wd_avg24 = 0
            i = 0
            data24 = []
            data24.append([])
            data24[i].append(s_no)
            data24[i].append(month_num)
            data24[i].append(date1)
            data24[i].append(time24)
            data24[i].append(round(wd_value24,3))
            data24[i].append(round(ws_avg24,3))
            data24[i].append(round(wd_avg24,3))


            data_value.append([])
            data_value[s].append(data1)
            data_value[s].append(data2)
            data_value[s].append(data3)
            data_value[s].append(data4)
            data_value[s].append(data5)
            data_value[s].append(data6)
            data_value[s].append(data7)
            data_value[s].append(data8)
            data_value[s].append(data9)
            data_value[s].append(data10)
            data_value[s].append(data11)
            data_value[s].append(data12)
            data_value[s].append(data13)
            data_value[s].append(data14)
            data_value[s].append(data15)
            data_value[s].append(data16)
            data_value[s].append(data17)
            data_value[s].append(data18)
            data_value[s].append(data19)
            data_value[s].append(data20)
            data_value[s].append(data21)
            data_value[s].append(data22)
            data_value[s].append(data23)
            data_value[s].append(data24)
            # # print(data_value)
            date1 = date1 + day

        data['result'] = data_value
        # print(data)

    return JsonResponse(data)

@login_required
def frequency_distribution_count_report(request, template_name='frequency_distribution_count_report.html'):

    return render(request, template_name)

def fetch_frequency_distribution_count_ajax(request):
    if request.is_ajax():
        from_date = request.GET.get('from_date', None)
        to_date = request.GET.get('to_date', None)
        date1 = datetime.datetime.strptime(from_date, '%Y-%m-%d').date()
        date2 = datetime.datetime.strptime(to_date, '%Y-%m-%d').date()
        data = {}
        result_data = []
        data_avg_ws = []
        data_avg_wd = []
        # date2 = datetime.date(2004, 10, 8)
        # # print(date1)
        # # print(date2)
        day = datetime.timedelta(days=1)

        while date1 <= date2:
            # print(date1)
            avg_ws_1 = Weather_data.objects.filter(time__range=('00:00:00.000000', '01:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_1 = avg_ws_1["ws_value__avg"]
            # # print(avg_ws)
            if (ws_avg_1 == None):
                ws_avg_1 = 0
            avg_wd_1 = Weather_data.objects.filter(time__range=('00:00:00.000000', '01:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_1 = avg_wd_1["wd_value__avg"]
            # # print(wd_avg)
            if(wd_avg_1 == None):
                wd_avg_1 = 0

            avg_ws_2 = Weather_data.objects.filter(time__range=('01:00:00.000000', '02:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_2 = avg_ws_2["ws_value__avg"]
            if (ws_avg_2 == None):
                ws_avg_2 = 0
            avg_wd_2 = Weather_data.objects.filter(time__range=('01:00:00.000000', '02:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_2 = avg_wd_2["wd_value__avg"]
            if (wd_avg_2 == None):
                wd_avg_2 = 0

            avg_ws_3 = Weather_data.objects.filter(time__range=('02:00:00.000000', '03:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_3 = avg_ws_3["ws_value__avg"]
            # # print(avg_ws_3)
            if (ws_avg_3 == None):
                ws_avg_3 = 0
            avg_wd_3 = Weather_data.objects.filter(time__range=('02:00:00.000000', '03:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_3 = avg_wd_3["wd_value__avg"]
            # # print(wd_avg)
            if (wd_avg_3 == None):
                wd_avg_3 = 0

            avg_ws_4 = Weather_data.objects.filter(time__range=('03:00:00.000000', '04:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_4 = avg_ws_4["ws_value__avg"]
            # # print(avg_ws_4)
            if (ws_avg_4 == None):
                ws_avg_4 = 0
            avg_wd_4 = Weather_data.objects.filter(time__range=('03:00:00.000000', '04:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_4 = avg_wd_4["wd_value__avg"]
            # # print(wd_avg_4)
            if (wd_avg_4 == None):
                wd_avg_4 = 0

            avg_ws_5 = Weather_data.objects.filter(time__range=('04:00:00.000000', '05:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_5 = avg_ws_5["ws_value__avg"]
            # # print(avg_ws_5)
            if (ws_avg_5 == None):
                ws_avg_5 = 0
            avg_wd_5 = Weather_data.objects.filter(time__range=('04:00:00.000000', '05:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_5 = avg_wd_5["wd_value__avg"]
            # # print(wd_avg_5)
            if (wd_avg_5 == None):
                wd_avg_5 = 0

            avg_ws_6 = Weather_data.objects.filter(time__range=('05:00:00.000000', '06:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_6 = avg_ws_6["ws_value__avg"]
            # # print(avg_ws_6)
            if (ws_avg_6 == None):
                ws_avg_6 = 0
            avg_wd_6 = Weather_data.objects.filter(time__range=('05:00:00.000000', '06:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_6 = avg_wd_6["wd_value__avg"]
            # # print(wd_avg_6)
            if (wd_avg_6 == None):
                wd_avg_6 = 0

            avg_ws_7 = Weather_data.objects.filter(time__range=('06:00:00.000000', '07:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_7 = avg_ws_7["ws_value__avg"]
            # print(avg_ws_7)
            if (ws_avg_7 == None):
                ws_avg_7 = 0
            avg_wd_7 = Weather_data.objects.filter(time__range=('06:00:00.000000', '07:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_7 = avg_wd_7["wd_value__avg"]
            # print(wd_avg_7)
            if (wd_avg_7 == None):
                wd_avg_7 = 0

            avg_ws_8 = Weather_data.objects.filter(time__range=('07:00:00.000000', '08:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_8 = avg_ws_8["ws_value__avg"]
            # print(avg_ws_8)
            if (ws_avg_8 == None):
                ws_avg_8 = 0
            avg_wd_8 = Weather_data.objects.filter(time__range=('07:00:00.000000', '08:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_8 = avg_wd_8["wd_value__avg"]
            # print(wd_avg_8)
            if (wd_avg_8 == None):
                wd_avg_8 = 0

            avg_ws_9 = Weather_data.objects.filter(time__range=('08:00:00.000000', '09:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_9 = avg_ws_9["ws_value__avg"]
            # print(avg_ws_9)
            if (ws_avg_9 == None):
                ws_avg_9 = 0
            avg_wd_9 = Weather_data.objects.filter(time__range=('08:00:00.000000', '09:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_9 = avg_wd_9["wd_value__avg"]
            # print(wd_avg_9)
            if (wd_avg_9 == None):
                wd_avg_9 = 0

            avg_ws_10 = Weather_data.objects.filter(time__range=('09:00:00.000000', '10:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_10 = avg_ws_10["ws_value__avg"]
            # print(avg_ws_10)
            if (ws_avg_10 == None):
                ws_avg_10 = 0
            avg_wd_10 = Weather_data.objects.filter(time__range=('09:00:00.000000', '10:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_10 = avg_wd_10["wd_value__avg"]
            # print(wd_avg_10)
            if (wd_avg_10 == None):
                wd_avg_10 = 0

            avg_ws_11 = Weather_data.objects.filter(time__range=('10:00:00.000000', '11:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_11 = avg_ws_11["ws_value__avg"]
            # print(avg_ws_11)
            if (ws_avg_11 == None):
                ws_avg_11 = 0
            avg_wd_11 = Weather_data.objects.filter(time__range=('10:00:00.000000', '11:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_11 = avg_wd_11["wd_value__avg"]
            # print(wd_avg_11)
            if (wd_avg_11 == None):
                wd_avg_11 = 0

            avg_ws_12 = Weather_data.objects.filter(time__range=('11:00:00.000000', '12:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_12 = avg_ws_12["ws_value__avg"]
            # print(avg_ws_12)
            if (ws_avg_12 == None):
                ws_avg_12 = 0
            avg_wd_12 = Weather_data.objects.filter(time__range=('11:00:00.000000', '12:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_12 = avg_wd_12["wd_value__avg"]
            # print(wd_avg_12)
            if (wd_avg_12 == None):
                wd_avg_12 = 0

            avg_ws_13 = Weather_data.objects.filter(time__range=('12:00:00.000000', '13:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_13 = avg_ws_13["ws_value__avg"]
            # print(avg_ws_13)
            if (ws_avg_13 == None):
                ws_avg_13 = 0
            avg_wd_13 = Weather_data.objects.filter(time__range=('12:00:00.000000', '13:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_13 = avg_wd_13["wd_value__avg"]
            # print(wd_avg_13)
            if (wd_avg_13 == None):
                wd_avg_13 = 0

            avg_ws_14 = Weather_data.objects.filter(time__range=('13:00:00.000000', '14:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_14 = avg_ws_14["ws_value__avg"]
            # print(avg_ws_14)
            if (ws_avg_14 == None):
                ws_avg_14 = 0
            avg_wd_14 = Weather_data.objects.filter(time__range=('13:00:00.000000', '14:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_14 = avg_wd_14["wd_value__avg"]
            # print(wd_avg_14)
            if (wd_avg_14 == None):
                wd_avg_14 = 0

            avg_ws_15 = Weather_data.objects.filter(time__range=('14:00:00.000000', '15:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_15 = avg_ws_15["ws_value__avg"]
            # print(avg_ws_15)
            if (ws_avg_15 == None):
                ws_avg_15 = 0
            avg_wd_15 = Weather_data.objects.filter(time__range=('14:00:00.000000', '15:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_15 = avg_wd_15["wd_value__avg"]
            # print(wd_avg_15)
            if (wd_avg_15 == None):
                wd_avg_15 = 0

            avg_ws_16 = Weather_data.objects.filter(time__range=('15:00:00.000000', '16:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_16 = avg_ws_16["ws_value__avg"]
            # print(avg_ws_16)
            if (ws_avg_16 == None):
                ws_avg_16 = 0
            avg_wd_16 = Weather_data.objects.filter(time__range=('15:00:00.000000', '16:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_16 = avg_wd_16["wd_value__avg"]
            # print(wd_avg_16)
            if (wd_avg_16 == None):
                wd_avg_16 = 0

            avg_ws_17 = Weather_data.objects.filter(time__range=('16:00:00.000000', '17:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_17 = avg_ws_17["ws_value__avg"]
            # print(avg_ws_17)
            if (ws_avg_17 == None):
                ws_avg_17 = 0
            avg_wd_17 = Weather_data.objects.filter(time__range=('16:00:00.000000', '17:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_17 = avg_wd_17["wd_value__avg"]
            # print(wd_avg_17)
            if (wd_avg_17 == None):
                wd_avg_17 = 0

            avg_ws_18 = Weather_data.objects.filter(time__range=('17:00:00.000000', '18:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_18 = avg_ws_18["ws_value__avg"]
            # print(avg_ws_18)
            if (ws_avg_18 == None):
                ws_avg_18 = 0
            avg_wd_18 = Weather_data.objects.filter(time__range=('17:00:00.000000', '18:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_18 = avg_wd_18["wd_value__avg"]
            # print(wd_avg_18)
            if (wd_avg_18 == None):
                wd_avg_18 = 0

            avg_ws_19 = Weather_data.objects.filter(time__range=('18:00:00.000000', '19:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_19 = avg_ws_19["ws_value__avg"]
            # print(avg_ws_19)
            if (ws_avg_19 == None):
                ws_avg_19 = 0
            avg_wd_19 = Weather_data.objects.filter(time__range=('18:00:00.000000', '19:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_19 = avg_wd_19["wd_value__avg"]
            # print(wd_avg_19)
            if (wd_avg_19 == None):
                wd_avg_19 = 0

            avg_ws_20 = Weather_data.objects.filter(time__range=('19:00:00.000000', '20:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_20 = avg_ws_20["ws_value__avg"]
            # print(avg_ws_20)
            if (ws_avg_20 == None):
                ws_avg_20 = 0
            avg_wd_20 = Weather_data.objects.filter(time__range=('19:00:00.000000', '20:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_20 = avg_wd_20["wd_value__avg"]
            # print(wd_avg_20)
            if (wd_avg_20 == None):
                wd_avg_20 = 0

            avg_ws_21 = Weather_data.objects.filter(time__range=('20:00:00.000000', '21:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_21 = avg_ws_21["ws_value__avg"]
            # print(avg_ws_21)
            if (ws_avg_21 == None):
                ws_avg_21 = 0
            avg_wd_21 = Weather_data.objects.filter(time__range=('20:00:00.000000', '21:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_21 = avg_wd_21["wd_value__avg"]
            # print(wd_avg_21)
            if (wd_avg_21 == None):
                wd_avg_21 = 0

            avg_ws_22 = Weather_data.objects.filter(time__range=('21:00:00.000000', '22:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_22 = avg_ws_22["ws_value__avg"]
            # print(avg_ws_22)
            if (ws_avg_22 == None):
                ws_avg_22 = 0
            avg_wd_22 = Weather_data.objects.filter(time__range=('21:00:00.000000', '22:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_22 = avg_wd_22["wd_value__avg"]
            # print(wd_avg_22)
            if (wd_avg_22 == None):
                wd_avg_22 = 0

            avg_ws_23 = Weather_data.objects.filter(time__range=('22:00:00.000000', '23:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_23 = avg_ws_23["ws_value__avg"]
            # print(avg_ws_23)
            if (ws_avg_23 == None):
                ws_avg_23 = 0
            avg_wd_23 = Weather_data.objects.filter(time__range=('22:00:00.000000', '23:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_23 = avg_wd_23["wd_value__avg"]
            # print(wd_avg_23)
            if (wd_avg_23 == None):
                wd_avg_23 = 0

            avg_ws_24 = Weather_data.objects.filter(time__range=('23:00:00.000000', '23:59:59.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_24 = avg_ws_24["ws_value__avg"]
            # print(avg_ws_24)
            if (ws_avg_24 == None):
                ws_avg_24 = 0
            avg_wd_24 = Weather_data.objects.filter(time__range=('23:00:00.000000', '23:59:59.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_24 = avg_wd_24["wd_value__avg"]
            # print(wd_avg_24)
            if (wd_avg_24 == None):
                wd_avg_24 = 0

            i = 0

            data_avg_ws.append([])
            data_avg_ws[i].append(round(ws_avg_1,3))
            data_avg_ws[i].append(round(ws_avg_2,3))
            data_avg_ws[i].append(round(ws_avg_3,3))
            data_avg_ws[i].append(round(ws_avg_4,3))
            data_avg_ws[i].append(round(ws_avg_5,3))
            data_avg_ws[i].append(round(ws_avg_6,3))
            data_avg_ws[i].append(round(ws_avg_7,3))
            data_avg_ws[i].append(round(ws_avg_8,3))
            data_avg_ws[i].append(round(ws_avg_9,3))
            data_avg_ws[i].append(round(ws_avg_10,3))
            data_avg_ws[i].append(round(ws_avg_11,3))
            data_avg_ws[i].append(round(ws_avg_12,3))
            data_avg_ws[i].append(round(ws_avg_13,3))
            data_avg_ws[i].append(round(ws_avg_14,3))
            data_avg_ws[i].append(round(ws_avg_15,3))
            data_avg_ws[i].append(round(ws_avg_16,3))
            data_avg_ws[i].append(round(ws_avg_17,3))
            data_avg_ws[i].append(round(ws_avg_18,3))
            data_avg_ws[i].append(round(ws_avg_19,3))
            data_avg_ws[i].append(round(ws_avg_20,3))
            data_avg_ws[i].append(round(ws_avg_21,3))
            data_avg_ws[i].append(round(ws_avg_22,3))
            data_avg_ws[i].append(round(ws_avg_23,3))
            data_avg_ws[i].append(round(ws_avg_24,3))

            j = 0

            data_avg_wd.append([])
            data_avg_wd[j].append(round(wd_avg_1,3))
            data_avg_wd[j].append(round(wd_avg_2,3))
            data_avg_wd[j].append(round(wd_avg_3,3))
            data_avg_wd[j].append(round(wd_avg_4,3))
            data_avg_wd[j].append(round(wd_avg_5,3))
            data_avg_wd[j].append(round(wd_avg_6,3))
            data_avg_wd[j].append(round(wd_avg_7,3))
            data_avg_wd[j].append(round(wd_avg_8,3))
            data_avg_wd[j].append(round(wd_avg_9,3))
            data_avg_wd[j].append(round(wd_avg_10,3))
            data_avg_wd[j].append(round(wd_avg_11,3))
            data_avg_wd[j].append(round(wd_avg_12,3))
            data_avg_wd[j].append(round(wd_avg_13,3))
            data_avg_wd[j].append(round(wd_avg_14,3))
            data_avg_wd[j].append(round(wd_avg_15,3))
            data_avg_wd[j].append(round(wd_avg_16,3))
            data_avg_wd[j].append(round(wd_avg_17,3))
            data_avg_wd[j].append(round(wd_avg_18,3))
            data_avg_wd[j].append(round(wd_avg_19,3))
            data_avg_wd[j].append(round(wd_avg_20,3))
            data_avg_wd[j].append(round(wd_avg_21,3))
            data_avg_wd[j].append(round(wd_avg_22,3))
            data_avg_wd[j].append(round(wd_avg_23,3))
            data_avg_wd[j].append(round(wd_avg_24,3))

            date1 = date1 + day

        data_ws_avg =  data_avg_ws[0]
        len1 = len(data_ws_avg)
        data_wd_avg = data_avg_wd[0]
        len2 = len(data_wd_avg)
        print(data_ws_avg)
        print(data_wd_avg)
        a1=a2=a3=a4=a5=a6=b1=b2=b3=b4=b5=b6=c1=c2=c3=c4=c5=c6=d1=d2=d3=d4=d5=d6=e1=e2=e3=e4=e5=e6=f1=f2=f3=f4=f5=f6=g1=g2=g3=g4=g5=g6=0
        h1=h2=h3=h4=h5=h6=i1=i2=i3=i4=i5=i6=j1=j2=j3=j4=j5=j6=k1=k2=k3=k4=k5=k6=l1=l2=l3=l4=l5=l6=m1=m2=m3=m4=m5=m6=n1=n2=n3=n4=n5=n6=0
        o1 = o2 = o3 = o4 = o5 = o6 = p1 = p2 = p3 = p4 = p5 = p6 = 0
        for i in range(1,len2):
            avg_wd = data_wd_avg[i]


            for i in range(1,len1):
                avg_ws = data_ws_avg[i]
                print('wd', avg_wd)
                print('ws',avg_ws)

                if(avg_wd >= 348.75 or avg_wd < 11.25):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        a1 =a1 + 1
                        print('a1',a1)
                    elif(avg_ws >= 2.1 and avg_ws < 3.6):
                        a2 = a2 + 1
                        print('a2', a2)
                    elif(avg_ws >= 3.6 and avg_ws < 5.7):
                        a3 = a3 +1
                        print('a3', a3)
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        a4 = a4 + 1
                    elif(avg_ws >= 8.8 and avg_ws < 11.1):
                        a5 = a5 + 1
                    elif(avg_ws >= 11.1):
                        a6 = a6 + 1

                elif(avg_wd >= 11.25 and avg_wd < 33.75):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        b1 = b1 + 1
                    elif(avg_ws >= 2.1 and avg_ws < 3.6):
                        b2 = b2 + 1
                    elif(avg_ws >= 3.6 and avg_ws < 5.7):
                        b3 = b3 +1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        b4 = b4 + 1
                    elif(avg_ws >= 8.8 and avg_ws < 11.1):
                        b5 = b5 + 1
                    elif(avg_ws >= 11.1):
                        b6 = b6 + 1

                elif (avg_wd >= 33.75 and avg_wd < 56.25):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        c1 = c1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        c2 = c2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        c3 = c3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        c4 = c4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        c5 = c5 + 1
                    elif (avg_ws >= 11.1):
                        c6 = c6 + 1

                elif (avg_wd >= 56.25 and avg_wd < 78.75):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        d1 = d1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        d2 = d2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        d3 = d3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        d4 = d4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        d5 = d5 + 1
                    elif (avg_ws >= 11.1):
                        d6 = d6 + 1

                elif (avg_wd >= 78.75 and avg_wd < 101.25):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        e1 = e1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        e2 = e2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        e3 = e3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        e4 = e4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        e5 = e5 + 1
                    elif (avg_ws >= 11.1):
                        e6 = e6 + 1

                elif (avg_wd >= 101.25 and avg_wd < 123.75):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        f1 = f1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        f2 = f2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        f3 = f3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        f4 = f4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        f5 = f5 + 1
                    elif (avg_ws >= 11.1):
                        f6 = f6 + 1

                elif (avg_wd >= 123.75 and avg_wd <146.25):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        g1 = g1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        g2 = g2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        g3 = g3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        g4 = g4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        g5 = g5 + 1
                    elif (avg_ws >= 11.1):
                        g6 = g6 + 1

                elif (avg_wd >= 146.25 and avg_wd < 168.75):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        h1 = h1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        h2 = h2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        h3 = h3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        h4 = h4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        h5 = h5 + 1
                    elif (avg_ws >= 11.1):
                        h6 = h6 + 1

                elif (avg_wd >= 168.75 and avg_wd < 191.25):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        i1 = i1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        i2 = i2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        i3 = i3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        i4 = i4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        i5 = i5 + 1
                    elif (avg_ws >= 11.1):
                        i6 = i6 + 1

                elif (avg_wd >= 191.25 and avg_wd < 213.75):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        j1 = j1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        j2 = j2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        j3 = j3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        j4 = j4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        j5 = j5 + 1
                    elif (avg_ws >= 11.1):
                        j6 = j6 + 1

                elif (avg_wd >= 213.75 and avg_wd < 236.25):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        k1 = k1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        k2 = k2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        k3 = k3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        k4 = k4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        k5 = k5 + 1
                    elif (avg_ws >= 11.1):
                        k6 = k6 + 1

                elif (avg_wd >= 236.25 and avg_wd < 258.75):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        l1 = l1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        l2 = l2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        l3 = l3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        l4 = l4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        l5 = l5 + 1
                    elif (avg_ws >= 11.1):
                        l6 = l6 + 1

                elif (avg_wd >= 258.75 and avg_wd < 281.25):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        m1 = m1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        m2 = m2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        m3 = m3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        m4 = m4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        m5 = m5 + 1
                    elif (avg_ws >= 11.1):
                        m6 = m6 + 1

                elif (avg_wd >= 281.25 and avg_wd < 303.75):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        n1 = n1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        n2 = n2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        n3 = n3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        n4 = n4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        n5 = n5 + 1
                    elif (avg_ws >= 11.1):
                        n6 = n6 + 1

                elif (avg_wd >= 303.75 and avg_wd < 326.25):
                    if (avg_ws >= 0.5 and avg_wd < 2.1):
                        o1 = o1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        o2 = o2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        o3 = o3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        o4 = o4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        o5 = o5 + 1
                    elif (avg_ws >= 11.1):
                        o6 = o6 + 1

                elif (avg_wd >= 326.25 and avg_wd < 348.75):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        p1 = p1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        p2 = p2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        p3 = p3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        p4 = p4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        p5 = p5 + 1
                    elif (avg_ws >= 11.1):
                        p6 = p6 + 1

            t1 =  a1 + a2 + a3 + a4 + a5 + a6
            t2 = b1 + b2 + b3 + b4 + b5 + b6
            t3 = c1 + c2 + c3 + c4 + c5 + c6
            t4 = d1 + d2 + d3 + d4 + d5 + d6
            t5 = e1 + e2 + e3 + e4 + e5 + e6
            t6 = f1 + f2 + f3 + f4 + f5 + f6
            t7 = g1 + g2 + g3 + g4 + g5 + g6
            t8 = h1 + h2 + h3 + h4 + h5 + h6
            t9 = i1 + i2 + i3 + i4 + i5 + i6
            t10 = j1 + j2 + j3 + j4 + j5 + j6
            t11 = k1 + k2 + k3 + k4 + k5 + k6
            t12 = l1 + l2 + l3 + l4 + l5 + l6
            t13 = m1 + m2 + m3 + m4 + m5 + m6
            t14 = n1 + n2 + n3 + n4 + n5 + n6
            t15 = o1 + o2 + o3 + o4 + o5 + o6
            t16 = p1 + p2 + p3 + p4 + p5 + p6

            t17 = a1 + b1 + c1 + d1+ e1 + f1 + g1 + h1 + i1 + j1 + k1 + l1 + m1 + n1 + o1 + p1
            t18 = a2 + b2 + c2 + d2+ e2 + f2 + g2 + h2 + i2 + j2 + k2 + l2 + m2 + n2 + o2 + p2
            t19 = a3 + b3 + c3 + d3+ e3 + f3 + g3 + h3 + i3 + j3 + k3 + l3 + m3 + n3 + o3 + p3
            t20 = a4 + b4 + c4 + d4+ e4 + f4 + g4 + h4 + i4 + j4 + k4 + l4 + m4 + n4 + o4 + p4
            t21 = a5 + b5 + c5 + d5+ e5 + f5 + g5 + h5 + i5 + j5 + k5 + l5 + m5 + n5 + o5 + p5
            t22 = a6 + b6 + c6 + d6+ e6 + f6 + g6 + h6 + i6 + j6 + k6 + l6 + m6 + n6 + o6 + p6
            t23 = t17 + t18 + t19 + t20 + t21 + t22



        result_data.append(str(a1) + ',' + str(a2) + ',' + str(a3) + ',' + str(a4) + ',' + str(a5) + ',' + str(a6) + ',' +
                           str(b1) + ',' + str(b2) + ',' + str(b3) + ',' + str(b4) + ',' + str(b5) + ',' + str(b6) + ',' +
                           str(c1) + ',' + str(c2) + ',' + str(c3) + ',' + str(c4) + ',' + str(c5) + ',' + str(c6) + ',' +
                           str(d1) + ',' + str(d2) + ',' + str(d3) + ',' + str(d4) + ',' + str(d5) + ',' + str(d6) + ',' +
                           str(e1) + ',' + str(e2) + ',' + str(e3) + ',' + str(e4) + ',' + str(e5) + ',' + str(e6) + ',' +
                           str(f1) + ',' + str(f2) + ',' + str(f3) + ',' + str(f4) + ',' + str(f5) + ',' + str(f6) + ',' +
                           str(g1) + ',' + str(g2) + ',' + str(g3) + ',' + str(g4) + ',' + str(g5) + ',' + str(g6) + ',' +
                           str(h1) + ',' + str(h2) + ',' + str(h3) + ',' + str(h4) + ',' + str(h5) + ',' + str(h6) + ',' +
                           str(i1) + ',' + str(i2) + ',' + str(i3) + ',' + str(i4) + ',' + str(i5) + ',' + str(i6) + ',' +
                           str(j1) + ',' + str(j2) + ',' + str(j3) + ',' + str(j4) + ',' + str(j5) + ',' + str(j6) + ',' +
                           str(k1) + ',' + str(k2) + ',' + str(k3) + ',' + str(k4) + ',' + str(k5) + ',' + str(k6) + ',' +
                           str(l1) + ',' + str(l2) + ',' + str(l3) + ',' + str(l4) + ',' + str(l5) + ',' + str(l6) + ',' +
                           str(m1) + ',' + str(m2) + ',' + str(m3) + ',' + str(m4) + ',' + str(m5) + ',' + str(m6) + ',' +
                           str(n1) + ',' + str(n2) + ',' + str(n3) + ',' + str(n4) + ',' + str(n5) + ',' + str(n6) + ',' +
                           str(o1) + ',' + str(o2) + ',' + str(o3) + ',' + str(o4) + ',' + str(o5) + ',' + str(o6) + ',' +
                           str(p1) + ',' + str(p2) + ',' + str(p3) + ',' + str(p4) + ',' + str(p5) + ',' + str(p6) + ',' +
                           str(t1) + ',' + str(t2) + ',' + str(t3) + ',' + str(t4) + ',' + str(t5) + ',' + str(t6) + ',' +
                           str(t7) + ',' + str(t8) + ',' + str(t9) + ',' + str(t10) + ',' + str(t11) + ',' + str(t12) + ',' +
                           str(t13) + ',' + str(t14)+ ',' + str(t15) + ',' + str(t16) + ',' + str(t17) + ',' + str(t18) + ',' +
                           str(t19) + ',' + str(t20) + ',' + str(t21) + ',' + str(t22) + ',' + str(t23))

        data['result'] = result_data
        # print(data)
    return JsonResponse(data)


@login_required
def sensor_hourly_report(request, template_name='sensor_hourly_report.html'):

    return render(request, template_name)

def fetch_sensor_hourly_report_ajax(request):
    if request.is_ajax():
        from_date = request.GET.get('from_date', None)
        to_date = request.GET.get('to_date', None)
        date1 = datetime.datetime.strptime(from_date, '%Y-%m-%d').date()
        date2 = datetime.datetime.strptime(to_date, '%Y-%m-%d').date()
        s_no = 0
        s=0
        data_value = []
        data = {}
        # date2 = datetime.date(2004, 10, 8)
        # # print(date1)
        # # print(date2)
        day = datetime.timedelta(days=1)

        while date1 <= date2:
            # # print(date1)
            s_no = s_no + 1
            time1 = '00:00'
            # calculating average rainfall
            rainfall_1 = Weather_data.objects.filter(time__range=('00:00:00.000000', '01:00:00.000000'),date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_1 = rainfall_1["rain_gauge__avg"]
            if (avg_rainfall_1 == None):
                avg_rainfall_1 = 0
            # calculating average pm2.5
            pm2_5_1 = Weather_data.objects.filter(time__range=('00:00:00.000000', '01:00:00.000000'),date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_1 = pm2_5_1["pm2_5__avg"]
            if (avg_pm2_5_1 == None):
                avg_pm2_5_1 = 0
            # calculating average pm10
            pm10_1 = Weather_data.objects.filter(time__range=('00:00:00.000000', '01:00:00.000000'),date=date1).aggregate(Avg('pm10'))
            avg_pm10_1 = pm10_1["pm10__avg"]
            if (avg_pm10_1 == None):
                avg_pm10_1 = 0
            # calculating average humidity
            humidity_1 = Weather_data.objects.filter(time__range=('00:00:00.000000', '01:00:00.000000'),date=date1).aggregate(Avg('humidity'))
            avg_humidity_1 = humidity_1["humidity__avg"]
            if (avg_humidity_1 == None):
                avg_humidity_1 = 0
            # calculating average temperature
            temperature_1 = Weather_data.objects.filter(time__range=('00:00:00.000000', '01:00:00.000000'),date=date1).aggregate(Avg('temperature'))
            avg_temperature_1 = temperature_1["temperature__avg"]
            if (avg_temperature_1 == None):
                avg_temperature_1 = 0
            # calculating average wind speed
            avg_ws_1 = Weather_data.objects.filter(time__range=('00:00:00.000000', '01:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_1 = avg_ws_1["ws_value__avg"]
            if (ws_avg_1 == None):
                ws_avg_1 = 0
            # calculating average wind direction
            avg_wd_1 = Weather_data.objects.filter(time__range=('00:00:00.000000', '01:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_1 = avg_wd_1["wd_value__avg"]
            if(wd_avg_1 == None):
                wd_avg_1 = 0
            # calculating average No2
            no2_1 = Weather_data.objects.filter(time__range=('00:00:00.000000', '01:00:00.000000'), date=date1).aggregate(Avg('no2'))
            avg_no2_1 = no2_1["no2__avg"]
            if (avg_no2_1 == None):
                avg_no2_1 = 0
            # calculating average So2
            so2_1 = Weather_data.objects.filter(time__range=('00:00:00.000000', '01:00:00.000000'),date=date1).aggregate(Avg('so2'))
            avg_so2_1 = so2_1["so2__avg"]
            if (avg_so2_1 == None):
                avg_so2_1 = 0

            i=0
            data1=[]
            data1.append([])
            data1[i].append(s_no)
            data1[i].append(str(date1))
            data1[i].append(time1)
            data1[i].append(round(avg_rainfall_1,3))
            data1[i].append(round(avg_pm2_5_1,3))
            data1[i].append(round(avg_pm10_1,3))
            data1[i].append(round(avg_humidity_1,3))
            data1[i].append(round(avg_temperature_1,3))
            data1[i].append(round(ws_avg_1,3))
            data1[i].append(round(wd_avg_1,3))
            data1[i].append(round(avg_no2_1,3))
            data1[i].append(round(avg_so2_1,3))

            s_no = s_no + 1
            time2 = '01:00'
            # calculating average rainfall
            rainfall_2 = Weather_data.objects.filter(time__range=('01:00:00.000000', '02:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_2 = rainfall_2["rain_gauge__avg"]
            if (avg_rainfall_2 == None):
                avg_rainfall_2 = 0
            # calculating average pm2.5
            pm2_5_2 = Weather_data.objects.filter(time__range=('01:00:00.000000', '02:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_2 = pm2_5_2["pm2_5__avg"]
            if (avg_pm2_5_2 == None):
                avg_pm2_5_2 = 0
            # calculating average pm10
            pm10_2 = Weather_data.objects.filter(time__range=('01:00:00.000000', '02:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_2 = pm10_2["pm10__avg"]
            if (avg_pm10_2 == None):
                avg_pm10_2 = 0
            # calculating average humidity
            humidity_2 = Weather_data.objects.filter(time__range=('01:00:00.000000', '02:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_2 = humidity_1["humidity__avg"]
            if (avg_humidity_2 == None):
                avg_humidity_2 = 0
            # calculating average temperature
            temperature_2 = Weather_data.objects.filter(time__range=('01:00:00.000000', '02:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_2 = temperature_2["temperature__avg"]
            if (avg_temperature_2 == None):
                avg_temperature_2 = 0
            # calculating average wind speed
            avg_ws_2 = Weather_data.objects.filter(time__range=('01:00:00.000000', '02:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_2 = avg_ws_2["ws_value__avg"]
            # print(avg_ws_2)
            if (ws_avg_2 == None):
                ws_avg_2 = 0
            avg_wd_2 = Weather_data.objects.filter(time__range=('01:00:00.000000', '02:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_2 = avg_wd_2["wd_value__avg"]
            # print(wd_avg_2)
            if (wd_avg_2 == None):
                wd_avg_2 = 0
            # calculating average No2
            no2_2 = Weather_data.objects.filter(time__range=('01:00:00.000000', '02:00:00.000000'),
                                                date=date1).aggregate(Avg('no2'))
            avg_no2_2 = no2_2["no2__avg"]
            if (avg_no2_2 == None):
                avg_no2_2 = 0
            # calculating average So2
            so2_2 = Weather_data.objects.filter(time__range=('01:00:00.000000', '02:00:00.000000'),
                                                date=date1).aggregate(Avg('so2'))
            avg_so2_2 = so2_2["so2__avg"]
            if (avg_so2_2 == None):
                avg_so2_2 = 0
            i = 0
            data2 = []
            data2.append([])
            data2[i].append(s_no)
            data2[i].append(str(date1))
            data2[i].append(time2)
            data2[i].append(round(avg_rainfall_2,3))
            data2[i].append(round(avg_pm2_5_2,3))
            data2[i].append(round(avg_pm10_2,3))
            data2[i].append(round(avg_humidity_2,3))
            data2[i].append(round(avg_temperature_2,3))
            data2[i].append(round(ws_avg_2,3))
            data2[i].append(round(wd_avg_2,3))
            data2[i].append(round(avg_no2_2,3))
            data2[i].append(round(avg_so2_2,3))

            s_no = s_no + 1
            time3 = '02:00'
            # calculating average rainfall
            rainfall_3 = Weather_data.objects.filter(time__range=('02:00:00.000000', '03:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_3 = rainfall_3["rain_gauge__avg"]
            if (avg_rainfall_3 == None):
                avg_rainfall_3 = 0
            # calculating average pm2.5
            pm2_5_3 = Weather_data.objects.filter(time__range=('02:00:00.000000', '03:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_3 = pm2_5_3["pm2_5__avg"]
            if (avg_pm2_5_3 == None):
                avg_pm2_5_3 = 0
            # calculating average pm10
            pm10_3 = Weather_data.objects.filter(time__range=('02:00:00.000000', '03:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_3 = pm10_3["pm10__avg"]
            if (avg_pm10_3 == None):
                avg_pm10_3 = 0
            # calculating average humidity
            humidity_3 = Weather_data.objects.filter(time__range=('02:00:00.000000', '03:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_3 = humidity_1["humidity__avg"]
            if (avg_humidity_3 == None):
                avg_humidity_3 = 0
            # calculating average temperature
            temperature_3 = Weather_data.objects.filter(time__range=('02:00:00.000000', '03:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_3 = temperature_1["temperature__avg"]
            if (avg_temperature_3 == None):
                avg_temperature_3 = 0
            # calculating average wind speed
            avg_ws_3 = Weather_data.objects.filter(time__range=('02:00:00.000000', '03:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_3 = avg_ws_3["ws_value__avg"]
            # print(avg_ws_3)
            if (ws_avg_3 == None):
                ws_avg_3 = 0
            avg_wd_3 = Weather_data.objects.filter(time__range=('02:00:00.000000', '03:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_3 = avg_wd_3["wd_value__avg"]
            # print(wd_avg_3)
            if (wd_avg_3 == None):
                wd_avg_3 = 0
            # calculating average No2
            no2_3 = Weather_data.objects.filter(time__range=('02:00:00.000000', '03:00:00.000000'),
                                                date=date1).aggregate(Avg('no2'))
            avg_no2_3 = no2_3["no2__avg"]
            if (avg_no2_3 == None):
                avg_no2_3 = 0
            # calculating average So2
            so2_3 = Weather_data.objects.filter(time__range=('02:00:00.000000', '03:00:00.000000'),
                                                date=date1).aggregate(Avg('so2'))
            avg_so2_3 = so2_3["so2__avg"]
            if (avg_so2_3 == None):
                avg_so2_3 = 0
            i = 0
            data3 = []
            data3.append([])
            data3[i].append(s_no)
            data3[i].append(str(date1))
            data3[i].append(time3)
            data3[i].append(round(avg_rainfall_3,3))
            data3[i].append(round(avg_pm2_5_3,3))
            data3[i].append(round(avg_pm10_3,3))
            data3[i].append(round(avg_humidity_3,3))
            data3[i].append(round(avg_temperature_3,3))
            data3[i].append(round(ws_avg_3,3))
            data3[i].append(round(wd_avg_3,3))
            data3[i].append(round(avg_no2_3,3))
            data3[i].append(round(avg_so2_3,3))

            s_no = s_no + 1
            time4 = '03:00'

            # calculating average rainfall
            rainfall_4 = Weather_data.objects.filter(time__range=('03:00:00.000000', '04:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_4 = rainfall_4["rain_gauge__avg"]
            if (avg_rainfall_4 == None):
                avg_rainfall_4 = 0
            # calculating average pm2.5
            pm2_5_4 = Weather_data.objects.filter(time__range=('03:00:00.000000', '04:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_4 = pm2_5_4["pm2_5__avg"]
            if (avg_pm2_5_4 == None):
                avg_pm2_5_4 = 0
            # calculating average pm10
            pm10_4 = Weather_data.objects.filter(time__range=('03:00:00.000000', '04:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_4 = pm10_4["pm10__avg"]
            if (avg_pm10_4 == None):
                avg_pm10_4 = 0
            # calculating average humidity
            humidity_4 = Weather_data.objects.filter(time__range=('03:00:00.000000', '04:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_4 = humidity_4["humidity__avg"]
            if (avg_humidity_4 == None):
                avg_humidity_4 = 0
            # calculating average temperature
            temperature_4 = Weather_data.objects.filter(time__range=('03:00:00.000000', '04:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_4 = temperature_4["temperature__avg"]
            if (avg_temperature_4 == None):
                avg_temperature_4 = 0
            # calculating average wind speed

            avg_ws_4 = Weather_data.objects.filter(time__range=('03:00:00.000000', '04:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_4 = avg_ws_4["ws_value__avg"]
            # print(avg_ws_4)
            if (ws_avg_4 == None):
                ws_avg_4 = 0
            avg_wd_4 = Weather_data.objects.filter(time__range=('03:00:00.000000', '04:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_4 = avg_wd_4["wd_value__avg"]
            # print(wd_avg_4)
            if (wd_avg_4 == None):
                wd_avg_4 = 0
            # calculating average No2
            no2_4 = Weather_data.objects.filter(time__range=('03:00:00.000000', '04:00:00.000000'),
                                                date=date1).aggregate(Avg('no2'))
            avg_no2_4 = no2_4["no2__avg"]
            if (avg_no2_4 == None):
                avg_no2_4 = 0
            # calculating average So2
            so2_4 = Weather_data.objects.filter(time__range=('03:00:00.000000', '04:00:00.000000'),
                                                date=date1).aggregate(Avg('so2'))
            avg_so2_4 = so2_4["so2__avg"]
            if (avg_so2_4 == None):
                avg_so2_4 = 0
            i = 0
            data4 = []
            data4.append([])
            data4[i].append(s_no)
            data4[i].append(str(date1))
            data4[i].append(time4)
            data4[i].append(round(avg_rainfall_4,3))
            data4[i].append(round(avg_pm2_5_4,3))
            data4[i].append(round(avg_pm10_4,3))
            data4[i].append(round(avg_humidity_4,3))
            data4[i].append(round(avg_temperature_4,3))
            data4[i].append(round(ws_avg_4,3))
            data4[i].append(round(wd_avg_4,3))
            data4[i].append(round(avg_no2_4,3))
            data4[i].append(round(avg_so2_4,3))

            s_no = s_no + 1
            time5 = '04:00'
            # calculating average rainfall
            rainfall_5 = Weather_data.objects.filter(time__range=('04:00:00.000000', '05:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_5 = rainfall_5["rain_gauge__avg"]
            if (avg_rainfall_5 == None):
                avg_rainfall_5 = 0
            # calculating average pm2.5
            pm2_5_5 = Weather_data.objects.filter(time__range=('04:00:00.000000', '05:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_5 = pm2_5_5["pm2_5__avg"]
            if (avg_pm2_5_5 == None):
                avg_pm2_5_5 = 0
            # calculating average pm10
            pm10_5 = Weather_data.objects.filter(time__range=('04:00:00.000000', '05:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_5 = pm10_5["pm10__avg"]
            if (avg_pm10_5 == None):
                avg_pm10_5 = 0
            # calculating average humidity
            humidity_5 = Weather_data.objects.filter(time__range=('04:00:00.000000', '05:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_5 = humidity_5["humidity__avg"]
            if (avg_humidity_5 == None):
                avg_humidity_5 = 0
            # calculating average temperature
            temperature_5 = Weather_data.objects.filter(time__range=('04:00:00.000000', '05:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_5 = temperature_5["temperature__avg"]
            if (avg_temperature_5 == None):
                avg_temperature_5 = 0
            # calculating average wind speed
            avg_ws_5 = Weather_data.objects.filter(time__range=('04:00:00.000000', '05:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_5 = avg_ws_5["ws_value__avg"]
            # print(avg_ws_5)
            if (ws_avg_5 == None):
                ws_avg_5 = 0
            avg_wd_5 = Weather_data.objects.filter(time__range=('04:00:00.000000', '05:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_5 = avg_wd_5["wd_value__avg"]
            # print(wd_avg_5)
            if (wd_avg_5 == None):
                wd_avg_5 = 0
            # calculating average No2
            no2_5 = Weather_data.objects.filter(time__range=('04:00:00.000000', '05:00:00.000000'),
                                                date=date1).aggregate(Avg('no2'))
            avg_no2_5 = no2_5["no2__avg"]
            if (avg_no2_5== None):
                avg_no2_5 = 0
            # calculating average So2
            so2_5 = Weather_data.objects.filter(time__range=('04:00:00.000000', '05:00:00.000000'),
                                                date=date1).aggregate(Avg('so2'))
            avg_so2_5 = so2_5["so2__avg"]
            if (avg_so2_5 == None):
                avg_so2_5 = 0
            i = 0
            data5 = []
            data5.append([])
            data5[i].append(s_no)
            data5[i].append(str(date1))
            data5[i].append(time5)
            data5[i].append(round(avg_rainfall_5,3))
            data5[i].append(round(avg_pm2_5_5,3))
            data5[i].append(round(avg_pm10_5,3))
            data5[i].append(round(avg_humidity_5,3))
            data5[i].append(round(avg_temperature_5,3))
            data5[i].append(round(ws_avg_5,3))
            data5[i].append(round(wd_avg_5,3))
            data5[i].append(round(avg_no2_5,3))
            data5[i].append(round(avg_so2_5,3))

            s_no = s_no + 1
            time6 = '05:00'
            # calculating average rainfall
            rainfall_6 = Weather_data.objects.filter(time__range=('05:00:00.000000', '06:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_6 = rainfall_6["rain_gauge__avg"]
            if (avg_rainfall_6 == None):
                avg_rainfall_6 = 0
            # calculating average pm2.5
            pm2_5_6 = Weather_data.objects.filter(time__range=('05:00:00.000000', '06:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_6 = pm2_5_6["pm2_5__avg"]
            if (avg_pm2_5_6 == None):
                avg_pm2_5_6 = 0
            # calculating average pm10
            pm10_6 = Weather_data.objects.filter(time__range=('05:00:00.000000', '06:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_6 = pm10_6["pm10__avg"]
            if (avg_pm10_6 == None):
                avg_pm10_6 = 0
            # calculating average humidity
            humidity_6 = Weather_data.objects.filter(time__range=('05:00:00.000000', '06:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_6 = humidity_6["humidity__avg"]
            if (avg_humidity_6 == None):
                avg_humidity_6 = 0
            # calculating average temperature
            temperature_6 = Weather_data.objects.filter(time__range=('05:00:00.000000', '06:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_6 = temperature_6["temperature__avg"]
            if (avg_temperature_6 == None):
                avg_temperature_6 = 0
            # calculating average wind speed
            avg_ws_6 = Weather_data.objects.filter(time__range=('05:00:00.000000', '06:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_6 = avg_ws_6["ws_value__avg"]
            # print(avg_ws_6)
            if (ws_avg_6 == None):
                ws_avg_6 = 0
            avg_wd_6 = Weather_data.objects.filter(time__range=('05:00:00.000000', '06:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_6 = avg_wd_6["wd_value__avg"]
            # print(wd_avg_6)
            if (wd_avg_6 == None):
                wd_avg_6 = 0
            # calculating average No2
            no2_6 = Weather_data.objects.filter(time__range=('05:00:00.000000', '06:00:00.000000'),
                                                date=date1).aggregate(Avg('no2'))
            avg_no2_6 = no2_6["no2__avg"]
            if (avg_no2_6 == None):
                avg_no2_6 = 0
            # calculating average So2
            so2_6 = Weather_data.objects.filter(time__range=('05:00:00.000000', '06:00:00.000000'),
                                                date=date1).aggregate(Avg('so2'))
            avg_so2_6 = so2_6["so2__avg"]
            if (avg_so2_6 == None):
                avg_so2_6 = 0
            i = 0
            data6 = []
            data6.append([])
            data6[i].append(s_no)
            data6[i].append(str(date1))
            data6[i].append(time6)
            data6[i].append(round(avg_rainfall_6,3))
            data6[i].append(round(avg_pm2_5_6,3))
            data6[i].append(round(avg_pm10_6,3))
            data6[i].append(round(avg_humidity_6,3))
            data6[i].append(round(avg_temperature_6,3))
            data6[i].append(round(ws_avg_6,3))
            data6[i].append(round(wd_avg_6,3))
            data6[i].append(round(avg_no2_6,3))
            data6[i].append(round(avg_so2_6,3))

            s_no = s_no + 1
            time7 = '06:00'
            # calculating average rainfall
            rainfall_7 = Weather_data.objects.filter(time__range=('06:00:00.000000', '07:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_7 = rainfall_7["rain_gauge__avg"]
            if (avg_rainfall_7 == None):
                avg_rainfall_7 = 0
            # calculating average pm2.5
            pm2_5_7 = Weather_data.objects.filter(time__range=('06:00:00.000000', '07:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_7 = pm2_5_7["pm2_5__avg"]
            if (avg_pm2_5_7 == None):
                avg_pm2_5_7 = 0
            # calculating average pm10
            pm10_7 = Weather_data.objects.filter(time__range=('06:00:00.000000', '07:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_7 = pm10_7["pm10__avg"]
            if (avg_pm10_7 == None):
                avg_pm10_7 = 0
            # calculating average humidity
            humidity_7 = Weather_data.objects.filter(time__range=('06:00:00.000000', '07:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_7 = humidity_7["humidity__avg"]
            if (avg_humidity_7 == None):
                avg_humidity_7 = 0
            # calculating average temperature
            temperature_7 = Weather_data.objects.filter(time__range=('06:00:00.000000', '07:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_7 = temperature_7["temperature__avg"]
            if (avg_temperature_7 == None):
                avg_temperature_7 = 0
            # calculating average wind speed
            avg_ws_7 = Weather_data.objects.filter(time__range=('06:00:00.000000', '07:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_7 = avg_ws_7["ws_value__avg"]
            # print(avg_ws_7)
            if (ws_avg_7 == None):
                ws_avg_7 = 0
            avg_wd_7 = Weather_data.objects.filter(time__range=('06:00:00.000000', '07:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_7 = avg_wd_7["wd_value__avg"]
            # print(wd_avg_7)
            if (wd_avg_7 == None):
                wd_avg_7 = 0
            # calculating average No2
            no2_7 = Weather_data.objects.filter(time__range=('06:00:00.000000', '07:00:00.000000'),
                                                date=date1).aggregate(Avg('no2'))
            avg_no2_7 = no2_7["no2__avg"]
            if (avg_no2_7 == None):
                avg_no2_7 = 0
            # calculating average So2
            so2_7 = Weather_data.objects.filter(time__range=('06:00:00.000000', '07:00:00.000000'),
                                                date=date1).aggregate(Avg('so2'))
            avg_so2_7 = so2_7["so2__avg"]
            if (avg_so2_7 == None):
                avg_so2_7 = 0
            i = 0
            data7 = []
            data7.append([])
            data7[i].append(s_no)
            data7[i].append(str(date1))
            data7[i].append(time7)
            data7[i].append(round(avg_rainfall_7,3))
            data7[i].append(round(avg_pm2_5_7,3))
            data7[i].append(round(avg_pm10_7,3))
            data7[i].append(round(avg_humidity_7,3))
            data7[i].append(round(avg_temperature_7,3))
            data7[i].append(round(ws_avg_7,3))
            data7[i].append(round(wd_avg_7,3))
            data7[i].append(round(avg_no2_7,3))
            data7[i].append(round(avg_so2_7,3))

            s_no = s_no + 1
            time8 = '07:00'
            # calculating average rainfall
            rainfall_8 = Weather_data.objects.filter(time__range=('07:00:00.000000', '08:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_8 = rainfall_8["rain_gauge__avg"]
            if (avg_rainfall_8 == None):
                avg_rainfall_8 = 0
            # calculating average pm2.5
            pm2_5_8 = Weather_data.objects.filter(time__range=('07:00:00.000000', '08:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_8 = pm2_5_8["pm2_5__avg"]
            if (avg_pm2_5_8 == None):
                avg_pm2_5_8 = 0
            # calculating average pm10
            pm10_8 = Weather_data.objects.filter(time__range=('07:00:00.000000', '08:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_8 = pm10_8["pm10__avg"]
            if (avg_pm10_8 == None):
                avg_pm10_8 = 0
            # calculating average humidity
            humidity_8 = Weather_data.objects.filter(time__range=('07:00:00.000000', '08:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_8 = humidity_8["humidity__avg"]
            if (avg_humidity_8 == None):
                avg_humidity_8 = 0
            # calculating average temperature
            temperature_8 = Weather_data.objects.filter(time__range=('07:00:00.000000', '08:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_8 = temperature_8["temperature__avg"]
            if (avg_temperature_8 == None):
                avg_temperature_8 = 0
            # calculating average wind speed
            avg_ws_8 = Weather_data.objects.filter(time__range=('07:00:00.000000', '08:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_8 = avg_ws_8["ws_value__avg"]
            # print(avg_ws_8)
            if (ws_avg_8 == None):
                ws_avg_8 = 0
            avg_wd_8 = Weather_data.objects.filter(time__range=('07:00:00.000000', '08:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_8 = avg_wd_8["wd_value__avg"]
            # print(wd_avg_8)
            if (wd_avg_8 == None):
                wd_avg_8 = 0
            # calculating average No2
            no2_8 = Weather_data.objects.filter(time__range=('07:00:00.000000', '08:00:00.000000'),
                                                date=date1).aggregate(Avg('no2'))
            avg_no2_8 = no2_8["no2__avg"]
            if (avg_no2_8 == None):
                avg_no2_8 = 0
            # calculating average So2
            so2_8 = Weather_data.objects.filter(time__range=('07:00:00.000000', '08:00:00.000000'),
                                                date=date1).aggregate(Avg('so2'))
            avg_so2_8 = so2_8["so2__avg"]
            if (avg_so2_8 == None):
                avg_so2_8 = 0
            i = 0
            data8 = []
            data8.append([])
            data8[i].append(s_no)
            data8[i].append(str(date1))
            data8[i].append(time8)
            data8[i].append(round(avg_rainfall_8,3))
            data8[i].append(round(avg_pm2_5_8,3))
            data8[i].append(round(avg_pm10_8,3))
            data8[i].append(round(avg_humidity_8,3))
            data8[i].append(round(avg_temperature_8,3))
            data8[i].append(round(ws_avg_8,3))
            data8[i].append(round(wd_avg_8,3))
            data8[i].append(round(avg_no2_8,3))
            data8[i].append(round(avg_so2_8,3))

            s_no = s_no + 1
            time9 = '08:00'
            # calculating average rainfall
            rainfall_9 = Weather_data.objects.filter(time__range=('08:00:00.000000', '09:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_9 = rainfall_9["rain_gauge__avg"]
            if (avg_rainfall_9 == None):
                avg_rainfall_9 = 0
            # calculating average pm2.5
            pm2_5_9 = Weather_data.objects.filter(time__range=('08:00:00.000000', '09:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_9 = pm2_5_9["pm2_5__avg"]
            if (avg_pm2_5_9 == None):
                avg_pm2_5_9 = 0
            # calculating average pm10
            pm10_9 = Weather_data.objects.filter(time__range=('08:00:00.000000', '09:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_9 = pm10_9["pm10__avg"]
            if (avg_pm10_9 == None):
                avg_pm10_9 = 0
            # calculating average humidity
            humidity_9 = Weather_data.objects.filter(time__range=('08:00:00.000000', '09:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_9 = humidity_9["humidity__avg"]
            if (avg_humidity_9 == None):
                avg_humidity_9 = 0
            # calculating average temperature
            temperature_9 = Weather_data.objects.filter(time__range=('08:00:00.000000', '09:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_9 = temperature_9["temperature__avg"]
            if (avg_temperature_9 == None):
                avg_temperature_9 = 0
            # calculating average wind speed
            avg_ws_9 = Weather_data.objects.filter(time__range=('08:00:00.000000', '09:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_9 = avg_ws_9["ws_value__avg"]
            # print(avg_ws_9)
            if (ws_avg_9 == None):
                ws_avg_9 = 0
            avg_wd_9 = Weather_data.objects.filter(time__range=('08:00:00.000000', '09:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_9 = avg_wd_9["wd_value__avg"]
            # print(wd_avg_9)
            if (wd_avg_9 == None):
                wd_avg_9 = 0
            # calculating average No2
            no2_9 = Weather_data.objects.filter(time__range=('08:00:00.000000', '09:00:00.000000'),
                                                date=date1).aggregate(Avg('no2'))
            avg_no2_9 = no2_9["no2__avg"]
            if (avg_no2_9 == None):
                avg_no2_9 = 0
            # calculating average So2
            so2_9 = Weather_data.objects.filter(time__range=('08:00:00.000000', '09:00:00.000000'),
                                                date=date1).aggregate(Avg('so2'))
            avg_so2_9 = so2_9["so2__avg"]
            if (avg_so2_9 == None):
                avg_so2_9 = 0
            i = 0
            data9 = []
            data9.append([])
            data9[i].append(s_no)
            data9[i].append(str(date1))
            data9[i].append(time9)
            data9[i].append(round(avg_rainfall_9,3))
            data9[i].append(round(avg_pm2_5_9,3))
            data9[i].append(round(avg_pm10_9,3))
            data9[i].append(round(avg_humidity_9,3))
            data9[i].append(round(avg_temperature_9,3))
            data9[i].append(round(ws_avg_9,3))
            data9[i].append(round(wd_avg_9,3))
            data9[i].append(round(avg_no2_9,3))
            data9[i].append(round(avg_so2_9,3))

            s_no = s_no + 1
            time10 = '09:00'
            # calculating average rainfall
            rainfall_10 = Weather_data.objects.filter(time__range=('09:00:00.000000', '10:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_10 = rainfall_10["rain_gauge__avg"]
            if (avg_rainfall_10 == None):
                avg_rainfall_10 = 0
            # calculating average pm2.5
            pm2_5_10 = Weather_data.objects.filter(time__range=('09:00:00.000000', '10:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_10 = pm2_5_10["pm2_5__avg"]
            if (avg_pm2_5_10 == None):
                avg_pm2_5_10 = 0
            # calculating average pm10
            pm10_10 = Weather_data.objects.filter(time__range=('09:00:00.000000', '10:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_10 = pm10_10["pm10__avg"]
            if (avg_pm10_10 == None):
                avg_pm10_10 = 0
            # calculating average humidity
            humidity_10 = Weather_data.objects.filter(time__range=('09:00:00.000000', '10:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_10 = humidity_10["humidity__avg"]
            if (avg_humidity_10 == None):
                avg_humidity_10 = 0
            # calculating average temperature
            temperature_10 = Weather_data.objects.filter(time__range=('09:00:00.000000', '10:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_10 = temperature_10["temperature__avg"]
            if (avg_temperature_10 == None):
                avg_temperature_10 = 0
            # calculating average wind speed
            avg_ws_10 = Weather_data.objects.filter(time__range=('09:00:00.000000', '10:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_10 = avg_ws_10["ws_value__avg"]
            # print(avg_ws_10)
            if (ws_avg_10 == None):
                ws_avg_10 = 0
            avg_wd_10 = Weather_data.objects.filter(time__range=('09:00:00.000000', '10:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_10 = avg_wd_10["wd_value__avg"]
            # print(wd_avg_10)
            if (wd_avg_10 == None):
                wd_avg_10 = 0
            # calculating average No2
            no2_10 = Weather_data.objects.filter(time__range=('09:00:00.000000', '10:00:00.000000'),
                                                date=date1).aggregate(Avg('no2'))
            avg_no2_10 = no2_10["no2__avg"]
            if (avg_no2_10 == None):
                avg_no2_10 = 0
            # calculating average So2
            so2_10 = Weather_data.objects.filter(time__range=('09:00:00.000000', '10:00:00.000000'),
                                                date=date1).aggregate(Avg('so2'))
            avg_so2_10 = so2_10["so2__avg"]
            if (avg_so2_10 == None):
                avg_so2_10 = 0
            i = 0
            data10 = []
            data10.append([])
            data10[i].append(s_no)
            data10[i].append(str(date1))
            data10[i].append(time10)
            data10[i].append(round(avg_rainfall_10,3))
            data10[i].append(round(avg_pm2_5_10,3))
            data10[i].append(round(avg_pm10_10,3))
            data10[i].append(round(avg_humidity_10,3))
            data10[i].append(round(avg_temperature_10,3))
            data10[i].append(round(ws_avg_10,3))
            data10[i].append(round(wd_avg_10,3))
            data10[i].append(round(avg_no2_10,3))
            data10[i].append(round(avg_so2_10,3))

            s_no = s_no + 1
            time11 = '10:00'
            # calculating average rainfall
            rainfall_11 = Weather_data.objects.filter(time__range=('10:00:00.000000', '11:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_11 = rainfall_11["rain_gauge__avg"]
            if (avg_rainfall_11 == None):
                avg_rainfall_11 = 0
            # calculating average pm2.5
            pm2_5_11 = Weather_data.objects.filter(time__range=('10:00:00.000000', '11:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_11 = pm2_5_11["pm2_5__avg"]
            if (avg_pm2_5_11 == None):
                avg_pm2_5_11 = 0
            # calculating average pm10
            pm10_11 = Weather_data.objects.filter(time__range=('10:00:00.000000', '11:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_11 = pm10_11["pm10__avg"]
            if (avg_pm10_11 == None):
                avg_pm10_11 = 0
            # calculating average humidity
            humidity_11 = Weather_data.objects.filter(time__range=('10:00:00.000000', '11:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_11 = humidity_11["humidity__avg"]
            if (avg_humidity_11 == None):
                avg_humidity_11 = 0
            # calculating average temperature
            temperature_11 = Weather_data.objects.filter(time__range=('10:00:00.000000', '11:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_11 = temperature_11["temperature__avg"]
            if (avg_temperature_11 == None):
                avg_temperature_11 = 0
            # calculating average wind speed
            avg_ws_11 = Weather_data.objects.filter(time__range=('10:00:00.000000', '11:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_11 = avg_ws_11["ws_value__avg"]
            # print(avg_ws_11)
            if (ws_avg_11 == None):
                ws_avg_11 = 0
            avg_wd_11 = Weather_data.objects.filter(time__range=('10:00:00.000000', '11:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_11 = avg_wd_11["wd_value__avg"]
            # print(wd_avg_11)
            if (wd_avg_11 == None):
                wd_avg_11 = 0
            # calculating average No2
            no2_11 = Weather_data.objects.filter(time__range=('10:00:00.000000', '11:00:00.000000'),
                                                date=date1).aggregate(Avg('no2'))
            avg_no2_11 = no2_11["no2__avg"]
            if (avg_no2_11 == None):
                avg_no2_11 = 0
            # calculating average So2
            so2_11 = Weather_data.objects.filter(time__range=('10:00:00.000000', '11:00:00.000000'),
                                                date=date1).aggregate(Avg('so2'))
            avg_so2_11 = so2_11["so2__avg"]
            if (avg_so2_11 == None):
                avg_so2_11 = 0
            i = 0
            i = 0
            data11 = []
            data11.append([])
            data11[i].append(s_no)
            data11[i].append(str(date1))
            data11[i].append(time11)
            data11[i].append(round(avg_rainfall_11,3))
            data11[i].append(round(avg_pm2_5_11,3))
            data11[i].append(round(avg_pm10_11,3))
            data11[i].append(round(avg_humidity_11,3))
            data11[i].append(round(avg_temperature_11,3))
            data11[i].append(round(ws_avg_11,3))
            data11[i].append(round(wd_avg_11,3))
            data11[i].append(round(avg_no2_11,3))
            data11[i].append(round(avg_so2_11,3))

            s_no = s_no + 1
            time12 = '11:00'
            # calculating average rainfall
            rainfall_12 = Weather_data.objects.filter(time__range=('11:00:00.000000', '12:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_12 = rainfall_12["rain_gauge__avg"]
            if (avg_rainfall_12 == None):
                avg_rainfall_12 = 0
            # calculating average pm2.5
            pm2_5_12 = Weather_data.objects.filter(time__range=('11:00:00.000000', '12:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_12 = pm2_5_12["pm2_5__avg"]
            if (avg_pm2_5_12 == None):
                avg_pm2_5_12 = 0
            # calculating average pm10
            pm10_12 = Weather_data.objects.filter(time__range=('11:00:00.000000', '12:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_12 = pm10_12["pm10__avg"]
            if (avg_pm10_12 == None):
                avg_pm10_12 = 0
            # calculating average humidity
            humidity_12 = Weather_data.objects.filter(time__range=('11:00:00.000000', '12:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_12 = humidity_12["humidity__avg"]
            if (avg_humidity_12 == None):
                avg_humidity_12 = 0
            # calculating average temperature
            temperature_12 = Weather_data.objects.filter(time__range=('11:00:00.000000', '12:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_12 = temperature_12["temperature__avg"]
            if (avg_temperature_12 == None):
                avg_temperature_12 = 0
            # calculating average wind speed
            avg_ws_12 = Weather_data.objects.filter(time__range=('11:00:00.000000', '12:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_12 = avg_ws_12["ws_value__avg"]
            # print(avg_ws_12)
            if (ws_avg_12 == None):
                ws_avg_12 = 0
            avg_wd_12 = Weather_data.objects.filter(time__range=('11:00:00.000000', '12:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_12 = avg_wd_12["wd_value__avg"]
            # print(wd_avg_12)
            if (wd_avg_12 == None):
                wd_avg_12 = 0
            # calculating average No2
            no2_12 = Weather_data.objects.filter(time__range=('11:00:00.000000', '12:00:00.000000'),
                                                date=date1).aggregate(Avg('no2'))
            avg_no2_12 = no2_12["no2__avg"]
            if (avg_no2_12 == None):
                avg_no2_12 = 0
            # calculating average So2
            so2_12 = Weather_data.objects.filter(time__range=('11:00:00.000000', '12:00:00.000000'),
                                                date=date1).aggregate(Avg('so2'))
            avg_so2_12 = so2_12["so2__avg"]
            if (avg_so2_12 == None):
                avg_so2_12 = 0
            i = 0
            data12 = []
            data12.append([])
            data12[i].append(s_no)
            data12[i].append(str(date1))
            data12[i].append(time12)
            data12[i].append(round(avg_rainfall_12,3))
            data12[i].append(round(avg_pm2_5_12,3))
            data12[i].append(round(avg_pm10_12,3))
            data12[i].append(round(avg_humidity_12,3))
            data12[i].append(round(avg_temperature_12,3))
            data12[i].append(round(ws_avg_12,3))
            data12[i].append(round(wd_avg_12,3))
            data12[i].append(round(avg_no2_12,3))
            data12[i].append(round(avg_so2_12,3))

            s_no = s_no + 1
            time13 = '12:00'
            # calculating average rainfall
            rainfall_13 = Weather_data.objects.filter(time__range=('12:00:00.000000', '13:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_13 = rainfall_13["rain_gauge__avg"]
            if (avg_rainfall_13 == None):
                avg_rainfall_13 = 0
            # calculating average pm2.5
            pm2_5_13 = Weather_data.objects.filter(time__range=('12:00:00.000000', '13:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_13 = pm2_5_13["pm2_5__avg"]
            if (avg_pm2_5_13 == None):
                avg_pm2_5_13 = 0
            # calculating average pm10
            pm10_13 = Weather_data.objects.filter(time__range=('12:00:00.000000', '13:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_13 = pm10_13["pm10__avg"]
            if (avg_pm10_13 == None):
                avg_pm10_13 = 0
            # calculating average humidity
            humidity_13 = Weather_data.objects.filter(time__range=('12:00:00.000000', '13:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_13 = humidity_13["humidity__avg"]
            if (avg_humidity_13 == None):
                avg_humidity_13 = 0
            # calculating average temperature
            temperature_13 = Weather_data.objects.filter(time__range=('12:00:00.000000', '13:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_13 = temperature_13["temperature__avg"]
            if (avg_temperature_13 == None):
                avg_temperature_13 = 0
            # calculating average wind speed
            avg_ws_13 = Weather_data.objects.filter(time__range=('12:00:00.000000', '13:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_13 = avg_ws_13["ws_value__avg"]
            # print(avg_ws_13)
            if (ws_avg_13 == None):
                ws_avg_13 = 0
            avg_wd_13 = Weather_data.objects.filter(time__range=('12:00:00.000000', '13:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_13 = avg_wd_13["wd_value__avg"]
            # print(wd_avg_13)
            if (wd_avg_13 == None):
                wd_avg_13 = 0
            # calculating average No2
            no2_13 = Weather_data.objects.filter(time__range=('12:00:00.000000', '14:00:00.000000'),
                                                date=date1).aggregate(Avg('no2'))
            avg_no2_13 = no2_13["no2__avg"]
            if (avg_no2_13 == None):
                avg_no2_13 = 0
            # calculating average So2
            so2_13 = Weather_data.objects.filter(time__range=('12:00:00.000000', '13:00:00.000000'),
                                                date=date1).aggregate(Avg('so2'))
            avg_so2_13 = so2_13["so2__avg"]
            if (avg_so2_13 == None):
                avg_so2_13 = 0
            i = 0
            data13 = []
            data13.append([])
            data13[i].append(s_no)
            data13[i].append(str(date1))
            data13[i].append(time13)
            data13[i].append(round(avg_rainfall_13,3))
            data13[i].append(round(avg_pm2_5_13,3))
            data13[i].append(round(avg_pm10_13,3))
            data13[i].append(round(avg_humidity_13,3))
            data13[i].append(round(avg_temperature_13,3))
            data13[i].append(round(ws_avg_13,3))
            data13[i].append(round(wd_avg_13,3))
            data13[i].append(round(avg_no2_13,3))
            data13[i].append(round(avg_so2_13,3))

            s_no = s_no + 1
            time14 = '13:00'
            # calculating average rainfall
            rainfall_14 = Weather_data.objects.filter(time__range=('13:00:00.000000', '14:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_14 = rainfall_14["rain_gauge__avg"]
            if (avg_rainfall_14 == None):
                avg_rainfall_14 = 0
            # calculating average pm2.5
            pm2_5_14 = Weather_data.objects.filter(time__range=('13:00:00.000000', '14:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_14 = pm2_5_14["pm2_5__avg"]
            if (avg_pm2_5_14 == None):
                avg_pm2_5_14 = 0
            # calculating average pm10
            pm10_14 = Weather_data.objects.filter(time__range=('13:00:00.000000', '14:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_14 = pm10_14["pm10__avg"]
            if (avg_pm10_14 == None):
                avg_pm10_14 = 0
            # calculating average humidity
            humidity_14 = Weather_data.objects.filter(time__range=('13:00:00.000000', '14:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_14 = humidity_14["humidity__avg"]
            if (avg_humidity_14 == None):
                avg_humidity_14 = 0
            # calculating average temperature
            temperature_14 = Weather_data.objects.filter(time__range=('13:00:00.000000', '14:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_14 = temperature_14["temperature__avg"]
            if (avg_temperature_14 == None):
                avg_temperature_14 = 0
            # calculating average wind speed
            avg_ws_14 = Weather_data.objects.filter(time__range=('13:00:00.000000', '14:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_14 = avg_ws_14["ws_value__avg"]
            # print(avg_ws_14)
            if (ws_avg_14 == None):
                ws_avg_14 = 0
            avg_wd_14 = Weather_data.objects.filter(time__range=('13:00:00.000000', '14:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_14 = avg_wd_14["wd_value__avg"]
            # print(wd_avg_14)
            if (wd_avg_14 == None):
                wd_avg_14 = 0
            # calculating average No2
            no2_14 = Weather_data.objects.filter(time__range=('13:00:00.000000', '14:00:00.000000'),
                                                 date=date1).aggregate(Avg('no2'))
            avg_no2_14 = no2_14["no2__avg"]
            if (avg_no2_14 == None):
                avg_no2_14 = 0
            # calculating average So2
            so2_14 = Weather_data.objects.filter(time__range=('13:00:00.000000', '14:00:00.000000'),
                                                 date=date1).aggregate(Avg('so2'))
            avg_so2_14 = so2_14["so2__avg"]
            if (avg_so2_14 == None):
                avg_so2_14 = 0
            i = 0
            data14 = []
            data14.append([])
            data14[i].append(s_no)
            data14[i].append(str(date1))
            data14[i].append(time14)
            data14[i].append(round(avg_rainfall_14,3))
            data14[i].append(round(avg_pm2_5_14,3))
            data14[i].append(round(avg_pm10_14,3))
            data14[i].append(round(avg_humidity_14,3))
            data14[i].append(round(avg_temperature_14,3))
            data14[i].append(round(ws_avg_14,3))
            data14[i].append(round(wd_avg_14,3))
            data14[i].append(round(avg_no2_14,3))
            data14[i].append(round(avg_so2_14,3))

            s_no = s_no + 1
            time15 = '14:00'
            # calculating average rainfall
            rainfall_15 = Weather_data.objects.filter(time__range=('14:00:00.000000', '15:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_15 = rainfall_15["rain_gauge__avg"]
            if (avg_rainfall_15 == None):
                avg_rainfall_15 = 0
            # calculating average pm2.5
            pm2_5_15 = Weather_data.objects.filter(time__range=('14:00:00.000000', '15:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_15 = pm2_5_15["pm2_5__avg"]
            if (avg_pm2_5_15 == None):
                avg_pm2_5_15 = 0
            # calculating average pm10
            pm10_15 = Weather_data.objects.filter(time__range=('14:00:00.000000', '15:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_15 = pm10_15["pm10__avg"]
            if (avg_pm10_15 == None):
                avg_pm10_15 = 0
            # calculating average humidity
            humidity_15= Weather_data.objects.filter(time__range=('14:00:00.000000', '15:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_15 = humidity_15["humidity__avg"]
            if (avg_humidity_15 == None):
                avg_humidity_15 = 0
            # calculating average temperature
            temperature_15 = Weather_data.objects.filter(time__range=('14:00:00.000000', '15:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_15 = temperature_15["temperature__avg"]
            if (avg_temperature_15 == None):
                avg_temperature_15 = 0
            # calculating average wind speed
            avg_ws_15 = Weather_data.objects.filter(time__range=('14:00:00.000000', '15:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_15 = avg_ws_15["ws_value__avg"]
            # print(avg_ws_15)
            if (ws_avg_15 == None):
                ws_avg_15 = 0
            avg_wd_15 = Weather_data.objects.filter(time__range=('14:00:00.000000', '15:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_15 = avg_wd_15["wd_value__avg"]
            # print(wd_avg_15)
            if (wd_avg_15 == None):
                wd_avg_15 = 0
            no2_15 = Weather_data.objects.filter(time__range=('14:00:00.000000', '15:00:00.000000'),
                                                 date=date1).aggregate(Avg('no2'))
            avg_no2_15 = no2_15["no2__avg"]
            if (avg_no2_15 == None):
                avg_no2_15 = 0
            # calculating average So2
            so2_15 = Weather_data.objects.filter(time__range=('14:00:00.000000', '15:00:00.000000'),
                                                 date=date1).aggregate(Avg('so2'))
            avg_so2_15 = so2_15["so2__avg"]
            if (avg_so2_15 == None):
                avg_so2_15 = 0
            i = 0
            data15 = []
            data15.append([])
            data15[i].append(s_no)
            data15[i].append(str(date1))
            data15[i].append(time15)
            data15[i].append(round(avg_rainfall_15,3))
            data15[i].append(round(avg_pm2_5_15,3))
            data15[i].append(round(avg_pm10_15,3))
            data15[i].append(round(avg_humidity_15,3))
            data15[i].append(round(avg_temperature_15,3))
            data15[i].append(round(ws_avg_15,3))
            data15[i].append(round(wd_avg_15,3))
            data15[i].append(round(avg_no2_15,3))
            data15[i].append(round(avg_so2_15,3))

            s_no = s_no + 1
            time16 = '15:00'
            # calculating average rainfall
            rainfall_16 = Weather_data.objects.filter(time__range=('15:00:00.000000', '16:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_16 = rainfall_16["rain_gauge__avg"]
            if (avg_rainfall_16 == None):
                avg_rainfall_16 = 0
            # calculating average pm2.5
            pm2_5_16 = Weather_data.objects.filter(time__range=('15:00:00.000000', '16:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_16 = pm2_5_16["pm2_5__avg"]
            if (avg_pm2_5_16 == None):
                avg_pm2_5_16 = 0
            # calculating average pm10
            pm10_16 = Weather_data.objects.filter(time__range=('15:00:00.000000', '16:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_16 = pm10_16["pm10__avg"]
            if (avg_pm10_16 == None):
                avg_pm10_16 = 0
            # calculating average humidity
            humidity_16 = Weather_data.objects.filter(time__range=('15:00:00.000000', '16:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_16 = humidity_16["humidity__avg"]
            if (avg_humidity_16 == None):
                avg_humidity_16 = 0
            # calculating average temperature
            temperature_16 = Weather_data.objects.filter(time__range=('15:00:00.000000', '16:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_16 = temperature_16["temperature__avg"]
            if (avg_temperature_16 == None):
                avg_temperature_16 = 0
            # calculating average wind speed
            avg_ws_16 = Weather_data.objects.filter(time__range=('15:00:00.000000', '16:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_16 = avg_ws_16["ws_value__avg"]
            # print(avg_ws_16)
            if (ws_avg_16 == None):
                ws_avg_16 = 0
            avg_wd_16 = Weather_data.objects.filter(time__range=('15:00:00.000000', '16:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_16 = avg_wd_16["wd_value__avg"]
            # print(wd_avg_16)
            if (wd_avg_16 == None):
                wd_avg_16 = 0

            no2_16 = Weather_data.objects.filter(time__range=('15:00:00.000000', '16:00:00.000000'),
                                                 date=date1).aggregate(Avg('no2'))
            avg_no2_16 = no2_14["no2__avg"]
            if (avg_no2_16 == None):
                avg_no2_16 = 0
            # calculating average So2
            so2_16 = Weather_data.objects.filter(time__range=('15:00:00.000000', '16:00:00.000000'),
                                                 date=date1).aggregate(Avg('so2'))
            avg_so2_16 = so2_16["so2__avg"]
            if (avg_so2_16 == None):
                avg_so2_16 = 0
            i = 0
            data16 = []
            data16.append([])
            data16[i].append(s_no)
            data16[i].append(str(date1))
            data16[i].append(time16)
            data16[i].append(round(avg_rainfall_16,3))
            data16[i].append(round(avg_pm2_5_16,3))
            data16[i].append(round(avg_pm10_16,3))
            data16[i].append(round(avg_humidity_16,3))
            data16[i].append(round(avg_temperature_16,3))
            data16[i].append(round(ws_avg_16,3))
            data16[i].append(round(wd_avg_16,3))
            data16[i].append(round(avg_no2_16,3))
            data16[i].append(round(avg_so2_16,3))

            s_no = s_no + 1
            time17 = '16:00'
            # calculating average rainfall
            rainfall_17 = Weather_data.objects.filter(time__range=('16:00:00.000000', '17:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_17 = rainfall_17["rain_gauge__avg"]
            if (avg_rainfall_17 == None):
                avg_rainfall_17 = 0
            # calculating average pm2.5
            pm2_5_17 = Weather_data.objects.filter(time__range=('16:00:00.000000', '17:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_17 = pm2_5_17["pm2_5__avg"]
            if (avg_pm2_5_17 == None):
                avg_pm2_5_17 = 0
            # calculating average pm10
            pm10_17 = Weather_data.objects.filter(time__range=('16:00:00.000000', '17:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_17 = pm10_17["pm10__avg"]
            if (avg_pm10_17 == None):
                avg_pm10_17 = 0
            # calculating average humidity
            humidity_17 = Weather_data.objects.filter(time__range=('16:00:00.000000', '17:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_17 = humidity_17["humidity__avg"]
            if (avg_humidity_17 == None):
                avg_humidity_17 = 0
            # calculating average temperature
            temperature_17 = Weather_data.objects.filter(time__range=('16:00:00.000000', '17:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_17 = temperature_17["temperature__avg"]
            if (avg_temperature_17 == None):
                avg_temperature_17 = 0
            # calculating average wind speed
            avg_ws_17 = Weather_data.objects.filter(time__range=('16:00:00.000000', '17:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_17 = avg_ws_17["ws_value__avg"]
            # print(avg_ws_17)
            if (ws_avg_17 == None):
                ws_avg_17 = 0
            avg_wd_17 = Weather_data.objects.filter(time__range=('16:00:00.000000', '17:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_17 = avg_wd_17["wd_value__avg"]
            # print(wd_avg_17)
            if (wd_avg_17 == None):
                wd_avg_17 = 0

            no2_17 = Weather_data.objects.filter(time__range=('16:00:00.000000', '17:00:00.000000'),
                                                 date=date1).aggregate(Avg('no2'))
            avg_no2_17 = no2_17["no2__avg"]
            if (avg_no2_17 == None):
                avg_no2_17 = 0
            # calculating average So2
            so2_17 = Weather_data.objects.filter(time__range=('16:00:00.000000', '17:00:00.000000'),
                                                 date=date1).aggregate(Avg('so2'))
            avg_so2_17 = so2_17["so2__avg"]
            if (avg_so2_17 == None):
                avg_so2_17 = 0
            i = 0
            data17 = []
            data17.append([])
            data17[i].append(s_no)
            data17[i].append(str(date1))
            data17[i].append(time17)
            data17[i].append(round(avg_rainfall_17,3))
            data17[i].append(round(avg_pm2_5_17,3))
            data17[i].append(round(avg_pm10_17,3))
            data17[i].append(round(avg_humidity_17,3))
            data17[i].append(round(avg_temperature_17,3))
            data17[i].append(round(ws_avg_17,3))
            data17[i].append(round(wd_avg_17,3))
            data17[i].append(round(avg_no2_17,3))
            data17[i].append(round(avg_so2_17,3))

            s_no = s_no + 1
            time18 = '17:00'
            # calculating average rainfall
            rainfall_18 = Weather_data.objects.filter(time__range=('17:00:00.000000', '18:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_18 = rainfall_18["rain_gauge__avg"]
            if (avg_rainfall_18 == None):
                avg_rainfall_18 = 0
            # calculating average pm2.5
            pm2_5_18 = Weather_data.objects.filter(time__range=('17:00:00.000000', '18:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_18 = pm2_5_18["pm2_5__avg"]
            if (avg_pm2_5_18 == None):
                avg_pm2_5_18 = 0
            # calculating average pm10
            pm10_18 = Weather_data.objects.filter(time__range=('17:00:00.000000', '18:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_18 = pm10_18["pm10__avg"]
            if (avg_pm10_18 == None):
                avg_pm10_18 = 0
            # calculating average humidity
            humidity_18 = Weather_data.objects.filter(time__range=('17:00:00.000000', '18:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_18 = humidity_18["humidity__avg"]
            if (avg_humidity_18 == None):
                avg_humidity_18 = 0
            # calculating average temperature
            temperature_18 = Weather_data.objects.filter(time__range=('17:00:00.000000', '18:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_18 = temperature_18["temperature__avg"]
            if (avg_temperature_18 == None):
                avg_temperature_18 = 0
            # calculating average wind speed
            avg_ws_18 = Weather_data.objects.filter(time__range=('17:00:00.000000', '18:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_18 = avg_ws_18["ws_value__avg"]
            # print(avg_ws_18)
            if (ws_avg_18 == None):
                ws_avg_18 = 0
            avg_wd_18 = Weather_data.objects.filter(time__range=('17:00:00.000000', '18:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_18 = avg_wd_18["wd_value__avg"]
            # print(wd_avg_18)
            if (wd_avg_18 == None):
                wd_avg_18 = 0

            no2_18 = Weather_data.objects.filter(time__range=('17:00:00.000000', '18:00:00.000000'),
                                                 date=date1).aggregate(Avg('no2'))
            avg_no2_18 = no2_18["no2__avg"]
            if (avg_no2_18 == None):
                avg_no2_18 = 0
            # calculating average So2
            so2_18 = Weather_data.objects.filter(time__range=('17:00:00.000000', '18:00:00.000000'),
                                                 date=date1).aggregate(Avg('so2'))
            avg_so2_18 = so2_18["so2__avg"]
            if (avg_so2_18 == None):
                avg_so2_18 = 0
            i = 0
            data18 = []
            data18.append([])
            data18[i].append(s_no)
            data18[i].append(str(date1))
            data18[i].append(time18)
            data18[i].append(round(avg_rainfall_18,3))
            data18[i].append(round(avg_pm2_5_18,3))
            data18[i].append(round(avg_pm10_18,3))
            data18[i].append(round(avg_humidity_18,3))
            data18[i].append(round(avg_temperature_18,3))
            data18[i].append(round(ws_avg_18,3))
            data18[i].append(round(wd_avg_18,3))
            data18[i].append(round(avg_no2_18,3))
            data18[i].append(round(avg_so2_18,3))

            s_no = s_no + 1
            time19 = '18:00'
            # calculating average rainfall
            rainfall_19 = Weather_data.objects.filter(time__range=('18:00:00.000000', '19:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_19 = rainfall_19["rain_gauge__avg"]
            if (avg_rainfall_19 == None):
                avg_rainfall_19 = 0
            # calculating average pm2.5
            pm2_5_19 = Weather_data.objects.filter(time__range=('18:00:00.000000', '19:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_19 = pm2_5_19["pm2_5__avg"]
            if (avg_pm2_5_19 == None):
                avg_pm2_5_19 = 0
            # calculating average pm10
            pm10_19 = Weather_data.objects.filter(time__range=('18:00:00.000000', '19:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_19 = pm10_19["pm10__avg"]
            if (avg_pm10_19 == None):
                avg_pm10_19 = 0
            # calculating average humidity
            humidity_19 = Weather_data.objects.filter(time__range=('18:00:00.000000', '19:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_19 = humidity_19["humidity__avg"]
            if (avg_humidity_19 == None):
                avg_humidity_19 = 0
            # calculating average temperature
            temperature_19 = Weather_data.objects.filter(time__range=('18:00:00.000000', '19:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_19 = temperature_19["temperature__avg"]
            if (avg_temperature_19 == None):
                avg_temperature_19 = 0
            # calculating average wind speed
            avg_ws_19 = Weather_data.objects.filter(time__range=('18:00:00.000000', '19:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_19 = avg_ws_19["ws_value__avg"]
            # print(avg_ws_19)
            if (ws_avg_19 == None):
                ws_avg_19 = 0
            avg_wd_19 = Weather_data.objects.filter(time__range=('18:00:00.000000', '19:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_19 = avg_wd_19["wd_value__avg"]
            # print(wd_avg_19)
            if (wd_avg_19 == None):
                wd_avg_19 = 0

            no2_19 = Weather_data.objects.filter(time__range=('18:00:00.000000', '19:00:00.000000'),
                                                 date=date1).aggregate(Avg('no2'))
            avg_no2_19 = no2_19["no2__avg"]
            if (avg_no2_19 == None):
                avg_no2_19 = 0
            # calculating average So2
            so2_19 = Weather_data.objects.filter(time__range=('18:00:00.000000', '19:00:00.000000'),
                                                 date=date1).aggregate(Avg('so2'))
            avg_so2_19 = so2_19["so2__avg"]
            if (avg_so2_19 == None):
                avg_so2_19 = 0
            i = 0
            data19 = []
            data19.append([])
            data19[i].append(s_no)
            data19[i].append(str(date1))
            data19[i].append(time19)
            data19[i].append(round(avg_rainfall_19,3))
            data19[i].append(round(avg_pm2_5_19,3))
            data19[i].append(round(avg_pm10_19,3))
            data19[i].append(round(avg_humidity_19,3))
            data19[i].append(round(avg_temperature_19,3))
            data19[i].append(round(ws_avg_19,3))
            data19[i].append(round(wd_avg_19,3))
            data19[i].append(round(avg_no2_19,3))
            data19[i].append(round(avg_so2_19,3))

            s_no = s_no + 1
            time20 = '19:00'
            # calculating average rainfall
            rainfall_20 = Weather_data.objects.filter(time__range=('19:00:00.000000', '20:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_20 = rainfall_20["rain_gauge__avg"]
            if (avg_rainfall_20 == None):
                avg_rainfall_20 = 0
            # calculating average pm2.5
            pm2_5_20 = Weather_data.objects.filter(time__range=('19:00:00.000000', '20:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_20 = pm2_5_20["pm2_5__avg"]
            if (avg_pm2_5_20 == None):
                avg_pm2_5_20 = 0
            # calculating average pm10
            pm10_20 = Weather_data.objects.filter(time__range=('19:00:00.000000', '20:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_20 = pm10_20["pm10__avg"]
            if (avg_pm10_20 == None):
                avg_pm10_20 = 0
            # calculating average humidity
            humidity_20 = Weather_data.objects.filter(time__range=('19:00:00.000000', '20:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_20 = humidity_20["humidity__avg"]
            if (avg_humidity_20 == None):
                avg_humidity_20 = 0
            # calculating average temperature
            temperature_20 = Weather_data.objects.filter(time__range=('19:00:00.000000', '20:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_20 = temperature_20["temperature__avg"]
            if (avg_temperature_20 == None):
                avg_temperature_20 = 0
            # calculating average wind speed
            avg_ws_20 = Weather_data.objects.filter(time__range=('19:00:00.000000', '20:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_20 = avg_ws_20["ws_value__avg"]
            # print(avg_ws_20)
            if (ws_avg_20 == None):
                ws_avg_20 = 0
            avg_wd_20 = Weather_data.objects.filter(time__range=('19:00:00.000000', '20:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_20 = avg_wd_20["wd_value__avg"]
            # print(wd_avg_20)
            if (wd_avg_20 == None):
                wd_avg_20 = 0

            no2_20 = Weather_data.objects.filter(time__range=('19:00:00.000000', '20:00:00.000000'),
                                                 date=date1).aggregate(Avg('no2'))
            avg_no2_20 = no2_20["no2__avg"]
            if (avg_no2_20 == None):
                avg_no2_20 = 0
            # calculating average So2
            so2_20 = Weather_data.objects.filter(time__range=('19:00:00.000000', '20:00:00.000000'),
                                                 date=date1).aggregate(Avg('so2'))
            avg_so2_20 = so2_20["so2__avg"]
            if (avg_so2_20 == None):
                avg_so2_20 = 0
            i = 0
            data20 = []
            data20.append([])
            data20[i].append(s_no)
            data20[i].append(str(date1))
            data20[i].append(time20)
            data20[i].append(round(avg_rainfall_20,3))
            data20[i].append(round(avg_pm2_5_20,3))
            data20[i].append(round(avg_pm10_20,3))
            data20[i].append(round(avg_humidity_20,3))
            data20[i].append(round(avg_temperature_20,3))
            data20[i].append(round(ws_avg_20,3))
            data20[i].append(round(wd_avg_20,3))
            data20[i].append(round(avg_no2_20,3))
            data20[i].append(round(avg_so2_20,3))

            s_no = s_no + 1
            time21 = '20:00'
            # calculating average rainfall
            rainfall_21 = Weather_data.objects.filter(time__range=('20:00:00.000000', '21:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_21 = rainfall_21["rain_gauge__avg"]
            if (avg_rainfall_21 == None):
                avg_rainfall_21 = 0
            # calculating average pm2.5
            pm2_5_21 = Weather_data.objects.filter(time__range=('20:00:00.000000', '21:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_21 = pm2_5_21["pm2_5__avg"]
            if (avg_pm2_5_21 == None):
                avg_pm2_5_21 = 0
            # calculating average pm10
            pm10_21 = Weather_data.objects.filter(time__range=('20:00:00.000000', '21:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_21 = pm10_21["pm10__avg"]
            if (avg_pm10_21 == None):
                avg_pm10_21 = 0
            # calculating average humidity
            humidity_21 = Weather_data.objects.filter(time__range=('20:00:00.000000', '21:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_21 = humidity_21["humidity__avg"]
            if (avg_humidity_21 == None):
                avg_humidity_21 = 0
            # calculating average temperature
            temperature_21 = Weather_data.objects.filter(time__range=('20:00:00.000000', '21:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_21 = temperature_21["temperature__avg"]
            if (avg_temperature_21 == None):
                avg_temperature_21 = 0
            # calculating average wind speed
            avg_ws_21 = Weather_data.objects.filter(time__range=('20:00:00.000000', '21:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_21 = avg_ws_21["ws_value__avg"]
            # print(avg_ws_21)
            if (ws_avg_21 == None):
                ws_avg_21 = 0
            avg_wd_21 = Weather_data.objects.filter(time__range=('20:00:00.000000', '21:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_21 = avg_wd_21["wd_value__avg"]
            # print(wd_avg_21)
            if (wd_avg_21 == None):
                wd_avg_21 = 0

            no2_21 = Weather_data.objects.filter(time__range=('20:00:00.000000', '21:00:00.000000'),
                                                 date=date1).aggregate(Avg('no2'))
            avg_no2_21 = no2_21["no2__avg"]
            if (avg_no2_21 == None):
                avg_no2_21 = 0
            # calculating average So2
            so2_21 = Weather_data.objects.filter(time__range=('20:00:00.000000', '21:00:00.000000'),
                                                 date=date1).aggregate(Avg('so2'))
            avg_so2_21 = so2_14["so2__avg"]
            if (avg_so2_21 == None):
                avg_so2_21 = 0
            i = 0
            data21 = []
            data21.append([])
            data21[i].append(s_no)
            data21[i].append(str(date1))
            data21[i].append(time21)
            data21[i].append(round(avg_rainfall_21,3))
            data21[i].append(round(avg_pm2_5_21,3))
            data21[i].append(round(avg_pm10_21,3))
            data21[i].append(round(avg_humidity_21,3))
            data21[i].append(round(avg_temperature_21,3))
            data21[i].append(round(ws_avg_21,3))
            data21[i].append(round(wd_avg_21,3))
            data21[i].append(round(avg_no2_21,3))
            data21[i].append(round(avg_so2_21,3))

            s_no = s_no + 1
            time22 = '21:00'
            # calculating average rainfall
            rainfall_22 = Weather_data.objects.filter(time__range=('21:00:00.000000', '22:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_22 = rainfall_22["rain_gauge__avg"]
            if (avg_rainfall_22 == None):
                avg_rainfall_22 = 0
            # calculating average pm2.5
            pm2_5_22 = Weather_data.objects.filter(time__range=('21:00:00.000000', '22:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_22 = pm2_5_22["pm2_5__avg"]
            if (avg_pm2_5_22 == None):
                avg_pm2_5_22 = 0
            # calculating average pm10
            pm10_22 = Weather_data.objects.filter(time__range=('21:00:00.000000', '22:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_22 = pm10_22["pm10__avg"]
            if (avg_pm10_22 == None):
                avg_pm10_22 = 0
            # calculating average humidity
            humidity_22 = Weather_data.objects.filter(time__range=('21:00:00.000000', '22:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_22 = humidity_1["humidity__avg"]
            if (avg_humidity_22 == None):
                avg_humidity_22 = 0
            # calculating average temperature
            temperature_22 = Weather_data.objects.filter(time__range=('21:00:00.000000', '22:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_22 = temperature_22["temperature__avg"]
            if (avg_temperature_22 == None):
                avg_temperature_22 = 0
            # calculating average wind speed
            avg_ws_22 = Weather_data.objects.filter(time__range=('21:00:00.000000', '22:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_22 = avg_ws_22["ws_value__avg"]
            # print(avg_ws_22)
            if (ws_avg_22 == None):
                ws_avg_22 = 0
            avg_wd_22 = Weather_data.objects.filter(time__range=('21:00:00.000000', '22:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_22 = avg_wd_22["wd_value__avg"]
            # print(wd_avg_22)
            if (wd_avg_22 == None):
                wd_avg_22 = 0

            no2_22 = Weather_data.objects.filter(time__range=('21:00:00.000000', '22:00:00.000000'),
                                                 date=date1).aggregate(Avg('no2'))
            avg_no2_22 = no2_22["no2__avg"]
            if (avg_no2_22 == None):
                avg_no2_22 = 0
            # calculating average So2
            so2_22 = Weather_data.objects.filter(time__range=('21:00:00.000000', '22:00:00.000000'),
                                                 date=date1).aggregate(Avg('so2'))
            avg_so2_22 = so2_22["so2__avg"]
            if (avg_so2_22 == None):
                avg_so2_22 = 0
            i = 0
            data22 = []
            data22.append([])
            data22[i].append(s_no)
            data22[i].append(str(date1))
            data22[i].append(time22)
            data22[i].append(round(avg_rainfall_22,3))
            data22[i].append(round(avg_pm2_5_22,3))
            data22[i].append(round(avg_pm10_22,3))
            data22[i].append(round(avg_humidity_22,3))
            data22[i].append(round(avg_temperature_22,3))
            data22[i].append(round(ws_avg_22,3))
            data22[i].append(round(wd_avg_22,3))
            data22[i].append(round(avg_no2_22,3))
            data22[i].append(round(avg_so2_22,3))

            s_no = s_no + 1
            time23 = '22:00'
            # calculating average rainfall
            rainfall_23 = Weather_data.objects.filter(time__range=('22:00:00.000000', '23:00:00.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_23 = rainfall_23["rain_gauge__avg"]
            if (avg_rainfall_23 == None):
                avg_rainfall_23 = 0
            # calculating average pm2.5
            pm2_5_23 = Weather_data.objects.filter(time__range=('22:00:00.000000', '23:00:00.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_23 = pm2_5_23["pm2_5__avg"]
            if (avg_pm2_5_23 == None):
                avg_pm2_5_23 = 0
            # calculating average pm10
            pm10_23 = Weather_data.objects.filter(time__range=('22:00:00.000000', '23:00:00.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_23 = pm10_23["pm10__avg"]
            if (avg_pm10_23 == None):
                avg_pm10_23 = 0
            # calculating average humidity
            humidity_23 = Weather_data.objects.filter(time__range=('22:00:00.000000', '23:00:00.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_23 = humidity_23["humidity__avg"]
            if (avg_humidity_23 == None):
                avg_humidity_23 = 0
            # calculating average temperature
            temperature_23 = Weather_data.objects.filter(time__range=('22:00:00.000000', '23:00:00.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_23 = temperature_23["temperature__avg"]
            if (avg_temperature_23 == None):
                avg_temperature_23 = 0
            # calculating average wind speed
            avg_ws_23 = Weather_data.objects.filter(time__range=('22:00:00.000000', '23:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_23 = avg_ws_23["ws_value__avg"]
            # print(avg_ws_23)
            if (ws_avg_23 == None):
                ws_avg_23 = 0
            avg_wd_23 = Weather_data.objects.filter(time__range=('22:00:00.000000', '23:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_23 = avg_wd_23["wd_value__avg"]
            # print(wd_avg_23)
            if (wd_avg_23 == None):
                wd_avg_23 = 0

            no2_23 = Weather_data.objects.filter(time__range=('22:00:00.000000', '23:00:00.000000'),
                                                 date=date1).aggregate(Avg('no2'))
            avg_no2_23 = no2_23["no2__avg"]
            if (avg_no2_23 == None):
                avg_no2_23 = 0
            # calculating average So2
            so2_23 = Weather_data.objects.filter(time__range=('22:00:00.000000', '23:00:00.000000'),
                                                 date=date1).aggregate(Avg('so2'))
            avg_so2_23 = so2_23["so2__avg"]
            if (avg_so2_23 == None):
                avg_so2_23 = 0
            i = 0
            data23 = []
            data23.append([])
            data23[i].append(s_no)
            data23[i].append(str(date1))
            data23[i].append(time23)
            data23[i].append(round(avg_rainfall_23,3))
            data23[i].append(round(avg_pm2_5_23,3))
            data23[i].append(round(avg_pm10_23, 3))
            data23[i].append(round(avg_humidity_23, 3))
            data23[i].append(round(avg_temperature_23,3))
            data23[i].append(round(ws_avg_23,3))
            data23[i].append(round(wd_avg_23,3))
            data23[i].append(round(avg_no2_23,3))
            data23[i].append(round(avg_so2_23,3))

            s_no = s_no + 1
            time24 = '23:00'
            # calculating average rainfall
            rainfall_24 = Weather_data.objects.filter(time__range=('23:00:00.000000', '23:59:59.000000'),
                                                     date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_24 = rainfall_24["rain_gauge__avg"]
            if (avg_rainfall_24 == None):
                avg_rainfall_24 = 0
            # calculating average pm2.5
            pm2_5_24 = Weather_data.objects.filter(time__range=('23:00:00.000000', '23:59:59.000000'),
                                                  date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_24 = pm2_5_24["pm2_5__avg"]
            if (avg_pm2_5_24 == None):
                avg_pm2_5_24 = 0
            # calculating average pm10
            pm10_24 = Weather_data.objects.filter(time__range=('23:00:00.000000', '23:59:59.000000'),
                                                 date=date1).aggregate(Avg('pm10'))
            avg_pm10_24 = pm10_24["pm10__avg"]
            if (avg_pm10_24 == None):
                avg_pm10_24 = 0
            # calculating average humidity
            humidity_24 = Weather_data.objects.filter(time__range=('23:00:00.000000', '23:59:59.000000'),
                                                     date=date1).aggregate(Avg('humidity'))
            avg_humidity_24 = humidity_24["humidity__avg"]
            if (avg_humidity_24 == None):
                avg_humidity_24 = 0
            # calculating average temperature
            temperature_24 = Weather_data.objects.filter(time__range=('23:00:00.000000', '23:59:59.000000'),
                                                        date=date1).aggregate(Avg('temperature'))
            avg_temperature_24 = temperature_24["temperature__avg"]
            if (avg_temperature_24 == None):
                avg_temperature_24 = 0
            # calculating average wind speed
            avg_ws_24 = Weather_data.objects.filter(time__range=('23:00:00.000000', '23:59:59.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_24 = avg_ws_24["ws_value__avg"]
            # print(avg_ws_24)
            if (ws_avg_24 == None):
                ws_avg_24 = 0
            avg_wd_24 = Weather_data.objects.filter(time__range=('23:00:00.000000', '23:59:59.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_24 = avg_wd_24["wd_value__avg"]
            # print(wd_avg_24)
            if (wd_avg_24 == None):
                wd_avg_24 = 0

            no2_24 = Weather_data.objects.filter(time__range=('23:00:00.000000', '23:59:59.000000'),
                                                 date=date1).aggregate(Avg('no2'))
            avg_no2_24 = no2_24["no2__avg"]
            if (avg_no2_24 == None):
                avg_no2_24 = 0
            # calculating average So2
            so2_24 = Weather_data.objects.filter(time__range=('23:00:00.000000', '23:59:59.000000'),
                                                 date=date1).aggregate(Avg('so2'))
            avg_so2_24 = so2_24["so2__avg"]
            if (avg_so2_24 == None):
                avg_so2_24 = 0
            i = 0
            data24 = []
            data24.append([])
            data24[i].append(s_no)
            data24[i].append(str(date1))
            data24[i].append(time24)
            data24[i].append(round(avg_rainfall_24,3))
            data24[i].append(round(avg_pm2_5_24,3))
            data24[i].append(round(avg_pm10_24,3))
            data24[i].append(round(avg_humidity_24,3))
            data24[i].append(round(avg_temperature_24,3))
            data24[i].append(round(ws_avg_24,3))
            data24[i].append(round(wd_avg_24,3))
            data24[i].append(round(avg_no2_24,3))
            data24[i].append(round(avg_so2_24,3))

            data_value.append([])
            data_value[s].append(data1)
            data_value[s].append(data2)
            data_value[s].append(data3)
            data_value[s].append(data4)
            data_value[s].append(data5)
            data_value[s].append(data6)
            data_value[s].append(data7)
            data_value[s].append(data8)
            data_value[s].append(data9)
            data_value[s].append(data10)
            data_value[s].append(data11)
            data_value[s].append(data12)
            data_value[s].append(data13)
            data_value[s].append(data14)
            data_value[s].append(data15)
            data_value[s].append(data16)
            data_value[s].append(data17)
            data_value[s].append(data18)
            data_value[s].append(data19)
            data_value[s].append(data20)
            data_value[s].append(data21)
            data_value[s].append(data22)
            data_value[s].append(data23)
            data_value[s].append(data24)
            # # print(data_value)
            date1 = date1 + day

        data['result'] = data_value
        # print(data)
    return JsonResponse(data)


@login_required
def hour_duration_avg_report(request, template_name='hour_duration_avg_report.html'):
    return render(request, template_name)

def fetch_hour_duration_avg_report_ajax(request):
    if request.is_ajax():
        from_date = request.GET.get('from_date', None)
        date1 = datetime.datetime.strptime(from_date, '%Y-%m-%d').date()
        from_time = request.GET.get('from_time', None)
        to_time = request.GET.get('to_time', None)

        # print(from_time)
        # print(to_time)

        data = {}
        s_no = 0
        s_no = s_no + 1
        # calculating average rainfall
        rainfall = Weather_data.objects.filter(time__range=(from_time, to_time),date=date1).aggregate(Avg('rain_gauge'))
        avg_rainfall =rainfall["rain_gauge__avg"]
        ## print(rainfall.query)
        ## print(avg_rainfall)
        if (avg_rainfall == None):
            avg_rainfall = 0
        # calculating average pm2.5
        pm2_5 = Weather_data.objects.filter(time__range=(from_time, to_time), date=date1).aggregate(Avg('pm2_5'))
        avg_pm2_5 = pm2_5["pm2_5__avg"]
        if (avg_pm2_5 == None):
            avg_pm2_5 = 0
        # calculating average pm10
        pm10 = Weather_data.objects.filter(time__range=(from_time, to_time), date=date1).aggregate(Avg('pm10'))
        avg_pm10 = pm10["pm10__avg"]
        if (avg_pm10 == None):
            avg_pm10 = 0
        # calculating average humidity
        humidity = Weather_data.objects.filter(time__range=(from_time, to_time),date=date1).aggregate(Avg('humidity'))
        avg_humidity = humidity["humidity__avg"]
        if (avg_humidity == None):
            avg_humidity = 0
        # calculating average temperature
        temperature = Weather_data.objects.filter(time__range=(from_time, to_time),
                                                    date=date1).aggregate(Avg('temperature'))
        avg_temperature = temperature["temperature__avg"]
        if (avg_temperature == None):
            avg_temperature = 0
        # calculating average wind speed
        avg_ws = Weather_data.objects.filter(time__range=(from_time, to_time),
                                               date=date1).aggregate(Avg('ws_value'))
        ws_avg = avg_ws["ws_value__avg"]
        if (ws_avg == None):
            ws_avg = 0
        # calculating average wind direction
        avg_wd = Weather_data.objects.filter(time__range=(from_time, to_time),
                                               date=date1).aggregate(Avg('wd_value'))
        wd_avg = avg_wd["wd_value__avg"]
        if (wd_avg == None):
            wd_avg = 0
        # calculating average No2
        no2 = Weather_data.objects.filter(time__range=(from_time, to_time), date=date1).aggregate(
            Avg('no2'))
        avg_no2 = no2["no2__avg"]
        if (avg_no2 == None):
            avg_no2 = 0
        # calculating average So2
        so2 = Weather_data.objects.filter(time__range=(from_time, to_time), date=date1).aggregate(
            Avg('so2'))
        avg_so2 = so2["so2__avg"]
        if (avg_so2 == None):
            avg_so2 = 0

        i = 0
        data1 = []
        data1.append([])
        data1[i].append(s_no)
        data1[i].append(str(date1))
        data1[i].append(round(avg_rainfall,3))
        data1[i].append(round(avg_pm2_5,3))
        data1[i].append(round(avg_pm10,3))
        data1[i].append(round(avg_humidity,3))
        data1[i].append(round(avg_temperature,3))
        data1[i].append(round(ws_avg,3))
        data1[i].append(round(wd_avg,3))
        data1[i].append(round(avg_no2,3))
        data1[i].append(round(avg_so2,3))


        data['result'] = data1

    return JsonResponse(data)


@login_required
def date_and_hour_duration_avg_report(request, template_name='date_and_hour_duration_avg_report.html'):
    return render(request, template_name)

def fetch_date_and_hour_duration_avg_report_ajax(request):
    if request.is_ajax():
        from_date = request.GET.get('from_date', None)
        to_date = request.GET.get('to_date', None)
        date1 = datetime.datetime.strptime(from_date, '%Y-%m-%d').date()
        date2 = datetime.datetime.strptime(to_date, '%Y-%m-%d').date()
        from_time = request.GET.get('from_time', None)
        to_time = request.GET.get('to_time', None)
        s_no = 0
        s=0
        data_value = []
        data = {}
        # # print(date1)
        # # print(date2)
        day = datetime.timedelta(days=1)

        while date1 <= date2:
            # # print(date1)
            s_no = s_no + 1
            # calculating average rainfall
            rainfall_1 = Weather_data.objects.filter(time__range=(from_time, to_time),date=date1).aggregate(Avg('rain_gauge'))
            avg_rainfall_1 = rainfall_1["rain_gauge__avg"]
            if (avg_rainfall_1 == None):
                avg_rainfall_1 = 0
            # calculating average pm2.5
            pm2_5_1 = Weather_data.objects.filter(time__range=(from_time, to_time),date=date1).aggregate(Avg('pm2_5'))
            avg_pm2_5_1 = pm2_5_1["pm2_5__avg"]
            if (avg_pm2_5_1 == None):
                avg_pm2_5_1 = 0
            # calculating average pm10
            pm10_1 = Weather_data.objects.filter(time__range=(from_time, to_time),date=date1).aggregate(Avg('pm10'))
            avg_pm10_1 = pm10_1["pm10__avg"]
            if (avg_pm10_1 == None):
                avg_pm10_1 = 0
            # calculating average humidity
            humidity_1 = Weather_data.objects.filter(time__range=(from_time, to_time),date=date1).aggregate(Avg('humidity'))
            avg_humidity_1 = humidity_1["humidity__avg"]
            if (avg_humidity_1 == None):
                avg_humidity_1 = 0
            # calculating average temperature
            temperature_1 = Weather_data.objects.filter(time__range=(from_time, to_time),date=date1).aggregate(Avg('temperature'))
            avg_temperature_1 = temperature_1["temperature__avg"]
            if (avg_temperature_1 == None):
                avg_temperature_1 = 0
            # calculating average wind speed
            avg_ws_1 = Weather_data.objects.filter(time__range=(from_time, to_time),date=date1).aggregate(Avg('ws_value'))
            ws_avg_1 = avg_ws_1["ws_value__avg"]
            if (ws_avg_1 == None):
                ws_avg_1 = 0
            # calculating average wind direction
            avg_wd_1 = Weather_data.objects.filter(time__range=(from_time, to_time),date=date1).aggregate(Avg('wd_value'))
            wd_avg_1 = avg_wd_1["wd_value__avg"]
            if(wd_avg_1 == None):
                wd_avg_1 = 0
            # calculating average No2
            no2_1 = Weather_data.objects.filter(time__range=(from_time, to_time), date=date1).aggregate(Avg('no2'))
            avg_no2_1 = no2_1["no2__avg"]
            if (avg_no2_1 == None):
                avg_no2_1 = 0
            # calculating average So2
            so2_1 = Weather_data.objects.filter(time__range=(from_time, to_time),date=date1).aggregate(Avg('so2'))
            avg_so2_1 = so2_1["so2__avg"]
            if (avg_so2_1 == None):
                avg_so2_1 = 0

            i=0
            data1=[]
            data1.append([])
            data1[i].append(s_no)
            data1[i].append(str(date1))
            data1[i].append(round(avg_rainfall_1,3))
            data1[i].append(round(avg_pm2_5_1,3))
            data1[i].append(round(avg_pm10_1,3))
            data1[i].append(round(avg_humidity_1,3))
            data1[i].append(round(avg_temperature_1,3))
            data1[i].append(round(ws_avg_1,3))
            data1[i].append(round(wd_avg_1,3))
            data1[i].append(round(avg_no2_1,3))
            data1[i].append(round(avg_so2_1,3))

            data_value.append([])
            data_value[s].append(data1)

            # # print(data_value)
            date1 = date1 + day

        data['result'] = data_value
        # print(data)

    return JsonResponse(data)


@login_required
def frequency_distribution_normalized_report(request, template_name='frequency_distribution_normalized_report.html'):
    return render(request, template_name)

def fetch_frequency_distribution_normalized_ajax(request):
    if request.is_ajax():
        from_date = request.GET.get('from_date', None)
        to_date = request.GET.get('to_date', None)
        date1 = datetime.datetime.strptime(from_date, '%Y-%m-%d').date()
        date2 = datetime.datetime.strptime(to_date, '%Y-%m-%d').date()
        data = {}
        result_data = []
        data_avg_ws = []
        data_avg_wd = []
        # date2 = datetime.date(2004, 10, 8)
        # # print(date1)
        # # print(date2)
        day = datetime.timedelta(days=1)

        while date1 <= date2:
            # print(date1)
            avg_ws_1 = Weather_data.objects.filter(time__range=('00:00:00.000000', '01:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_1 = avg_ws_1["ws_value__avg"]
            # # print(avg_ws)
            if (ws_avg_1 == None):
                ws_avg_1 = 0
            avg_wd_1 = Weather_data.objects.filter(time__range=('00:00:00.000000', '01:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_1 = avg_wd_1["wd_value__avg"]
            # # print(wd_avg)
            if(wd_avg_1 == None):
                wd_avg_1 = 0

            avg_ws_2 = Weather_data.objects.filter(time__range=('01:00:00.000000', '02:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_2 = avg_ws_2["ws_value__avg"]
            if (ws_avg_2 == None):
                ws_avg_2 = 0
            avg_wd_2 = Weather_data.objects.filter(time__range=('01:00:00.000000', '02:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_2 = avg_wd_2["wd_value__avg"]
            if (wd_avg_2 == None):
                wd_avg_2 = 0

            avg_ws_3 = Weather_data.objects.filter(time__range=('02:00:00.000000', '03:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_3 = avg_ws_3["ws_value__avg"]
            # # print(avg_ws_3)
            if (ws_avg_3 == None):
                ws_avg_3 = 0
            avg_wd_3 = Weather_data.objects.filter(time__range=('02:00:00.000000', '03:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_3 = avg_wd_3["wd_value__avg"]
            # # print(wd_avg)
            if (wd_avg_3 == None):
                wd_avg_3 = 0

            avg_ws_4 = Weather_data.objects.filter(time__range=('03:00:00.000000', '04:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_4 = avg_ws_4["ws_value__avg"]
            # # print(avg_ws_4)
            if (ws_avg_4 == None):
                ws_avg_4 = 0
            avg_wd_4 = Weather_data.objects.filter(time__range=('03:00:00.000000', '04:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_4 = avg_wd_4["wd_value__avg"]
            # # print(wd_avg_4)
            if (wd_avg_4 == None):
                wd_avg_4 = 0

            avg_ws_5 = Weather_data.objects.filter(time__range=('04:00:00.000000', '05:00:00.000000'),date=date1).aggregate(Avg('ws_value'))
            ws_avg_5 = avg_ws_5["ws_value__avg"]
            # # print(avg_ws_5)
            if (ws_avg_5 == None):
                ws_avg_5 = 0
            avg_wd_5 = Weather_data.objects.filter(time__range=('04:00:00.000000', '05:00:00.000000'),date=date1).aggregate(Avg('wd_value'))
            wd_avg_5 = avg_wd_5["wd_value__avg"]
            # # print(wd_avg_5)
            if (wd_avg_5 == None):
                wd_avg_5 = 0

            avg_ws_6 = Weather_data.objects.filter(time__range=('05:00:00.000000', '06:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_6 = avg_ws_6["ws_value__avg"]
            # # print(avg_ws_6)
            if (ws_avg_6 == None):
                ws_avg_6 = 0
            avg_wd_6 = Weather_data.objects.filter(time__range=('05:00:00.000000', '06:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_6 = avg_wd_6["wd_value__avg"]
            # # print(wd_avg_6)
            if (wd_avg_6 == None):
                wd_avg_6 = 0

            avg_ws_7 = Weather_data.objects.filter(time__range=('06:00:00.000000', '07:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_7 = avg_ws_7["ws_value__avg"]
            # print(avg_ws_7)
            if (ws_avg_7 == None):
                ws_avg_7 = 0
            avg_wd_7 = Weather_data.objects.filter(time__range=('06:00:00.000000', '07:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_7 = avg_wd_7["wd_value__avg"]
            # print(wd_avg_7)
            if (wd_avg_7 == None):
                wd_avg_7 = 0

            avg_ws_8 = Weather_data.objects.filter(time__range=('07:00:00.000000', '08:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_8 = avg_ws_8["ws_value__avg"]
            # print(avg_ws_8)
            if (ws_avg_8 == None):
                ws_avg_8 = 0
            avg_wd_8 = Weather_data.objects.filter(time__range=('07:00:00.000000', '08:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_8 = avg_wd_8["wd_value__avg"]
            # print(wd_avg_8)
            if (wd_avg_8 == None):
                wd_avg_8 = 0

            avg_ws_9 = Weather_data.objects.filter(time__range=('08:00:00.000000', '09:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_9 = avg_ws_9["ws_value__avg"]
            # print(avg_ws_9)
            if (ws_avg_9 == None):
                ws_avg_9 = 0
            avg_wd_9 = Weather_data.objects.filter(time__range=('08:00:00.000000', '09:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_9 = avg_wd_9["wd_value__avg"]
            # print(wd_avg_9)
            if (wd_avg_9 == None):
                wd_avg_9 = 0

            avg_ws_10 = Weather_data.objects.filter(time__range=('09:00:00.000000', '10:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_10 = avg_ws_10["ws_value__avg"]
            # print(avg_ws_10)
            if (ws_avg_10 == None):
                ws_avg_10 = 0
            avg_wd_10 = Weather_data.objects.filter(time__range=('09:00:00.000000', '10:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_10 = avg_wd_10["wd_value__avg"]
            # print(wd_avg_10)
            if (wd_avg_10 == None):
                wd_avg_10 = 0

            avg_ws_11 = Weather_data.objects.filter(time__range=('10:00:00.000000', '11:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_11 = avg_ws_11["ws_value__avg"]
            # print(avg_ws_11)
            if (ws_avg_11 == None):
                ws_avg_11 = 0
            avg_wd_11 = Weather_data.objects.filter(time__range=('10:00:00.000000', '11:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_11 = avg_wd_11["wd_value__avg"]
            # print(wd_avg_11)
            if (wd_avg_11 == None):
                wd_avg_11 = 0

            avg_ws_12 = Weather_data.objects.filter(time__range=('11:00:00.000000', '12:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_12 = avg_ws_12["ws_value__avg"]
            # print(avg_ws_12)
            if (ws_avg_12 == None):
                ws_avg_12 = 0
            avg_wd_12 = Weather_data.objects.filter(time__range=('11:00:00.000000', '12:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_12 = avg_wd_12["wd_value__avg"]
            # print(wd_avg_12)
            if (wd_avg_12 == None):
                wd_avg_12 = 0

            avg_ws_13 = Weather_data.objects.filter(time__range=('12:00:00.000000', '13:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_13 = avg_ws_13["ws_value__avg"]
            # print(avg_ws_13)
            if (ws_avg_13 == None):
                ws_avg_13 = 0
            avg_wd_13 = Weather_data.objects.filter(time__range=('12:00:00.000000', '13:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_13 = avg_wd_13["wd_value__avg"]
            # print(wd_avg_13)
            if (wd_avg_13 == None):
                wd_avg_13 = 0

            avg_ws_14 = Weather_data.objects.filter(time__range=('13:00:00.000000', '14:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_14 = avg_ws_14["ws_value__avg"]
            # print(avg_ws_14)
            if (ws_avg_14 == None):
                ws_avg_14 = 0
            avg_wd_14 = Weather_data.objects.filter(time__range=('13:00:00.000000', '14:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_14 = avg_wd_14["wd_value__avg"]
            # print(wd_avg_14)
            if (wd_avg_14 == None):
                wd_avg_14 = 0

            avg_ws_15 = Weather_data.objects.filter(time__range=('14:00:00.000000', '15:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_15 = avg_ws_15["ws_value__avg"]
            # print(avg_ws_15)
            if (ws_avg_15 == None):
                ws_avg_15 = 0
            avg_wd_15 = Weather_data.objects.filter(time__range=('14:00:00.000000', '15:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_15 = avg_wd_15["wd_value__avg"]
            # print(wd_avg_15)
            if (wd_avg_15 == None):
                wd_avg_15 = 0

            avg_ws_16 = Weather_data.objects.filter(time__range=('15:00:00.000000', '16:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_16 = avg_ws_16["ws_value__avg"]
            # print(avg_ws_16)
            if (ws_avg_16 == None):
                ws_avg_16 = 0
            avg_wd_16 = Weather_data.objects.filter(time__range=('15:00:00.000000', '16:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_16 = avg_wd_16["wd_value__avg"]
            # print(wd_avg_16)
            if (wd_avg_16 == None):
                wd_avg_16 = 0

            avg_ws_17 = Weather_data.objects.filter(time__range=('16:00:00.000000', '17:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_17 = avg_ws_17["ws_value__avg"]
            # print(avg_ws_17)
            if (ws_avg_17 == None):
                ws_avg_17 = 0
            avg_wd_17 = Weather_data.objects.filter(time__range=('16:00:00.000000', '17:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_17 = avg_wd_17["wd_value__avg"]
            # print(wd_avg_17)
            if (wd_avg_17 == None):
                wd_avg_17 = 0

            avg_ws_18 = Weather_data.objects.filter(time__range=('17:00:00.000000', '18:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_18 = avg_ws_18["ws_value__avg"]
            # print(avg_ws_18)
            if (ws_avg_18 == None):
                ws_avg_18 = 0
            avg_wd_18 = Weather_data.objects.filter(time__range=('17:00:00.000000', '18:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_18 = avg_wd_18["wd_value__avg"]
            # print(wd_avg_18)
            if (wd_avg_18 == None):
                wd_avg_18 = 0

            avg_ws_19 = Weather_data.objects.filter(time__range=('18:00:00.000000', '19:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_19 = avg_ws_19["ws_value__avg"]
            # print(avg_ws_19)
            if (ws_avg_19 == None):
                ws_avg_19 = 0
            avg_wd_19 = Weather_data.objects.filter(time__range=('18:00:00.000000', '19:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_19 = avg_wd_19["wd_value__avg"]
            # print(wd_avg_19)
            if (wd_avg_19 == None):
                wd_avg_19 = 0

            avg_ws_20 = Weather_data.objects.filter(time__range=('19:00:00.000000', '20:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_20 = avg_ws_20["ws_value__avg"]
            # print(avg_ws_20)
            if (ws_avg_20 == None):
                ws_avg_20 = 0
            avg_wd_20 = Weather_data.objects.filter(time__range=('19:00:00.000000', '20:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_20 = avg_wd_20["wd_value__avg"]
            # print(wd_avg_20)
            if (wd_avg_20 == None):
                wd_avg_20 = 0

            avg_ws_21 = Weather_data.objects.filter(time__range=('20:00:00.000000', '21:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_21 = avg_ws_21["ws_value__avg"]
            # print(avg_ws_21)
            if (ws_avg_21 == None):
                ws_avg_21 = 0
            avg_wd_21 = Weather_data.objects.filter(time__range=('20:00:00.000000', '21:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_21 = avg_wd_21["wd_value__avg"]
            # print(wd_avg_21)
            if (wd_avg_21 == None):
                wd_avg_21 = 0

            avg_ws_22 = Weather_data.objects.filter(time__range=('21:00:00.000000', '22:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_22 = avg_ws_22["ws_value__avg"]
            # print(avg_ws_22)
            if (ws_avg_22 == None):
                ws_avg_22 = 0
            avg_wd_22 = Weather_data.objects.filter(time__range=('21:00:00.000000', '22:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_22 = avg_wd_22["wd_value__avg"]
            # print(wd_avg_22)
            if (wd_avg_22 == None):
                wd_avg_22 = 0

            avg_ws_23 = Weather_data.objects.filter(time__range=('22:00:00.000000', '23:00:00.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_23 = avg_ws_23["ws_value__avg"]
            # print(avg_ws_23)
            if (ws_avg_23 == None):
                ws_avg_23 = 0
            avg_wd_23 = Weather_data.objects.filter(time__range=('22:00:00.000000', '23:00:00.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_23 = avg_wd_23["wd_value__avg"]
            # print(wd_avg_23)
            if (wd_avg_23 == None):
                wd_avg_23 = 0

            avg_ws_24 = Weather_data.objects.filter(time__range=('23:00:00.000000', '23:59:59.000000'),
                                                   date=date1).aggregate(Avg('ws_value'))
            ws_avg_24 = avg_ws_24["ws_value__avg"]
            # print(avg_ws_24)
            if (ws_avg_24 == None):
                ws_avg_24 = 0
            avg_wd_24 = Weather_data.objects.filter(time__range=('23:00:00.000000', '23:59:59.000000'),
                                                   date=date1).aggregate(Avg('wd_value'))
            wd_avg_24 = avg_wd_24["wd_value__avg"]
            # print(wd_avg_24)
            if (wd_avg_24 == None):
                wd_avg_24 = 0

            i = 0

            data_avg_ws.append([])
            data_avg_ws[i].append(round(ws_avg_1,3))
            data_avg_ws[i].append(round(ws_avg_2,3))
            data_avg_ws[i].append(round(ws_avg_3,3))
            data_avg_ws[i].append(round(ws_avg_4,3))
            data_avg_ws[i].append(round(ws_avg_5,3))
            data_avg_ws[i].append(round(ws_avg_6,3))
            data_avg_ws[i].append(round(ws_avg_7,3))
            data_avg_ws[i].append(round(ws_avg_8,3))
            data_avg_ws[i].append(round(ws_avg_9,3))
            data_avg_ws[i].append(round(ws_avg_10,3))
            data_avg_ws[i].append(round(ws_avg_11,3))
            data_avg_ws[i].append(round(ws_avg_12,3))
            data_avg_ws[i].append(round(ws_avg_13,3))
            data_avg_ws[i].append(round(ws_avg_14,3))
            data_avg_ws[i].append(round(ws_avg_15,3))
            data_avg_ws[i].append(round(ws_avg_16,3))
            data_avg_ws[i].append(round(ws_avg_17,3))
            data_avg_ws[i].append(round(ws_avg_18,3))
            data_avg_ws[i].append(round(ws_avg_19,3))
            data_avg_ws[i].append(round(ws_avg_20,3))
            data_avg_ws[i].append(round(ws_avg_21,3))
            data_avg_ws[i].append(round(ws_avg_22,3))
            data_avg_ws[i].append(round(ws_avg_23,3))
            data_avg_ws[i].append(round(ws_avg_24,3))

            j = 0

            data_avg_wd.append([])
            data_avg_wd[j].append(round(wd_avg_1,3))
            data_avg_wd[j].append(round(wd_avg_2,3))
            data_avg_wd[j].append(round(wd_avg_3,3))
            data_avg_wd[j].append(round(wd_avg_4,3))
            data_avg_wd[j].append(round(wd_avg_5,3))
            data_avg_wd[j].append(round(wd_avg_6,3))
            data_avg_wd[j].append(round(wd_avg_7,3))
            data_avg_wd[j].append(round(wd_avg_8,3))
            data_avg_wd[j].append(round(wd_avg_9,3))
            data_avg_wd[j].append(round(wd_avg_10,3))
            data_avg_wd[j].append(round(wd_avg_11,3))
            data_avg_wd[j].append(round(wd_avg_12,3))
            data_avg_wd[j].append(round(wd_avg_13,3))
            data_avg_wd[j].append(round(wd_avg_14,3))
            data_avg_wd[j].append(round(wd_avg_15,3))
            data_avg_wd[j].append(round(wd_avg_16,3))
            data_avg_wd[j].append(round(wd_avg_17,3))
            data_avg_wd[j].append(round(wd_avg_18,3))
            data_avg_wd[j].append(round(wd_avg_19,3))
            data_avg_wd[j].append(round(wd_avg_20,3))
            data_avg_wd[j].append(round(wd_avg_21,3))
            data_avg_wd[j].append(round(wd_avg_22,3))
            data_avg_wd[j].append(round(wd_avg_23,3))
            data_avg_wd[j].append(round(wd_avg_24,3))

            date1 = date1 + day

        data_ws_avg =  data_avg_ws[0]
        len1 = len(data_ws_avg)
        data_wd_avg = data_avg_wd[0]
        len2 = len(data_wd_avg)
        print(data_ws_avg)
        print(data_wd_avg)
        a1=a2=a3=a4=a5=a6=b1=b2=b3=b4=b5=b6=c1=c2=c3=c4=c5=c6=d1=d2=d3=d4=d5=d6=e1=e2=e3=e4=e5=e6=f1=f2=f3=f4=f5=f6=g1=g2=g3=g4=g5=g6=0
        h1=h2=h3=h4=h5=h6=i1=i2=i3=i4=i5=i6=j1=j2=j3=j4=j5=j6=k1=k2=k3=k4=k5=k6=l1=l2=l3=l4=l5=l6=m1=m2=m3=m4=m5=m6=n1=n2=n3=n4=n5=n6=0
        o1 = o2 = o3 = o4 = o5 = o6 = p1 = p2 = p3 = p4 = p5 = p6 = 0
        for i in range(1,len2):
            avg_wd = data_wd_avg[i]


            for i in range(1,len1):
                avg_ws = data_ws_avg[i]
                # print('wd', avg_wd)
                # print('ws',avg_ws)

                if(avg_wd >= 348.75 or avg_wd < 11.25):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        a1 =a1 + 1
                        # print('a1',a1)
                    elif(avg_ws >= 2.1 and avg_ws < 3.6):
                        a2 = a2 + 1
                        # print('a2', a2)
                    elif(avg_ws >= 3.6 and avg_ws < 5.7):
                        a3 = a3 +1
                        # print('a3', a3)
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        a4 = a4 + 1
                    elif(avg_ws >= 8.8 and avg_ws < 11.1):
                        a5 = a5 + 1
                    elif(avg_ws >= 11.1):
                        a6 = a6 + 1

                elif(avg_wd >= 11.25 and avg_wd < 33.75):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        b1 = b1 + 1
                    elif(avg_ws >= 2.1 and avg_ws < 3.6):
                        b2 = b2 + 1
                    elif(avg_ws >= 3.6 and avg_ws < 5.7):
                        b3 = b3 +1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        b4 = b4 + 1
                    elif(avg_ws >= 8.8 and avg_ws < 11.1):
                        b5 = b5 + 1
                    elif(avg_ws >= 11.1):
                        b6 = b6 + 1

                elif (avg_wd >= 33.75 and avg_wd < 56.25):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        c1 = c1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        c2 = c2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        c3 = c3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        c4 = c4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        c5 = c5 + 1
                    elif (avg_ws >= 11.1):
                        c6 = c6 + 1

                elif (avg_wd >= 56.25 and avg_wd < 78.75):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        d1 = d1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        d2 = d2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        d3 = d3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        d4 = d4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        d5 = d5 + 1
                    elif (avg_ws >= 11.1):
                        d6 = d6 + 1

                elif (avg_wd >= 78.75 and avg_wd < 101.25):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        e1 = e1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        e2 = e2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        e3 = e3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        e4 = e4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        e5 = e5 + 1
                    elif (avg_ws >= 11.1):
                        e6 = e6 + 1

                elif (avg_wd >= 101.25 and avg_wd < 123.75):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        f1 = f1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        f2 = f2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        f3 = f3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        f4 = f4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        f5 = f5 + 1
                    elif (avg_ws >= 11.1):
                        f6 = f6 + 1

                elif (avg_wd >= 123.75 and avg_wd <146.25):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        g1 = g1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        g2 = g2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        g3 = g3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        g4 = g4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        g5 = g5 + 1
                    elif (avg_ws >= 11.1):
                        g6 = g6 + 1

                elif (avg_wd >= 146.25 and avg_wd < 168.75):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        h1 = h1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        h2 = h2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        h3 = h3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        h4 = h4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        h5 = h5 + 1
                    elif (avg_ws >= 11.1):
                        h6 = h6 + 1

                elif (avg_wd >= 168.75 and avg_wd < 191.25):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        i1 = i1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        i2 = i2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        i3 = i3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        i4 = i4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        i5 = i5 + 1
                    elif (avg_ws >= 11.1):
                        i6 = i6 + 1

                elif (avg_wd >= 191.25 and avg_wd < 213.75):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        j1 = j1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        j2 = j2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        j3 = j3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        j4 = j4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        j5 = j5 + 1
                    elif (avg_ws >= 11.1):
                        j6 = j6 + 1

                elif (avg_wd >= 213.75 and avg_wd < 236.25):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        k1 = k1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        k2 = k2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        k3 = k3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        k4 = k4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        k5 = k5 + 1
                    elif (avg_ws >= 11.1):
                        k6 = k6 + 1

                elif (avg_wd >= 236.25 and avg_wd < 258.75):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        l1 = l1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        l2 = l2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        l3 = l3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        l4 = l4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        l5 = l5 + 1
                    elif (avg_ws >= 11.1):
                        l6 = l6 + 1

                elif (avg_wd >= 258.75 and avg_wd < 281.25):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        m1 = m1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        m2 = m2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        m3 = m3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        m4 = m4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        m5 = m5 + 1
                    elif (avg_ws >= 11.1):
                        m6 = m6 + 1

                elif (avg_wd >= 281.25 and avg_wd < 303.75):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        n1 = n1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        n2 = n2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        n3 = n3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        n4 = n4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        n5 = n5 + 1
                    elif (avg_ws >= 11.1):
                        n6 = n6 + 1

                elif (avg_wd >= 303.75 and avg_wd < 326.25):
                    if (avg_ws >= 0.5 and avg_wd < 2.1):
                        o1 = o1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        o2 = o2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        o3 = o3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        o4 = o4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        o5 = o5 + 1
                    elif (avg_ws >= 11.1):
                        o6 = o6 + 1

                elif (avg_wd >= 326.25 and avg_wd < 348.75):
                    if (avg_ws >= 0.5 and avg_ws < 2.1):
                        p1 = p1 + 1
                    elif (avg_ws >= 2.1 and avg_ws < 3.6):
                        p2 = p2 + 1
                    elif (avg_ws >= 3.6 and avg_ws < 5.7):
                        p3 = p3 + 1
                    elif (avg_ws >= 5.7 and avg_ws < 8.8):
                        p4 = p4 + 1
                    elif (avg_ws >= 8.8 and avg_ws < 11.1):
                        p5 = p5 + 1
                    elif (avg_ws >= 11.1):
                        p6 = p6 + 1

            t1 =  a1 + a2 + a3 + a4 + a5 + a6
            t2 = b1 + b2 + b3 + b4 + b5 + b6
            t3 = c1 + c2 + c3 + c4 + c5 + c6
            t4 = d1 + d2 + d3 + d4 + d5 + d6
            t5 = e1 + e2 + e3 + e4 + e5 + e6
            t6 = f1 + f2 + f3 + f4 + f5 + f6
            t7 = g1 + g2 + g3 + g4 + g5 + g6
            t8 = h1 + h2 + h3 + h4 + h5 + h6
            t9 = i1 + i2 + i3 + i4 + i5 + i6
            t10 = j1 + j2 + j3 + j4 + j5 + j6
            t11 = k1 + k2 + k3 + k4 + k5 + k6
            t12 = l1 + l2 + l3 + l4 + l5 + l6
            t13 = m1 + m2 + m3 + m4 + m5 + m6
            t14 = n1 + n2 + n3 + n4 + n5 + n6
            t15 = o1 + o2 + o3 + o4 + o5 + o6
            t16 = p1 + p2 + p3 + p4 + p5 + p6

            t17 = a1 + b1 + c1 + d1+ e1 + f1 + g1 + h1 + i1 + j1 + k1 + l1 + m1 + n1 + o1 + p1
            t18 = a2 + b2 + c2 + d2+ e2 + f2 + g2 + h2 + i2 + j2 + k2 + l2 + m2 + n2 + o2 + p2
            t19 = a3 + b3 + c3 + d3+ e3 + f3 + g3 + h3 + i3 + j3 + k3 + l3 + m3 + n3 + o3 + p3
            t20 = a4 + b4 + c4 + d4+ e4 + f4 + g4 + h4 + i4 + j4 + k4 + l4 + m4 + n4 + o4 + p4
            t21 = a5 + b5 + c5 + d5+ e5 + f5 + g5 + h5 + i5 + j5 + k5 + l5 + m5 + n5 + o5 + p5
            t22 = a6 + b6 + c6 + d6+ e6 + f6 + g6 + h6 + i6 + j6 + k6 + l6 + m6 + n6 + o6 + p6
            t23 = t17 + t18 + t19 + t20 + t21 + t22

            A1 = A2 = A3 = A4 = A5 = A6 = B1 = B2 = B3 = B4 = B5 = B6 = C1 = C2 = C3 = C4 = C5 = C6 = D1 = D2 = D3 = D4 = D5 = D6 = E1 = E2 = E3 = E4 = E5 = E6 = F1 = F2 = F3 = F4 = F5 = F6 = G1 = G2 = G3 = G4 = G5 = G6 = 0
            H1 = H2 = H3 = H4 = H5 = H6 = I1 = I2 = I3 = I4 = I5 = I6 = J1 = J2 = J3 = J4 = J5 = J6 = K1 = K2 = K3 = K4 = K5 = K6 = L1 = L2 = L3 = L4 = L5 = L6 = M1 = M2 = M3 = M4 = M5 = M6 = N1 = N2 = N3 = N4 = N5 = N6 = 0
            O1 = O2 = O3 = O4 = O5 = O6 = P1 = P2 = P3 = P4 = P5 = P6 = 0

            A1 = a1/t23*100
            A2 = a2/t23*100
            A3 = a3/t23*100
            A4 = a4/t23*100
            A5 = a5/t23*100
            A6 = a6/t23*100
            B1 = b1 / t23 * 100
            B2 = b2 / t23 * 100
            B3 = b3 / t23 * 100
            B4 = b4 / t23 * 100
            B5 = b5 / t23 * 100
            B6 = b6 / t23 * 100
            C1 = c1 / t23 * 100
            C2 = c2 / t23 * 100
            C3 = c3 / t23 * 100
            C4 = c4 / t23 * 100
            C5 = c5 / t23 * 100
            C6 = c6 / t23 * 100
            D1 = d1 / t23 * 100
            D2 = d2 / t23 * 100
            D3 = d3 / t23 * 100
            D4 = d4 / t23 * 100
            D5 = d5 / t23 * 100
            D6 = d6 / t23 * 100
            E1 = e1 / t23 * 100
            E2 = e2 / t23 * 100
            E3 = e3 / t23 * 100
            E4 = e4 / t23 * 100
            E5 = e5 / t23 * 100
            E6 = e6 / t23 * 100
            F1 = f1 / t23 * 100
            F2 = f2 / t23 * 100
            F3 = f3 / t23 * 100
            F4 = f4 / t23 * 100
            F5 = f5 / t23 * 100
            F6 = f6 / t23 * 100
            G1 = g1 / t23 * 100
            G2 = g2 / t23 * 100
            G3 = g3 / t23 * 100
            G4 = g4 / t23 * 100
            G5 = g5 / t23 * 100
            G6 = g6 / t23 * 100
            H1 = h1 / t23 * 100
            H2 = h2 / t23 * 100
            H3 = h3 / t23 * 100
            H4 = h4 / t23 * 100
            H5 = h5 / t23 * 100
            H6 = h6 / t23 * 100
            I1 = i1 / t23 * 100
            I2 = i2 / t23 * 100
            I3 = i3 / t23 * 100
            I4 = i4 / t23 * 100
            I5 = i5 / t23 * 100
            I6 = i6 / t23 * 100
            J1 = j1 / t23 * 100
            J2 = j2 / t23 * 100
            J3 = j3 / t23 * 100
            J4 = j4 / t23 * 100
            J5 = j5 / t23 * 100
            J6 = j6 / t23 * 100
            K1 = k1 / t23 * 100
            K2 = k2 / t23 * 100
            K3 = k3 / t23 * 100
            K4 = k4 / t23 * 100
            K5 = k5 / t23 * 100
            K6 = k6 / t23 * 100
            L1 = l1 / t23 * 100
            L2 = l2 / t23 * 100
            L3 = l3 / t23 * 100
            L4 = l4 / t23 * 100
            L5 = l5 / t23 * 100
            L6 = l6 / t23 * 100
            M1 = m1 / t23 * 100
            M2 = m2 / t23 * 100
            M3 = m3 / t23 * 100
            M4 = m4 / t23 * 100
            M5 = m5 / t23 * 100
            M6 = m6 / t23 * 100
            N1 = n1 / t23 * 100
            N2 = n2 / t23 * 100
            N3 = n3 / t23 * 100
            N4 = n4 / t23 * 100
            N5 = n5 / t23 * 100
            N6 = n6 / t23 * 100
            O1 = o1 / t23 * 100
            O2 = o2 / t23 * 100
            O3 = o3 / t23 * 100
            O4 = o4 / t23 * 100
            O5 = o5 / t23 * 100
            O6 = o6 / t23 * 100
            P1 = p1 / t23 * 100
            P2 = p2 / t23 * 100
            P3 = p3 / t23 * 100
            P4 = p4 / t23 * 100
            P5 = p5 / t23 * 100
            P6 = p6 / t23 * 100

            T1 =  A1 + A2 + A3 + A4 + A5 + A6
            T2 = B1 + B2 + B3 + B4 + B5 + B6
            T3 = C1 + C2 + C3 + C4 + C5 + C6
            T4 = D1 + D2 + D3 + D4 + D5 + D6
            T5 = E1 + E2 + E3 + E4 + E5 + E6
            T6 = F1 + F2 + F3 + F4 + F5 + F6
            T7 = G1 + G2 + G3 + G4 + G5 + G6
            T8 = H1 + H2 + H3 + H4 + H5 + H6
            T9 = I1 + I2 + I3 + I4 + I5 + I6
            T10 = J1 + J2 + J3 + J4 + J5 + J6
            T11 = K1 + K2 + K3 + K4 + K5 + K6
            T12 = L1 + L2 + L3 + L4 + L5 + L6
            T13 = M1 + M2 + M3 + M4 + M5 + M6
            T14 = N1 + N2 + N3 + N4 + N5 + N6
            T15 = O1 + O2 + O3 + O4 + O5 + O6
            T16 = P1 + P2 + P3 + P4 + P5 + P6

            T17 = A1 + B1 + C1 + D1+ E1 + F1 + G1 + H1 + I1 + J1 + K1 + L1 + M1 + N1 + O1 + P1
            T18 = A2 + B2 + C2 + D2+ E2 + F2 + G2 + H2 + I2 + J2 + K2 + L2 + M2 + N2 + O2 + P2
            T19 = A3 + B3 + C3 + D3+ E3 + F3 + G3 + H3 + I3 + J3 + K3 + L3 + M3 + N3 + O3 + P3
            T20 = A4 + B4 + C4 + D4+ E4 + F4 + G4 + H4 + I4 + J4 + K4 + L4 + M4 + N4 + O4 + P4
            T21 = A5 + B5 + C5 + D5+ E5 + F5 + G5 + H5 + I5 + J5 + K5 + L5 + M5 + N5 + O5 + P5
            T22 = A6 + B6 + C6 + D6+ E6 + F6 + G6 + H6 + I6 + J6 + K6 + L6 + M6 + N6 + O6 + P6
            T23 = T17 + T18 + T19 + T20 + T21 + T22


        result_data.append(str(A1) + ',' + str(A2) + ',' + str(A3) + ',' + str(A4) + ',' + str(A5) + ',' + str(A6) + ',' +
                           str(B1) + ',' + str(B2) + ',' + str(B3) + ',' + str(B4) + ',' + str(B5) + ',' + str(B6) + ',' +
                           str(C1) + ',' + str(C2) + ',' + str(C3) + ',' + str(C4) + ',' + str(C5) + ',' + str(C6) + ',' +
                           str(D1) + ',' + str(D2) + ',' + str(D3) + ',' + str(D4) + ',' + str(D5) + ',' + str(D6) + ',' +
                           str(E1) + ',' + str(E2) + ',' + str(E3) + ',' + str(E4) + ',' + str(E5) + ',' + str(E6) + ',' +
                           str(F1) + ',' + str(F2) + ',' + str(F3) + ',' + str(F4) + ',' + str(F5) + ',' + str(F6) + ',' +
                           str(G1) + ',' + str(G2) + ',' + str(G3) + ',' + str(G4) + ',' + str(G5) + ',' + str(G6) + ',' +
                           str(H1) + ',' + str(H2) + ',' + str(H3) + ',' + str(H4) + ',' + str(H5) + ',' + str(H6) + ',' +
                           str(I1) + ',' + str(I2) + ',' + str(I3) + ',' + str(I4) + ',' + str(I5) + ',' + str(I6) + ',' +
                           str(J1) + ',' + str(J2) + ',' + str(J3) + ',' + str(J4) + ',' + str(J5) + ',' + str(J6) + ',' +
                           str(K1) + ',' + str(K2) + ',' + str(K3) + ',' + str(K4) + ',' + str(K5) + ',' + str(K6) + ',' +
                           str(L1) + ',' + str(L2) + ',' + str(L3) + ',' + str(L4) + ',' + str(L5) + ',' + str(L6) + ',' +
                           str(M1) + ',' + str(M2) + ',' + str(M3) + ',' + str(M4) + ',' + str(M5) + ',' + str(M6) + ',' +
                           str(N1) + ',' + str(N2) + ',' + str(N3) + ',' + str(N4) + ',' + str(N5) + ',' + str(N6) + ',' +
                           str(O1) + ',' + str(O2) + ',' + str(O3) + ',' + str(O4) + ',' + str(O5) + ',' + str(O6) + ',' +
                           str(P1) + ',' + str(P2) + ',' + str(P3) + ',' + str(P4) + ',' + str(P5) + ',' + str(P6) + ',' +
                           str(T1) + ',' + str(T2) + ',' + str(T3) + ',' + str(T4) + ',' + str(T5) + ',' + str(T6) + ',' +
                           str(T7) + ',' + str(T8) + ',' + str(T9) + ',' + str(T10) + ',' + str(T11) + ',' + str(T12) + ',' +
                           str(T13) + ',' + str(T14)+ ',' + str(T15) + ',' + str(T16) + ',' + str(T17) + ',' + str(T18) + ',' +
                           str(T19) + ',' + str(T20) + ',' + str(T21) + ',' + str(T22) + ',' + str(T23))

        data['result'] = result_data
        print(data)
    return JsonResponse(data)