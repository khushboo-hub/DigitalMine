import matplotlib as mpl

from accounts.models import profile_extension
from sensor.forms import NodeForm
from sensor.models import Node

mpl.use('TkAgg')
import datetime
import matplotlib.pyplot as plt
import numpy as np
import io
from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404
from django.shortcuts import render, redirect
import requests
from .models import AreaModel, Fire_exp_gasesWifi
from .forms import AreaForm, ExplosiveAreaForm
from django.http import HttpResponse, JsonResponse
from employee.models import MineDetails


@login_required
def add_goaf_area(request, template_name='gasmonitoring_wifi/add_goaf_area.html'):
    if request.method == 'POST':
        form = AreaForm(request.POST)
        if form.is_valid():
            form.save()
            # return  HttpResponse("ok saved")
            return redirect('gasmonitoring_wifi:manage_goaf_area')
    else:
        form = AreaForm()
    return render(request, template_name, {'form': form})


@login_required
def manage_goaf_area(request, template_name='gasmonitoring_wifi/manage_goaf_area.html'):
    # area_table = AreaModel.objects.all()  ###  select * from Area(table)
    # print(area_table)
    data = {}


    current_user = request.user
    profile = get_object_or_404(profile_extension, user_id=current_user.id)
    form = NodeForm(initial={'mine_id': profile.mine_id.id})
    if current_user.is_superuser:
        book = Node.objects.all()
    else:
        book = Node.objects.filter(mine_id=profile.mine_id.id)
    data['object_list'] = book
    return render(request, template_name, data)


@login_required
def edit_area(request, pk, template_name='gasmonitoring_wifi/add_goaf_area.html'):
    book = get_object_or_404(AreaModel, pk=pk)  ### select * from Area table where id=6
    form = AreaForm(request.POST or None, instance=book)
    if form.is_valid():
        form.save()
        return redirect('gasmonitoring_wifi:manage_goaf_area')
    return render(request, template_name, {'form': form})


@login_required
def delete_area(request, pk):
    book = get_object_or_404(AreaModel, pk=pk)
    book.delete()
    return redirect('gasmonitoring_wifi:manage_goaf_area')


@login_required
def show_area(request, template_name='gasmonitoring_wifi/show_area.html'):
    form = ExplosiveAreaForm()
    return render(request, template_name, {'form': form})


