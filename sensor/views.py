# from django.shortcuts import render

# Create your views here.
import traceback

from django.contrib.auth.decorators import login_required
from django.urls import reverse
from django.views.decorators.csrf import csrf_protect
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.forms import ModelForm

from apps import settings
from gasmonitoring_wifi.models import Fire_exp_gasesWifi
from .models import Node, Sensor_Node, gasModel_auto
from .models import MineDetails
from .forms import NodeForm, Sensor_NodeForm, gasModel_autoForm
import requests
from background_task import background
from datetime import datetime
from django.utils.html import strip_tags, linebreaks
from accounts.models import profile_extension
from background_task.models import Task


# def sensor1_manage(request, wireless_id, template_name='sensor/sensor1_manage.html'):
#     book = Sensor.objects.filter(wireless_id=wireless_id)
#     data = {}
#     data['object_list'] = book
#     data['wireless_id'] = wireless_id
#     return render(request, template_name, data, {'wirelessid': wireless_id})
#
#
# def sensor1_add(request, wireless_id, template_name='sensor/sensor1_add.html'):
#     # print(wireless_id)
#     mine_table = Wireless.objects.get(id=wireless_id)
#     wireless_name = mine_table.name
#     # print(wireless_name)
#     form = SensorForm(request.POST or None, request.FILES)
#     object = Sensor()
#     if form.is_valid():
#         object.sensorid = request.POST.get("sensorid")
#         object.sensorname = request.POST.get("sensorname")
#         object.minrange = request.POST.get("minrange")
#         object.maxrange = request.POST.get("maxrange")
#         object.sensorunit = request.POST.get("sensorunit")
#         object.thresholdlimit = request.POST.get("thresholdlimit")
#         object.greenlevel = request.POST.get("greenlevel")
#         object.yellowlevel = request.POST.get("yellowlevel")
#         object.redlevel = request.POST.get("redlevel")
#         object.photo = request.FILES.get("photo")
#         object.wireless_id = wireless_id
#         # form.save()
#         object.save()
#         # return redirect("/sensor/sensor1_manage/" + str(wireless_id))
#         return redirect("/sensor/node_manage")
#     return render(request, template_name, {'form': form, 'wirelessname': wireless_name, 'wirelessid': wireless_id})
#
#
# def sensor1_edit(request, pk, wireless_id, template_name='sensor/sensor1_add.html'):
#     book = get_object_or_404(Sensor, pk=pk)
#     form = SensorForm(request.POST or None, request.FILES or None, instance=book)
#     if form.is_valid():
#         form.save()
#         return redirect('/sensor/sensor1_manage/' + str(wireless_id))
#     return render(request, template_name, {'form': form, 'wirelessid': wireless_id})
#
#
# def sensor1_delete(request, wireless_id, pk):
#     book = get_object_or_404(Sensor, pk=pk)
#     book.delete()
#     return redirect("/sensor/sensor1_manage/" + str(wireless_id))
#
#
# ##Wireless Info Details
#
# def wireless_manage(request, node_id, template_name='wireless/wireless_manage.html'):
#     book = Wireless.objects.filter(node_id=node_id)
#     data = {}
#     data['object_list'] = book
#     data['node_id'] = node_id
#
#     mine_table = Node.objects.get(id=node_id)
#     # data['mine_name'] = mine_table.name
#     data['node_name'] = mine_table.name
#     data['node_mine_id'] = mine_table.mine_id
#     return render(request, template_name, data, {'nodeid': node_id})
#
#
# def wireless_add(request, node_id, template_name='wireless/wireless_add.html'):
#     form = WirelessForm(request.POST or None, request.FILES)
#     mine_table = Node.objects.get(id=node_id)
#     node_name = mine_table.name
#     node_mine_id = mine_table.mine_id
#     # print(node_name)
#     object = Wireless()
#     if form.is_valid():
#         object.ipaddress = request.POST.get("ipaddress")
#         object.name = request.POST.get("name")
#         object.node_id = node_id
#         # print(request.POST)
#         # print(object)
#         object.save()
#         # form.save()
#         return redirect('/sensor/wireless_manage/' + str(node_id))
#     return render(request, template_name,
#                   {'form': form, 'nodename': node_name, 'nodeid': node_id, 'nodemineid': node_mine_id})
#
#
# def wireless_edit(request, pk, node_id, template_name='wireless/wireless_add.html'):
#     book = get_object_or_404(Wireless, pk=pk)
#     form = WirelessForm(request.POST or None, request.FILES or None, instance=book)
#     if form.is_valid():
#         form.save()
#         return redirect('/sensor/wireless_manage/' + str(node_id))
#     return render(request, template_name, {'form': form, 'nodeid': node_id})
#
#
# def wireless_delete(request, node_id, pk):
#     book = get_object_or_404(Wireless, pk=pk)
#     book.delete()
#     return redirect("/sensor/wireless_manage/" + str(node_id))
#

## Node Details

@login_required
def node_add(request, template_name='node/node_add.html'):
    current_user = request.user
    print('profile', current_user.id)
    profile = get_object_or_404(profile_extension, user_id=current_user.id)
    form = NodeForm(initial={'mine_id': profile.mine_id.id})
    if request.method == "POST":
        form = NodeForm(request.POST or None, request.FILES)

        if form.is_valid():
            form.save()
            return redirect(reverse('sensor:node_add'))
    return render(request, template_name, {'form': form, 'action': "Add", "alert": "added"})


@csrf_protect
@login_required
def node_edit(request, pk, template_name='node/node_add.html'):
    pk = decrypt(pk)
    current_user = request.user
    profile = get_object_or_404(profile_extension, user_id=current_user.id)
    book = get_object_or_404(Node, pk=pk)
    form = NodeForm(request.POST or None, request.FILES or None, instance=book)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect(reverse('sensor:node_manage'))

    return render(request, template_name,
                  {'form': form, 'action': "Edit", 'alert': "updated"})


@csrf_protect
@login_required
def node_manage(request, template_name='node/node_manage.html'):
    current_user = request.user
    profile = get_object_or_404(profile_extension, user_id=current_user.id)
    background = {}
    if current_user.is_superuser:
        books = Node.objects.all()
    else:
        books = Node.objects.filter(mine_id=profile.mine_id.id)
    for ob in books:
        background_task = 0
        sensors = Sensor_Node.objects.filter(mine_id_id=ob.mine_id, node_id_id=ob.id)
        for s in sensors:
            try:
                task = Task.objects.get(task_name='sensor.views.run_back_save',
                                        task_params="[[" + str(s.id) + "], {}]")
                if task:
                    background_task = 1

            except Task.DoesNotExist:
                background_task = 0
                break
                pass
        background[str(ob.id)] = background_task
    return render(request, template_name,
                  {'object_list': books, 'background': background, 'action': "EDIT"})


@login_required
def node_delete(request):
    data = {}
    if request.is_ajax():
        if request.method == 'POST':
            pk = request.POST.get('id')
            try:
                book = Node.objects.get(pk=pk)
                book.delete()
                data['success'] = "Router Deteled Successfully!"
                return JsonResponse(data)
            except Node.DoesNotExist:
                data['error'] = "Something Went Wrong!"
                print('Error')
                return JsonResponse(data)
    data['error'] = "Something Went Wrong!"
    return JsonResponse(data)


# def load_map(request):
#     data = {}
#     if request.POST:
#         mine_id = request.POST.get("mine_id")
#         mine_data = MineDetails.objects.values_list().filter(id=mine_id)[0]
#         data['mine_data'] = mine_data
#         routers = TrackingRouter.objects.values_list().filter(mine_id_id=mine_id)
#         data['routers'] = routers
#     mine_table = MineDetails.objects.all()
#     data['object_list'] = mine_table
#     # print(data)
#     return render(request, "sensor/load_map.html", data)


