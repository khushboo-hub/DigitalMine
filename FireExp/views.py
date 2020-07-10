##################################################################################
###     Created By: DEWANGSHU PANDIT
###     Created On: July-aug -2018
###     Purpose :Controlling of Gas Fire Explosibility in Goaf Areas both manual and automatic
###     Any Description:(Initially Created by Project Trainee(Vargise) then enhanced and implemented by Dewangshu)
###     Last Modified:
###     Modified function,any:
##################################################################################
from django.contrib import messages
from django.contrib.auth.decorators import login_required

import numpy as np
import io, csv
import datetime
from datetime import timedelta
from time import sleep
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.shortcuts import render
from .models import Gasdb, Fire_exp_gases
from .forms import FireForm
from .forms import EraseForm
from .forms import DisplayForm
from .forms import AnalysisForm
from .forms import TrendForm
from .forms import PredictForm
from .forms import SerialInputForm
from .forms import EditForm
from .forms import DeviceForm


# Create your views here.
@login_required
def manual_entry(request, template_name='FireExp/manual_entry.html'):
    form = FireForm()
    gasinst=[]
    if request.method == 'POST':
        form = FireForm(request.POST or None)
        gasinst=Gasdb()
        gasinst.o2=float(request.POST.get('o2'))
        gasinst.co=float(request.POST.get('co'))
        gasinst.ch4=float(request.POST.get('ch4'))
        gasinst.co2=float(request.POST.get('co2'))
        gasinst.h2=float(request.POST.get('h2'))
        gasinst.n2=float(request.POST.get('n2'))
        gasinst.c2h4=float(request.POST.get('c2h4'))
        date=request.POST.get('date')
        gasinst.date=date
        if 'addbutton' in request.POST:
            if form.is_valid():
                form.save()
                messages.success(request, 'Fire Status and explosibility formulated and saved successfully')
            else:
                messages.warning(request, 'Data with date '+str(date)+' already exist')
        elif 'showbutton' in request.POST:
            messages.success(request,'Fire Status and explosibility formulated successfully')

    return render(request, template_name,{'form': form, 'obj': gasinst})

from django.template.defaulttags import register


@register.filter(name='exlookup')
def get_item(dictionary, key, ex):
    return dictionary.get(key)[ex]


def findExplosibility(o2, co, ch4, co2, h2, n2, c2h4):
    # ratio calculation
    graham = (100 * co / (0.265 * n2 - o2))
    young = (100 * co2 / (0.265 * n2 - o2))
    coco2 = 100 * co / co2
    jtr = (co2 + 0.75 * co - 0.25 * h2) / (0.265 * n2 - o2)
    if (c2h4 == 0):
        chra = 0
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
    data = {
        'explosibilty': explosm,
        'graham': grahamm,
        'young': youngm,
        'coco2': coco2m,
        'jtr': jtrm,
        'chra': chram
    }
    return data


@login_required
def show_database(request, template_name='FireExp/show_database.html'):
    data = {}

    if request.method == "POST":
        date_from = datetime.datetime.strptime("1899-01-01", "%Y-%m-%d")
        date_to = datetime.datetime.strptime("2999-12-12", "%Y-%m-%d")

        if request.POST.get('from_date',None) is not None and request.POST.get('from_date',None) != '':
            print('in',request.POST.get('from_date',None))
            date_from=request.POST.get('from_date',None)

        if request.POST.get('to_date', None) is not None and request.POST.get('to_date', None) != '':
            print('in', request.POST.get('to_date', None))
            date_to = request.POST.get('to_date', None)

        print(date_from,date_to)
        gases = Gasdb.objects.filter(date__range=(date_from, date_to))
        data['object_list'] = gases
    return render(request, template_name, data)


