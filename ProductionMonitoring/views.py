import cv2
from django.contrib.auth.decorators import login_required
from django.core import serializers
from django.http import HttpResponse,JsonResponse
from django.shortcuts import render, redirect, get_object_or_404, render_to_response
from .forms import VehicleForm1, WeighbridgeForm1, ManualentryForm1,ContainerdetailsForm1,Production_Tub_Form1,Production_WasteMaterial_Form1,Production_DailyEntry_Form1,Production_Monthly_Form1,Production_DailyDispatch_Form1,Production_MonthlyDispatch_Form1,Production_YearlyDispatch_Form1,Production_YearlyEntry_Form1

from .models import Production_Vehicle, Production_Weighbridge, Production_Manualentry,Container_Details,Production_Tub,Production_Material_Waste,Production_DailyEntry,Production_Monthly,Production_DailyDispatch,Production_MonthlyDispatch,Production_YearlyDispatch,Production_YearlyEntry
from employee1.models import MineShift
from employee1.models import MineDetails
from django.db import connection
from django.contrib import messages

@login_required
def vehicle_manage(request, template_name='vehicle_manage.html'):
    book = Production_Vehicle.objects.all()
    data = {}
    data['object_list'] = book
    return render(request, template_name, data)


@login_required
def vehicle_add(request, template_name='vehicle_add.html'):

    if request.method == "POST":
        form = VehicleForm1(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('ProductionMonitoring:vehicle_manage')
        else:
            return render(request, template_name, {'form': form})

    form = VehicleForm1()
    return render(request, template_name, {'form': form})


@login_required
def vehicle_edit(request, pk, template_name='vehicle_add.html'):
    book = get_object_or_404(Production_Vehicle, pk=pk)
    form = VehicleForm1(request.POST or None, request.FILES or None, instance=book)
    if form.is_valid():
        form.save()
        return redirect('ProductionMonitoring:vehicle_manage')
    return render(request, template_name, {'form': form})


@login_required
def vehicle_delete(request, pk):
    book = get_object_or_404(Production_Vehicle, pk=pk)
    book.delete()
    return redirect('ProductionMonitoring:vehicle_manage')


##weighbridge###
@login_required
def weighbridge_manage(request, template_name='weighbridge_manage.html'):
    book = Production_Weighbridge.objects.all()
    data = {}
    data['object_list'] = book
    return render(request, template_name, data)


@login_required
def weighbridge_add(request, template_name='weighbridge_add.html'):

    if request.method == "POST":
        form = WeighbridgeForm1(request.POST)
        if form.is_valid():
            form.save()
            return redirect('ProductionMonitoring:weighbridge_manage')

    form = WeighbridgeForm1()
    return render(request, template_name, {'form': form})


@login_required
def weighbridge_edit(request, pk, template_name='weighbridge_add.html'):
    book = get_object_or_404(Production_Weighbridge, pk=pk)
    form = WeighbridgeForm1(request.POST or None, instance=book)
    if form.is_valid():
        form.save()
        return redirect('ProductionMonitoring:weighbridge_manage')
    return render(request, template_name, {'form': form})


@login_required
def weighbridge_delete(request, pk):
    book = get_object_or_404(Production_Weighbridge, pk=pk)
    book.delete()
    return redirect('ProductionMonitoring:weighbridge_manage')


@login_required
# def manualentry_manage(request, template_name='manualentry_manage.html'):
#     manual_data=[]
#     book = Production_Manualentry.objects.values_list()
#     print(book)
#     for s in book:
#         wb=Production_Weighbridge.objects.get(id=str(s[2]))
#         manual_data['mine_id']=str(s[1])
#         manual_data['wb_name']='3532'
#         manual_data['weighbridge_id']=str(s[2])
#         manual_data['vehicle_id']=str(s[3])
#         manual_data ['datetime_in'] =str(s[4])
#         manual_data['datetime_out'] =str(s[5])
#         manual_data ['trip_time'] =str(s[6])
#     data = {}
#     data['object_list'] = manual_data
#     print(data)
#     return HttpResponse(data)
#     return render(request, template_name, data)

def manualentry_manage(request, template_name='manualentry_manage.html'):

        manual_entry = Production_Manualentry.objects.all()
        prepared_data = []
        for entry in manual_entry:
            print('wn id',entry.weighbridge_id)
            wb=Production_Weighbridge.objects.get(id=entry.weighbridge_id)
            vechicle=Production_Vehicle.objects.get(id=entry.vehicle_id)
            print('wb name',wb.w_name)
            prepared_data.append({'id':entry,'mine':entry.mine_id,'wb_name':wb.w_name,'vechile':vechicle.vehicle_reg_no,'wb_code':wb.wb_code,'type':entry.production_type})
        # print(manual_entry_table)
        data = {}

        # i = 0
        # for r in manual_entry_table:
        #     print('id',r[2])
        #     wb_table = Production_Weighbridge.objects.get(id=str(r[2]))
        #     v_table=Production_Vehicle.objects.get(id=str(r[3]))
        #     #m_table=Production_Manualentry.objects.get(id=str(r[13]))
        #     prepared_data.append([])
        #     prepared_data[i].append(wb_table.mine_id)
        #     prepared_data[i].append(wb_table.w_name)
        #     prepared_data[i].append(v_table.vehicle_reg_no)
        #     prepared_data[i].append(wb_table.wb_code)
        #     prepared_data[i].append(str(r[13]))
        #     prepared_data[i].append(str(r[0]))
        #     i = i + 1
        #
        # # return HttpResponse("ok")
        # print(prepared_data)
        data['manual_entry'] = prepared_data
        return render(request, template_name, data)


@login_required
def manualentry_add(request, template_name='manualentry_add.html'):

    if request.method == "POST":
        form = ManualentryForm1(request.POST)
        if form.is_valid():
            form.save()
            return redirect('ProductionMonitoring:manualentry_manage')
        return render(request, template_name, {'form': form})
    form=ManualentryForm1()
    return render(request, template_name, {'form': form})


@login_required
def manualentry_edit(request, pk, template_name='manualentry_add.html'):
    book = get_object_or_404(Production_Manualentry, pk=pk)
    form = ManualentryForm1(request.POST or None, instance=book)
    if form.is_valid():
        form.save()
        return redirect('ProductionMonitoring:manualentry_manage')
    return render(request, template_name, {'form': form})


@login_required
def manualentry_delete(request, pk):
    book = get_object_or_404(Production_Manualentry, pk=pk)
    book.delete()
    return redirect('ProductionMonitoring:manualentry_manage')


def fetch_location_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        location_details = Production_Weighbridge.objects.values_list().filter(mine_id=mine_id)
        data = {}

        location_data = []
        for r in location_details:
            location_data.append(str(r[0]) + ',' + str(r[2]))
        data['result'] = location_data
        print(data)


    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_vehicle_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        location_details = Production_Vehicle.objects.values_list().filter(mine_id=mine_id)
        data = {}

        location_data = []
        for r in location_details:
            location_data.append(str(r[0]) + ',' + str(r[3]))
        data['result'] = location_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_weighbridge_ajax(request):
    data = {}
    if request.is_ajax():
        weighbridge_id = request.GET.get('id', None)
        weighbridge_details= Production_Weighbridge.objects.get(id=weighbridge_id)
        data = {}

        weighbridge_data = []
        weighbridge_data.append(str(weighbridge_details.wb_code))
        data['result'] = weighbridge_data

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


##Report###
@login_required
def report_data(request, template_name='report_data.html'):
    form = ManualentryForm1()
    return render(request, template_name, {'form': form})


def fetch_report_ajax(request):
    data = {}
    if request.is_ajax():
        wb_name = "----"
        vb_name = "----"
        r_name = "----"
        mine_id = request.GET.get('mine_ID', None)
        weighbridge_id = request.GET.get('weighbridge_ID', None)
        date_id = request.GET.get('entry_DATE', None)
        production_id = request.GET.get('production_TYPE', None)
        try:
            location_details = Production_Manualentry.objects.values_list().filter(mine_id=mine_id).filter(weighbridge_id=weighbridge_id).filter(production_type=production_id).filter(entry_date=date_id)
        except:
            pass
        location_data = []
        i=0
        for r in location_details:
            try:
                wb_table = Production_Weighbridge.objects.get(id=str(r[2]))
                wb_name=wb_table.wb_code
            except:
                pass
            try:
                v_table = Production_Vehicle.objects.get(id=str(r[3]))
                vb_name =v_table.vehicle_reg_no
                r_name  = v_table.rfid
            except:
                pass

            location_data.append(r_name+ ',' +str(r[4]) + ',' + str(r[5]) + ','+ str(
                r[6])+',' +vb_name + ',' + str(r[7])+ ','+ wb_name+ ','+str(r[9])+ ','+str(r[10]) + ','+str(r[11])+ ','+str(r[12])+ ','+str(r[13]) )
            i = i + 1
        data['result'] = location_data

    else:
        data['result'] = "Not Ajax"
    print(data)
    return JsonResponse(data)

@login_required
def container_details_add(request, template_name='container_details_add.html'):

    if request.method == "POST":
        form = ContainerdetailsForm1(request.POST)
        if form.is_valid():
            form.save()
            return redirect('ProductionMonitoring:container_details_manage')
        return render(request,template_name,{'form':form})
    form = ContainerdetailsForm1()
    return render(request, template_name, {'form': form})

@login_required
def production_despatch_add(request, template_name='production_despatch_add.html'):
    form = dispatchForm1(request.POST)
    if form.is_valid():
        form.save()

        return redirect('ProductionMonitoring:production_despatch_add')
    return render(request, template_name, {'form': form})



def fetch_laden_ajax (request):
    data = {}
    if request.is_ajax():
        name_tub = request.GET.get('id', None)
        tub_details = Container_Details.objects.get(id=name_tub)
        data = {}

        tub_data = []
        tub_data.append(str(tub_details.laden_weight))
        data['result'] =tub_data

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_unit_ajax (request):
    data = {}
    if request.is_ajax():
        name_tub = request.GET.get('id', None)
        tub_details = Container_Details.objects.get(id=name_tub)
        data = {}

        tub_data = []
        tub_data.append(str(tub_details.weight_unit ))
        data['result'] =tub_data

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)
def fetch_unit1_ajax (request):
    data = {}
    if request.is_ajax():
        name_tub = request.GET.get('id', None)
        tub_details = Container_Details.objects.get(id=name_tub)
        data = {}

        tub_data = []
        tub_data.append(str(tub_details.weight_unit ))
        data['result'] =tub_data

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)