def manage_sensor(request, mine_id, node_id, template_name='Sensor_Node/manage_sensor.html'):
    # water_level_sensor_details = water_level_monitoring_model.objects.all().order_by('-id')
    mine_id = decrypt(mine_id)
    node_id = decrypt(node_id)
    sensors = Sensor_Node.objects.filter(mine_id_id=mine_id, node_id_id=node_id).only('sensor_id', 'sensor_name',
                                                                                      'ip_add', 'sensor_unit',
                                                                                      'sensor_threshold_limit')
    data = {}
    prepared_data = []
    background_task = 0
    node_table = Node.objects.get(id=node_id)
    mine_table = MineDetails.objects.get(id=mine_id)
    for s in sensors:
        background_task = 0
        try:
            task = Task.objects.get(task_name='sensor.views.run_back_save',
                                    task_params="[[" + str(s.id) + "], {}]")
            if task:
                background_task = 1
        except:
            pass

        try:
            prepared_data.append({'id': s.id,
                                  'mine_name': mine_table.name,
                                  'node_name': node_table.name,
                                  'node_id': node_table.id,
                                  'sensor_id': s.sensor_id,
                                  'sensor_name': s.sensor_name,
                                  'ip': s.ip_add,
                                  'unit': s.sensor_unit,
                                  'thresholdlimit': s.sensor_threshold_limit,
                                  'background': background_task
                                  })
        except:
            pass

    data['mine'] = mine_id
    data['mine_name'] = mine_table.name
    data['node_id'] = node_id
    data['node_name'] = node_table.name
    data['result'] = prepared_data
    data['action'] = "MANAGE"

    return render(request, template_name, data)


def add_sensor(request, mine_id, node_id, template_name='Sensor_Node/add_sensor.html'):
    node = Node.objects.get(id=node_id)
    node_name = node.name
    mine = MineDetails.objects.get(pk=mine_id)
    mine_name = mine.name
    if request.method == 'POST':
        form = Sensor_NodeForm(request.POST or None, request.FILES)
        if form.is_valid():
            SensorModel = form.save(commit=False)
            SensorModel.node_id = node
            SensorModel.mine_id = mine
            SensorModel.save()
            return redirect('/sensor/manage_sensor/' + encrypt(mine_id) + '/' + encrypt(node_id))
        else:
            print("&&&&&&&&&")
        # print(node_name)
    else:
        form = Sensor_NodeForm()
    return render(request, template_name,
                  {'form': form, 'node_name': node_name, 'node_id': node_id,
                   'mine_name': mine_name, 'mine': mine_id, 'action': 'ADD'})


def delete_sensor(request, pk):
    pk = decrypt(pk)
    book = get_object_or_404(Sensor_Node, pk=pk)
    book.delete()
    return redirect(request.META.get('HTTP_REFERER'))


def edit_sensor(request, pk, node_id,
                template_name='Sensor_Node/add_sensor.html'):  # pk is Sensor Id of a node, node_id=> id the of wirelss node
    pk = decrypt(pk)
    node_id = decrypt(node_id)
    mine_table = Node.objects.get(id=node_id)
    node_name = mine_table.name
    mine_id = mine_table.mine_id_id
    mine_table = MineDetails.objects.get(id=mine_id)
    mine_name = mine_table.name
    book = get_object_or_404(Sensor_Node, pk=pk)
    form = Sensor_NodeForm(request.POST or None, request.FILES or None, instance=book)
    # object = Sensor_Node(pk=pk)

    if form.is_valid():
        form.save()

        return redirect('/sensor/manage_sensor/' + encrypt(mine_id) + "/" + encrypt(node_id))
    return render(request, template_name,
                  {'form': form, 'node_name': node_name, 'node_id': node_id,
                   'mine_name': mine_name, 'mine': mine_id, 'action': 'EDIT'})


# def add_id(request,pk )
##88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
# Code for Nodesensor

# class NodesensorForm(ModelForm):
#     class Meta:
#         model = Nodesensor
#         fields = ['id', 'name', 'sensorid', 'nodesensorname', 'thresholdvalue', 'alertcolourpriority', 'description']


# def nodesensor_manage(request, template_name='nodesensor/nodesensor_manage.html'):
#     book = Nodesensor.objects.all()
#     data = {}
#     data['object_list'] = book
#     return render(request, template_name, data)


# def nodesensor_add(request, template_name='nodesensor/nodesensor_add.html'):
#     form = NodesensorForm(request.POST or None, request.FILES)
#     if form.is_valid():
#         form.save()
#         return redirect('sensor:nodesensor_manage')
#     return render(request, template_name, {'form': form})


# def nodesensor_edit(request, pk, template_name='nodesensor/nodesensor_add.html'):
#     book = get_object_or_404(Nodesensor, pk=pk)
#     form = NodesensorForm(request.POST or None, request.FILES or None, instance=book)
#     if form.is_valid():
#         form.save()
#         return redirect('sensor:nodesensor_manage')
#     return render(request, template_name, {'form': form})

#
# def nodesensor_delete(request, pk):
#     book = get_object_or_404(Nodesensor, pk=pk)
#     book.delete()
#     return redirect("sensor:nodesensor_manage")


## Mine map with nodes

def load_map(request):
    data = {}
    if request.POST:
        mine_id = request.POST.get("mine_id")
        mine_data = MineDetails.objects.values_list().filter(id=mine_id)[0]
        data['mine_data'] = mine_data
        routers = Node.objects.values_list().filter(mine_id_id=mine_id)
        data['routers'] = routers
    mine_table = MineDetails.objects.all()
    data['object_list'] = mine_table
    # print(data)
    return render(request, "MinersTracking/load_map.html", data)


## For Establish Connection
#
# class ConnectionForm(ModelForm):
#     class Meta:
#         model = Node
#         fields = ['mine_id']


# def connection_manage(request, template_name='connection/connection_manage.html'):
#     # book = Nodesensor.objects.all()
#     # data = {}
#     # data['object_list'] = book
#     # return render(request, template_name, data)
#
#     connection_table = Connection.objects.values_list()
#     data = {}  ##data = {}
#     prepared_data = []
#     r = 0
#     for i in connection_table:
#         connect_id = Connection.objects.get(id=str(i[0]))
#         mine_table = MineDetails.objects.get(
#             id=str(i[1]))  # 3 means :mine_id (mine_id is refferenced to connection table)
#         node_table = Node.objects.get(id=str(i[2]))
#         connect_type = (str(i[3]))
#         # print(connect_type)
#         prepared_data.append([])
#         # prepared_data[r].append(mine_table.name)
#         # prepared_data[r].append(node_table.nodeid)
#         # r = r+1
#         # print(i)
#         if (i[3] == 'wired'):
#             arduino_table = Arduino.objects.get(id=str(i[4]))
#             # prepared_data.append([])
#             prepared_data[r].append(connect_id.id)
#             prepared_data[r].append(mine_table.name)
#             prepared_data[r].append(node_table.nodeid)
#             prepared_data[r].append(connect_type)
#             prepared_data[r].append(arduino_table.arduino_id)
#             prepared_data[r].append('----')
#             prepared_data[r].append(arduino_table.port_no)
#             prepared_data[r].append('----')
#
#             # r = r+1
#             # print(arduino_table)
#             # print(prepared_data)
#         else:
#             wireless_table = Wireless.objects.get(id=str(i[5]))
#             # prepared_data.append([])
#             prepared_data[r].append(connect_id.id)
#             prepared_data[r].append(mine_table.name)
#             prepared_data[r].append(node_table.nodeid)
#             prepared_data[r].append(connect_type)
#             prepared_data[r].append('-----')
#             prepared_data[r].append(wireless_table.name)
#             prepared_data[r].append('-----')
#             prepared_data[r].append(wireless_table.ipaddress)
#
#             # r = r+1
#         r = r + 1
#     # print(prepared_data)
#     # print(wireless_table)
#     data['object_list'] = prepared_data  ##data['object_list'] = book
#     # print(data)
#     return render(request, template_name, data)
#     # return HttpResponse('Ok....')