@login_required
def import_from_file(request, template_name='FireExp/import_from_file.html'):
    data = {}
    flag = 1
    if request.method == "POST" and request.FILES['file']:
        csv_file = request.FILES['file']
        try:
            if not csv_file.name.endswith('.csv'):
                messages.error(request, 'Please select a csv file')
                return render(request, template_name, data)
            data_set = csv_file.read().decode('UTF-8')
            io_string = io.StringIO(data_set)

            obj = []
            for column in csv.reader(io_string, delimiter=','):
                if column[0] == "id":
                    pass
                try:
                    obj.append(
                        Gasdb(o2=float(column[1]), co=float(column[2]), ch4=float(column[3]), co2=float(column[4]),
                              h2=float(column[5]), n2=float(column[6]), c2h4=float(column[7]), date=column[8]))
                except Exception as e:
                    pass
            if "show" in request.POST:
                try:
                    data['object_list'] = obj
                except:
                    messages.info(request, "Order of csv should be id,o2,co,ch4,co2,h2,n2,c2h4,date")
                    flag = 0
                    pass
                if flag == 1:
                    messages.success(request, "Data tabulated successfully")

            elif "save" in request.POST:
                try:
                    Gasdb.objects.bulk_create(obj)
                    data['object_list'] = obj
                except Exception as e:
                    messages.error(request, "Dublicate Entry")
                    flag = 0
                    pass
                if flag == 1:
                    messages.success(request, "Data saved and tabulated successfully")
        except Exception as e:
            print('f', e)
            messages.error(request, "Something went wrong!")
            pass

    return render(request, template_name, data)


@login_required
def analysis_button(request, template_name='FireExp/info_page.html'):
    return render(request, template_name)


@login_required
def explosibility(request, page, template_name='FireExp/explosibility.html'):
    data = {}
    if request.is_ajax():
        date_from = request.GET.get('from', None)
        date_to = request.GET.get('to', None)

        class GraphData:
            o2 = co = ch4 = co2 = h2 = n2 = c2h4 = elx = ely = 0.0
            explos = 5
            idtest = 0

        graphpoints = []

        if (page == 0):
            FireExp = Gasdb.objects.filter(date__range=(date_from, date_to))
        elif (page == 1):
            FireExp = Fire_exp_gases.objects.all()

        idn = 1
        data = {}
        graph = []
        dates = []
        for gas in FireExp:
            dates.append(gas.date)
            x = GraphData()

            try:
                x.o2 = gas.o2
                # x.o2 = Gasdb.objects.get(id=idn).o2
            except Gasdb.DoesNotExist:
                x.o2 = None
            try:
                x.co = gas.co
            except Gasdb.DoesNotExist:
                x.co = None
            try:
                x.ch4 = gas.ch4
            except Gasdb.DoesNotExist:
                x.ch4 = None

            try:
                x.co2 = gas.co2
            except Gasdb.DoesNotExist:
                x.co2 = None

            try:
                x.h2 = gas.h2
            except Gasdb.DoesNotExist:
                x.h2 = None

            try:
                x.n2 = gas.n2
            except Gasdb.DoesNotExist:
                x.n2 = None

            try:
                x.c2h4 = gas.c2h4
            except Gasdb.DoesNotExist:
                x.c2h4 = None

            try:
                x.idtest = gas.id
            except Gasdb.DoesNotExist:
                x.idtest = None

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
                        (Lnose - Llow) * x.o2 + (
                        Ob - Oxnose) * pt <= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow)):
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
            print("GPx", x)

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

        trialxlist = []
        trialylist = []
        idn = 0

        def markercrtr(numb):
            createdstring = '$' + str(numb + 1) + '$'
            return createdstring

        def markerclr(x, y):
            colorstring = '#77b5fe'
            if (x <= 0 and y <= 0):
                colorstring = '#4caf50'
            elif (x <= 0 and y > 0):
                colorstring = '#8bc34a'
            elif (x > 0 and y > 0):
                colorstring = '#ff9800'
            elif (x > 0 and y < 0):
                colorstring = '#f44336'
            return colorstring

        def quadrant(x, y):
            quad = 0
            if (x <= 0 and y <= 0):
                quad = 0
            elif (x <= 0 and y > 0):
                quad = 1
            elif (x > 0 and y > 0):
                quad = 2
            elif (x > 0 and y < 0):
                quad = 3
            return quad

        while (idn < len(graphpoints)):
            trialxlist = graphpoints[idn].elx
            trialylist = graphpoints[idn].ely
            # print('dates', dates[idn])
            graph.append({
                'x': trialxlist,
                'y': trialylist,
                'color': markerclr(trialxlist, trialylist),
                'quadrant': quadrant(trialxlist, trialylist),
                'dates': dates[idn]
            })
            idn = idn + 1
        data['result'] = graph
    else:
        data['error'] = "Not Ajax"
    return JsonResponse(data)


@login_required
def automatic_entry(request, template_name='FireExp/automatic_entry.html'):
    pass
    # return render(request, template_name, resultdict)