@login_required
def report_production_dispatch(request, template_name='report_production_dispatch.html'):
    form =VehicleForm1
    return render(request, template_name, {'form': form})

def fetch_report_dispatch_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('mine_ID', None)
        from_date = request.GET.get('from', None)
        to_date = request.GET.get('to', None)
        tubs=[];
        ProductionTub=Production_Tub.objects.filter(mine_id=mine_id, datetime_in__range=(from_date, to_date))
        for PD in ProductionTub:
            mine = get_object_or_404(MineDetails,pk=str(PD.mine_id.id))
            Tub=get_object_or_404(Container_Details,pk=PD.name_of_the_tub_id)
            tubs.append({'mine':str(mine.name), 'name_of_the_tub':Tub.name_of_the_tub, 'laden_weight':str(PD.laden_weight),
                         'no_of_trip':str(PD.no_of_trip), 'total_weight':str(PD.total_weight),'datetime_in':str(PD.datetime_in)})

        data['result'] = tubs
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


@login_required
def production_tub_add(request, template_name='production_tub_add.html'):
    if request.method == "POST":
        form = Production_Tub_Form1(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Production Tub added successfully')
            return redirect('ProductionMonitoring:production_tub_add')
        messages.error(request, 'Something Went Wrong!')
        return render(request,template_name,{'form':form})
    form=Production_Tub_Form1()
    return render(request, template_name, {'form': form})

@login_required
def production_wastematerial_add(request, template_name='production_wastematerial_add.html'):
    form = Production_WasteMaterial_Form1(request.POST)
    if form.is_valid():
        form.save()

        return redirect('ProductionMonitoring:production_wastematerial_add')
    return render(request, template_name, {'form': form})

@login_required
def production_dailyentry_add(request, template_name='production_dailyentry_add.html'):
    if request.method == "POST":
        print(request.POST)
        form = Production_DailyEntry_Form1(request.POST)
        if form.is_valid():
            form.save()
            return redirect('ProductionMonitoring:production_dailyentry_add')
        else:
            print("Invalid")
    else:
        form = Production_DailyEntry_Form1
    return render(request, template_name, {'form': form})

# @login_required
# def production_monthlyentry_add(request, template_name='production_dailyentry_add.html'):
#     form = Production_MonthlyEntry_Form1(request.POST)
#     if form.is_valid():
#         form.save()
#
#         return redirect('ProductionMonitoring:production_monthlyentry_add')
#     return render(request, template_name, {'form': form})

@login_required
def production_monthly_add(request, template_name='production_monthlyentry_add.html'):
    form = Production_Monthly_Form1(request.POST)
    if form.is_valid():
        form.save()

        return redirect('ProductionMonitoring:production_monthly_add')
    return render(request, template_name, {'form': form})

#####daily dispatch####
@login_required
def production_dailydispatch_add(request, template_name='production_dailydispatch_add.html'):
    form = Production_DailyDispatch_Form1(request.POST)
    if form.is_valid():
        form.save()

        return redirect('ProductionMonitoring:production_dailydispatch_add')
    return render(request, template_name, {'form': form})
####monthly dispatch#####
@login_required
def production_monthlydispatch_add(request, template_name='production_monthlydispatch_add.html'):
    form = Production_MonthlyDispatch_Form1(request.POST)
    if form.is_valid():
        form.save()

        return redirect('ProductionMonitoring:production_monthlydispatch_add')
    return render(request, template_name, {'form': form})
####yearly dispatch####
@login_required
def production_yearlydispatch_add(request, template_name='production_yearlydispatch_add.html'):
    form = Production_YearlyDispatch_Form1(request.POST)
    if form.is_valid():
        form.save()

        return redirect('ProductionMonitoring:production_yearlydispatch_add')
    return render(request, template_name, {'form': form})



def fetch_shift_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        location_details = MineShift.objects.values_list().filter(mine_id=mine_id)
        data = {}

        location_data = []
        for r in location_details:
            location_data.append(str(r[0]) + ',' + str(r[1]))
        data['result'] = location_data
        print(data)


    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)

