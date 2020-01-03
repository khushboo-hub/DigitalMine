# from django.shortcuts import render

# Create your views here.
import traceback

from django.contrib.auth.decorators import login_required
from django.urls import reverse
from django.views.decorators.csrf import csrf_protect
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.forms import ModelForm

from .models import Sensor, Arduino, Node, Nodesensor, Sensordata, Wireless, Connection, Sensor_Node, gasModel_auto
from .models import MineDetails
from .forms import NodeForm, SensorForm, ArduinoForm, WirelessForm, Sensor_NodeForm, gasModel_autoForm
import serial
import requests
from background_task import background
from datetime import datetime
from django.utils.html import strip_tags, linebreaks
from accounts.models import profile_extension


## Sensor Details
def sensor_manage(request, arduino_id, template_name='sensor/sensor_manage.html'):
    book = Sensor.objects.filter(arduino_id=arduino_id)

    data = {}
    data['object_list'] = book
    data['arduino_id'] = arduino_id

    mine_table = Arduino.objects.get(id=arduino_id)
    data['mine_name'] = mine_table.arduino_id

    return render(request, template_name, data, {'arduinoid': arduino_id})


def sensor_add(request, arduino_id, template_name='sensor/sensor_add.html'):
    # print(arduino_id)
    mine_table = Arduino.objects.get(id=arduino_id)
    arduino_arduino_id = mine_table.arduino_id

    form = SensorForm(request.POST or None, request.FILES)
    object = Sensor()
    if form.is_valid():
        object.sensorid = request.POST.get("sensorid")
        object.sensorname = request.POST.get("sensorname")
        object.minrange = request.POST.get("minrange")
        object.maxrange = request.POST.get("maxrange")
        object.sensorunit = request.POST.get("sensorunit")
        object.thresholdlimit = request.POST.get("thresholdlimit")
        object.greenlevel = request.POST.get("greenlevel")
        object.yellowlevel = request.POST.get("yellowlevel")
        object.redlevel = request.POST.get("redlevel")
        object.photo = request.FILES.get("photo")
        object.arduino_id = arduino_id
        # form.save()
        object.save()
        return redirect("/sensor/node_manage")
        # return redirect("/sensor/sensor_manage/" + str(arduino_id))
    return render(request, template_name, {'form': form, 'arduinoinfo': arduino_arduino_id, 'arduinoid': arduino_id})


def sensor_edit(request, pk, arduino_id, template_name='sensor/sensor_add.html'):
    book = get_object_or_404(Sensor, pk=pk)
    form = SensorForm(request.POST or None, request.FILES or None, instance=book)
    if form.is_valid():
        form.save()
        return redirect('/sensor/sensor_manage/' + str(arduino_id))
    return render(request, template_name, {'form': form, 'arduinoid': arduino_id})


def sensor_delete(request, arduino_id, pk):
    book = get_object_or_404(Sensor, pk=pk)
    book.delete()
    return redirect("/sensor/sensor_manage/" + str(arduino_id))


def sensor1_manage(request, wireless_id, template_name='sensor/sensor1_manage.html'):
    book = Sensor.objects.filter(wireless_id=wireless_id)
    data = {}
    data['object_list'] = book
    data['wireless_id'] = wireless_id
    return render(request, template_name, data, {'wirelessid': wireless_id})


def sensor1_add(request, wireless_id, template_name='sensor/sensor1_add.html'):
    # print(wireless_id)
    mine_table = Wireless.objects.get(id=wireless_id)
    wireless_name = mine_table.name
    # print(wireless_name)
    form = SensorForm(request.POST or None, request.FILES)
    object = Sensor()
    if form.is_valid():
        object.sensorid = request.POST.get("sensorid")
        object.sensorname = request.POST.get("sensorname")
        object.minrange = request.POST.get("minrange")
        object.maxrange = request.POST.get("maxrange")
        object.sensorunit = request.POST.get("sensorunit")
        object.thresholdlimit = request.POST.get("thresholdlimit")
        object.greenlevel = request.POST.get("greenlevel")
        object.yellowlevel = request.POST.get("yellowlevel")
        object.redlevel = request.POST.get("redlevel")
        object.photo = request.FILES.get("photo")
        object.wireless_id = wireless_id
        # form.save()
        object.save()
        # return redirect("/sensor/sensor1_manage/" + str(wireless_id))
        return redirect("/sensor/node_manage")
    return render(request, template_name, {'form': form, 'wirelessname': wireless_name, 'wirelessid': wireless_id})


def sensor1_edit(request, pk, wireless_id, template_name='sensor/sensor1_add.html'):
    book = get_object_or_404(Sensor, pk=pk)
    form = SensorForm(request.POST or None, request.FILES or None, instance=book)
    if form.is_valid():
        form.save()
        return redirect('/sensor/sensor1_manage/' + str(wireless_id))
    return render(request, template_name, {'form': form, 'wirelessid': wireless_id})


def sensor1_delete(request, wireless_id, pk):
    book = get_object_or_404(Sensor, pk=pk)
    book.delete()
    return redirect("/sensor/sensor1_manage/" + str(wireless_id))


# def manage_mining_shift(request,mine_id,template_name='mine/manage_mining_shift.html'):
#     book = MineShift.objects.filter(mine_id=mine_id)
#     data = {}
#     data['object_list'] = book
#     data['mine_id']=mine_id
#
#     mine_table=MineDetails.objects.get(id=mine_id)
#     data['mine_name']=mine_table.name
#     return render(request, template_name, data)


##Arduino Details
def arduino_manage(request, node_id, template_name='arduino/arduino_manage.html'):
    book = Arduino.objects.filter(node_id=node_id)
    data = {}
    data['object_list'] = book
    data['node_id'] = node_id

    mine_table = Node.objects.get(id=node_id)
    data['node_name'] = mine_table.name
    data['node_mine_id'] = mine_table.mine_id
    return render(request, template_name, data, {'nodeid': node_id})


# ************************************************************************

def arduino_edit(request, pk, node_id, template_name='arduino/arduino_add.html'):
    book = get_object_or_404(Arduino, pk=pk)
    form = ArduinoForm(request.POST or None, request.FILES or None, instance=book)
    if form.is_valid():
        form.save()
        return redirect("/sensor/arduino_manage/" + str(node_id))
    return render(request, template_name, {'form': form, 'nodeid': node_id})


def arduino_delete(request, pk, node_id):
    book = get_object_or_404(Arduino, pk=pk)
    book.delete()
    return redirect('/sensor/arduino_manage/' + str(node_id))


def arduino_connection(request, template_name='arduino/arduino_connection.html'):
    objectlist = Arduino.objects.order_by('type')
    # form = ArduinoForm(request.POST or None , request.FILES)
    # if form.is_valid():
    #      form.save()
    # return redirect('sensor:arduino_manage')
    return render(request, template_name, {'objectlist': objectlist})
    # return render(request, template_name, {'form':form})


def choose_connection(request, template_name='arduino/choose_connection.html'):
    return render(request, template_name)


# class SensordataForm(ModelForm):
#     class Meta:
#         model = Sensordata
#         fields = ['value', 'date']

def arduino_getdata(request, arduino_dd):
    # arduino_id = request.POST.get("arduino_id")
    table_data = Arduino.objects.values_list().filter(id=arduino_dd)[0]
    # print(arduino_dd)
    # print(table_data)
    a = table_data[5]
    b = table_data[6]
    # print(a, b)
    try:
        while True:
            sr = serial.Serial(a, b)
            st = list(str(sr.readline(), 'utf-8'))
            sr.close()
            ard_data = str(''.join(st[:]))
            dataArray = ard_data.split(',')
            print(dataArray)
            f = Sensordata()
            f.temp = dataArray[0]
            f.pressure = dataArray[1]
            # f.save()
            # return HttpResponse(str(ard_data))
    except:
        tb = traceback.format_exc()
        return HttpResponse(tb)
    # print ('%s (%s)' % (e.message, type(e)))

    # return HttpResponse("e")


# return HttpResponse( "ASDF")


#
#
# def getsensordata(request):
#     # table_data=Arduino.objects.values_list()[0]
#     #table_data = Storedata.objects.filter(value="portno")
#     # for x in table_data:
#     #     port_no=[0]
#     #     baud_rate=[0]
#     # sr = serial.Serial(port_no, baud_rate
#     # st = list(str(sr.readline(), 'utf-8'))
#     # sr.close()
#     # ard_data=str(''.join(st[:]))
#     # f=Storedata()
#     # f.modelno=ard_data
#     # f.save()
#     return HttpResponse()


##Wireless Info Details

def wireless_manage(request, node_id, template_name='wireless/wireless_manage.html'):
    book = Wireless.objects.filter(node_id=node_id)
    data = {}
    data['object_list'] = book
    data['node_id'] = node_id

    mine_table = Node.objects.get(id=node_id)
    # data['mine_name'] = mine_table.name
    data['node_name'] = mine_table.name
    data['node_mine_id'] = mine_table.mine_id
    return render(request, template_name, data, {'nodeid': node_id})