def fetch_area_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        area_details = AreaModel.objects.values_list().filter(mine_id=mine_id)
        data = {}
        i = 0
        area_data = []
        for r in area_details:
            area_data.append(str(r[0]) + ',' + str(r[2]))
            i = i + 1
        data['result'] = area_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_WiFiData_ajax(request):
    data = {}
    if request.is_ajax():
        area_id = request.GET.get('id', None)
        print(area_id)
        Ip_row = AreaModel.objects.values_list().filter(id=area_id)
        i = 0
        IP = 0
        for r in Ip_row:
            Mine_nm = MineDetails.objects.get(id=str(r[1]))
            i = i + 1
            id = Mine_nm
            Area_nm = str(r[2])
            IP = str(r[4])

            # print(mine_table)
        ########------------fetch data from wifi and save into database----------
        o2 = co = ch4 = co2 = h2 = n2 = c2h4 = 0.0
        # print(id,Area_nm,IP)
        try:
            ##  ser = request.get(IP)

            ##wireless_data = requests.get('http://192.168.1.104/')
            wireless_data = requests.get('http://' + str(IP))
            ##print(wireless_data)
            datastring = wireless_data.text  # # read the line of text from the serial port
            ##print(datastring)
            dataArray = datastring.split(',')  # Split it into an array called dataArray
            o2 = float(dataArray[0])
            co = float(dataArray[1])  # Convert first element to floating number and put in temp
            ch4 = float(dataArray[2])  # Convert second element to floating number and put in P
            co2 = float(dataArray[3])
            h2 = float(dataArray[4])
            n2 = float(dataArray[5])
            c2h4 = float(dataArray[6])

            ##print(o2, co, ch4, co2, h2, n2, c2h4)
            ##save the gas values in individual gasdb instance
            gasinst = Fire_exp_gasesWifi()
            gasinst.Area_id = area_id
            gasinst.o2 = o2
            gasinst.co = co
            gasinst.ch4 = ch4
            gasinst.co2 = co2
            gasinst.h2 = h2
            gasinst.n2 = n2
            gasinst.c2h4 = c2h4

            ####----------ratio & messages---------------
            ##ratio calculation
            graham = (100 * co / (0.265 * n2 - o2))
            young = (100 * co2 / (0.265 * n2 - o2))
            coco2 = 100 * co / co2
            jtr = (co2 + 0.75 * co - 0.25 * h2) / (0.265 * n2 - o2)
            if (c2h4 == 0):
                chra = 0;
            else:
                chra = 3 * (co2 + co + ch4 + 2 * c2h4) / (0.2468 * n2 - o2 - co2 - 0.5 * h2 + ch4 + c2h4 + h2 - co)

            ##message calculation
            ##graham
            if (graham <= 0.4):
                grahamm = "Normal"
            elif (graham <= 0.5):
                grahamm = "Checkup required"
            elif (graham <= 1):
                grahamm = "Heating"
            elif (graham <= 2):
                grahamm = "Serious heating"
            elif (graham <= 7):
                grahamm = "FIRE with certainty"
            else:
                grahamm = "BLAZING FIRE"
            ##young
            if (young <= 25):
                youngm = "Superficial heating"
            elif (young <= 50):
                youngm = "FIRE present"
            else:
                youngm = "BLAZING FIRE"
            ##coco2
            if (coco2 <= 2):
                coco2m = "Normal"
            elif (coco2 <= 13):
                coco2m = "ACTIVE FIRE"
            else:
                coco2m = "BLAZING FIRE"
            ##jtr
            if (jtr <= 0.4):
                jtrm = "Indicative of no fire"
            elif (jtr <= 0.5):
                jtrm = "Indicative of methane fire"
            elif (jtr <= 1):
                jtrm = "Indicative of coal/oil/conveyor fire"
            else:
                jtrm = "Indicative of timber fire"
            ##chra
            if (chra <= 5):
                chram = "Superficial heating"
            elif (chra <= 20):
                chram = "ACTIVE FIRE"
            else:
                chram = "BLAZING FIRE"

            ##explosibility
            explos = 5
            pt = ch4 + co + h2

            ch4low = 5
            colow = 12.5
            h2low = 4
            ch4high = 14
            cohigh = 74.2
            h2high = 74.2
            ch4nose = 5.9
            conose = 13.8
            h2nose = 4.3
            ch4np = 6.07
            conp = 4.13
            h2np = 16.59

            Llow = pt / (ch4 / ch4low + co / colow + h2 / h2low)
            Lhigh = pt / (ch4 / ch4high + co / cohigh + h2 / h2high)
            Lnose = pt / (ch4 / ch4nose + co / conose + h2 / h2nose)
            Nex = Lnose / pt * (ch4np * ch4 + conp * co + h2np * h2)

            Oxnose = 0.2093 * (100 - Nex - Lnose)

            ##total combustible at extinctive point
            Le = 20.93 * Lnose / (20.93 - Oxnose)
            ##oxygen at lower limit
            Ob = -20.93 * Llow / 100 + 20.93
            ##oxygen at upper limit
            Oc = -20.93 * Lhigh / 100 + 20.93

            if ((o2 >= 0) and (pt >= 0)):
                if (100 * o2 + 20.93 * pt >= 2093):
                    explos = 4
                if (Le * o2 + 20.93 * pt <= Le * 20.93):
                    explos = 0
                if ((100 * o2 + 20.93 * pt <= 2093) and (Le * o2 + 20.93 * pt >= Le * 20.93) and (
                        (Lnose - Llow) * o2 + (
                        Ob - Oxnose) * pt <= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow)):
                    explos = 2
                if ((100 * o2 + 20.93 * pt <= 2093) and (Le * o2 + 20.93 * pt >= Le * 20.93) and (
                        (Lnose - Llow) * o2 + (
                        Ob - Oxnose) * pt >= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow) and (
                        (Lnose - Lhigh) * o2 + (
                        Oc - Oxnose) * pt <= Oc * Lnose - Oc * Lhigh - Oxnose * Lhigh + Oc * Lhigh)):
                    explos = 3
                if ((100 * o2 + 20.93 * pt <= 2093) and (Le * o2 + 20.93 * pt >= Le * 20.93) and (
                        (Lnose - Llow) * o2 + (
                        Ob - Oxnose) * pt >= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow) and (
                        (Lnose - Lhigh) * o2 + (
                        Oc - Oxnose) * pt >= Oc * Lnose - Oc * Lhigh - Oxnose * Lhigh + Oc * Lhigh)):
                    explos = 1

            ##explosibility message
            if (explos == 0):
                explosm = "Not explosive"
            elif (explos == 1):
                explosm = "Potentially explosive(if air is added)"
            elif (explos == 2):
                explosm = "Potentially explosive(if combustible gas is added)"
            elif (explos == 3):
                explosm = "Explosive"
            elif (explos == 4):
                explosm = "Impossible mixture"
            else:
                explosm = "Unidentified"

            gasinst.graham_ratio = graham
            gasinst.graham_msg = grahamm
            gasinst.young_ratio = young
            gasinst.young_msg = youngm
            gasinst.coco2_ratio = coco2
            gasinst.coco2_msg = coco2m
            gasinst.jtr_ratio = jtr
            gasinst.jtr_msg = jtrm
            gasinst.chra_ratio = chra
            gasinst.chra_msg = chram
            gasinst.explosm_result = explosm
            gasinst.date = datetime.date.today()

            # print(gasinst)
            ##print(gasinst)
            gasinst.save()

            # print("Wifi values and calculations saved successfully")
            # retrun_gas_table = Fire_exp_gasesWifi.objects.values_list().filter(id=mine_id).filter(Area_name=Area_nm).filter(Wifi_IP=IP)
            retrun_gas_table = Fire_exp_gasesWifi.objects.values_list().filter(Area_id=area_id,
                                                                               date=datetime.date.today())
            print(retrun_gas_table)
            # retrun_gas_table = Fire_exp_gasesWifi.objects.values_list().filter(id=area_id).filter(date__range=(date_from, date_to))
            # retrun_gas_table = Fire_exp_gasesWifi.objects.values_list().filter(date__range=(date_from, date_to)).order_by('date')

            # retrun_gas_table = Fire_exp_gasesWifi.objects.filter(date__range=(date_from, date_to))
            wifi_data = []
            i = 0

            for r in reversed(retrun_gas_table):
                wifi_data.append(
                    str(r[0]) + ',' + str(r[2]) + ',' + str(r[3]) + ',' + str(r[4]) + ',' + str(r[5]) + ',' + str(
                        r[6]) + ',' + str(r[7]) + ',' + str(r[8]) + ',' + str(r[10]) + ',' + str(r[12]) + ',' + str(
                        r[14]) + ',' + str(r[16]) + ',' + str(r[18]) + ',' + str(r[19]) + ',' + str(
                        r[20]) + ',' + str(id) + ',' + str(Area_nm) + ',' + str(IP))
                i = i + 1

            data['result'] = wifi_data
            print("abc")
            print(wifi_data)

        except Exception as e:
            return HttpResponse(
                "<body bgcolor='#E59887'><h2><center>Please check wifi network.</br></h2></center><small>" + str(
                    e) + "</small></body>")
    else:
        data['result'] = "Not Ajax"

    return JsonResponse(data)