###Yearly entry#####
@login_required
def production_yearlyentry_add(request, template_name='production_yearlyentry_add.html'):
    form = Production_YearlyEntry_Form1(request.POST)
    if form.is_valid():
        form.save()

        return redirect('ProductionMonitoring:production_yearlyentry_add')
    return render(request, template_name, {'form': form})
#####Daily entry report#######
@login_required
def report_dailyentry(request, template_name='report_dailyentry.html'):
    form =Production_DailyEntry_Form1
    return render(request, template_name, {'form': form})
####Monthly entry report#####
@login_required
def report_monthlyentry(request, template_name='report_monthlyentry.html'):
    form =Production_Monthly_Form1
    return render(request, template_name, {'form': form})
#####Yearly entry report#####
@login_required
def report_yearlyentry(request, template_name='report_yearlyentry.html'):
    form =Production_YearlyEntry_Form1
    return render(request, template_name, {'form': form})

def fetch_report_daily_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('mine_ID', None)
        shift_id = request.GET.get('shift_ID', None)
        from_date = request.GET.get('from_ID', None)
        to_date = request.GET.get('to_ID', None)
        location_details =Production_DailyEntry.objects.values_list().filter(dates__range=(from_date,to_date),mine_id=mine_id,shift_name=shift_id)
        data = {}
        i = 0
        location_data = []
        for r in location_details:
            mine_table = MineDetails.objects.get(id=str(r[1]))

            shift_table = MineShift.objects.get(id=str(r[2]))
            location_data.append([])
            location_data[i].append(mine_table.name)
            location_data[i].append(shift_table.shift_name)
            location_data[i].append(str(r[5]))
            location_data[i].append(str(r[4]))
            location_data[i].append(str(r[6]))
            i = i + 1

        data['result'] = location_data
        print(data)


    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)



