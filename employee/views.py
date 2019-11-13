##################################################################################
###     Created By: DEWANGSHU PANDIT
###     Created On: Apr/May/June -2018
###     Purpose :Testing of CRUD, Employee Management etc
###     Any Description:(Currently not in used,refer to employee1 module )
###     Last Modified:
###     Modified function,any:
##################################################################################
from datetime import datetime

import serial
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render

# Create your views here.
from django.shortcuts import render, redirect, get_object_or_404
from django.forms import ModelForm

from .models import Employee
from employee1.models import SensorData
from rest_framework.response import Response


class EmployeeForm(ModelForm):
    class Meta:
        model = Employee
        fields = ['fname', 'lname','age','doj','rfid','address','state','pin','email','mob']

def employee_manage(request, template_name='employee/employee_manage.html'):
    book = Employee.objects.all()
    data = {}
    data['object_list'] = book
    return render(request, template_name, data)

def employee_add(request, template_name='employee/employee_add.html'):
    form = EmployeeForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('employee:employee_manage')
    return render(request, template_name, {'form':form})

def employee_edit(request, pk, template_name='employee/employee_add.html'):
    book= get_object_or_404(Employee, pk=pk)
    form = EmployeeForm(request.POST or None, instance=book)
    if form.is_valid():
        form.save()
        return redirect('employee:employee_manage')
    return render(request, template_name, {'form':form})

def employee_delete(request, pk, template_name='employee/employee_delete.html'):
    book= get_object_or_404(Employee, pk=pk)
    if request.method=='POST':
        book.delete()
        return redirect('employee:employee_manage')
    return render(request, template_name, {'object':book})

# def getsensordata(request):
#     #print("------Reading collection starts now------")
#     sr = serial.Serial("COM3",9600)
#     mystr="<html><body><table class='table table-responsive'>"
#     i=0
#     while(i<10):
#          st = list(str(sr.readline(),'utf-8'))
#          mystr+="<tr>"
#          mystr+=str(''.join(st[:]))
#
#          mystr+="</tr>"
#          i += 1
#     sr.close()
#     mystr+="</body></html>"
#     #print("------Reading collection ends successfully------")
#     #return int(str(''.join(st[:])))
#     #return HttpResponse(int(str(''.join(st[:]))))
#     return HttpResponse(mystr)

def getsensordata(request):
    try:
        print("------Reading collection starts now------")
        sr = serial.Serial("COM4",9600)
        st = list(str(sr.readline(),'utf-8'))
        sr.close()
        print("------Reading collection ends successfully------")
        #return  str(''.join(st[:]))
        return HttpResponse(str(datetime.now)+""+str(''.join(st[:])))
    except Exception as e:
        return HttpResponse("<h2>Please Connect The Arduino Properly and Check PORT.</br></h2><small>"+str(e)+"</small>")


    ###===================testing==============
    # sensor_table=SensorData.objects.all()
    # last_ten = SensorData.objects.filter().order_by('-id')[:10]
    # last_ten_in_ascending_order = reversed(last_ten)
    # # print(last_ten_in_ascending_order)
    # labels=[]
    # default_items=[]
    # for rr in last_ten_in_ascending_order:
    #     labels.append(rr.created_date)
    #     default_items.append(int(rr.data1))
    # print(default_items)
    # return HttpResponse("plz see in console")

def show_graph(request):
    return render(request,'employee/show_graph.html')

def get_data_for_graph(request):
        sensor_table = SensorData.objects.all()
        last_ten = SensorData.objects.filter().order_by('-id')[:10]
        last_ten_in_ascending_order = reversed(last_ten)
        labels = []
        default_items = []
        for rr in last_ten_in_ascending_order:
            # str_time = datetime.strptime(str(rr.created_date), '%Y-%m-%dT%H:%M:%SZ').time()
            # labels.append(str_time)
            labels.append(str(rr.created_date))
            default_items.append(float(rr.data1))
        print(labels)



        # qs_count = 2
        # labels=["Users","Oxygen", "CO", "CO2", "CH4", "H2", "HCO"]
        # default_items = [qs_count,23,2,3,12,2]
        data = {
            "labels": labels,
            "default": default_items,
            "users":3,
        }
        return JsonResponse(data)