@login_required
def show_wifi_report(request, template_name="gasmonitoring_wifi/show_wifi_report.html"):
    form = ExplosiveAreaForm()
    return render(request, template_name, {'form': form})


def fetch_WiFiReport_ajax(request):
    data = {}
    if request.is_ajax():
        area_id = request.GET.get('id', None)
        Ip_row = AreaModel.objects.values_list().filter(id=area_id)
        i = 0
        IP = 0
        for r in Ip_row:
            Mine_nm = MineDetails.objects.get(id=str(r[1]))
            i = i + 1
            Area_nm = str(r[2])
            IP = str(r[4])
        # print(IP)
        # data['result'] = wifi_Ip
        ########------------fetch data from wifi and save into database----------
        o2 = co = ch4 = co2 = h2 = n2 = c2h4 = 0.0

        try:
            ##  ser = request.get(IP)

            ##wireless_data = requests.get('http://192.168.1.104/')
            wireless_data = requests.get('http://' + str(IP))
            ##print(wireless_data)
            datastring = wireless_data.text  # # read the line of text from the serial port
            ##print(datastring)
            dataArray = datastring.split(',')  # Split it into an array called dataArray
            o2 = float(dataArray[0])
            co = float(dataArray[1])  # Convert first element to floating number and put in temp
            ch4 = float(dataArray[2])  # Convert second element to floating number and put in P
            co2 = float(dataArray[3])
            h2 = float(dataArray[4])
            n2 = float(dataArray[5])
            c2h4 = float(dataArray[6])
            print(o2, co, ch4, co2, h2, n2, c2h4)
            ##save the gas values in individual gasdb instance
            gasinst = Fire_exp_gasesWifi()
            gasinst.o2 = o2
            gasinst.co = co
            gasinst.ch4 = ch4
            gasinst.co2 = co2
            gasinst.h2 = h2
            gasinst.n2 = n2
            gasinst.c2h4 = c2h4

            ####----------ratio & messages---------------
            ##ratio calculation
            graham = (100 * co / (0.265 * n2 - o2))
            young = (100 * co2 / (0.265 * n2 - o2))
            coco2 = 100 * co / co2
            jtr = (co2 + 0.75 * co - 0.25 * h2) / (0.265 * n2 - o2)
            if (c2h4 == 0):
                chra = 0;
            else:
                chra = 3 * (co2 + co + ch4 + 2 * c2h4) / (0.2468 * n2 - o2 - co2 - 0.5 * h2 + ch4 + c2h4 + h2 - co)

            ##message calculation
            ##graham
            if (graham <= 0.4):
                grahamm = "Normal"
            elif (graham <= 0.5):
                grahamm = "Checkup required"
            elif (graham <= 1):
                grahamm = "Heating"
            elif (graham <= 2):
                grahamm = "Serious heating"
            elif (graham <= 7):
                grahamm = "FIRE with certainty"
            else:
                grahamm = "BLAZING FIRE"
            ##young
            if (young <= 25):
                youngm = "Superficial heating"
            elif (young <= 50):
                youngm = "FIRE present"
            else:
                youngm = "BLAZING FIRE"
            ##coco2
            if (coco2 <= 2):
                coco2m = "Normal"
            elif (coco2 <= 13):
                coco2m = "ACTIVE FIRE"
            else:
                coco2m = "BLAZING FIRE"
            ##jtr
            if (jtr <= 0.4):
                jtrm = "Indicative of no fire"
            elif (jtr <= 0.5):
                jtrm = "Indicative of methane fire"
            elif (jtr <= 1):
                jtrm = "Indicative of coal/oil/conveyor fire"
            else:
                jtrm = "Indicative of timber fire"
            ##chra
            if (chra <= 5):
                chram = "Superficial heating"
            elif (chra <= 20):
                chram = "ACTIVE FIRE"
            else:
                chram = "BLAZING FIRE"

            ##explosibility
            explos = 5
            pt = ch4 + co + h2

            ch4low = 5
            colow = 12.5
            h2low = 4
            ch4high = 14
            cohigh = 74.2
            h2high = 74.2
            ch4nose = 5.9
            conose = 13.8
            h2nose = 4.3
            ch4np = 6.07
            conp = 4.13
            h2np = 16.59

            Llow = pt / (ch4 / ch4low + co / colow + h2 / h2low)
            Lhigh = pt / (ch4 / ch4high + co / cohigh + h2 / h2high)
            Lnose = pt / (ch4 / ch4nose + co / conose + h2 / h2nose)
            Nex = Lnose / pt * (ch4np * ch4 + conp * co + h2np * h2)

            Oxnose = 0.2093 * (100 - Nex - Lnose)

            ##total combustible at extinctive point
            Le = 20.93 * Lnose / (20.93 - Oxnose)
            ##oxygen at lower limit
            Ob = -20.93 * Llow / 100 + 20.93
            ##oxygen at upper limit
            Oc = -20.93 * Lhigh / 100 + 20.93

            if ((o2 >= 0) and (pt >= 0)):
                if (100 * o2 + 20.93 * pt >= 2093):
                    explos = 4
                if (Le * o2 + 20.93 * pt <= Le * 20.93):
                    explos = 0
                if ((100 * o2 + 20.93 * pt <= 2093) and (Le * o2 + 20.93 * pt >= Le * 20.93) and (
                        (Lnose - Llow) * o2 + (
                        Ob - Oxnose) * pt <= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow)):
                    explos = 2
                if ((100 * o2 + 20.93 * pt <= 2093) and (Le * o2 + 20.93 * pt >= Le * 20.93) and (
                        (Lnose - Llow) * o2 + (
                        Ob - Oxnose) * pt >= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow) and (
                        (Lnose - Lhigh) * o2 + (
                        Oc - Oxnose) * pt <= Oc * Lnose - Oc * Lhigh - Oxnose * Lhigh + Oc * Lhigh)):
                    explos = 3
                if ((100 * o2 + 20.93 * pt <= 2093) and (Le * o2 + 20.93 * pt >= Le * 20.93) and (
                        (Lnose - Llow) * o2 + (
                        Ob - Oxnose) * pt >= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow) and (
                        (Lnose - Lhigh) * o2 + (
                        Oc - Oxnose) * pt >= Oc * Lnose - Oc * Lhigh - Oxnose * Lhigh + Oc * Lhigh)):
                    explos = 1

            ##explosibility message
            if (explos == 0):
                explosm = "Not explosive"
            elif (explos == 1):
                explosm = "Potentially explosive(if air is added)"
            elif (explos == 2):
                explosm = "Potentially explosive(if combustible gas is added)"
            elif (explos == 3):
                explosm = "Explosive"
            elif (explos == 4):
                explosm = "Impossible mixture"
            else:
                explosm = "Unidentified"

            gasinst.graham_ratio = graham
            gasinst.graham_msg = grahamm
            gasinst.young_ratio = young
            gasinst.young_msg = youngm
            gasinst.coco2_ratio = coco2
            gasinst.coco2_msg = coco2m
            gasinst.jtr_ratio = jtr
            gasinst.jtr_msg = jtrm
            gasinst.chra_ratio = chra
            gasinst.chra_msg = chram
            gasinst.explosm_result = explosm
            gasinst.date = datetime.date.today()

            print("test db date")
            print(gasinst.date)
            ##print(gasinst)
            gasinst.save()
            print("Wifi values and calculations saved successfully")
            # gas_table = Fire_exp_gasesWifi.objects.values_list().filter()
            # retrun_gas_table = Fire_exp_gasesWifi.objects.values_list().filter(id=area_id).filter(date__range=(date_from, date_to))
            retrun_gas_table = Fire_exp_gasesWifi.objects.values_list().filter(Area_id=area_id,
                                                                               date=datetime.date.today())

            # retrun_gas_table = Fire_exp_gasesWifi.objects.filter(date__range=(date_from, date_to))
            wifi_data = []
            i = 0
            print("abc")
            print(retrun_gas_table)
            for r in retrun_gas_table:
                wifi_data.append(
                    str(r[0]) + ',' + str(r[2]) + ',' + str(r[3]) + ',' + str(r[4]) + ',' + str(r[5]) + ',' + str(
                        r[6]) + ',' + str(r[7]) + ',' + str(r[8]) + ',' + str(r[10]) + ',' + str(r[12]) + ',' + str(
                        r[14]) + ',' + str(r[16]) + ',' + str(r[18]) + ',' + str(r[19]) + ',' + str(
                        r[20]) + ',' + str(Mine_nm) + ',' + str(Area_nm) + ',' + str(IP))
                i = i + 1

            data['result'] = wifi_data
        except Exception as e:
            # return HttpResponse("<body bgcolor='#E59887'><h2><center>Please check wifi network.</br></h2></center><small>" + str(e) + "</small></body>")
            return HttpResponse(
                "<body bgcolor='#E59887'><h2><center>Please check wifi network..</br></h2></center><small>" + str(
                    e) + "</small></body>")
    else:
        data['result'] = "Not Ajax"

    return JsonResponse(data)