def wireless_add(request, node_id, template_name='wireless/wireless_add.html'):
    form = WirelessForm(request.POST or None, request.FILES)
    mine_table = Node.objects.get(id=node_id)
    node_name = mine_table.name
    node_mine_id = mine_table.mine_id
    # print(node_name)
    object = Wireless()
    if form.is_valid():
        object.ipaddress = request.POST.get("ipaddress")
        object.name = request.POST.get("name")
        object.node_id = node_id
        # print(request.POST)
        # print(object)
        object.save()
        # form.save()
        return redirect('/sensor/wireless_manage/' + str(node_id))
    return render(request, template_name,
                  {'form': form, 'nodename': node_name, 'nodeid': node_id, 'nodemineid': node_mine_id})


def wireless_edit(request, pk, node_id, template_name='wireless/wireless_add.html'):
    book = get_object_or_404(Wireless, pk=pk)
    form = WirelessForm(request.POST or None, request.FILES or None, instance=book)
    if form.is_valid():
        form.save()
        return redirect('/sensor/wireless_manage/' + str(node_id))
    return render(request, template_name, {'form': form, 'nodeid': node_id})


def wireless_delete(request, node_id, pk):
    book = get_object_or_404(Wireless, pk=pk)
    book.delete()
    return redirect("/sensor/wireless_manage/" + str(node_id))


## Node Details

@login_required
def node_add(request, template_name='node/node_add.html'):

    current_user = request.user
    profile = get_object_or_404(profile_extension, user_id=current_user.id)
    form = NodeForm(initial={'mine_id': profile.mine_id.id})  
    if current_user.is_superuser:
        book = Node.objects.all()
    else:
        book = Node.objects.filter(mine_id=profile.mine_id.id)
    if request.method == "POST":
        form = NodeForm(request.POST or None, request.FILES)
        # print("+++++++++++++++++")
        # print(form)
        # if(request.POST):
        #     print(request.POST)
        # else:
        #     print("nr")
        if form.is_valid():
            form.save()
            return redirect(reverse('sensor:node_add') + '?' + 'result=success')

    return render(request, template_name, {'form': form, 'object_list': book})


@csrf_protect
@login_required
def node_manage(request, pk, template_name='node/node_manage.html'):
    book = get_object_or_404(Node, pk=pk)
    books = Node.objects.all()
    form = NodeForm(request.POST or None, request.FILES or None, instance=book)
    if form.is_valid():
        try:
            form.save()

            return redirect(reverse('sensor:node_add') + '?err=err')
        except Exception as e:
            # print(e)
            return render(request, template_name, {'form': form, 'object_list': books, 'pk': pk})
    return render(request, template_name, {'form': form, 'object_list': books, 'pk': pk})
    # book = Node.objects.all()
    # data = {}
    # data['object_list'] = book
    # return render(request, template_name, data)


@csrf_protect
@login_required
def node_edit(request):
    response_data = {}
    if request.is_ajax():
        if request.method == 'POST':

            pk = request.POST.get('pk')
            # formData=request.POST.get('formData')
            # print(formData)
            # book = get_object_or_404(Node, pk=pk)
            # print(book)

            form = NodeForm(data=request.POST, files=request.FILES, instance=pk)
            # print(form)
            # print(form.errors)
            if form.is_valid():
                print('form is valid')
                try:

                    form.save()
                    #
                    response_data['success'] = "Router Updated Successfully!!"
                    #  response_data['book']=serializers.serialize('json', TrackingRouter.objects.filter(pk=tracking_router_inst.pk), fields=('mine_id','router_id','address','location','is_block','x_axis','y_axis','is_blocked','ip_add'))
                    return JsonResponse(response_data)
                except:
                    response_data['error'] = "Router Already Available!"
                    return JsonResponse(response_data)
            else:
                print('form is not valid')
    else:
        response_data['error'] = "Something Went Wrong!"
        return JsonResponse(response_data)

        # mine = request.POST.get('mine')
        # node_id = str(request.POST.get('node_id'))
        # node_name=str(request.POST.get('node_name'))
        # location = str(request.POST.get('location'))
        # x_axis = request.POST.get('x_axis')
        # y_axis = request.POST.get('y_axis')
        # photo1 = request.FILES.getlist('photo1')
        # print(photo1)
        # photo2 = request.FILES.getlist('photo2')
        # description = request.POST.get('description')
        #
        # node_inst = get_object_or_404(Node, pk=pk)
        # node_inst.x_axis = x_axis
        # node_inst.y_axis = y_axis
        # node_inst.mine_id_id = mine
        # node_inst.location = location
        # node_inst.name = node_name
        # node_inst.nodeid = node_id
        # node_inst.photo1 = photo1
        # node_inst.photo2 = photo2
        # node_inst.description = description

        # try:
        #     node_inst.save()
        #     response_data['success'] = "Router Updated Successfully!!"
        #     #  response_data['book']=serializers.serialize('json', TrackingRouter.objects.filter(pk=tracking_router_inst.pk), fields=('mine_id','router_id','address','location','is_block','x_axis','y_axis','is_blocked','ip_add'))
        #     return JsonResponse(response_data)
        # except:
        #     response_data['error'] = "Router Already Available!"
        #     return JsonResponse(response_data)
    # else:
    #     response_data['error'] = "Something Went Wrong!"
    #     return JsonResponse(response_data)


@login_required
def node_delete(request):
    data = {}

    if request.is_ajax():
        if request.method == 'POST':
            pk = request.POST.get('id')
            # print(pk)
            try:
                book = Node.objects.get(pk=pk)
                # print(book)
                book.delete()
                data['success'] = "Router Deteled Successfully!"
                return JsonResponse(data)
            except Node.DoesNotExist:
                data['error'] = "Something Went Wrong!"
                print('Error')
                return JsonResponse(data)
    data['error'] = "Something Went Wrong!"
    return JsonResponse(data)


# def node_delete(request, pk):
#     book= get_object_or_404(Node, pk=pk)
#     mine_table = Node.objects.get(pk=pk)
#     node_id1 = mine_table.id
#     book1 = Sensor_Node.objects.filter(node_id=node_id1)
#     book.delete()
#     book1.delete()
#     return redirect("sensor:node_manage")

## Mine map with nodes

def load_map(request):
    data = {}
    if request.POST:
        mine_id = request.POST.get("mine_id")
        mine_data = MineDetails.objects.values_list().filter(id=mine_id)[0]
        data['mine_data'] = mine_data
        routers = TrackingRouter.objects.values_list().filter(mine_id_id=mine_id)
        data['routers'] = routers
    mine_table = MineDetails.objects.all()
    data['object_list'] = mine_table
    # print(data)
    return render(request, "sensor/load_map.html", data)


## Sensor node888888888888888888888888888888888888888888888888888888888888888888888888888
# def node_edit(request, pk, template_name='node/node_add.html'):
# def node_edit(request, pk, template_name='node/node_add.html'):
#     book = get_object_or_404(Node, pk=pk)
#     form = NodeForm(request.POST or None, request.FILES or None, instance=book)
#     if form.is_valid():
#         form.save()
#         return redirect('sensor:node_manage')
#     return render(request, template_name, {'form': form})

def manage_sensor(request, mine_id, node_id, template_name='Sensor_Node/manage_sensor.html'):
    current_user = request.user
    profile = get_object_or_404(profile_extension, user_id=current_user.id)
    if current_user.is_superuser:
        book = Sensor_Node.objects.filter(mine_id=mine_id,node_id=node_id)
        # print(book)
    else:
        book = Sensor_Node.objects.filter(mine_id=profile.mine_id.id, node_id=node_id)
    data = {}
    data['object_list'] = book
    data['node_id'] = node_id

    mine_table = Node.objects.get(id=node_id)
    data['node_name1'] = mine_table.name
    node_mine_id = mine_table.mine_id_id
    data['node_id']=node_id
    mine_table1 = MineDetails.objects.get(id=node_mine_id)
    data['mine_name1'] = mine_table1.name
    data['mine']=mine_table1.id
    return render(request, template_name, data)


def arduino_add(request, node_id, template_name='arduino/arduino_add.html'):
    # print(node_id)
    mine_table = Node.objects.get(id=node_id)

    node_name = mine_table.name
    node_mine_id = mine_table.mine_id
    form = ArduinoForm(request.POST or None, request.FILES)
    object = Arduino()
    if form.is_valid():
        print("form is valid")
        object.arduino_id = request.POST.get("arduino_id")
        object.type = request.POST.get("type")
        object.noofsensors = request.POST.get("noofsensors")
        object.port_no = request.POST.get("port_no")
        object.baudrate = request.POST.get("baudrate")
        object.photo = request.FILES.get("photo")
        object.node_id = node_id
        # print(request.POST)
        # print(object)
        object.save()
        # return redirect('/employee1/manage_mining_shift/' + str(mine_id))
        # object.save()
        return redirect('/sensor/arduino_manage/' + str(node_id))
    return render(request, template_name,
                  {'form': form, 'nodename': node_name, 'nodeid': node_id, 'nodemineid': node_mine_id})