# def connection_add(request, template_name='connection/connection_add.html'):
#     form = ConnectionForm(request.POST or None, request.FILES)
#     # if form.is_valid():
#     #     form.save()
#     # return redirect('sensor:connection_manage')
#     return render(request, template_name, {'form': form})
#
#
# def connection_edit(request, pk, template_name='connection/connection_add.html'):
#     connection_table = get_object_or_404(Connection, pk=pk)
#     form = ConnectionForm(request.POST or None, request.FILES or None, instance=connection_table)
#     if form.is_valid():
#         form.save()
#         return redirect('sensor:connection_save')
#     return render(request, template_name, {'form': form})
#
#
# def connection_delete(request, pk):
#     connection_table = get_object_or_404(Connection, pk=pk)
#     connection_table.delete()
#     return redirect("sensor:connection_manage")


def fetch_node_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        try:
            node_details = Node.objects.filter(mine_id_id=mine_id)
            node_data = []
            for r in node_details:
                node_data.append({'id': r.id, 'node_name': r.name})
            data['result'] = node_data
        except:
            data['error'] = "Error"
        pass
    else:
        data['result'] = "Not Ajax"

    return JsonResponse(data)


# def fetch_arduino(request):
#     data = {}
#     if request.is_ajax():
#         node_id = request.GET.get('id', None)
#         arduino_info = Arduino.objects.values_list().filter(node_id=node_id)
#
#         data = {}
#         i = 0
#         arduino_data = []
#         for r in arduino_info:
#             arduino_data.append(str(r[0]) + ',' + str(r[2]))
#             i = i + 1
#             data['result'] = arduino_data
#     else:
#         data['result'] = "Something Wen't Wrong!"
#
#     return JsonResponse(data)


# def fetch_wireless(request):
#     data = {}
#     if request.is_ajax():
#         node_id = request.GET.get('id', None)
#         wireless_info = Wireless.objects.values_list().filter(node_id=node_id)
#
#         data = {}
#         i = 0
#         wireless_data = []
#         for r in wireless_info:
#             wireless_data.append(str(r[1]) + ',' + str(r[3]))
#             i = i + 1
#             data['result'] = wireless_data
#     else:
#         data['result'] = "Something went wrong!"
#
#     return JsonResponse(data)


# def fetch_port(request):
#     data = {}
#     if request.is_ajax():
#         arduino_id = request.GET.get('id', None)
#         port_info = Arduino.objects.values_list().filter(id=arduino_id)
#         data = {}
#         i = 0
#         port_data = []
#         for r in port_info:
#             port_data.append(str(r[0]) + ',' + str(r[5]))
#             i = i + 1
#             data['result'] = port_data
#     else:
#         data['result'] = "Something went wrong!"
#
#     return JsonResponse(data)


# def fetch_ip(request):
#     data = {}
#     if request.is_ajax():
#         wireless_id = request.GET.get('id', None)
#         ip_info = Wireless.objects.values_list().filter(id=wireless_id)
#         data = {}
#         i = 0
#         ip_data = []
#         for r in ip_info:
#             ip_data.append(str(r[0]) + ',' + str(r[2]))
#             i = i + 1
#             data['result'] = ip_data
#     else:
#         data['result'] = "Something went wrong!"
#
#     return JsonResponse(data)


# def save_connection(request, template_name='connection/connection_manage.html'):
#     object = Connection()
#
#     object.mine_id = request.POST.get("mine_id")
#     object.node_id = request.POST.get("node_id")
#     object.type = request.POST.get("type")
#     object.arduino_id = request.POST.get("arduino_id")
#     object.wireless_id = request.POST.get("wireless_id")
#     # print(request.POST)
#     # print(object.mine_id)
#     object.save()
#     # form.save()
#     return redirect('sensor:connection_manage')
#     # return render(request,template_name)
#
#     # print(request.POST)
#
#     # return HttpResponse("ok")


# Recieve continuous data wirelessly

def start_save_multiple_sensor(request, mine_id, node_id):
    data = {}

    if request.is_ajax():
        action = request.POST.get('action', None)
        print(action)
        sensors = Sensor_Node.objects.filter(mine_id_id=mine_id, node_id_id=node_id)

        for s in sensors:
            if action == 'true':
                print('IF')
                try:
                    task = Task.objects.get(task_name='sensor.views.run_back_save',
                                            task_params="[[" + str(s.id) + "], {}]")
                    if task:
                        task.delete()
                except:
                    pass

                run_back_save(s.id, repeat=5)
            else:
                print('Else')
                try:
                    task = Task.objects.get(task_name='sensor.views.run_back_save',
                                            task_params="[[" + str(s.id) + "], {}]")
                    if task:
                        task.delete()
                except:
                    pass
    data['result'] = "success"
    return JsonResponse(data)


def start_save_sensor(request, sensor_id):
    data = {}
    print('start save sensor')
    if request.is_ajax():
        action = request.POST.get('action', None)
        if action == 'true':
            print('IF')
            try:
                task = Task.objects.get(task_name='sensor.views.run_back_save',
                                        task_params="[[" + str(sensor_id) + "], {}]")
                if task:
                    task.delete()
                data['result'] = "success"
            except:
                # data['error'] = "error"
                pass

            run_back_save(sensor_id, repeat=15)
        else:
            print('Else')
            try:
                task = Task.objects.get(task_name='sensor.views.run_back_save',
                                        task_params="[[" + str(sensor_id) + "], {}]")
                if task:
                    task.delete()
                data['result'] = "success"
            except:
                # data['error'] = "error"
                pass
        return JsonResponse(data)


@background(schedule=5)
def run_back_save(sensor_id):
    print("================Gas Sensor Background task start")
    task = Task.objects.filter(task_name='sensor.views.run_back_save',
                               task_params="[[" + str(sensor_id) + "], {}]")

    print('Task ID', task)

    inst = gasModel_auto()
    sensor_node = Sensor_Node.objects.get(pk=sensor_id)
    inst.mine_id = sensor_node.mine_id_id

    inst.node_id = sensor_node.node_id_id
    inst.sensor_name = sensor_node.sensor_name
    inst.sensor_id = sensor_node.id
    inst.sensor_value = '0.00'
    print(sensor_node.node_id)
    print(sensor_node.sensor_name)
    try:
        response = requests.get('http://' + str(sensor_node.ip_add))
        sensor_val = strip_tags(response.text)
        sensor_val = sensor_val if (isNum(sensor_val)) else "Network Error"
        if sensor_val:
            print(sensor_val)
            inst.sensor_value = str(float(sensor_val))
            print('sensor value', float(sensor_val))
        else:
            print('else part')
            inst.sensor_value = 'No Data'
            print("NO data")
    except Exception as x:
        print('exception part')
        inst.sensor_value = 'Network Error'
        print("Network Error")
    print('before saving instance')
    try:
        inst.save()
    except Exception as e:
        print(e)
    print("================Gas Sensor Background task end")
    # if task:
    #     task.delete()


# @background(schedule=5)
# def getsensordata(ip, mine_id, node_id, gas_name):
#     print("##############")
#     try:
#         object = gasModel_auto()
#         response = requests.get('http://' + str(ip))
#         sensor_value = str(strip_tags(response.text))  # read the line of text from the serial port
#         object.mine_id = mine_id
#         object.node_id = node_id
#         object.sensor_value = sensor_value
#         object.sensor_name = gas_name
#
#     except Exception as e:
#         pass
#     object.save()