def fetch_report_month_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('mine_ID', None)
        year_id = request.GET.get('year_ID', None)
        from_month = request.GET.get('from_ID', None)
        to_month = request.GET.get('to_ID', None)
        print(to_month)
        location_details =Production_Monthly.objects.values_list().filter(month__range=(from_month,to_month),mine_id=mine_id,years=year_id)
        data = {}
        i = 0
        location_data = []
        for r in location_details:
            mine_table = MineDetails.objects.get(id=str(r[1]))


            location_data.append([])
            location_data[i].append(mine_table.name)

            location_data[i].append(str(r[3]))
            location_data[i].append(str(r[2]))
            location_data[i].append(str(r[4]))
            location_data[i].append(str(r[6]))
            i = i + 1

        data['result'] = location_data
        print(data)


    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)

def fetch_report_year_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('mine_ID', None)

        from_year = request.GET.get('from_ID', None)
        to_year = request.GET.get('to_ID', None)

        location_details =Production_YearlyEntry.objects.values_list().filter(years__range=(from_year,to_year),mine_id=mine_id)
        data = {}
        i = 0
        location_data = []
        for r in location_details:
            mine_table = MineDetails.objects.get(id=str(r[1]))


            location_data.append([])
            location_data[i].append(mine_table.name)

            location_data[i].append(str(r[3]))
            location_data[i].append(str(r[2]))
            location_data[i].append(str(r[4]))
            location_data[i].append(str(r[5]))

            i = i + 1

        data['result'] = location_data
        print(data)


    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)