def add_sensor(request,mine_id, node_id, template_name='Sensor_Node/add_sensor.html'):
    node = Node.objects.get(id=node_id)
    node_name = node.name
    mine = MineDetails.objects.get(pk=mine_id)
    mine_name = mine.name
    form = Sensor_NodeForm(request.POST or None, request.FILES)

    if form.is_valid():
        SensorModel = form.save(commit=False)
        SensorModel.node_id = node
        SensorModel.mine_id = mine
        SensorModel.save()
        return redirect('/sensor/manage_sensor/' + str(mine_id) + '/' + str(node_id))
    else:
        print("&&&&&&&&&")
    # print(node_name)
    return render(request, template_name,
                  {'form': form, 'nodename': node_name, 'nodeid': node_id, 'nodemineid': mine_id,
                   'minename': mine_name,'mine':mine_id})


def delete_sensor(request, pk, node_id):
    book = get_object_or_404(Sensor_Node, pk=pk)
    book.delete()
    return redirect('/sensor/manage_sensor/' + str(node_id))


def edit_sensor(request, pk, node_id, template_name='Sensor_Node/add_sensor.html'): #pk is Sensor Id of a node, node_id=> id the of wirelss node
    mine_table = Node.objects.get(id=node_id)
    node_name = mine_table.name
    node_mine_id = mine_table.mine_id_id
    mine_table1 = MineDetails.objects.get(id=node_mine_id)
    mine_name = mine_table1.name
    book = get_object_or_404(Sensor_Node, pk=pk)
    form = Sensor_NodeForm(request.POST or None, request.FILES or None, instance=book)
    # object = Sensor_Node(pk=pk)

    if form.is_valid():
        form.save()
        # object.sensorid = request.POST.get("sensorid")
        # object.ip_add = request.POST.get("ip_add")
        # object.sensorname = request.POST.get("sensorname")
        # object.sensorunit = request.POST.get("sensorunit")
        # object.thresholdlimit = request.POST.get("thresholdlimit")
        # object.sensorunit1 = request.POST.get("sensorunit1")
        # object.sensorunit2 = request.POST.get("sensorunit2")
        # object.sensorunit3 = request.POST.get("sensorunit3")
        # object.sensormsg1 = request.POST.get("sensormsg1")
        # object.sensormsg2 = request.POST.get("sensormsg2")
        # object.sensormsg3 = request.POST.get("sensormsg3")
        # object.greenlevel = request.POST.get("greenlevel")
        # object.yellowlevel = request.POST.get("yellowlevel")
        # object.redlevel = request.POST.get("redlevel")
        # object.description = request.POST.get("description")
        # object.save()
        return redirect('/sensor/manage_sensor/' +str(node_mine_id) +"/"+ str(node_id))
    return render(request, template_name,
                  {'form': form, 'nodename': node_name, 'nodeid': node_id, 'nodemineid': node_mine_id,
                   'minename': mine_name, 'mine': node_mine_id})


# def add_id(request,pk )
##88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
# Code for Nodesensor

class NodesensorForm(ModelForm):
    class Meta:
        model = Nodesensor
        fields = ['id', 'name', 'sensorid', 'nodesensorname', 'thresholdvalue', 'alertcolourpriority', 'description']


def nodesensor_manage(request, template_name='nodesensor/nodesensor_manage.html'):
    book = Nodesensor.objects.all()
    data = {}
    data['object_list'] = book
    return render(request, template_name, data)


def nodesensor_add(request, template_name='nodesensor/nodesensor_add.html'):
    form = NodesensorForm(request.POST or None, request.FILES)
    if form.is_valid():
        form.save()
        return redirect('sensor:nodesensor_manage')
    return render(request, template_name, {'form': form})


def nodesensor_edit(request, pk, template_name='nodesensor/nodesensor_add.html'):
    book = get_object_or_404(Nodesensor, pk=pk)
    form = NodesensorForm(request.POST or None, request.FILES or None, instance=book)
    if form.is_valid():
        form.save()
        return redirect('sensor:nodesensor_manage')
    return render(request, template_name, {'form': form})


def nodesensor_delete(request, pk):
    book = get_object_or_404(Nodesensor, pk=pk)
    book.delete()
    return redirect("sensor:nodesensor_manage")


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

class ConnectionForm(ModelForm):
    class Meta:
        model = Node
        fields = ['mine_id']


def connection_manage(request, template_name='connection/connection_manage.html'):
    # book = Nodesensor.objects.all()
    # data = {}
    # data['object_list'] = book
    # return render(request, template_name, data)

    connection_table = Connection.objects.values_list()
    data = {}  ##data = {}
    prepared_data = []
    r = 0
    for i in connection_table:
        connect_id = Connection.objects.get(id=str(i[0]))
        mine_table = MineDetails.objects.get(
            id=str(i[1]))  # 3 means :mine_id (mine_id is refferenced to connection table)
        node_table = Node.objects.get(id=str(i[2]))
        connect_type = (str(i[3]))
        # print(connect_type)
        prepared_data.append([])
        # prepared_data[r].append(mine_table.name)
        # prepared_data[r].append(node_table.nodeid)
        # r = r+1
        # print(i)
        if (i[3] == 'wired'):
            arduino_table = Arduino.objects.get(id=str(i[4]))
            # prepared_data.append([])
            prepared_data[r].append(connect_id.id)
            prepared_data[r].append(mine_table.name)
            prepared_data[r].append(node_table.nodeid)
            prepared_data[r].append(connect_type)
            prepared_data[r].append(arduino_table.arduino_id)
            prepared_data[r].append('----')
            prepared_data[r].append(arduino_table.port_no)
            prepared_data[r].append('----')

            # r = r+1
            # print(arduino_table)
            # print(prepared_data)
        else:
            wireless_table = Wireless.objects.get(id=str(i[5]))
            # prepared_data.append([])
            prepared_data[r].append(connect_id.id)
            prepared_data[r].append(mine_table.name)
            prepared_data[r].append(node_table.nodeid)
            prepared_data[r].append(connect_type)
            prepared_data[r].append('-----')
            prepared_data[r].append(wireless_table.name)
            prepared_data[r].append('-----')
            prepared_data[r].append(wireless_table.ipaddress)

            # r = r+1
        r = r + 1
    # print(prepared_data)
    # print(wireless_table)
    data['object_list'] = prepared_data  ##data['object_list'] = book
    # print(data)
    return render(request, template_name, data)
    # return HttpResponse('Ok....')


def connection_add(request, template_name='connection/connection_add.html'):
    form = ConnectionForm(request.POST or None, request.FILES)
    # if form.is_valid():
    #     form.save()
    # return redirect('sensor:connection_manage')
    return render(request, template_name, {'form': form})


def connection_edit(request, pk, template_name='connection/connection_add.html'):
    connection_table = get_object_or_404(Connection, pk=pk)
    form = ConnectionForm(request.POST or None, request.FILES or None, instance=connection_table)
    if form.is_valid():
        form.save()
        return redirect('sensor:connection_save')
    return render(request, template_name, {'form': form})


def connection_delete(request, pk):
    connection_table = get_object_or_404(Connection, pk=pk)
    connection_table.delete()
    return redirect("sensor:connection_manage")