@login_required
def line_chart_gas_ratios_wifi(request, template_name="gasmonitoring_wifi/line_chart_gas_ratios_wifi.html"):
    form = ExplosiveAreaForm()
    return render(request, template_name, {'form': form})


def fetch_gas_ratios_ajax_wifi(request):
    data = {}
    if request.is_ajax():
        area_id = request.GET.get('id', None)
        date_from = request.GET.get('date_from', None)
        date_to = request.GET.get('date_to', None)
        default_items = []
        gas_table = Fire_exp_gasesWifi.objects.filter(date__range=(date_from, date_to), Area_id=area_id)

        for rr in gas_table:
            default_items.append(
                {'date': rr.date.strftime("%d-%b"), 'co': float(rr.co), 'graham_ratio': float(rr.graham_ratio),
                 'coco2_ratio': float(rr.coco2_ratio), 'jtr_ratio': float(rr.jtr_ratio)})

        data['result'] = default_items
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


@login_required
def young_co_ratio_page_wifi(request):
    return render(request, "gasmonitoring_wifi/young_co_ratio_page_wifi.html")


@login_required
def fetch_young_co_ajax_wifi(request):
    data={}
    if request.is_ajax():
        area_id = request.GET.get('id', None)
        date_from = request.GET.get('date_from', None)
        date_to = request.GET.get('date_to', None)
        gas_table = Fire_exp_gasesWifi.objects.filter(date__range=(date_from, date_to), Area_id=area_id)
        print(gas_table)
        default_items = []
        i = 0
        for rr in gas_table:
            default_items.append({'date':str(rr.date.strftime("%d-%b")),'young_ratio':float(rr.young_ratio),'co_ratio':float(rr.co)})
        data['result']=default_items
    else:
        data['result']="Not Ajax"

    return JsonResponse(data)