#####Daily Dispatch report#######
@login_required
def report_dailydispatch(request, template_name='report_dailydispatch.html'):
    form =Production_DailyDispatch_Form1
    return render(request, template_name, {'form': form})
####Monthly dispatch report#####
@login_required
def report_monthlydispatch(request, template_name='report_monthlydispatch.html'):
    form =Production_MonthlyDispatch_Form1
    return render(request, template_name, {'form': form})
#####Yearly Dispatch report#####
@login_required
def report_yearlydispatch(request, template_name='report_yearlydispatch.html'):
    form =Production_YearlyDispatch_Form1
    return render(request, template_name, {'form': form})


def fetch_report_dailydispatch_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('mine_ID', None)
        shift_id = request.GET.get('shift_ID', None)
        from_date = request.GET.get('from_ID', None)
        to_date = request.GET.get('to_ID', None)
        location_details =Production_DailyDispatch.objects.values_list().filter(dates__range=(from_date,to_date),mine_id=mine_id,shift_name=shift_id)
        data = {}
        i = 0
        location_data = []
        for r in location_details:
            mine_table = MineDetails.objects.get(id=str(r[1]))

            shift_table = MineShift.objects.get(id=str(r[2]))
            location_data.append([])
            location_data[i].append(mine_table.name)
            location_data[i].append(shift_table.shift_name)
            location_data[i].append(str(r[5]))
            location_data[i].append(str(r[4]))
            location_data[i].append(str(r[6]))
            location_data[i].append(str(r[3]))
            i = i + 1

        data['result'] = location_data
        print(data)


    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)

def fetch_report_monthlydispatch_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('mine_ID', None)
        year_id = request.GET.get('year_ID', None)
        from_month = request.GET.get('from_ID', None)
        to_month = request.GET.get('to_ID', None)
        print(to_month)
        location_details =Production_MonthlyDispatch.objects.values_list().filter(month__range=(from_month,to_month),mine_id=mine_id,years=year_id)
        data = {}
        i = 0
        location_data = []
        for r in location_details:
            mine_table = MineDetails.objects.get(id=str(r[1]))


            location_data.append([])
            location_data[i].append(mine_table.name)

            location_data[i].append(str(r[3]))
            location_data[i].append(str(r[2]))
            location_data[i].append(str(r[4]))
            location_data[i].append(str(r[6]))
            i = i + 1

        data['result'] = location_data
        print(data)


    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_report_yearlydispatch_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('mine_ID', None)

        from_year = request.GET.get('from_ID', None)
        to_year = request.GET.get('to_ID', None)

        location_details =Production_YearlyDispatch.objects.values_list().filter(years__range=(from_year,to_year),mine_id=mine_id)
        data = {}
        i = 0
        location_data = []
        for r in location_details:
            mine_table = MineDetails.objects.get(id=str(r[1]))


            location_data.append([])
            location_data[i].append(mine_table.name)

            location_data[i].append(str(r[3]))
            location_data[i].append(str(r[2]))
            location_data[i].append(str(r[4]))
            location_data[i].append(str(r[5]))

            i = i + 1

        data['result'] = location_data
        print(data)


    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)

def fetch_laden_weight_ajax (request):
    data = {}
    if request.is_ajax():
        vehicle_id = request.GET.get('id', None)
        vehicle_details = Production_Vehicle.objects.get(id=vehicle_id)
        data = {}

        tub_data = []
        tub_data.append(str(vehicle_details.reg_laden_weight_of_the_vehicle))
        data['result'] =tub_data

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_weightunit_ajax (request):
    data = {}
    if request.is_ajax():
        vehicle_id = request.GET.get('id', None)
        vehicle_details = Production_Vehicle.objects.get(id=vehicle_id)
        data = {}

        tub_data = []
        tub_data.append(str(vehicle_details.reg_laden_weight_of_the_vehicles))
        data['result'] =tub_data

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)
@login_required
def container_details_manage(request, template_name='container_details_manage.html'):
    book = Container_Details.objects.all()
    data = {}
    data['object_list'] = book
    return render(request, template_name, data)