def fetch_node(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        node_info = Node.objects.values_list().filter(mine_id=mine_id)

        data = {}
        i = 0
        node_data = []
        for r in node_info:
            node_data.append(str(r[0]) + ',' + str(r[2]))
            i = i + 1
            data['result'] = node_data
    else:
        data['result'] = "Something Wen't Wrong!"

    return JsonResponse(data)


def fetch_arduino(request):
    data = {}
    if request.is_ajax():
        node_id = request.GET.get('id', None)
        arduino_info = Arduino.objects.values_list().filter(node_id=node_id)

        data = {}
        i = 0
        arduino_data = []
        for r in arduino_info:
            arduino_data.append(str(r[0]) + ',' + str(r[2]))
            i = i + 1
            data['result'] = arduino_data
    else:
        data['result'] = "Something Wen't Wrong!"

    return JsonResponse(data)


def fetch_wireless(request):
    data = {}
    if request.is_ajax():
        node_id = request.GET.get('id', None)
        wireless_info = Wireless.objects.values_list().filter(node_id=node_id)

        data = {}
        i = 0
        wireless_data = []
        for r in wireless_info:
            wireless_data.append(str(r[1]) + ',' + str(r[3]))
            i = i + 1
            data['result'] = wireless_data
    else:
        data['result'] = "Something went wrong!"

    return JsonResponse(data)


def fetch_port(request):
    data = {}
    if request.is_ajax():
        arduino_id = request.GET.get('id', None)
        port_info = Arduino.objects.values_list().filter(id=arduino_id)
        data = {}
        i = 0
        port_data = []
        for r in port_info:
            port_data.append(str(r[0]) + ',' + str(r[5]))
            i = i + 1
            data['result'] = port_data
    else:
        data['result'] = "Something went wrong!"

    return JsonResponse(data)


def fetch_ip(request):
    data = {}
    if request.is_ajax():
        wireless_id = request.GET.get('id', None)
        ip_info = Wireless.objects.values_list().filter(id=wireless_id)
        data = {}
        i = 0
        ip_data = []
        for r in ip_info:
            ip_data.append(str(r[0]) + ',' + str(r[2]))
            i = i + 1
            data['result'] = ip_data
    else:
        data['result'] = "Something went wrong!"

    return JsonResponse(data)


def save_connection(request, template_name='connection/connection_manage.html'):
    object = Connection()

    object.mine_id = request.POST.get("mine_id")
    object.node_id = request.POST.get("node_id")
    object.type = request.POST.get("type")
    object.arduino_id = request.POST.get("arduino_id")
    object.wireless_id = request.POST.get("wireless_id")
    # print(request.POST)
    # print(object.mine_id)
    object.save()
    # form.save()
    return redirect('sensor:connection_manage')
    # return render(request,template_name)

    # print(request.POST)

    # return HttpResponse("ok")


# Recieve continuous data wirelessly
@background(schedule=5)
def getsensordata(ip, mine_id, node_id, gas_name):
    print("##############")
    try:
        object = gasModel_auto()
        wireless_data = requests.get('http://' + str(ip))
        # print(wireless_data)
        wirelessString = wireless_data.text  # read the line of text from the serial port
        # print(wirelessString)

        object.mine_id = mine_id
        object.node_id = node_id
        object.gas_value = wirelessString
        object.gas_name = gas_name

    except Exception as x:
        pass
    object.save()


def background_view(request, pk, template_name='node/node_manage.html'):
    book = Node.objects.all()
    data = {}
    data['object_list'] = book
    node_details = Sensor_Node.objects.values_list().filter(node_id=pk)
    print("*************")
    # print(node_details)
    for r in node_details:
        mine_id = str(r[1])
        node_id = str(r[2])
        gas_name = str(r[5])
        try:
            ip = str(r[3])

            if (ip != 'NULL'):
                # print(ip)
                getsensordata(ip, mine_id, node_id, gas_name, repeat=1)
                print("Hi..............")
        except:
            pass

    return render(request, template_name, data)


@login_required
def live_data_tabular(request, template_name='live_data/live_data_tabular.html'):
    form = NodeForm(request.POST)

    return render(request, template_name, {'form': form})

import random
@login_required
def iframe_live_data(request,mine_id, node_id,sensor_id, template_name='live_data/iframe_live_data.html'):
    data={}
    if request.is_ajax():
        try:
           wireless_node=get_object_or_404(Sensor_Node,pk=sensor_id,mine_id=mine_id,node_id=node_id)
           ipAdd=wireless_node.ip_add
           print('Ip Adderss',ipAdd)
           response = requests.get('http://' + ipAdd)
           data['result']=strip_tags(response.text)
        except Exception as e:
            print(e)
            data['result']='Network Error'
        return JsonResponse(data)

    return render(request,template_name)

#########demo
def background_data(request):
    live = gasModel_auto.objects.values_list()
    # print(live)

    return render(request)


def fetch_mine_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        node_details = Node.objects.values_list().filter(mine_id_id=mine_id)
        # print(node_details)
        data = {}
        i = 0
        node_data = []
        for r in node_details:
            node_data.append(str(r[0]) + ',' + str(r[3]))
            i = i + 1
        data['result'] = node_data
        print("############")
        # print(data)
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_sensor_values_ajax_p(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_data1 = []

        node_id2 = request.GET.get('id', None)
        sensor_details = Sensor_Node.objects.values_list().filter(node_id=node_id2)
        # print(sensor_details)

        for r1 in sensor_details:
            location_details1 = str(r1[2])
            mine_details = str(r1[1])

        location_details = Node.objects.get(id=location_details1)
        mine_details = MineDetails.objects.get(id=mine_details)
        now = datetime.now()
        ok_date = (str(now.strftime('%Y-%m-%d %H:%M:%S')))
        sensor_data.append(ok_date)
        sensor_data.append(str(mine_details.name))
        sensor_data.append(str(location_details.name))

        for r in sensor_details:
            try:
                ip_add = str(r[3])
                sensor_name = str(r[5])
                unit = str(r[6])
                sensorunit1 = str(r[8])
                sensorunit2 = str(r[9])
                sensorunit3 = str(r[10])
                green = str(r[14])
                yellow = str(r[15])
                red = str(r[16])
                response = requests.get('http://' + ip_add)

                if (sensor_name == "CH4"):
                    CH4 = strip_tags(response.text)
                    if (int(CH4) < int(sensorunit1)):
                        sensor_data1.append('#1216f6')
                        sensor_data.append(str(CH4 + ' ' + unit))
                    elif ((int(CH4) >= int(sensorunit1)) & (int(CH4) < int(sensorunit2))):
                        sensor_data1.append(str(green))
                        sensor_data.append(str(CH4 + ' ' + unit))
                    elif ((int(CH4) >= int(sensorunit2)) & (int(CH4) < int(sensorunit3))):
                        sensor_data1.append(str(yellow))
                        sensor_data.append(str(CH4 + ' ' + unit))
                    else:
                        sensor_data1.append(str(red))
                        sensor_data.append(str(CH4 + ' ' + unit))
                    # sensor_data.append(sensor_name)

                elif (sensor_name == "CO"):
                    CO = strip_tags(response.text)
                    if (int(CO) < int(sensorunit1)):
                        sensor_data1.append('#1216f6')
                        sensor_data.append(str(CO + ' ' + unit))
                    elif ((int(CO) >= int(sensorunit1)) & (int(CO) < int(sensorunit2))):
                        sensor_data1.append(str(green))
                        sensor_data.append(str(CO + ' ' + unit))
                    elif ((int(CO) >= int(sensorunit2)) & (int(CO) < int(sensorunit3))):
                        sensor_data1.append(str(yellow))
                        sensor_data.append(str(CO + ' ' + unit))
                    else:
                        sensor_data1.append(str(red))
                        sensor_data.append(str(CO + ' ' + unit))

                    # sensor_data.append(sensor_name)

                elif (sensor_name == "CO2"):
                    CO2 = strip_tags(response.text)
                    if (int(CO2) < int(sensorunit1)):
                        sensor_data1.append('#1216f6')
                        sensor_data.append(str(CO2 + ' ' + unit))
                    elif ((int(CO2) >= int(sensorunit1)) & (int(CO2) < int(sensorunit2))):
                        sensor_data1.append(str(green))
                        sensor_data.append(str(CO2 + ' ' + unit))
                    elif ((int(CO2) >= int(sensorunit2)) & (int(CO2) < int(sensorunit3))):
                        sensor_data1.append(str(yellow))
                        sensor_data.append(str(CO2 + ' ' + unit))
                    else:
                        sensor_data1.append(str(red))
                        sensor_data.append(str(CO2 + ' ' + unit))
                elif (sensor_name == "O2"):
                    O2 = strip_tags(response.text)
                    if (int(O2) < int(sensorunit1)):
                        sensor_data1.append('#1216f6')
                        sensor_data.append(str(O2 + ' ' + unit))
                    elif ((int(O2) >= int(sensorunit1)) & (int(O2) < int(sensorunit2))):
                        sensor_data1.append(str(green))
                        sensor_data.append(str(O2 + ' ' + unit))
                    elif ((int(O2) >= int(sensorunit2)) & (int(O2) < int(sensorunit3))):
                        sensor_data1.append(str(yellow))
                        sensor_data.append(str(O2 + ' ' + unit))
                    else:
                        sensor_data1.append(str(red))
                        sensor_data.append(str(O2 + ' ' + unit))
                elif (sensor_name == "H2S"):
                    H2S = strip_tags(response.text)
                    if (int(H2S) < int(sensorunit1)):
                        sensor_data1.append('#1216f6')
                        sensor_data.append(str(H2S + ' ' + unit))
                    elif ((int(H2S) >= int(sensorunit1)) & (int(H2S) < int(sensorunit2))):
                        sensor_data1.append(str(green))
                        sensor_data.append(str(H2S + ' ' + unit))
                    elif ((int(H2S) >= int(sensorunit2)) & (int(H2S) < int(sensorunit3))):
                        sensor_data1.append(str(yellow))
                        sensor_data.append(str(H2S + ' ' + unit))
                    else:
                        sensor_data1.append(str(red))
                        sensor_data.append(str(H2S + ' ' + unit))
                elif (sensor_name == "NO2"):
                    NO2 = strip_tags(response.text)
                    if (int(NO2) < int(sensorunit1)):
                        sensor_data1.append('#1216f6')
                        sensor_data.append(str(NO2 + ' ' + unit))
                    elif ((int(NO2) >= int(sensorunit1)) & (int(NO2) < int(sensorunit2))):
                        sensor_data1.append(str(green))
                        sensor_data.append(str(NO2 + ' ' + unit))
                    elif ((int(NO2) >= int(sensorunit2)) & (int(NO2) < int(sensorunit3))):
                        sensor_data1.append(str(yellow))
                        sensor_data.append(str(NO2 + ' ' + unit))
                    else:
                        sensor_data1.append(str(red))
                        sensor_data.append(str(NO2 + ' ' + unit))
                elif (sensor_name == "SO2"):
                    SO2 = strip_tags(response.text)
                    if (int(SO2) < int(sensorunit1)):
                        sensor_data1.append('#1216f6')
                        sensor_data.append(str(SO2 + ' ' + unit))
                    elif ((int(SO2) >= int(sensorunit1)) & (int(SO2) < int(sensorunit2))):
                        sensor_data1.append(str(green))
                        sensor_data.append(str(SO2 + ' ' + unit))
                    elif ((int(SO2) >= int(sensorunit2)) & (int(SO2) < int(sensorunit3))):
                        sensor_data1.append(str(yellow))
                        sensor_data.append(str(SO2 + ' ' + unit))
                    else:
                        sensor_data1.append(str(red))
                        sensor_data.append(str(SO2 + ' ' + unit))
                elif (sensor_name == "H2"):
                    H2 = strip_tags(response.text)
                    if (int(H2) < int(sensorunit1)):
                        sensor_data1.append('#1216f6')
                        sensor_data.append(str(H2 + ' ' + unit))
                    elif ((int(H2) >= int(sensorunit1)) & (int(H2) < int(sensorunit2))):
                        sensor_data1.append(str(green))
                        sensor_data.append(str(H2 + ' ' + unit))
                    elif ((int(H2) >= int(sensorunit2)) & (int(H2) < int(sensorunit3))):
                        sensor_data1.append(str(yellow))
                        sensor_data.append(str(H2 + ' ' + unit))
                    else:
                        sensor_data1.append(str(red))
                        sensor_data.append(str(H2 + ' ' + unit))
                else:
                    He = strip_tags(response.text)
                    if (int(He) < int(sensorunit1)):
                        sensor_data1.append('#1216f6')
                        sensor_data.append(str(He + ' ' + unit))
                    elif ((int(He) >= int(sensorunit1)) & (int(He) < int(sensorunit2))):
                        sensor_data1.append(str(green))
                        sensor_data.append(str(He + ' ' + unit))
                    elif ((int(He) >= int(sensorunit2)) & (int(He) < int(sensorunit3))):
                        sensor_data1.append(str(yellow))
                        sensor_data.append(str(He + ' ' + unit))
                    else:
                        sensor_data1.append(str(red))
                        sensor_data.append(str(He + ' ' + unit))
            except Exception as x:
                sensor_data.append('Network Error')
                sensor_data1.append('Network Error')

        data['result'] = sensor_data
        data['result1'] = sensor_data1
        # print(data)

    else:
        data['result'] = "Not Ajax"
        data['heading'] = "Not Ajax"
    return JsonResponse(data)


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


def fetch_sensor_ajax(request):
    data = {}
    if request.is_ajax():
        node_id1 = request.GET.get('id', None)
        node_details = Sensor_Node.objects.values_list().filter(node_id=node_id1)
        # print(node_details)
        data = {}
        node_data = []

        for r in node_details:
            node_data.append(str(r[0]) + ',' + str(r[5]))

        data['result'] = node_data
        # print("############")
        # print(data)
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_sensor_values_ajax(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_data1 = []
        sensor_data2 = []
        sensor_id = request.GET.get('id', None)
        sensor_details = Sensor_Node.objects.get(id=sensor_id)
        # print(sensor_details)
        now = datetime.now()
        ok_date = (str(now.strftime('%Y-%m-%d %H:%M:%S')))
        try:
            response = requests.get('http://' + str(sensor_details.ip_add))
            # print(sensor_details.ip_add)
            sensor_val = strip_tags(response.text)
            if (int(sensor_val) < int(sensor_details.sensorunit1)):
                sensor_data1.append('#1216f6')
                sensor_data2.append('Gas condition is normal ')
            elif ((int(sensor_val) >= int(sensor_details.sensorunit1)) & (
                    int(sensor_val) < int(sensor_details.sensorunit2))):
                sensor_data1.append(str(sensor_details.greenlevel))
                sensor_data2.append(str(sensor_details.sensormsg1))
            elif ((int(sensor_val) >= int(sensor_details.sensorunit2)) & (
                    int(sensor_val) < int(sensor_details.sensorunit3))):
                sensor_data1.append(str(sensor_details.yellowlevel))
                sensor_data2.append(str(sensor_details.sensormsg2))
            else:
                sensor_data1.append(str(sensor_details.redlevel))
                sensor_data2.append(str(sensor_details.sensormsg3))
            sensor_data.append(
                ok_date + ',' + str(sensor_details.id) + ',' + str(sensor_details.sensorname) + ',' + str(
                    sensor_details.ip_add) + ',' + str(sensor_details.sensorunit) + ',' + str(sensor_val))


        except Exception as x:
            sensor_data.append(ok_date + ',' + str(sensor_details.id) + ',' + str(
                sensor_details.sensorname) + ',' + str(
                sensor_details.ip_add) + ',' + str(sensor_details.sensorunit) + ',' + "Network Error")

        data['result'] = sensor_data
        data['result1'] = sensor_data1
        data['result2'] = sensor_data2
        # print(data)
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_sensor_ajax_sensor(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_id = request.GET.get('id', None)
        sensor_details = Sensor_Node.objects.get(id=sensor_id)
        # print(sensor_details)
        sensor_data.append(str(sensor_details.id) + ',' + str(sensor_details.sensorname) + ',' + str(
            sensor_details.sensorunit) + ',' + '#1216f6')
        data['result1'] = sensor_data
        # print(data)
    else:
        data['result1'] = "Not Ajax"
    return JsonResponse(data)


def fetch_sensor_values_all_ajax(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_id = request.GET.get('id', None)
        sensor_details = Sensor_Node.objects.values_list().filter(node_id=sensor_id)
        # print(sensor_details)
        # now = datetime.now()
        # ok_date = (str(now.strftime('%Y-%m-%d %H:%M:%S')))
        # sensor_data.append(ok_date)
        for r in sensor_details:
            try:
                ip_add = str(r[3])
                sensor_name = str(r[5])
                response = requests.get('http://' + ip_add)

                if (sensor_name == "CH4"):
                    CH4 = strip_tags(response.text)
                    sensor_data.append(sensor_name)
                    # sensor_data.append(str(CH4))
                elif (sensor_name == "CO"):
                    CO = strip_tags(response.text)
                    sensor_data.append(sensor_name)
                    # sensor_data.append(str(CO))
                elif (sensor_name == "CO2"):
                    CO2 = strip_tags(response.text)
                    sensor_data.append(sensor_name)
                    # sensor_data.append(str(CO2))
                elif (sensor_name == "O2"):
                    O2 = strip_tags(response.text)
                    sensor_data.append(sensor_name)
                    # sensor_data.append(str(O2))
                elif (sensor_name == "H2S"):
                    H2S = strip_tags(response.text)
                    sensor_data.append(sensor_name)
                    # sensor_data.append(str(H2S))
                elif (sensor_name == "NO2"):
                    NO2 = strip_tags(response.text)
                    sensor_data.append(sensor_name)
                    # sensor_data.append(str(NO2))
                elif (sensor_name == "SO2"):
                    SO2 = strip_tags(response.text)
                    sensor_data.append(sensor_name)
                    # sensor_data.append(str(SO2))
                elif (sensor_name == "H2"):
                    H2 = strip_tags(response.text)
                    sensor_data.append(sensor_name)
                    # sensor_data.append(str(H2))
                else:
                    He = strip_tags(response.text)
                    sensor_data.append(sensor_name)
                    # sensor_data.append(str(He))
            except Exception as x:
                sensor_data.append('Network Error')

        data['result'] = sensor_data
        # print(data)
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_sensor_values_ajax_CH4(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_data1 = []
        sensor_data2 = []
        sensor_data3 = []
        sensor_id = request.GET.get('id', None)
        sensor_id1 = request.GET.get('id1', None)
        sensor_details = Sensor_Node.objects.values_list().filter(node_id=sensor_id)
        # print(sensor_details)
        for r in sensor_details:
            ip_add = str(r[3])
            sensor_name = str(r[5])
            unit = str(r[6])
            sensorunit1 = str(r[8])
            sensorunit2 = str(r[9])
            sensorunit3 = str(r[10])
            green = str(r[14])
            yellow = str(r[15])
            red = str(r[16])
            msg1 = str(r[11])
            msg2 = str(r[12])
            msg3 = str(r[13])
            if (sensor_name == sensor_id1):
                try:
                    response = requests.get('http://' + ip_add)
                    # print(ip_add)
                    sensor_val = strip_tags(response.text)
                    if (int(sensor_val) < int(sensorunit1)):
                        sensor_data3.append('#1216f6')
                        sensor_data2.append('Gas condition is normal ')
                    elif ((int(sensor_val) >= int(sensorunit1)) & (int(sensor_val) < int(sensorunit2))):
                        sensor_data3.append(str(green))
                        sensor_data2.append(str(msg1))
                    elif ((int(sensor_val) >= int(sensorunit2)) & (int(sensor_val) < int(sensorunit3))):
                        sensor_data3.append(str(yellow))
                        sensor_data2.append(str(msg2))
                    else:
                        sensor_data3.append(str(red))
                        sensor_data2.append(str(msg3))
                    sensor_data.append(str(sensor_val))
                    sensor_data1.append(str(sensor_name) + ',' + str(unit))


                except Exception as x:
                    sensor_data.append("Network Error")

        data['result'] = sensor_data
        data['result1'] = sensor_data1
        data['result2'] = sensor_data2
        data['result3'] = sensor_data3
        # print(data)

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_sensor_values_ajax_CO(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_data1 = []
        sensor_data2 = []
        sensor_data3 = []

        sensor_id = request.GET.get('id', None)
        sensor_id1 = request.GET.get('id1', None)
        sensor_details = Sensor_Node.objects.values_list().filter(node_id=sensor_id)
        # print(sensor_details)
        for r in sensor_details:
            ip_add = str(r[3])
            sensor_name = str(r[5])
            unit = str(r[6])
            sensorunit1 = str(r[8])
            sensorunit2 = str(r[9])
            sensorunit3 = str(r[10])
            green = str(r[14])
            yellow = str(r[15])
            red = str(r[16])
            msg1 = str(r[11])
            msg2 = str(r[12])
            msg3 = str(r[13])
            if (sensor_name == sensor_id1):
                try:
                    response = requests.get('http://' + ip_add)
                    # print(ip_add)
                    sensor_val = strip_tags(response.text)
                    if (int(sensor_val) < int(sensorunit1)):
                        sensor_data3.append('#1216f6')
                        sensor_data2.append('Gas condition is normal ')
                    elif ((int(sensor_val) >= int(sensorunit1)) & (int(sensor_val) < int(sensorunit2))):
                        sensor_data3.append(str(green))
                        sensor_data2.append(str(msg1))
                    elif ((int(sensor_val) >= int(sensorunit2)) & (int(sensor_val) < int(sensorunit3))):
                        sensor_data3.append(str(yellow))
                        sensor_data2.append(str(msg2))
                    else:
                        sensor_data3.append(str(red))
                        sensor_data2.append(str(msg3))
                    sensor_data.append(str(sensor_val))
                    sensor_data1.append(str(sensor_name) + ',' + str(unit))


                except Exception as x:
                    sensor_data.append("Network Error")

        data['result'] = sensor_data
        data['result1'] = sensor_data1
        data['result2'] = sensor_data2
        data['result3'] = sensor_data3
        # print(data)

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_sensor_values_ajax_CO2(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_data1 = []
        sensor_data2 = []
        sensor_data3 = []

        sensor_id = request.GET.get('id', None)
        sensor_id1 = request.GET.get('id1', None)
        sensor_details = Sensor_Node.objects.values_list().filter(node_id=sensor_id)
        # print(sensor_details)
        for r in sensor_details:
            ip_add = str(r[3])
            sensor_name = str(r[5])
            unit = str(r[6])
            sensorunit1 = str(r[8])
            sensorunit2 = str(r[9])
            sensorunit3 = str(r[10])
            green = str(r[14])
            yellow = str(r[15])
            red = str(r[16])
            msg1 = str(r[11])
            msg2 = str(r[12])
            msg3 = str(r[13])
            if (sensor_name == sensor_id1):
                try:
                    response = requests.get('http://' + ip_add)
                    # print(ip_add)
                    sensor_val = strip_tags(response.text)
                    if (int(sensor_val) < int(sensorunit1)):
                        sensor_data3.append('#1216f6')
                        sensor_data2.append('Gas condition is normal ')
                    elif ((int(sensor_val) >= int(sensorunit1)) & (int(sensor_val) < int(sensorunit2))):
                        sensor_data3.append(str(green))
                        sensor_data2.append(str(msg1))
                    elif ((int(sensor_val) >= int(sensorunit2)) & (int(sensor_val) < int(sensorunit3))):
                        sensor_data3.append(str(yellow))
                        sensor_data2.append(str(msg2))
                    else:
                        sensor_data3.append(str(red))
                        sensor_data2.append(str(msg3))
                    sensor_data.append(str(sensor_val))
                    sensor_data1.append(str(sensor_name) + ',' + str(unit))


                except Exception as x:
                    sensor_data.append("Network Error")

        data['result'] = sensor_data
        data['result1'] = sensor_data1
        data['result2'] = sensor_data2
        data['result3'] = sensor_data3
        # print(data)

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_sensor_values_ajax_O2(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_data1 = []
        sensor_data2 = []
        sensor_data3 = []
        sensor_id = request.GET.get('id', None)
        sensor_id1 = request.GET.get('id1', None)
        sensor_details = Sensor_Node.objects.values_list().filter(node_id=sensor_id)
        # print(sensor_details)

        for r in sensor_details:
            ip_add = str(r[3])
            sensor_name = str(r[5])
            unit = str(r[6])
            sensorunit1 = str(r[8])
            sensorunit2 = str(r[9])
            sensorunit3 = str(r[10])
            green = str(r[14])
            yellow = str(r[15])
            red = str(r[16])
            msg1 = str(r[11])
            msg2 = str(r[12])
            msg3 = str(r[13])
            if (sensor_name == sensor_id1):
                try:
                    response = requests.get('http://' + ip_add)
                    # print(ip_add)
                    sensor_val = strip_tags(response.text)
                    if (int(sensor_val) < int(sensorunit1)):
                        sensor_data3.append('#1216f6')
                        sensor_data2.append('Gas condition is normal ')
                    elif ((int(sensor_val) >= int(sensorunit1)) & (int(sensor_val) < int(sensorunit2))):
                        sensor_data3.append(str(green))
                        sensor_data2.append(str(msg1))
                    elif ((int(sensor_val) >= int(sensorunit2)) & (int(sensor_val) < int(sensorunit3))):
                        sensor_data3.append(str(yellow))
                        sensor_data2.append(str(msg2))
                    else:
                        sensor_data3.append(str(red))
                        sensor_data2.append(str(msg3))
                    sensor_data.append(str(sensor_val))
                    sensor_data1.append(str(sensor_name) + ',' + str(unit))


                except Exception as x:
                    sensor_data.append("Network Error")

        data['result'] = sensor_data
        data['result1'] = sensor_data1
        data['result2'] = sensor_data2
        data['result3'] = sensor_data3
        # print(data)

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_sensor_values_ajax_H2S(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_data1 = []
        sensor_data2 = []
        sensor_data3 = []
        sensor_id = request.GET.get('id', None)
        sensor_id1 = request.GET.get('id1', None)
        sensor_details = Sensor_Node.objects.values_list().filter(node_id=sensor_id)
        # print(sensor_details)
        for r in sensor_details:
            ip_add = str(r[3])
            sensor_name = str(r[5])
            unit = str(r[6])
            sensorunit1 = str(r[8])
            sensorunit2 = str(r[9])
            sensorunit3 = str(r[10])
            green = str(r[14])
            yellow = str(r[15])
            red = str(r[16])
            msg1 = str(r[11])
            msg2 = str(r[12])
            msg3 = str(r[13])
            if (sensor_name == sensor_id1):
                try:
                    response = requests.get('http://' + ip_add)
                    # print(ip_add)
                    sensor_val = strip_tags(response.text)
                    if (int(sensor_val) < int(sensorunit1)):
                        sensor_data3.append('#1216f6')
                        sensor_data2.append('Gas condition is normal ')
                    elif ((int(sensor_val) >= int(sensorunit1)) & (int(sensor_val) < int(sensorunit2))):
                        sensor_data3.append(str(green))
                        sensor_data2.append(str(msg1))
                    elif ((int(sensor_val) >= int(sensorunit2)) & (int(sensor_val) < int(sensorunit3))):
                        sensor_data3.append(str(yellow))
                        sensor_data2.append(str(msg2))
                    else:
                        sensor_data3.append(str(red))
                        sensor_data2.append(str(msg3))
                    sensor_data.append(str(sensor_val))
                    sensor_data1.append(str(sensor_name) + ',' + str(unit))


                except Exception as x:
                    sensor_data.append("Network Error")

        data['result'] = sensor_data
        data['result1'] = sensor_data1
        data['result2'] = sensor_data2
        data['result3'] = sensor_data3
        # print(data)

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_sensor_values_ajax_NO2(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_data1 = []
        sensor_data2 = []
        sensor_data3 = []
        sensor_id = request.GET.get('id', None)
        sensor_id1 = request.GET.get('id1', None)
        sensor_details = Sensor_Node.objects.values_list().filter(node_id=sensor_id)
        # print(sensor_details)
        for r in sensor_details:
            ip_add = str(r[3])
            sensor_name = str(r[5])
            unit = str(r[6])
            sensorunit1 = str(r[8])
            sensorunit2 = str(r[9])
            sensorunit3 = str(r[10])
            green = str(r[14])
            yellow = str(r[15])
            red = str(r[16])
            msg1 = str(r[11])
            msg2 = str(r[12])
            msg3 = str(r[13])
            if (sensor_name == sensor_id1):
                try:
                    response = requests.get('http://' + ip_add)
                    # print(ip_add)
                    sensor_val = strip_tags(response.text)
                    if (int(sensor_val) < int(sensorunit1)):
                        sensor_data3.append('#1216f6')
                        sensor_data2.append('Gas condition is normal ')
                    elif ((int(sensor_val) >= int(sensorunit1)) & (int(sensor_val) < int(sensorunit2))):
                        sensor_data3.append(str(green))
                        sensor_data2.append(str(msg1))
                    elif ((int(sensor_val) >= int(sensorunit2)) & (int(sensor_val) < int(sensorunit3))):
                        sensor_data3.append(str(yellow))
                        sensor_data2.append(str(msg2))
                    else:
                        sensor_data3.append(str(red))
                        sensor_data2.append(str(msg3))
                    sensor_data.append(str(sensor_val))
                    sensor_data1.append(str(sensor_name) + ',' + str(unit))


                except Exception as x:
                    sensor_data.append("Network Error")

        data['result'] = sensor_data
        data['result1'] = sensor_data1
        data['result2'] = sensor_data2
        data['result3'] = sensor_data3
        # print(data)

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_sensor_values_ajax_SO2(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_data1 = []
        sensor_data2 = []
        sensor_data3 = []
        sensor_id = request.GET.get('id', None)
        sensor_id1 = request.GET.get('id1', None)
        sensor_details = Sensor_Node.objects.values_list().filter(node_id=sensor_id)
        # print(sensor_details)
        for r in sensor_details:
            ip_add = str(r[3])
            sensor_name = str(r[5])
            unit = str(r[6])
            sensorunit1 = str(r[8])
            sensorunit2 = str(r[9])
            sensorunit3 = str(r[10])
            green = str(r[14])
            yellow = str(r[15])
            red = str(r[16])
            msg1 = str(r[11])
            msg2 = str(r[12])
            msg3 = str(r[13])
            if (sensor_name == sensor_id1):
                try:
                    response = requests.get('http://' + ip_add)
                    # print(ip_add)
                    sensor_val = strip_tags(response.text)
                    if (int(sensor_val) < int(sensorunit1)):
                        sensor_data3.append('#1216f6')
                        sensor_data2.append('Gas condition is normal ')
                    elif ((int(sensor_val) >= int(sensorunit1)) & (int(sensor_val) < int(sensorunit2))):
                        sensor_data3.append(str(green))
                        sensor_data2.append(str(msg1))
                    elif ((int(sensor_val) >= int(sensorunit2)) & (int(sensor_val) < int(sensorunit3))):
                        sensor_data3.append(str(yellow))
                        sensor_data2.append(str(msg2))
                    else:
                        sensor_data3.append(str(red))
                        sensor_data2.append(str(msg3))
                    sensor_data.append(str(sensor_val))
                    sensor_data1.append(str(sensor_name) + ',' + str(unit))


                except Exception as x:
                    sensor_data.append("Network Error")

        data['result'] = sensor_data
        data['result1'] = sensor_data1
        data['result2'] = sensor_data2
        data['result3'] = sensor_data3
        # print(data)

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_sensor_values_ajax_H2(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_data1 = []
        sensor_data2 = []
        sensor_data3 = []
        sensor_id = request.GET.get('id', None)
        sensor_id1 = request.GET.get('id1', None)
        sensor_details = Sensor_Node.objects.values_list().filter(node_id=sensor_id)
        # print(sensor_details)
        for r in sensor_details:
            ip_add = str(r[3])
            sensor_name = str(r[5])
            unit = str(r[6])
            sensorunit1 = str(r[8])
            sensorunit2 = str(r[9])
            sensorunit3 = str(r[10])
            green = str(r[14])
            yellow = str(r[15])
            red = str(r[16])
            msg1 = str(r[11])
            msg2 = str(r[12])
            msg3 = str(r[13])
            if (sensor_name == sensor_id1):
                try:
                    response = requests.get('http://' + ip_add)
                    # print(ip_add)
                    sensor_val = strip_tags(response.text)
                    if (int(sensor_val) < int(sensorunit1)):
                        sensor_data3.append('#1216f6')
                        sensor_data2.append('Gas condition is normal ')
                    elif ((int(sensor_val) >= int(sensorunit1)) & (int(sensor_val) < int(sensorunit2))):
                        sensor_data3.append(str(green))
                        sensor_data2.append(str(msg1))
                    elif ((int(sensor_val) >= int(sensorunit2)) & (int(sensor_val) < int(sensorunit3))):
                        sensor_data3.append(str(yellow))
                        sensor_data2.append(str(msg2))
                    else:
                        sensor_data3.append(str(red))
                        sensor_data2.append(str(msg3))
                    sensor_data.append(str(sensor_val))
                    sensor_data1.append(str(sensor_name) + ',' + str(unit))


                except Exception as x:
                    sensor_data.append("Network Error")

        data['result'] = sensor_data
        data['result1'] = sensor_data1
        data['result2'] = sensor_data2
        data['result3'] = sensor_data3
        # print(data)

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def sensor_wise_node(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_data1 = []
        sensor_data2 = []
        sensor_data3 = []
        sensor_data4 = []
        sensor_data5 = []

        sensor_id = request.GET.get('id', None)
        sensor_id1 = request.GET.get('id1', None)
        sensor_details = Sensor_Node.objects.values_list().filter(mine_id=sensor_id1, sensorname=sensor_id)
        # print(sensor_details)
        for r in sensor_details:
            ip_add = str(r[3])
            sensor_name = str(r[5])
            unit = str(r[6])
            sensorunit1 = str(r[8])
            sensorunit2 = str(r[9])
            sensorunit3 = str(r[10])
            green = str(r[14])
            yellow = str(r[15])
            red = str(r[16])
            msg1 = str(r[11])
            msg2 = str(r[12])
            msg3 = str(r[13])
            sensor_data1.append(sensor_name)
            sensor_data2.append(unit)
            node_name = Node.objects.get(id=str(r[2]))
            sensor_data3.append(node_name.name)

            try:
                response = requests.get('http://' + ip_add)
                # print(ip_add)
                sensor_val = strip_tags(response.text)
                if (int(sensor_val) < int(sensorunit1)):
                    sensor_data4.append('#1216f6')
                    sensor_data5.append('Gas condition is normal ')
                elif ((int(sensor_val) >= int(sensorunit1)) & (int(sensor_val) < int(sensorunit2))):
                    sensor_data4.append(str(green))
                    sensor_data5.append(str(msg1))
                elif ((int(sensor_val) >= int(sensorunit2)) & (int(sensor_val) < int(sensorunit3))):
                    sensor_data4.append(str(yellow))
                    sensor_data5.append(str(msg2))
                else:
                    sensor_data4.append(str(red))
                    sensor_data5.append(str(msg3))
                sensor_data.append(str(sensor_val))



            except Exception as x:
                sensor_data.append("Network Error")

        data['result'] = sensor_data
        data['result1'] = sensor_data1
        data['result2'] = sensor_data2
        data['result3'] = sensor_data3
        data['result4'] = sensor_data4
        data['result5'] = sensor_data5

        # print(data)

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
        # print(sensor_details)
        for r in sensor_details:
            ip_add = str(r[3])
            sensor_name = str(r[5])
            sensor_data1.append(sensor_name)

            try:
                response = requests.get('http://' + ip_add)
                # print(ip_add)
                sensor_val = strip_tags(response.text)
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
        node_id1 = request.GET.get('id', None)
        sensor_details = Sensor_Node.objects.values_list().filter(sensorname=node_id1)
        # print(sensor_details)
        sensor_data.append('Date Time')
        sensor_data.append('Mine Name')
        sensor_data.append('Node name')
        for r in sensor_details:
            node_details = Node.objects.get(id=str(r[2]))
            sensor_data.append(node_details.name)

        data['result'] = sensor_data
        # print(data)

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_sensor_values_ajax_sensor_body(request):
    data = {}
    if request.is_ajax():
        sensor_data = []
        sensor_data1 = []

        node_id = request.GET.get('id', None)
        sensor_details = Sensor_Node.objects.values_list().filter(sensorname=node_id)
        # print(sensor_details)

        for r1 in sensor_details:
            mine_details = str(r1[1])

        mine_details = MineDetails.objects.get(id=mine_details)
        now = datetime.now()
        ok_date = (str(now.strftime('%Y-%m-%d %H:%M:%S')))
        sensor_data.append(ok_date)
        sensor_data.append(str(mine_details.name))
        sensor_data.append(str(node_id))

        for r in sensor_details:
            try:
                ip_add = str(r[3])
                sensor_name = str(r[5])
                unit = str(r[6])
                sensorunit1 = str(r[8])
                sensorunit2 = str(r[9])
                sensorunit3 = str(r[10])
                green = str(r[14])
                yellow = str(r[15])
                red = str(r[16])
                response = requests.get('http://' + ip_add)

                if (sensor_name == "CH4"):
                    CH4 = strip_tags(response.text)
                    if (int(CH4) < int(sensorunit1)):
                        sensor_data1.append('#1216f6')
                        sensor_data.append(str(CH4 + ' ' + unit))
                    elif ((int(CH4) >= int(sensorunit1)) & (int(CH4) < int(sensorunit2))):
                        sensor_data1.append(str(green))
                        sensor_data.append(str(CH4 + ' ' + unit))
                    elif ((int(CH4) >= int(sensorunit2)) & (int(CH4) < int(sensorunit3))):
                        sensor_data1.append(str(yellow))
                        sensor_data.append(str(CH4 + ' ' + unit))
                    else:
                        sensor_data1.append(str(red))
                        sensor_data.append(str(CH4 + ' ' + unit))
                    # sensor_data.append(sensor_name)

                elif (sensor_name == "CO"):
                    CO = strip_tags(response.text)
                    if (int(CO) < int(sensorunit1)):
                        sensor_data1.append('#1216f6')
                        sensor_data.append(str(CO + ' ' + unit))
                    elif ((int(CO) >= int(sensorunit1)) & (int(CO) < int(sensorunit2))):
                        sensor_data1.append(str(green))
                        sensor_data.append(str(CO + ' ' + unit))
                    elif ((int(CO) >= int(sensorunit2)) & (int(CO) < int(sensorunit3))):
                        sensor_data1.append(str(yellow))
                        sensor_data.append(str(CO + ' ' + unit))
                    else:
                        sensor_data1.append(str(red))
                        sensor_data.append(str(CO + ' ' + unit))

                    # sensor_data.append(sensor_name)

                elif (sensor_name == "CO2"):
                    CO2 = strip_tags(response.text)
                    if (int(CO2) < int(sensorunit1)):
                        sensor_data1.append('#1216f6')
                        sensor_data.append(str(CO2 + ' ' + unit))
                    elif ((int(CO2) >= int(sensorunit1)) & (int(CO2) < int(sensorunit2))):
                        sensor_data1.append(str(green))
                        sensor_data.append(str(CO2 + ' ' + unit))
                    elif ((int(CO2) >= int(sensorunit2)) & (int(CO2) < int(sensorunit3))):
                        sensor_data1.append(str(yellow))
                        sensor_data.append(str(CO2 + ' ' + unit))
                    else:
                        sensor_data1.append(str(red))
                        sensor_data.append(str(CO2 + ' ' + unit))
                elif (sensor_name == "O2"):
                    O2 = strip_tags(response.text)
                    if (int(O2) < int(sensorunit1)):
                        sensor_data1.append('#1216f6')
                        sensor_data.append(str(O2 + ' ' + unit))
                    elif ((int(O2) >= int(sensorunit1)) & (int(O2) < int(sensorunit2))):
                        sensor_data1.append(str(green))
                        sensor_data.append(str(O2 + ' ' + unit))
                    elif ((int(O2) >= int(sensorunit2)) & (int(O2) < int(sensorunit3))):
                        sensor_data1.append(str(yellow))
                        sensor_data.append(str(O2 + ' ' + unit))
                    else:
                        sensor_data1.append(str(red))
                        sensor_data.append(str(O2 + ' ' + unit))
                elif (sensor_name == "H2S"):
                    H2S = strip_tags(response.text)
                    if (int(H2S) < int(sensorunit1)):
                        sensor_data1.append('#1216f6')
                        sensor_data.append(str(H2S + ' ' + unit))
                    elif ((int(H2S) >= int(sensorunit1)) & (int(H2S) < int(sensorunit2))):
                        sensor_data1.append(str(green))
                        sensor_data.append(str(H2S + ' ' + unit))
                    elif ((int(H2S) >= int(sensorunit2)) & (int(H2S) < int(sensorunit3))):
                        sensor_data1.append(str(yellow))
                        sensor_data.append(str(H2S + ' ' + unit))
                    else:
                        sensor_data1.append(str(red))
                        sensor_data.append(str(H2S + ' ' + unit))
                elif (sensor_name == "NO2"):
                    NO2 = strip_tags(response.text)
                    if (int(NO2) < int(sensorunit1)):
                        sensor_data1.append('#1216f6')
                        sensor_data.append(str(NO2 + ' ' + unit))
                    elif ((int(NO2) >= int(sensorunit1)) & (int(NO2) < int(sensorunit2))):
                        sensor_data1.append(str(green))
                        sensor_data.append(str(NO2 + ' ' + unit))
                    elif ((int(NO2) >= int(sensorunit2)) & (int(NO2) < int(sensorunit3))):
                        sensor_data1.append(str(yellow))
                        sensor_data.append(str(NO2 + ' ' + unit))
                    else:
                        sensor_data1.append(str(red))
                        sensor_data.append(str(NO2 + ' ' + unit))
                elif (sensor_name == "SO2"):
                    SO2 = strip_tags(response.text)
                    if (int(SO2) < int(sensorunit1)):
                        sensor_data1.append('#1216f6')
                        sensor_data.append(str(SO2 + ' ' + unit))
                    elif ((int(SO2) >= int(sensorunit1)) & (int(SO2) < int(sensorunit2))):
                        sensor_data1.append(str(green))
                        sensor_data.append(str(SO2 + ' ' + unit))
                    elif ((int(SO2) >= int(sensorunit2)) & (int(SO2) < int(sensorunit3))):
                        sensor_data1.append(str(yellow))
                        sensor_data.append(str(SO2 + ' ' + unit))
                    else:
                        sensor_data1.append(str(red))
                        sensor_data.append(str(SO2 + ' ' + unit))
                elif (sensor_name == "H2"):
                    H2 = strip_tags(response.text)
                    if (int(H2) < int(sensorunit1)):
                        sensor_data1.append('#1216f6')
                        sensor_data.append(str(H2 + ' ' + unit))
                    elif ((int(H2) >= int(sensorunit1)) & (int(H2) < int(sensorunit2))):
                        sensor_data1.append(str(green))
                        sensor_data.append(str(H2 + ' ' + unit))
                    elif ((int(H2) >= int(sensorunit2)) & (int(H2) < int(sensorunit3))):
                        sensor_data1.append(str(yellow))
                        sensor_data.append(str(H2 + ' ' + unit))
                    else:
                        sensor_data1.append(str(red))
                        sensor_data.append(str(H2 + ' ' + unit))
                else:
                    He = strip_tags(response.text)
                    if (int(He) < int(sensorunit1)):
                        sensor_data1.append('#1216f6')
                        sensor_data.append(str(He + ' ' + unit))
                    elif ((int(He) >= int(sensorunit1)) & (int(He) < int(sensorunit2))):
                        sensor_data1.append(str(green))
                        sensor_data.append(str(He + ' ' + unit))
                    elif ((int(He) >= int(sensorunit2)) & (int(He) < int(sensorunit3))):
                        sensor_data1.append(str(yellow))
                        sensor_data.append(str(He + ' ' + unit))
                    else:
                        sensor_data1.append(str(red))
                        sensor_data.append(str(He + ' ' + unit))
            except Exception as x:
                sensor_data.append('Network Error')
                sensor_data1.append('Network Error')

        data['result'] = sensor_data
        data['result1'] = sensor_data1
        print(data)

    else:
        data['result'] = "Not Ajax"
        data['heading'] = "Not Ajax"
    return JsonResponse(data)


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
            node_data['node_id'] = str(n.nodeid)
            node_data['name'] = str(n.name)
            node_data['location'] = str(n.location)
            node_data['cordX'] = str(n.x_axis)
            node_data['cordY'] = str(n.y_axis)
            node_data['icon'] = '/static/image/node_green.svg'
            node_data['photo2'] = str(n.photo2)
            node_modal_data = {'title': str(n.name) + "||" + str(n.location),
                               'content': '<div id="content' + n.name + '"></div>'}
            node_data['modal'] = node_modal_data
            nodes_data[str(n.name)] = node_data
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
        print('warn3')
        # warning = 3

    return warning


@login_required
def node_sensor_data(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        node_id = request.GET.get('node_id', None)
        node_name = request.GET.get('node_name', None)
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
                warning = str(WarningLevel(gasValue, sd.sensorunit1, sd.sensorunit2, sd.sensorunit3))
                sensor_data[str(sd.sensorname)] = {'value': gasValue, 'unit': sd.sensorunit, 'warning': warning}
                print(sensor_data)
            except:
                data['error'] = "Connection Error!"
                return JsonResponse(data)

        data[str(node_name)] = sensor_data
        return JsonResponse(data)
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)