@login_required
@login_required
def fetch_Report_ajax(request):
    data = {}
    if request.is_ajax():
        area_id = request.GET.get('id', None)
        date_from = request.GET.get('date_from', None)
        date_to = request.GET.get('date_to', None)

        Ip_row = AreaModel.objects.values_list().filter(id=area_id)
        i = 0
        IP = 0
        for r in Ip_row:
            Mine_nm = MineDetails.objects.get(id=str(r[1]))
            i = i + 1
            Area_nm = str(r[2])
            IP = str(r[4])
        print(area_id, date_from, date_to, Mine_nm, Area_nm, IP)
        try:
            Report = Fire_exp_gasesWifi.objects.all().values_list().filter(date__range=(date_from, date_to),
                                                                           Area_id=area_id).order_by('date')
            # print(Report)
            datalist = []
            i = 0
            for r in reversed(Report):
                datalist.append(
                    str(r[0]) + ',' + str(r[2]) + ',' + str(r[3]) + ',' + str(r[4]) + ',' + str(r[5]) + ',' + str(
                        r[6]) + ',' + str(r[7]) + ',' + str(r[8]) + ',' + str(r[10]) + ',' + str(r[12]) + ',' + str(
                        r[14]) + ',' + str(r[16]) + ',' + str(r[18]) + ',' + str(r[19]) + ',' + str(
                        r[20]) + ',' + str(Mine_nm) + ',' + str(Area_nm) + ',' + str(IP))
                i = i + 1

            data['result'] = datalist
            print(datalist)
        except Exception as e:
            return HttpResponse(
                "<body bgcolor='#E59887'><h2><center>Data not found.</br></h2></center><small>" + str(
                    e) + "</small></body>")
    else:
        data['result'] = "Not Ajax"

    return JsonResponse(data)