@login_required
def trends(request):
    if request.method == 'POST':
        form = PredictForm(request.POST)

        class GraphData:
            o2 = co = ch4 = co2 = h2 = n2 = c2h4 = 0.0
            explos = 5
            idtest = 0
            date = datetime.date.today()
            dateval = 0

        graphpoints = []

        data_list = Fire_exp_gases.objects.all()
        instance_count = data_list.count()

        idn = 1
        while (idn <= instance_count):
            x = GraphData()
            x.o2 = Gasdb.objects.get(id=idn).o2
            x.co = Gasdb.objects.get(id=idn).co
            x.ch4 = Gasdb.objects.get(id=idn).ch4
            x.co2 = Gasdb.objects.get(id=idn).co2
            x.h2 = Gasdb.objects.get(id=idn).h2
            x.n2 = Gasdb.objects.get(id=idn).n2
            x.c2h4 = Gasdb.objects.get(id=idn).c2h4
            x.idtest = Gasdb.objects.get(id=idn).id
            x.date = Gasdb.objects.get(id=idn).date

            ##calculating the difference in dates for y values
            if (idn == 1):
                x.dateval = 0
            else:
                x.dateval = float((x.date - graphpoints[0].date).days)
            graphpoints.append(x)
            idn = idn + 1

        ##linear regression to predict next 10 gas values

        theta0list = []
        theta1list = []
        theta0 = 0.0
        theta1 = 0.0
        temp0 = temp1 = 0.0
        alpha = 0.0001

        def sum1(th0, th1):
            summ = 0.0
            for i in range(1, instance_count):
                summ = summ + th0 + th1 * graphpoints[i - 1].dateval - graphpoints[i - 1].o2
            return summ

        def sum2(th0, th1):
            summ = 0.0
            for i in range(1, instance_count):
                summ = summ + (th0 + th1 * graphpoints[i - 1].dateval - graphpoints[i - 1].o2) * (
                    graphpoints[i - 1].dateval)
            return summ

        i = 0
        while (i <= 100000):
            temp0 = theta0 - alpha * (1 / float(instance_count) * sum1(theta0, theta1))
            temp1 = theta1 - alpha * (1 / float(instance_count) * sum2(theta0, theta1))
            theta0 = temp0
            theta1 = temp1
            i = i + 1

        ##modularise the linear regression

        def regressor(gas):
            theta0 = 0.0
            theta1 = 0.0
            temp0 = temp1 = 0.0
            alpha = 0.0001

            def sum1(th0, th1):
                summ = 0.0
                for i in range(1, instance_count):
                    if gas == 0:
                        summ = summ + th0 + th1 * graphpoints[i - 1].dateval - graphpoints[i - 1].o2
                    elif gas == 1:
                        summ = summ + th0 + th1 * graphpoints[i - 1].dateval - graphpoints[i - 1].ch4
                    elif gas == 2:
                        summ = summ + th0 + th1 * graphpoints[i - 1].dateval - graphpoints[i - 1].co
                    elif gas == 3:
                        summ = summ + th0 + th1 * graphpoints[i - 1].dateval - graphpoints[i - 1].h2
                    else:
                        return HttpResponse('wrong gas number')
                return summ

            def sum2(th0, th1):
                summ = 0.0
                for i in range(1, instance_count):
                    if gas == 0:
                        summ = summ + (th0 + th1 * graphpoints[i - 1].dateval - graphpoints[i - 1].o2) * (
                            graphpoints[i - 1].dateval)
                    elif gas == 1:
                        summ = summ + (th0 + th1 * graphpoints[i - 1].dateval - graphpoints[i - 1].ch4) * (
                            graphpoints[i - 1].dateval)
                    elif gas == 2:
                        summ = summ + (th0 + th1 * graphpoints[i - 1].dateval - graphpoints[i - 1].co) * (
                            graphpoints[i - 1].dateval)
                    elif gas == 3:
                        summ = summ + (th0 + th1 * graphpoints[i - 1].dateval - graphpoints[i - 1].h2) * (
                            graphpoints[i - 1].dateval)
                    else:
                        return HttpResponse('wrong gas number')
                return summ

            i = 0
            while (i <= 100000):
                temp0 = theta0 - alpha * (1 / float(instance_count) * sum1(theta0, theta1))
                temp1 = theta1 - alpha * (1 / float(instance_count) * sum2(theta0, theta1))
                theta0 = temp0
                theta1 = temp1
                i = i + 1

            theta0list.append(theta0)
            theta1list.append(theta1)
            return

        regressor(0)
        regressor(1)
        regressor(2)
        regressor(3)

        ##        ##graphing this
        ##        trialxlist = []
        ##        trialylist = []
        ##
        ##        i = 0
        ##        while(i<=instance_count):
        ##            trialxlist.append(graphpoints[i-1].dateval)
        ##            trialylist.append(graphpoints[i-1].h2)
        ##            i = i+1
        ##
        ##        xlist2 = []
        ##        ylist2 = []
        ##
        ##        i = 0
        ##        while(i<=graphpoints[instance_count-1].dateval+10):
        ##            xlist2.append(i)
        ##            ylist2.append(theta0list[3]+theta1list[3]*i)
        ##            i = i + 1
        ##
        ##    ##    plt.xlim((0, 10))
        ##    ##    plt.ylim((0,10))
        ##        plt.scatter(trialxlist,trialylist, c='xkcd:sky blue', marker='*')
        ##        plt.plot(xlist2, ylist2, linewidth = 1, color = 'black')
        ##
        ##        f = io.BytesIO()
        ##        plt.savefig(f, format="png", facecolor=(0.95,0.95,0.95)) #removed dpi
        ##        plt.clf()
        ##
        ##        ##Add the contents of the StringIO or BytesIO object to the response, matching the mime type with the plot format (in this case, PNG) and return
        ##        return HttpResponse(f.getvalue(), content_type="image/png")

        ##calculate explosibility for the next few days
        explosibilitylist = []
        o2list = []
        ch4list = []
        colist = []
        h2list = []

        ##        firstday = int(graphpoints[instance_count-1].dateval+1) # this is index 0 on the list
        lastday = 10
        if form.is_valid():
            firstday = int((form.cleaned_data['startdate'] - graphpoints[
                0].date).days)  # x.dateval = float((x.date - graphpoints[0].date).days)
            lastday = int((form.cleaned_data['enddate'] - form.cleaned_data[
                'startdate']).days) + 1  # number of days which to predict for
        else:
            return HttpResponse('incorrect input')

        ##testing
        ##        return HttpResponse(firstday)

        for i in range(lastday):
            o2list.append(theta0list[0] + theta1list[0] * (firstday + i))
            ch4list.append(theta0list[1] + theta1list[1] * (firstday + i))
            colist.append(theta0list[2] + theta1list[2] * (firstday + i))
            h2list.append(theta0list[3] + theta1list[3] * (firstday + i))

        for i in range(lastday):
            ##explosibility calculation again
            pt = ch4list[i] + colist[i] + h2list[i]

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

            Llow = pt / (ch4list[i] / ch4low + colist[i] / colow + h2list[i] / h2low)
            Lhigh = pt / (ch4list[i] / ch4high + colist[i] / cohigh + h2list[i] / h2high)
            Lnose = pt / (ch4list[i] / ch4nose + colist[i] / conose + h2list[i] / h2nose)
            Nex = Lnose / pt * (ch4np * ch4list[i] + conp * colist[i] + h2list[i] * x.h2)

            Oxnose = 0.2093 * (100 - Nex - Lnose)

            ##total combustible at extinctive point
            Le = 20.93 * Lnose / (20.93 - Oxnose)
            ##oxygen at lower limit
            Ob = -20.93 * Llow / 100 + 20.93
            ##oxygen at upper limit
            Oc = -20.93 * Lhigh / 100 + 20.93

            if ((o2list[i] >= 0) and (pt >= 0)):
                if (100 * o2list[i] + 20.93 * pt >= 2093):
                    explosibilitylist.append(4)
                elif (Le * o2list[i] + 20.93 * pt <= Le * 20.93):
                    explosibilitylist.append(0)
                elif ((100 * o2list[i] + 20.93 * pt <= 2093) and (Le * o2list[i] + 20.93 * pt >= Le * 20.93) and (
                        (Lnose - Llow) * o2list[i] + (
                        Ob - Oxnose) * pt <= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow)):
                    explosibilitylist.append(2)
                elif ((100 * o2list[i] + 20.93 * pt <= 2093) and (Le * o2list[i] + 20.93 * pt >= Le * 20.93) and (
                        (Lnose - Llow) * o2list[i] + (
                        Ob - Oxnose) * pt >= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow) and (
                              (Lnose - Lhigh) * o2list[i] + (
                              Oc - Oxnose) * pt <= Oc * Lnose - Oc * Lhigh - Oxnose * Lhigh + Oc * Lhigh)):
                    explosibilitylist.append(3)
                elif ((100 * o2list[i] + 20.93 * pt <= 2093) and (Le * o2list[i] + 20.93 * pt >= Le * 20.93) and (
                        (Lnose - Llow) * o2list[i] + (
                        Ob - Oxnose) * pt >= Ob * Lnose - Ob * Llow - Oxnose * Llow + Ob * Llow) and (
                              (Lnose - Lhigh) * o2list[i] + (
                              Oc - Oxnose) * pt >= Oc * Lnose - Oc * Lhigh - Oxnose * Lhigh + Oc * Lhigh)):
                    explosibilitylist.append(1)
                else:
                    explosibilitylist.append(5)
            else:
                explosibility.append(5)
            ##0 NE, 1 PE w/air, 2 PE w/comb, 3 E, 4 IM, 5 Unidentified

        datelist = []
        for i in range(lastday):
            datelist.append(form.cleaned_data['startdate'] + timedelta(days=i))

    ##actions if POST.method == GET
    else:
        form = PredictForm()
        explosibilitylist = []
        datelist = []
        lastday = 0

    ##for now need to pass next 10 dates and explosibility values to
    explosdict = {'explos_list': explosibilitylist, 'lastday': lastday, 'date_list': datelist, 'form': form}
    return render(request, 'FireExp/trends.html', explosdict)