@login_required
def container_details_edit(request, pk, template_name='container_details_add.html'):
    book = get_object_or_404(Container_Details, pk=pk)
    form = ContainerdetailsForm1(request.POST or None, request.FILES or None, instance=book)
    if form.is_valid():
        form.save()
        return redirect('ProductionMonitoring:container_details_manage')

    return render(request, template_name, {'form': form})


@login_required
def container_details_delete(request, pk):
    book = get_object_or_404(Container_Details, pk=pk)
    book.delete()
    return redirect('ProductionMonitoring:container_details_manage')

def fetch_tub_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        location_details = Production_Weighbridge.objects.values_list().filter(mine_id=mine_id)
        data = {}

        location_data = []
        for r in location_details:
            location_data.append(str(r[0]) + ',' + str(r[2]))
        data['result'] = location_data
        print(data)


    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)

######report_production_dispatch
@login_required
def report_dailyprod_dispatch(request, template_name='report_dailyprod_dispatch.html'):
    form =Production_DailyEntry_Form1
    return render(request, template_name, {'form': form})

def fetch_report_daily_prod_dispatch_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('mine_ID', None)
        shift_id = request.GET.get('shift_ID', None)
        from_date = request.GET.get('from_ID', None)
        to_date = request.GET.get('to_ID', None)
        query = "SELECT a.shift_name, a.production_type, a.total_weight, a.mine_id_id, a.weight_unit, a.dates, b.total_weight FROM production_dailyentry as a JOIN production_dailydispatch as b  on a.mine_id_id = b.mine_id_id where a.mine_id_id = '"+mine_id+"' AND a.shift_name = '"+shift_id+"' AND a.dates BETWEEN '"+from_date+"' and '"+to_date+"' group by a.dates, a.shift_name"
        with connection.cursor() as cursor:
           cursor.execute(query)
           row = cursor.fetchall()
           print(row)
           data['result'] = row
        print(query)
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


# def live_video_ip(request):
#     cv2.namedWindow("preview")
#     vc = cv2.VideoCapture(0)
#
#     if vc.isOpened():  # try to get the first frame
#         rval, frame = vc.read()
#     else:
#         rval = False
#
#     while rval:
#         cv2.imshow("preview", frame)
#         rval, frame = vc.read()
#         key = cv2.waitKey(20)
#         if key == 27:  # exit on ESC
#             break
#     cv2.destroyWindow("preview")

def live_video_ip(request):
    from imutils.video import VideoStream

    # capture = VideoStream(0)
    capture = VideoStream(
        r'rtsp://admin:admin@192.168.1.250/cam/realmonitor?channel=1&subtype=00&authbasic=YWRtaW46YWRtaW4=')
    # capture = VideoStream(r'rtsp://192.168.178.137:554/mainstream')
    capture.start()
    while True:
        img = capture.read()
        cv2.imshow('stream', img)
        if cv2.waitKey(27) & 0xFF == ord('q'):
            break
            cv2.destroyAllWindows()
    capture.stop()


def live_video_webcam(request):
    from imutils.video import VideoStream

    capture = VideoStream(0)
    # capture = VideoStream(
    #     r'rtsp://admin:admin@192.168.1.250/cam/realmonitor?channel=1&subtype=00&authbasic=YWRtaW46YWRtaW4=')
    # capture = VideoStream(r'rtsp://192.168.178.137:554/mainstream')
    capture.start()
    while True:
        img = capture.read()
        cv2.imshow('stream', img)
        if cv2.waitKey(27) & 0xFF == ord('q'):
            break
            cv2.destroyAllWindows()
    capture.stop()


def live_video_ip_151(request):
    from imutils.video import VideoStream

    # capture = VideoStream(0)
    capture = VideoStream(
        r'rtsp://admin:admin@192.168.1.251/cam/realmonitor?channel=1&subtype=00&authbasic=YWRtaW46YWRtaW4=')
    # capture = VideoStream(r'rtsp://192.168.178.137:554/mainstream')
    capture.start()
    while True:
        img = capture.read()
        cv2.imshow('stream', img)
        if cv2.waitKey(27) & 0xFF == ord('q'):
            break
            cv2.destroyAllWindows()
    capture.stop()