# def background_view(request, pk, template_name='node/node_manage.html'):
#     book = Node.objects.all()
#     data = {}
#     data['object_list'] = book
#     node_details = Sensor_Node.objects.values_list().filter(node_id=pk)
#     print("*************")
#     # print(node_details)
#     for r in node_details:
#         mine_id = str(r[1])
#         node_id = str(r[2])
#         gas_name = str(r[5])
#         try:
#             ip = str(r[3])
#
#             if (ip != 'NULL'):
#                 # print(ip)
#                 getsensordata(ip, mine_id, node_id, gas_name, repeat=1)
#                 print("Hi..............")
#         except:
#             pass
#
#     return render(request, template_name, data)


@login_required
def live_data_tabular(request, template_name='live_data/live_data_tabular.html'):
    form = NodeForm(request.POST)

    return render(request, template_name, {'form': form})


import random


@login_required
def iframe_live_data(request, mine_id, node_id, sensor_id, template_name='live_data/iframe_live_data.html'):
    data = {}
    node = get_object_or_404(Node, pk=node_id, mine_id=mine_id)
    node_name = node.name
    wireless_node = get_object_or_404(Sensor_Node, pk=sensor_id, mine_id=mine_id, node_id=node_id)
    sensor_name = wireless_node.sensor_name
    if request.is_ajax():
        try:
            # wireless_node=get_object_or_404(Sensor_Node,pk=sensor_id,mine_id=mine_id,node_id=node_id)
            ipAdd = wireless_node.ip_add
            print('Ip Adderss', ipAdd)
            response = requests.get('http://' + ipAdd)
            sensor_val = strip_tags(response.text)
            sensor_val = sensor_val if (isNum(sensor_val)) else "Network Error"
            data['result'] = sensor_val
        except Exception as e:
            print(e)
            data['result'] = 'Network Error'
        return JsonResponse(data)

    return render(request, template_name, {'node_name': node_name, 'sensor_name': sensor_name})


########demo
# def background_data(request):
#     live = gasModel_auto.objects.values_list()
#     # print(live)
#
#     return render(request)


def fetch_mine_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        try:
            node_details = Node.objects.filter(mine_id_id=mine_id)
            node_data = []
            for r in node_details:
                node_data.append({'id': r.id, 'node_name': r.name})
            data['result'] = node_data
        except:
            data['error'] = "Error"
        pass
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


#
# def fetch_sensor_values_ajax_p(request):
#     data = {}
#     if request.is_ajax():
#         sensor_data = []
#         sensor_data1 = []
#
#         node_id2 = request.GET.get('id', None)
#         sensor_details = Sensor_Node.objects.values_list().filter(node_id=node_id2)
#         # print(sensor_details)
#
#         for r1 in sensor_details:
#             location_details1 = str(r1[2])
#             mine_details = str(r1[1])
#
#         location_details = Node.objects.get(id=location_details1)
#         mine_details = MineDetails.objects.get(id=mine_details)
#         now = datetime.now()
#         ok_date = (str(now.strftime('%Y-%m-%d %H:%M:%S')))
#         sensor_data.append(ok_date)
#         sensor_data.append(str(mine_details.name))
#         sensor_data.append(str(location_details.name))
#
#         for r in sensor_details:
#             try:
#                 ip_add = str(r[3])
#                 sensor_name = str(r[5])
#                 unit = str(r[6])
#                 sensorunit1 = str(r[8])
#                 sensorunit2 = str(r[9])
#                 sensorunit3 = str(r[10])
#                 green = str(r[14])
#                 yellow = str(r[15])
#                 red = str(r[16])
#                 response = requests.get('http://' + ip_add)
#
#                 if (sensor_name == "CH4"):
#                     CH4 = strip_tags(response.text)
#                     if (int(CH4) < int(sensorunit1)):
#                         sensor_data1.append('#1216f6')
#                         sensor_data.append(str(CH4 + ' ' + unit))
#                     elif ((int(CH4) >= int(sensorunit1)) & (int(CH4) < int(sensorunit2))):
#                         sensor_data1.append(str(green))
#                         sensor_data.append(str(CH4 + ' ' + unit))
#                     elif ((int(CH4) >= int(sensorunit2)) & (int(CH4) < int(sensorunit3))):
#                         sensor_data1.append(str(yellow))
#                         sensor_data.append(str(CH4 + ' ' + unit))
#                     else:
#                         sensor_data1.append(str(red))
#                         sensor_data.append(str(CH4 + ' ' + unit))
#                     # sensor_data.append(sensor_name)
#
#                 elif (sensor_name == "CO"):
#                     CO = strip_tags(response.text)
#                     if (int(CO) < int(sensorunit1)):
#                         sensor_data1.append('#1216f6')
#                         sensor_data.append(str(CO + ' ' + unit))
#                     elif ((int(CO) >= int(sensorunit1)) & (int(CO) < int(sensorunit2))):
#                         sensor_data1.append(str(green))
#                         sensor_data.append(str(CO + ' ' + unit))
#                     elif ((int(CO) >= int(sensorunit2)) & (int(CO) < int(sensorunit3))):
#                         sensor_data1.append(str(yellow))
#                         sensor_data.append(str(CO + ' ' + unit))
#                     else:
#                         sensor_data1.append(str(red))
#                         sensor_data.append(str(CO + ' ' + unit))
#
#                     # sensor_data.append(sensor_name)
#
#                 elif (sensor_name == "CO2"):
#                     CO2 = strip_tags(response.text)
#                     if (int(CO2) < int(sensorunit1)):
#                         sensor_data1.append('#1216f6')
#                         sensor_data.append(str(CO2 + ' ' + unit))
#                     elif ((int(CO2) >= int(sensorunit1)) & (int(CO2) < int(sensorunit2))):
#                         sensor_data1.append(str(green))
#                         sensor_data.append(str(CO2 + ' ' + unit))
#                     elif ((int(CO2) >= int(sensorunit2)) & (int(CO2) < int(sensorunit3))):
#                         sensor_data1.append(str(yellow))
#                         sensor_data.append(str(CO2 + ' ' + unit))
#                     else:
#                         sensor_data1.append(str(red))
#                         sensor_data.append(str(CO2 + ' ' + unit))
#                 elif (sensor_name == "O2"):
#                     O2 = strip_tags(response.text)
#                     if (int(O2) < int(sensorunit1)):
#                         sensor_data1.append('#1216f6')
#                         sensor_data.append(str(O2 + ' ' + unit))
#                     elif ((int(O2) >= int(sensorunit1)) & (int(O2) < int(sensorunit2))):
#                         sensor_data1.append(str(green))
#                         sensor_data.append(str(O2 + ' ' + unit))
#                     elif ((int(O2) >= int(sensorunit2)) & (int(O2) < int(sensorunit3))):
#                         sensor_data1.append(str(yellow))
#                         sensor_data.append(str(O2 + ' ' + unit))
#                     else:
#                         sensor_data1.append(str(red))
#                         sensor_data.append(str(O2 + ' ' + unit))
#                 elif (sensor_name == "H2S"):
#                     H2S = strip_tags(response.text)
#                     if (int(H2S) < int(sensorunit1)):
#                         sensor_data1.append('#1216f6')
#                         sensor_data.append(str(H2S + ' ' + unit))
#                     elif ((int(H2S) >= int(sensorunit1)) & (int(H2S) < int(sensorunit2))):
#                         sensor_data1.append(str(green))
#                         sensor_data.append(str(H2S + ' ' + unit))
#                     elif ((int(H2S) >= int(sensorunit2)) & (int(H2S) < int(sensorunit3))):
#                         sensor_data1.append(str(yellow))
#                         sensor_data.append(str(H2S + ' ' + unit))
#                     else:
#                         sensor_data1.append(str(red))
#                         sensor_data.append(str(H2S + ' ' + unit))
#                 elif (sensor_name == "NO2"):
#                     NO2 = strip_tags(response.text)
#                     if (int(NO2) < int(sensorunit1)):
#                         sensor_data1.append('#1216f6')
#                         sensor_data.append(str(NO2 + ' ' + unit))
#                     elif ((int(NO2) >= int(sensorunit1)) & (int(NO2) < int(sensorunit2))):
#                         sensor_data1.append(str(green))
#                         sensor_data.append(str(NO2 + ' ' + unit))
#                     elif ((int(NO2) >= int(sensorunit2)) & (int(NO2) < int(sensorunit3))):
#                         sensor_data1.append(str(yellow))
#                         sensor_data.append(str(NO2 + ' ' + unit))
#                     else:
#                         sensor_data1.append(str(red))
#                         sensor_data.append(str(NO2 + ' ' + unit))
#                 elif (sensor_name == "SO2"):
#                     SO2 = strip_tags(response.text)
#                     if (int(SO2) < int(sensorunit1)):
#                         sensor_data1.append('#1216f6')
#                         sensor_data.append(str(SO2 + ' ' + unit))
#                     elif ((int(SO2) >= int(sensorunit1)) & (int(SO2) < int(sensorunit2))):
#                         sensor_data1.append(str(green))
#                         sensor_data.append(str(SO2 + ' ' + unit))
#                     elif ((int(SO2) >= int(sensorunit2)) & (int(SO2) < int(sensorunit3))):
#                         sensor_data1.append(str(yellow))
#                         sensor_data.append(str(SO2 + ' ' + unit))
#                     else:
#                         sensor_data1.append(str(red))
#                         sensor_data.append(str(SO2 + ' ' + unit))
#                 elif (sensor_name == "H2"):
#                     H2 = strip_tags(response.text)
#                     if (int(H2) < int(sensorunit1)):
#                         sensor_data1.append('#1216f6')
#                         sensor_data.append(str(H2 + ' ' + unit))
#                     elif ((int(H2) >= int(sensorunit1)) & (int(H2) < int(sensorunit2))):
#                         sensor_data1.append(str(green))
#                         sensor_data.append(str(H2 + ' ' + unit))
#                     elif ((int(H2) >= int(sensorunit2)) & (int(H2) < int(sensorunit3))):
#                         sensor_data1.append(str(yellow))
#                         sensor_data.append(str(H2 + ' ' + unit))
#                     else:
#                         sensor_data1.append(str(red))
#                         sensor_data.append(str(H2 + ' ' + unit))
#                 else:
#                     He = strip_tags(response.text)
#                     if (int(He) < int(sensorunit1)):
#                         sensor_data1.append('#1216f6')
#                         sensor_data.append(str(He + ' ' + unit))
#                     elif ((int(He) >= int(sensorunit1)) & (int(He) < int(sensorunit2))):
#                         sensor_data1.append(str(green))
#                         sensor_data.append(str(He + ' ' + unit))
#                     elif ((int(He) >= int(sensorunit2)) & (int(He) < int(sensorunit3))):
#                         sensor_data1.append(str(yellow))
#                         sensor_data.append(str(He + ' ' + unit))
#                     else:
#                         sensor_data1.append(str(red))
#                         sensor_data.append(str(He + ' ' + unit))
#             except Exception as x:
#                 sensor_data.append('Network Error')
#                 sensor_data1.append('Network Error')
#
#         data['result'] = sensor_data
#         data['result1'] = sensor_data1
#         # print(data)
#
#     else:
#         data['result'] = "Not Ajax"
#         data['heading'] = "Not Ajax"
#     return JsonResponse(data)
#