# @login_required
# def test_graph(request):
#     xlist = []
#     ylist = []
#     idn = 0
#     # while (idn < len(graphpoints)):
#     #     xlist.append(graphpoints[idn].elx)
#     #     ylist.append(graphpoints[idn].ely)
#     #     idn = idn + 1
#
#     xaxislist = []
#     yaxislist = []
#     for i in range(-12, 13):
#         xaxislist.append(i)
#         yaxislist.append(0)
#
#     plt.xlim(-12, 12)
#     plt.ylim(-12, 12)
#     # plt.xticks([])
#     # plt.yticks([])
#     plt.plot(xaxislist, yaxislist, linewidth=1, color='black')
#     plt.plot(yaxislist, xaxislist, linewidth=1, color='black')
#     # while (idn < len(graphpoints)):
#     #     trialxlist = graphpoints[idn].elx
#     #     trialylist = graphpoints[idn].ely
#     #     plt.scatter(trialxlist, trialylist, c=markerclr(idn), marker=markercrtr(idn))
#     #     idn = idn + 1
#     plt.text(8, 10, 'EXPLOSIVE')
#     plt.text(-11, 10, 'NON-EXPLOSIVE')
#     plt.text(-11, -11, 'NON-EXPLOSIVE')
#     plt.text(3, -11, 'POTENTIALLY EXPLOSIVE')
#     plt.title('Ellicott\'s Extension')
#     # plt.xlim(0, 19)
#     # plt.ylim(10, 60)
#     ##Now the redirect into the cStringIO or BytesIO object
#
#     f = io.BytesIO()
#     plt.savefig(f, format="png", facecolor=(0.95, 0.95, 0.95),
#                 dpi=1200)  # need to fix so that this takes up the full screen and is not dependent on the device
#     plt.clf()
#
#     ##Add the contents of the StringIO or BytesIO object to the response, matching the mime type with the plot format (in this case, PNG) and return
#     return HttpResponse(f.getvalue(), content_type="image/png")


@login_required
def line_chart_gas_ratios(request):
    return render(request, "FireExp/line_chart_gas_ratios.html")


def fetch_gas_ratios_ajax(request):
    gas_table = Fire_exp_gases.objects.all()
    default_items = []
    i = 0
    for rr in gas_table:
        default_items.append([])
        default_items[i].append(str(rr.date.strftime("%d-%b")))
        default_items[i].append(float(rr.co))
        default_items[i].append(float(rr.graham_ratio))
        default_items[i].append(float(rr.coco2_ratio))
        default_items[i].append(float(rr.jtr_ratio))
        i += 1

    # print(default_items)
    data = {
        "default": default_items,
    }
    return JsonResponse(data)


@login_required
def young_co_ratio_page(request):
    return render(request, "FireExp/young_co_ratio_page.html")


@login_required
def fetch_young_co_ajax(request):
    gas_table = Fire_exp_gases.objects.all()
    default_items = []
    i = 0
    for rr in gas_table:
        default_items.append([])
        default_items[i].append(str(rr.date.strftime("%d-%b")))
        default_items[i].append(float(rr.young_ratio))
        default_items[i].append(float(rr.co))
        i += 1

    # print(default_items)
    data = {
        "default": default_items,
    }
    return JsonResponse(data)