def analysis_wifi(request, pk, template_name='gasmonitoring_wifi/manage_goaf_area.html'):
    class GraphData:
        o2 = co = ch4 = co2 = h2 = n2 = c2h4 = elx = ely = 0.0
        explos = 5
        idtest = 0

    graphpoints = []
    # area_id = request.GET.get('id', None)
    # data_list =Fire_exp_gasesWifi.objects.values_list().filter(Area_id=area_id)
    data_list = Fire_exp_gasesWifi.objects.filter(Area_id=pk)
    # data_list =Fire_exp_gasesWifi.objects.all()
    # print(data_list)
    instance_count = data_list.count()

    idn = 1
    for gas in data_list:
        x = GraphData()
        x.o2 = gas.o2
        x.co = gas.co
        x.ch4 = gas.ch4
        x.co2 = gas.co2
        x.h2 = gas.h2
        x.n2 = gas.n2
        x.c2h4 = gas.c2h4
        x.idtest = gas.id

        ##explosibility calculation again
        x.explos = 5
        pt = x.ch4 + x.co + x.h2

        ch4low = 5
        colow = 12.5
        h2low = 4
        ch4high = 14
        cohigh = 74.2
        h2high = 74.2
        ch4nose = 5.9
        conose = 13.8
        h2nose = 4.3
        ch4np = 6.07
        conp = 4.13
        h2np = 16.59

        Llow = pt / (x.ch4 / ch4low + x.co / colow + x.h2 / h2low)
        Lhigh = pt / (x.ch4 / ch4high + x.co / cohigh + x.h2 / h2high)
        Lnose = pt / (x.ch4 / ch4nose + x.co / conose + x.h2 / h2nose)
        Nex = Lnose / pt * (ch4np * x.ch4 + conp * x.co + h2np * x.h2)

        Oxnose = 0.2093 * (100 - Nex - Lnose)

        ##total combustible at extinctive point
        Le = 20.93 * Lnose / (20.93 - Oxnose)
        ##oxygen at lower limit
        Ob = -20.93 * Llow / 100 + 20.93
        ##oxygen at upper limit
        Oc = -20.93 * Lhigh / 100 + 20.93

        if ((x.o2 >= 0) and (pt >= 0)):
            if (100 * x.o2 + 20.93 * pt >= 2093):
                x.explos = 4
            if (Le * x.o2 + 20.93 * pt <= Le * 20.93):
                x.explos = 0
            if ((100 * x.o2 + 20.93 * pt <= 2093) and (Le * x.o2 + 20.93 * pt >= Le * 20.93) and (
                    (Lnose - Llow) * x.o2 + (Ob - Oxnose) * pt <= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow)):
                x.explos = 2
            if ((100 * x.o2 + 20.93 * pt <= 2093) and (Le * x.o2 + 20.93 * pt >= Le * 20.93) and (
                    (Lnose - Llow) * x.o2 + (
                    Ob - Oxnose) * pt >= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow) and (
                    (Lnose - Lhigh) * x.o2 + (
                    Oc - Oxnose) * pt <= Oc * Lnose - Oc * Lhigh - Oxnose * Lhigh + Oc * Lhigh)):
                x.explos = 3
            if ((100 * x.o2 + 20.93 * pt <= 2093) and (Le * x.o2 + 20.93 * pt >= Le * 20.93) and (
                    (Lnose - Llow) * x.o2 + (
                    Ob - Oxnose) * pt >= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow) and (
                    (Lnose - Lhigh) * x.o2 + (
                    Oc - Oxnose) * pt >= Oc * Lnose - Oc * Lhigh - Oxnose * Lhigh + Oc * Lhigh)):
                x.explos = 1

        ##0 NE, 1 PE w/air, 2 PE w/comb, 3 E, 4 IM, 5 Unidentified

        ##calculating Ellicott's Extension point

        ##calculating new x,y coordinates after origin shift
        xx = pt - Lnose
        yx = x.o2 - Oxnose

        xp = Llow - Lnose
        yp = Ob - Oxnose

        xq = Lhigh - Lnose
        yq = Oc - Oxnose

        xs = Le - Lnose
        ys = -Oxnose

        # calculating polar coordinates
        def properarctan(valuex, valuey):
            if valuex >= 0:
                if (np.degrees(np.arctan(valuey / valuex) < 0)):
                    return (360 + np.degrees(np.arctan(valuey / valuex)))
                else:
                    return np.degrees(np.arctan(valuey / valuex))
            else:
                return (np.degrees(np.arctan(valuey / valuex)) + 180.0)

        rx = np.sqrt(xx * xx + yx * yx)
        thx = properarctan(xx, yx)

        rp = np.sqrt(xp * xp + yp * yp)
        thp = properarctan(xp, yp)

        rq = np.sqrt(xq * xq + yq * yq)
        thq = properarctan(xq, yq)

        rs = np.sqrt(xs * xs + ys * ys)
        ths = properarctan(xs, ys)

        ##calculating r,theta values based on explosibiility
        if x.explos == 3:
            rm = rx
            thm = 90 * ((thx - thq) / (thx - thq + thp - thx))
        elif (x.explos == 1 or x.explos == 2):
            rm = rx
            thm = 270 + (90 * ((thx - ths) / (
                    thx - ths + thx - thq)))  ##HERE MADE A CHANGE FROM ELLICOTTS EXTENSION thx-thq instead of thq-thx
        elif x.explos == 0:
            rm = rx
            thm = 90 + (180 * ((thx - thp) / (thx - thp + ths - thx)))
        else:
            rm = 0
            thm = 0

        x.elx = rm * np.cos(np.radians(thm))
        x.ely = rm * np.sin(np.radians(thm))

        graphpoints.append(x)
        idn = idn + 1

    ##graph
    xlist = []
    ylist = []
    idn = 0
    while (idn < len(graphpoints)):
        xlist.append(graphpoints[idn].elx)
        ylist.append(graphpoints[idn].ely)
        idn = idn + 1

    xaxislist = []
    yaxislist = []
    for i in range(-12, 13):
        xaxislist.append(i)
        yaxislist.append(0)

    plt.xlim((-12, 12))
    plt.ylim((-12, 12))
    plt.xticks([])
    plt.yticks([])
    plt.plot(xaxislist, yaxislist, linewidth=1, color='black')
    plt.plot(yaxislist, xaxislist, linewidth=1, color='black')

    trialxlist = []
    trialylist = []
    idn = 0

    def markercrtr(numb):
        createdstring = '$' + str(numb + 1) + '$'
        return createdstring

    def markerclr(numb):
        tot = len(graphpoints)
        colorstring = 'xkcd:sky blue'
        if (numb < tot / 5):
            colorstring = 'xkcd:blue purple'
        elif (numb < 2 * tot / 5):
            colorstring = 'xkcd:apple green'
        elif (numb < 3 * tot / 5):
            colorstring = 'xkcd:yellowish'
        elif (numb < 4 * tot / 5):
            colorstring = 'xkcd:marigold'
        else:
            colorstring = 'xkcd:pinky red'
        return colorstring

    while (idn < len(graphpoints)):
        trialxlist = graphpoints[idn].elx
        trialylist = graphpoints[idn].ely
        plt.scatter(trialxlist, trialylist, c=markerclr(idn), marker=markercrtr(idn))
        idn = idn + 1

    plt.text(8, 10, 'EXPLOSIVE')
    plt.text(-11, 10, 'NON-EXPLOSIVE')
    plt.text(-11, -11, 'NON-EXPLOSIVE')
    plt.text(3, -11, 'POTENTIALLY EXPLOSIVE')
    plt.title('Ellicott\'s Extension')

    ##Now the redirect into the cStringIO or BytesIO object

    f = io.BytesIO()
    plt.savefig(f, format="png", facecolor=(0.95, 0.95, 0.95),
                dpi=1200)  # need to fix so that this takes up the full screen and is not dependent on the device
    plt.clf()

    ##Add the contents of the StringIO or BytesIO object to the response, matching the mime type with the plot format (in this case, PNG) and return
    return HttpResponse(f.getvalue(), content_type="image/png")