def fetch_sensor_values_ajax_h(request):
    data = {}
    if request.is_ajax():
        sensor_data_h = []
        node_id2 = request.GET.get('id', None)
        sensor_details = Sensor_Node.objects.values_list().filter(node_id=node_id2)
        # print(sensor_details)
        sensor_data_h.append('Date Time')
        sensor_data_h.append('Mine Name')
        sensor_data_h.append('Node name')
        for r1 in sensor_details:
            sensor_data_h.append(str(r1[5]))

        data['result'] = sensor_data_h
        # print(data)

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_sensor_values(request):
    data = {}
    if request.is_ajax():
        node_id = request.GET.get('id', None)
        data['result'] = node_id
    # print(data)
    return JsonResponse(data)


@login_required
def live_data_graph(request, template_name='live_data/live_data_graph.html'):
    form = NodeForm(request.POST)

    return render(request, template_name, {'form': form})


@login_required
def fetch_sensors_list(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        try:
            sensors = Sensor_Node.objects.filter(mine_id=mine_id).values('sensor_name').distinct()
            sensor_list = []
            for s in sensors:
                print(s)
                sensor_list.append(s)
            data['result'] = sensor_list
        except:
            data['error'] = 'error'
            pass
    else:
        data['result'] = 'Not Ajax'
    return JsonResponse(data)


@login_required
def fetch_sensor_ajax(request):
    data = {}
    if request.is_ajax():
        node_id = request.GET.get('id', None)
        node_data = []
        try:
            node_details = Sensor_Node.objects.filter(node_id=node_id)
            for r in node_details:
                node_data.append({'id': str(r.id), 'sensor_name': r.sensor_name})

            data['result'] = node_data
        except:
            data['error'] = "Error"
            pass
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_sensor_values_ajax(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_id = request.GET.get('id', None)

        sensor_details = Sensor_Node.objects.get(id=sensor_id)

        now = datetime.now()
        ok_date = (str(now.strftime('%Y-%m-%d %H:%M:%S')))
        try:
            response = requests.get('http://' + str(sensor_details.ip_add))
            sensor_val = strip_tags(response.text)
            sensor_val = sensor_val if (isNum(sensor_val)) else "Network Error"

            if (int(sensor_val) < int(sensor_details.level_1_warning_unit)):
                data['result'] = {
                    'id': sensor_id,
                    'time': str(ok_date),
                    'sensor_value': str(sensor_val),
                    'sensor_name': str(sensor_details.sensor_name),
                    'sensor_unit': str(sensor_details.sensor_unit),
                    'sensor_warning_color': '#1216f6',
                    'sensor_warning_msg': 'Gas condition is normal'
                }
            elif ((int(sensor_val) >= int(sensor_details.level_1_warning_unit)) & (
                    int(sensor_val) < int(sensor_details.level_2_warning_unit))):
                data['result'] = {
                    'id': sensor_id,
                    'time': str(ok_date),
                    'sensor_value': sensor_val,
                    'sensor_name': str(sensor_details.sensor_name),
                    'sensor_unit': str(sensor_details.sensor_unit),
                    'sensor_warning_color': str(sensor_details.level_1_color),
                    'sensor_warning_msg': str(sensor_details.level_1_msg)

                }
            elif ((int(sensor_val) >= int(sensor_details.level_2_warning_unit)) & (
                    int(sensor_val) < int(sensor_details.level_3_warning_unit))):
                data['result'] = {
                    'id': sensor_id,
                    'time': str(ok_date),
                    'sensor_value': sensor_val,
                    'sensor_name': str(sensor_details.sensor_name),
                    'sensor_unit': str(sensor_details.sensor_unit),
                    'sensor_warning_color': str(sensor_details.level_2_color),
                    'sensor_warning_msg': str(sensor_details.level_2_msg)

                }
            else:
                data['result'] = {
                    'id': sensor_id,
                    'time': str(ok_date),
                    'sensor_value': sensor_val,
                    'sensor_name': str(sensor_details.sensor_name),
                    'sensor_unit': str(sensor_details.sensor_unit),
                    'sensor_warning_color': str(sensor_details.level_3_color),
                    'sensor_warning_msg': str(sensor_details.level_3_msg)

                }

        except:
            data['result'] = {
                'error': 'Network Error'
            }
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_sensor_ajax_sensor(request):
    data = {}
    if request.is_ajax():
        sensor_id = request.GET.get('id', None)
        try:
            sensor_details = Sensor_Node.objects.get(id=sensor_id)
            data['result'] = {'id': str(sensor_details.id), 'sensor_name': str(sensor_details.sensor_name), 'unit': str(
                sensor_details.sensor_unit), 'color': '#1216f6'}
        except:
            data['error'] = "Error"
            pass
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_sensor_values_all_ajax(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_id = request.GET.get('id', None)
        sensor_details = Sensor_Node.objects.filter(node_id=sensor_id)

        for r in sensor_details:
            id = str(r.id)
            ip_add = str(r.ip_add)
            sensor_name = str(r.sensor_name)
            unit = str(r.sensor_unit)
            sensorunit1 = str(r.level_1_warning_unit)
            sensorunit2 = str(r.level_2_warning_unit)
            sensorunit3 = str(r.level_3_warning_unit)
            green = str(r.level_1_color)
            yellow = str(r.level_2_color)
            red = str(r.level_3_color)
            msg1 = str(r.level_1_msg)
            msg2 = str(r.level_2_msg)
            msg3 = str(r.level_3_msg)
            try:
                response = requests.get('http://' + ip_add)
                sensor_val = str(strip_tags(response.text))
                sensor_val = sensor_val if (isNum(sensor_val)) else "Network Error"

                if (int(sensor_val) < int(sensorunit1)):
                    sensor_data.append({
                        'id': id,
                        'sensor_value': sensor_val,
                        'sensor_name': sensor_name,
                        'sensor_unit': unit,
                        'sensor_warning_color': '#1216f6',
                        'sensor_warning_msg': 'Gas condition is normal'

                    })
                    # sensor_data4.append('#1216f6')
                    # sensor_data5.append('Gas condition is normal ')
                elif ((int(sensor_val) >= int(sensorunit1)) & (int(sensor_val) < int(sensorunit2))):
                    sensor_data.append({
                        'id': id,
                        'sensor_value': sensor_val,
                        'sensor_name': sensor_name,
                        'sensor_unit': unit,
                        'sensor_warning_color': green,
                        'sensor_warning_msg': msg1

                    })
                    # sensor_data4.append(green)
                    # sensor_data5.append(msg1)
                elif ((int(sensor_val) >= int(sensorunit2)) & (int(sensor_val) < int(sensorunit3))):
                    sensor_data.append({
                        'id': id,
                        'sensor_value': sensor_val,
                        'sensor_name': sensor_name,
                        'sensor_unit': unit,
                        'sensor_warning_color': yellow,
                        'sensor_warning_msg': msg2

                    })
                    # sensor_data4.append(yellow)
                    # sensor_data5.append(msg2)
                else:
                    sensor_data.append({
                        'id': id,
                        'sensor_value': sensor_val,
                        'sensor_name': sensor_name,
                        'sensor_unit': unit,
                        'sensor_warning_color': red,
                        'sensor_warning_msg': msg3

                    })

            except Exception as x:
                sensor_data.append({'error': "Network Error"})

        data['result'] = sensor_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def sensor_wise_node_header(request):
    data = {}
    if request.is_ajax():
        request.session['ip'] = 127
        sensor_data = []

        sensor_id = request.GET.get('id', None)
        mine = request.GET.get('mine', None)
        sensor_details = Sensor_Node.objects.filter(mine_id=mine, sensor_name=sensor_id)

        for r in sensor_details:
            id = str(r.id)
            ip_add = str(r.ip_add)
            sensor_name = str(r.sensor_name)
            unit = str(r.sensor_unit)
            sensorunit1 = str(r.level_1_warning_unit)
            sensorunit2 = str(r.level_2_warning_unit)
            sensorunit3 = str(r.level_3_warning_unit)
            green = str(r.level_1_color)
            yellow = str(r.level_2_color)
            red = str(r.level_3_color)
            msg1 = str(r.level_1_msg)
            msg2 = str(r.level_2_msg)
            msg3 = str(r.level_3_msg)
            node_name = Node.objects.get(id=r.node_id_id)
            sensor_data.append({
                'id': id,
                'sensor_name': sensor_name,
                'sensor_node_name': str(node_name.name),
                'sensor_unit': unit,
                'sensor_warning_color': '#1216f6',
                'sensor_warning_msg': 'Gas condition is normal'

            })
            data['result'] = sensor_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def sensor_wise_node(request):
    data = {}
    if request.is_ajax():
        sensor_data = []

        sensor_id = request.GET.get('id', None)
        mine = request.GET.get('mine', None)
        sensor_details = Sensor_Node.objects.filter(mine_id=mine, sensor_name=sensor_id)

        for r in sensor_details:
            id = str(r.id)
            ip_add = str(r.ip_add)
            sensor_name = str(r.sensor_name)
            unit = str(r.sensor_unit)
            sensorunit1 = str(r.level_1_warning_unit)
            sensorunit2 = str(r.level_2_warning_unit)
            sensorunit3 = str(r.level_3_warning_unit)
            green = str(r.level_1_color)
            yellow = str(r.level_2_color)
            red = str(r.level_3_color)
            msg1 = str(r.level_1_msg)
            msg2 = str(r.level_2_msg)
            msg3 = str(r.level_3_msg)
            node_name = Node.objects.get(id=r.node_id_id)

            try:
                response = requests.get('http://' + ip_add)
                sensor_val = strip_tags(response.text)
                sensor_val = sensor_val if (isNum(sensor_val)) else "Network Error"
                if (int(sensor_val) < int(sensorunit1)):
                    sensor_data.append({
                        'id': id,
                        'sensor_value': sensor_val,
                        'sensor_name': sensor_name,
                        'sensor_node_name': str(node_name.name),
                        'sensor_unit': unit,
                        'sensor_warning_color': '#1216f6',
                        'sensor_warning_msg': 'Gas condition is normal'

                    })
                elif ((int(sensor_val) >= int(sensorunit1)) & (int(sensor_val) < int(sensorunit2))):
                    sensor_data.append({
                        'id': id,
                        'sensor_value': sensor_val,
                        'sensor_name': sensor_name,
                        'sensor_node_name': str(node_name.name),
                        'sensor_unit': unit,
                        'sensor_warning_color': green,
                        'sensor_warning_msg': msg1

                    })
                elif ((int(sensor_val) >= int(sensorunit2)) & (int(sensor_val) < int(sensorunit3))):
                    sensor_data.append({
                        'id': id,
                        'sensor_value': sensor_val,
                        'sensor_name': sensor_name,
                        'sensor_node_name': str(node_name.name),
                        'sensor_unit': unit,
                        'sensor_warning_color': yellow,
                        'sensor_warning_msg': msg2

                    })
                else:
                    sensor_data.append({
                        'id': id,
                        'sensor_value': sensor_val,
                        'sensor_name': sensor_name,
                        'sensor_node_name': str(node_name.name),
                        'sensor_unit': unit,
                        'sensor_warning_color': red,
                        'sensor_warning_msg': msg3

                    })
            except Exception as x:
                sensor_data.append({'error': "Network Error"})
            data['result'] = sensor_data
    else:
        data['result'] = "Not Ajax"

    return JsonResponse(data)


######################## live map############################
@login_required
def live_map(request, template_name='live_data/live_map.html'):
    form = NodeForm(request.POST)

    return render(request, template_name, {'form': form})


def fetch_map_ajax(request):
    data = {}
    if request.is_ajax():
        sensor_data = []

        sensor_id = request.GET.get('id', None)
        mine_detail = MineDetails.objects.get(id=sensor_id)
        sensor_data.append(str(mine_detail.mine_map_image))
        data['result'] = sensor_data
        # print(data)
    else:
        data['result'] = "Not Ajax"

    return JsonResponse(data)


############popup

def sensor_wise_popup(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_data1 = []
        sensor_data2 = []

        sensor_id = request.GET.get('id', None)
        sensor_details = Sensor_Node.objects.values_list().filter(node_id=sensor_id)
        sensor_details1 = Node.objects.get(id=sensor_id)
        sensor_data2.append(sensor_details1.name)
        for r in sensor_details:
            ip_add = str(r[3])
            sensor_name = str(r[5])
            sensor_data1.append(sensor_name)
            try:
                response = requests.get('http://' + ip_add)
                sensor_val = strip_tags(response.text)
                sensor_val = sensor_val if (isNum(sensor_val)) else "Network Error"
                sensor_data.append(str(sensor_val))
            except Exception as x:
                sensor_data.append("Network Error")

        data['result'] = sensor_data
        data['result1'] = sensor_data1
        data['result2'] = sensor_data2
        # print(data)

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


###################################### senor data for table#############################

def fetch_sensor_values_ajax_sensor_table(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_condition = []
        sensor_or_node_name = request.GET.get('id', None)
        mine = request.GET.get('mine', None)
        mode = request.GET.get('mode', None)
        if mode == '0':  # Node Wise

            try:
                sensor_details = Sensor_Node.objects.filter(mine_id=mine, node_id_id=sensor_or_node_name)
                sensor_data.append('Date Time')
                sensor_data.append('Mine Name')
                sensor_data.append('Node Name')
                i = 3
                for r in sensor_details:
                    # node_details = Node.objects.get(id=str(r.node_id_id))
                    sensor_data.append(r.sensor_name + " (" + r.sensor_unit + ")")
                    sensor_condition.append({'id': str(i),
                                             'level1': r.level_1_warning_unit,
                                             'level2': r.level_2_warning_unit,
                                             'level3': r.level_3_warning_unit,
                                             'level1_color': r.level_1_color,
                                             'level2_color': r.level_2_color,
                                             'level3_color': r.level_3_color,
                                             })
                    i += 1

                data['result'] = sensor_data
                data['condition'] = sensor_condition
            except:
                data['error'] = "Error"
                pass
        elif mode == '1':  # Sensor Wise
            try:
                sensor_details = Sensor_Node.objects.filter(mine_id=mine, sensor_name=sensor_or_node_name)
                sensor_data.append('Date Time')
                sensor_data.append('Mine Name')
                sensor_data.append('Sensor Name')

                i = 3
                for r in sensor_details:
                    sensor_data.append(str(r.node_id) + " (" + r.sensor_unit + ")")
                    sensor_condition.append({'id': str(i),
                                             'level1': r.level_1_warning_unit,
                                             'level2': r.level_2_warning_unit,
                                             'level3': r.level_3_warning_unit,
                                             'level1_color': r.level_1_color,
                                             'level2_color': r.level_2_color,
                                             'level3_color': r.level_3_color,
                                             })
                    i += 1

                data['result'] = sensor_data
                data['condition'] = sensor_condition
            except:
                data['error'] = "Error"
                pass

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_sensor_values_ajax_sensor_body(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        node_or_sensor_id = request.GET.get('id', None)
        mine = request.GET.get('mine', None)
        mode = request.GET.get('mode', None)
        now = datetime.now()
        ok_date = (str(now.strftime('%Y-%m-%d %H:%M:%S')))
        data['time'] = str(ok_date)
        if mode == '0':
            sensor_details = Sensor_Node.objects.filter(mine_id=mine, node_id_id=node_or_sensor_id)
        elif mode == '1':
            sensor_details = Sensor_Node.objects.filter(mine_id=mine, sensor_name=node_or_sensor_id)
        for r in sensor_details:
            id = str(r.id)
            ip_add = str(r.ip_add)
            try:
                response = requests.get('http://' + ip_add)
                sensor_val = strip_tags(response.text)
                sensor_val = sensor_val if (isNum(sensor_val)) else "Network Error"
                sensor_data.append({
                    'id': id,
                    'sensor_value': sensor_val,
                })
            except Exception as x:
                sensor_data.append({
                    'id': id,
                    'sensor_value': "Network Error",
                })

        data['result'] = sensor_data

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


import hashlib


@login_required
def fetch_map_image(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        mine_details = MineDetails.objects.values_list().filter(id=mine_id)
        node_detail = Node.objects.filter(mine_id_id=mine_id)
        data = {}
        mine_data = {}
        for m in mine_details:
            mine_data['id'] = str(m[0])
            mine_data['name'] = str(m[1])
            mine_data['image_url'] = str(m[6])
        nodes_data = {}
        for n in node_detail:
            node_data = {}
            node_data['id'] = str(n.id)
            node_data['node_id'] = str(n.node_id)
            node_data['name'] = str(n.name)
            node_data['location'] = str(n.location)
            node_data['cordX'] = str(n.x_axis)
            node_data['cordY'] = str(n.y_axis)
            if n.isgoaf == 0:
                node_data['icon'] = '/static/image/node_green.svg'
            else:
                node_data['icon'] = '/static/image/node_red.svg'
            node_data['photo2'] = str(n.photo2)
            hash_object = hashlib.sha512(str(n.id).encode())
            hash = hash_object.hexdigest()
            node_modal_data = {'title': str(n.name) + "||" + str(n.location),
                               'content': '<div id="Content' + hash + '"></div>'}
            node_data['modal'] = node_modal_data

            nodes_data[hash] = node_data
        data['mine'] = mine_data
        data['node'] = nodes_data

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def WarningLevel(gasValue, AWarning, BWarning, CWarning):
    warning = 0
    # print(gasValue, AWarning, BWarning, CWarning)
    if float(gasValue) > float(AWarning):
        warning = 1
        # print('warn1')
    if float(gasValue) > float(BWarning):
        warning = 2
        # print('warn2')

    if float(gasValue) > float(CWarning):
        # print('warn3')
        warning = 3

    return warning


@login_required
def node_sensor_data(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        node_id = request.GET.get('node_id', None)
        mine_details = MineDetails.objects.values_list().filter(id=mine_id)
        data = {}
        mine_data = {}
        for m in mine_details:
            mine_data['id'] = str(m[0])
            mine_data['name'] = str(m[1])
            mine_data['image_url'] = str(m[6])

        sensor_data = {}
        sensor_details = Sensor_Node.objects.filter(node_id=node_id, mine_id=mine_id)
        for sd in sensor_details:
            try:
                response = requests.get('http://' + sd.ip_add)

                gasValue = strip_tags(response.text)
                gasValue = gasValue if (isNum(gasValue)) else "Network Error"
                warning = str(
                    WarningLevel(gasValue, sd.level_1_warning_unit, sd.level_1_warning_unit, sd.level_1_warning_unit))
                sensor_data[str(sd.sensor_name)] = {'value': gasValue, 'unit': sd.sensor_unit, 'warning': warning}
                print(sensor_data)
            except:
                sensor_data[str(sd.sensor_name)] = {'value': "Connection Error!", 'unit': sd.sensor_unit, 'warning': 1}
                pass

        hash_object = hashlib.sha512(str(node_id).encode())

        data[hash_object.hexdigest()] = sensor_data
        return JsonResponse(data)
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


import matplotlib.pyplot as plt
import io
import numpy as np
from django.db.models import Avg
from django.db.models.functions import NullIf, TruncDay
from django.db.models import Value


@login_required
def ellicots(request, pk, template_name='sensor/test.html'):
    data = {}
    pk = decrypt(pk)
    data['node_id'] = pk
    return render(request, template_name, data)


@login_required
def locate_node(request, mine_id, node_id, template_name='sensor/test1.html'):
    mine_id = decrypt(mine_id)
    node_id = decrypt(node_id)
    data = {}

    data['mine_id'] = mine_id
    try:
        node = get_object_or_404(Node, mine_id=mine_id, pk=node_id)
        data['x'] = node.x_axis
        data['y'] = node.y_axis
        data['node_name'] = node.name
        data['content'] = node.description
        data['location'] = node.location

    except:
        data['error'] = 1
        pass
    return render(request, template_name, data)


from datetime import timedelta


@login_required
def ellicots_ajax(request, template_name='sensor/test.html'):
    data = {}
    if request.is_ajax():
        node_id = request.GET.get('id', None)
        node_id = decrypt(node_id)
        date_from = request.GET.get('date_from', None)
        date_from += " 00:00:00"
        date_from = datetime.strptime(date_from, "%Y-%m-%d %H:%M:%S").date()
        date_to = request.GET.get('date_to', None)
        date_to += " 00:00:00"
        date_to = datetime.strptime(date_to, "%Y-%m-%d %H:%M:%S").date()
        graph = []

        class GraphData:
            o2 = co = ch4 = co2 = h2 = n2 = c2h4 = elx = ely = 0.0
            explos = 5
            idtest = 0

        data_list = gasModel_auto.objects.filter(date_time__range=(
            date_from, date_to
        ), node_id=node_id).values('sensor_name', 'sensor_name').annotate(day=TruncDay('date_time'),
                                                                          avg=Avg(NullIf('sensor_value', Value(0))))

        # SELECT AVG(sensor_value), sensor_name, sensor_id, date_time FROM `gasmodel_auto` GROUP BY sensor_name, DATE(date_time), sensor_id

        DateWiseData = {}
        for d in data_list:
            DateWiseData[d['day']] = []
        for d in data_list:
            list = {'name': d['sensor_name'], 'avg': d['avg']}
            DateWiseData[d['day']].append(list)

        i = 1
        gases = {}

        for DateWise in DateWiseData:
            gases['CO'] = gases['CO2'] = gases['CH4'] = gases['O2'] = gases['H2'] = gases['N2'] = gases['C2H4'] = 0
            # print(DateWise)
            for gas in DateWiseData[DateWise]:
                gases[gas['name']] = gas['avg']

            Total = gases['CO'] + gases['CO2'] + gases['CH4'] + gases['O2'] + gases['H2'] + gases['N2'] + gases[
                'C2H4']
            try:
                gases['CO'] = (gases['CO'] / Total) * 100
            except:
                gases['CO'] = 0
            try:
                gases['CO2'] = (gases['CO2'] / Total) * 100
            except:
                gases['CO2'] = 0
            try:
                gases['CH4'] = (gases['CH4'] / Total) * 100
            except:
                gases['CH4'] = 0
            try:
                gases['O2'] = (gases['O2'] / Total) * 100
            except:
                gases['O2'] = 0
            try:
                gases['H2'] = (gases['H2'] / Total) * 100
            except:
                gases['H2'] = 0
            try:
                gases['N2'] = (gases['N2'] / Total) * 100
            except:
                gases['N2'] = 0
            try:
                gases['C2H4'] = (gases['C2H4'] / Total) * 100
            except:
                gases['C2H4'] = 0

            #####################################

            graphpoints = []

            dates = []
            dates.append(datetime.now())

            x = GraphData()
            x.o2 = gases['O2']  # 3.2734952481520594
            x.co = gases['CO']  # 10.03167898627244
            x.ch4 = gases['CH4']  # 9.820485744456176
            x.co2 = gases['CO2']  # 14.783526927138332
            x.h2 = gases['N2']  # 23.231256599788807
            x.n2 = gases['N2']  # 19.1129883843717
            x.c2h4 = gases['C2H4']  # 19.746568109820487

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

            try:
                Llow = pt / (x.ch4 / ch4low + x.co / colow + x.h2 / h2low)
            except ZeroDivisionError:
                Llow = 1
                pass
            try:
                Lhigh = pt / (x.ch4 / ch4high + x.co / cohigh + x.h2 / h2high)
            except ZeroDivisionError:
                Lhigh = 1
                pass
            try:
                Lnose = pt / (x.ch4 / ch4nose + x.co / conose + x.h2 / h2nose)
            except ZeroDivisionError:
                Lnose = 1
                pass
            try:
                Nex = Lnose / pt * (ch4np * x.ch4 + conp * x.co + h2np * x.h2)
            except ZeroDivisionError:
                Nex = 1
                pass
            # print('low high', Llow, Lhigh, Lnose, Nex)
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

            # print('EXPLOS', x.explos)
            # 0 NE, 1 PE w/air, 2 PE w/comb, 3 E, 4 IM, 5 Unidentified

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
                print('x y', valuex, valuey)
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
                # print('Else part')
                rm = 0
                thm = 0
            x.elx = rm * np.cos(np.radians(thm))
            x.ely = rm * np.sin(np.radians(thm))
            # print('GP', x.elx, x.ely, rm, thm)
            graphpoints.append(x)

            idn = 0

            def markercrtr(numb):
                createdstring = '$' + str(numb + 1) + '$'
                return createdstring

            def markerclr(numb):
                print('numb', numb)
                tot = 10  # len(graphpoints) #10
                colorstring = '#77b5fe'
                if (numb < tot / 5):  # 2
                    colorstring = '#8a2be2'
                elif (numb < 2 * tot / 5):  # 4
                    colorstring = '#8db600'
                elif (numb < 3 * tot / 5):  # 6
                    colorstring = '#ffff00'
                elif (numb < 4 * tot / 5):  # 8
                    colorstring = '#eaa221'
                else:
                    colorstring = '#ffc0cb'
                return colorstring

            graph.append({
                'x': x.elx,
                'y': x.ely,
                'color': markerclr(i),
                'dates': str(DateWise)
            })

            # date_from += day
            i += 1
        data['result'] = graph

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


# return render(request,template_name,{'data':data})


from django.template.defaulttags import register


@register.filter(name='lookup')
def get_item(dictionary, key):
    return dictionary.get(str(key))


@register.filter(name='encrypt')
def encrypt(key):
    return encrypt(key)


@register.filter(name='decrypt')
def decrypt(key):
    return decrypt(key)


def isNum(data):
    try:
        int(data)
        return True
    except ValueError:
        return False


from cryptography.fernet import Fernet
import base64


def encrypt(txt):
    try:
        # convert integer etc to string first
        txt = str(txt)
        # get the key from settings
        cipher_suite = Fernet(settings.ENCRYPT_KEY)  # key should be byte
        # #input should be byte, so convert the text to byte
        encrypted_text = cipher_suite.encrypt(txt.encode('ascii'))
        # encode to urlsafe base64 format
        encrypted_text = base64.urlsafe_b64encode(encrypted_text).decode("ascii")
        return encrypted_text
    except Exception as e:
        # log the error if any
        print(e)
        return None


def decrypt(txt):
    try:
        # base64 decode
        txt = base64.urlsafe_b64decode(txt)
        cipher_suite = Fernet(settings.ENCRYPT_KEY)
        decoded_text = cipher_suite.decrypt(txt).decode("ascii")
        return decoded_text
    except Exception as e:
        # log the error
        print(e)
        return None


from django.core.signing import Signer


@register.filter(name="signed")
def signed(txt, id):
    id = id % 26
    temp_text = ""
    for t in txt:
        ch = bytes(t, 'utf-8')
        s = bytes([ch[0] + int(id)])
        s = str(s)
        temp_text += s[2]
    return temp_text


@register.filter(name="unsigned")
def unsigned(txt, id):
    id = id % 26
    temp_text = ""
    for t in txt:
        ch = bytes(t, 'utf-8')
        s = bytes([ch[0] - int(id)])
        s = str(s)
        temp_text += s[2]
    return temp_text
