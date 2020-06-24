from django.contrib.auth.decorators import login_required, permission_required, user_passes_test
from django.core import serializers
from django.urls import reverse
from django.views.decorators.csrf import csrf_protect
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.template.defaulttags import register

from apps import settings
from setting.utils import decrypt
from .models import Node, Sensor_Node, gasModel_auto
from .models import MineDetails
from .forms import NodeForm, Sensor_NodeForm
import requests
from background_task import background
from datetime import datetime
from django.utils.html import strip_tags, linebreaks
from accounts.models import profile_extension
from background_task.models import Task
from FireExp.models import Gasdb

from django.db.models import Avg, Value
from django.db.models.functions import NullIf, TruncDay, TruncHour, TruncMonth, TruncYear
from accounts.utils import is_manager


@login_required
@user_passes_test(is_manager)
def node_add(request, template_name='node/node_add.html'):
    current_user = request.user

    profile = get_object_or_404(profile_extension, user_id=current_user.id)
    if request.user.is_superuser:
        form = NodeForm()
    else:
        form = NodeForm(initial={'mine_id': profile.mine_id_id})
    if request.method == "POST":
        form = NodeForm(request.POST or None, request.FILES)
        if form.is_valid():
            form.save()
            return redirect(reverse('sensor:node_manage'))
    return render(request, template_name, {'form': form, 'action': "Add", "alert": "added"})


@csrf_protect
@login_required
def node_edit(request, pk, template_name='node/node_add.html'):
    pk = decrypt(pk)
    current_user = request.user
    # profile = get_object_or_404(profile_extension, user_id=current_user.id)
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


def manage_sensor(request, mine_id, node_id, template_name='sensor/manage_sensor.html'):
    mine_id = decrypt(mine_id)
    node_id = decrypt(node_id)
    sensors = Sensor_Node.objects.filter(mine_id_id=mine_id, node_id_id=node_id).only('sensor_id', 'sensor_name',
                                                                                      'ip_add', 'sensor_unit',
                                                                                      'sensor_threshold_limit')
    data = {}
    prepared_data = []
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



@login_required
@user_passes_test(is_manager)
def add_sensor(request, mine_id, node_id, template_name='sensor/add_sensor.html'):
    mine_id = decrypt(mine_id)
    node_id = decrypt(node_id)
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
                template_name='sensor/add_sensor.html'):  # pk is Sensor Id of a node, node_id=> id the of wirelss node
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


@login_required
def live_data_tabular(request, template_name='live_data/live_data_tabular.html'):
    form = NodeForm(request.POST)

    return render(request, template_name, {'form': form})


@login_required
def report_table(request, template_name="report/report_data_tabular.html"):
    form = NodeForm(request.POST or None)
    return render(request, template_name, {'form': form})


@login_required
def avg_report_table(request, template_name="report/average_report_data_tabular.html"):
    form = NodeForm(request.POST or None)
    return render(request, template_name, {'form': form})


@login_required
def report_graph(request, template_name="report/report_data_graph.html"):
    form = NodeForm(request.POST or None)
    return render(request, template_name, {'form': form})


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
            sensors = Sensor_Node.objects.filter(mine_id=mine_id).values('id', 'sensor_name').distinct()
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
            data['result'] = {
                'id': sensor_id,
                'time': str(ok_date),
                'sensor_value': str(sensor_val),
            }
        except:
            data['result'] = {
                'error': 'Network Error'
            }
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def report_fetch_sensor_values_ajax(request):
    data = {}
    if request.is_ajax():
        for i in range(1,1000):
            print(i)
        sensor_id = request.GET.get('id', None)
        date_from = request.GET.get('from', None)
        date_to = request.GET.get('to', None)

        try:
            data['result'] = serializers.serialize('json',
                                                   gasModel_auto.objects.filter(sensor_id=sensor_id,
                                                                                date_time__range=(date_from, date_to)),
                                                   fields=('id', 'sensor_value', 'date_time'))
        except:
            data['error'] = {
                'error': 'Network Error'
            }
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def avg_report_fetch_sensor_values_ajax(request):
    data = {}
    if request.is_ajax():
        sensor_id = request.GET.get('id', None)
        date_from = request.GET.get('from', None)
        date_to = request.GET.get('to', None)
        avg = request.GET.get('avg', None)
        avg_data = {}
        try:
            gas = []
            # Hourly avg
            gases = gasModel_auto.objects.filter(sensor_id=sensor_id, date_time__range=(date_from, date_to)).order_by(
                'date_time')

            avg_data['hourly'] = list(gases.values('sensor_name').annotate(day=TruncHour('date_time'),
                                                                           avg=Avg(NullIf('sensor_value', Value(0)))))

            avg_data['daily'] = list(gases.values('sensor_name').annotate(day=TruncDay('date_time'),
                                                                          avg=Avg(NullIf('sensor_value', Value(0)))))

            avg_data['monthly'] = list(gases.values('sensor_name').annotate(day=TruncMonth('date_time'),
                                                                            avg=Avg(NullIf('sensor_value', Value(0)))))

            avg_data['yearly'] = list(gases.values('sensor_name').annotate(day=TruncYear('date_time'),
                                                                           avg=Avg(NullIf('sensor_value', Value(0)))))

            data['result'] = avg_data
        except Exception as e:
            print(e)
            data['error'] = {
                'error': 'Network Error'
            }
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def report_fetch_node_values_ajax(request):
    data = {}
    if request.is_ajax():
        node_id = request.GET.get('id', None)
        try:
            sensors = Sensor_Node.objects.filter(node_id=node_id)
            result = []
            for s in sensors:
                result.append(serializers.serialize('json',
                                                    gasModel_auto.objects.filter(sensor_id=s.id),
                                                    fields=('id', 'sensor_value', 'date_time')))

            data['result'] = result
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
            data['result'] = {'id': str(sensor_details.id),
                              'index': 3,
                              'sensor_name': str(sensor_details.sensor_name),
                              'sensor_unit': str(sensor_details.sensor_unit),
                              'color': '#1216f6',
                              'level1': sensor_details.level_1_warning_unit,
                              'level2': sensor_details.level_2_warning_unit,
                              'level3': sensor_details.level_3_warning_unit,
                              'level1_color': sensor_details.level_1_color,
                              'level2_color': sensor_details.level_2_color,
                              'level3_color': sensor_details.level_3_color,
                              'level1_msg': sensor_details.level_1_msg,
                              'level2_msg': sensor_details.level_2_msg,
                              'level3_msg': sensor_details.level_3_msg,
                              'level1_audio': str(sensor_details.level_1_audio),
                              'level2_audio': str(sensor_details.level_2_audio),
                              'level3_audio': str(sensor_details.level_3_audio),
                              'audio_type': sensor_details.audio_play_type,
                              }
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
            # ip_add = str(r.ip_add)
            sensor_name = str(r.sensor_name)
            unit = str(r.sensor_unit)
            try:
                # response = requests.get('http://' + ip_add)
                # sensor_val = str(strip_tags(response.text))
                # sensor_val = sensor_val if (isNum(sensor_val)) else "Network Error"
                sensor_data.append({
                    'id': id,
                    # 'sensor_value': sensor_val,
                    'sensor_name': sensor_name,
                    'sensor_unit': unit,
                    'sensor_warning_color': '#1216f6',
                    'sensor_warning_msg': 'Gas condition is normal',
                    'level1': r.level_1_warning_unit,
                    'level2': r.level_2_warning_unit,
                    'level3': r.level_3_warning_unit,
                    'level1_color': r.level_1_color,
                    'level2_color': r.level_2_color,
                    'level3_color': r.level_3_color,
                    'level1_msg': r.level_1_msg,
                    'level2_msg': r.level_2_msg,
                    'level3_msg': r.level_3_msg,
                    'level1_audio': str(r.level_1_audio),
                    'level2_audio': str(r.level_2_audio),
                    'level3_audio': str(r.level_3_audio),
                    'audio_type': r.audio_play_type,
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
                'sensor_warning_msg': 'Gas condition is normal',
                'level1': r.level_1_warning_unit,
                'level2': r.level_2_warning_unit,
                'level3': r.level_3_warning_unit,
                'level1_color': r.level_1_color,
                'level2_color': r.level_2_color,
                'level3_color': r.level_3_color,
                'level1_msg': r.level_1_msg,
                'level2_msg': r.level_2_msg,
                'level3_msg': r.level_3_msg,
                'level1_audio': str(r.level_1_audio),
                'level2_audio': str(r.level_2_audio),
                'level3_audio': str(r.level_3_audio),
                'audio_type': r.audio_play_type,

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
            try:
                response = requests.get('http://' + ip_add)
                sensor_val = strip_tags(response.text)
                sensor_val = sensor_val if (isNum(sensor_val)) else "Network Error"
                sensor_data.append({
                    'id': id,
                    'sensor_value': sensor_val,
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
                                             'index': str(i),
                                             'sensor_name': r.sensor_name,
                                             'level1': r.level_1_warning_unit,
                                             'level2': r.level_2_warning_unit,
                                             'level3': r.level_3_warning_unit,
                                             'level1_color': r.level_1_color,
                                             'level2_color': r.level_2_color,
                                             'level3_color': r.level_3_color,
                                             'level1_msg': r.level_1_msg,
                                             'level2_msg': r.level_2_msg,
                                             'level3_msg': r.level_3_msg,
                                             'level1_audio': str(r.level_1_audio),
                                             'level2_audio': str(r.level_2_audio),
                                             'level3_audio': str(r.level_3_audio),
                                             'audio_type': r.audio_play_type,
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
                                             'sensor_name': r.sensor_name,
                                             'level1': r.level_1_warning_unit,
                                             'level2': r.level_2_warning_unit,
                                             'level3': r.level_3_warning_unit,
                                             'level1_color': r.level_1_color,
                                             'level2_color': r.level_2_color,
                                             'level3_color': r.level_3_color,
                                             'level1_msg': r.level_1_msg,
                                             'level2_msg': r.level_2_msg,
                                             'level3_msg': r.level_3_msg,
                                             'level1_audio': str(r.level_1_audio),
                                             'level2_audio': str(r.level_2_audio),
                                             'level3_audio': str(r.level_3_audio),
                                             'audio_type': str(r.audio_play_type),
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
        sensor_details = []
        if mode == '0':
            sensor_details = Sensor_Node.objects.filter(mine_id=mine, node_id_id=node_or_sensor_id)
        elif mode == '1':
            sensor_details = Sensor_Node.objects.filter(mine_id=mine, sensor_name=node_or_sensor_id)
        for r in sensor_details:
            rid = str(r.id)
            ip_add = str(r.ip_add)
            try:
                response = requests.get('http://' + ip_add)
                sensor_val = strip_tags(response.text)
                sensor_val = sensor_val if (isNum(sensor_val)) else "Network Error"
                sensor_data.append({
                    'id': rid,
                    'sensor_value': sensor_val,
                })
            except Exception as x:
                sensor_data.append({
                    'id': rid,
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
def node_sensor_ajax(request):
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
            sensor_hash_object = hashlib.sha512(str(sd.id).encode())
            try:
                warning = ""
                sensor_data[sensor_hash_object.hexdigest()] = {'id':sd.id,'name':sd.sensor_name,'value': 0, 'unit': sd.sensor_unit, 'warning': warning}
                print(sensor_data)
            except:
                sensor_data[sensor_hash_object.hexdigest()] = {'id':sd.id,'name':sd.sensor_name,'value': "Connection Error!", 'unit': sd.sensor_unit, 'warning': 1}
                pass

        node_hash_object = hashlib.sha512(str(node_id).encode())

        data[node_hash_object.hexdigest()] = sensor_data
        return JsonResponse(data)
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


@login_required
def node_sensor_data_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        sensor_id = request.GET.get('sensor_id', None)
        mine_details = MineDetails.objects.values_list().filter(id=mine_id)
        data = {}
        mine_data = {}
        for m in mine_details:
            mine_data['id'] = str(m[0])
            mine_data['name'] = str(m[1])
            mine_data['image_url'] = str(m[6])

        sensor_data = {}
        sensor_details = Sensor_Node.objects.get(id=sensor_id, mine_id=mine_id)
        sensor_hash_object = hashlib.sha512(str(sensor_details.id).encode())
        node_ash_object = hashlib.sha512(str(sensor_details.node_id_id).encode())
        try:
            response = requests.get('http://' + sensor_details.ip_add)
            gasValue = strip_tags(response.text)
            gasValue = gasValue if (isNum(gasValue)) else "Network Error"
            warning = str(WarningLevel(gasValue, sensor_details.level_1_warning_unit, sensor_details.level_2_warning_unit, sensor_details.level_3_warning_unit))
            data['result'] = {'node': node_ash_object.hexdigest(),'sensor':sensor_hash_object.hexdigest(),'value': gasValue, 'threshold':sensor_details.sensor_threshold_limit,'unit': sensor_details.sensor_unit, 'warning': warning}
        except:
            data['result'] = {'node': node_ash_object.hexdigest(),'sensor':sensor_hash_object.hexdigest(),'value': "Connection Error!", 'threshold':sensor_details.sensor_threshold_limit,'unit': sensor_details.sensor_unit, 'warning': 1}
            pass

        return JsonResponse(data)

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


@login_required
def ellicots(request, pk, template_name='report/ellicots_graph.html'):
    data = {}
    pk = decrypt(pk)
    data['node_id'] = pk
    return render(request, template_name, data)


@login_required
def line_chart_ratio_graph(request, pk, template_name='report/line_chart_ratio.html'):
    data = {}
    pk = decrypt(pk)
    data['node_id'] = pk
    return render(request, template_name, data)


@login_required
def youngs_ratio_graph(request, pk, template_name='report/young_ratio.html'):
    data = {}
    pk = decrypt(pk)
    data['node_id'] = pk
    return render(request, template_name, data)


@login_required
def line_chart_ratio_graph_ajax(request):
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

        data_list = gasModel_auto.objects.filter(date_time__range=(
            date_from, date_to
        ), node_id=node_id).values('sensor_name', 'sensor_name').annotate(day=TruncDay('date_time'),
                                                                          avg=Avg('sensor_value'))

        DateWiseData = {}
        for d in data_list:
            DateWiseData[d['day']] = []
        for d in data_list:
            list = {'name': d['sensor_name'], 'avg': d['avg']}
            DateWiseData[d['day']].append(list)
        gases = {}

        for DateWise in DateWiseData:
            gases['CO'] = gases['CO2'] = gases['CH4'] = gases['O2'] = gases['H2'] = gases['N2'] = gases['C2H4'] = 0
            for gas in DateWiseData[DateWise]:
                gases[gas['name']] = gas['avg']

            gas = Gasdb(co=gases['CO'], co2=gases['CO2'], ch4=gases['CH4'], o2=gases['O2'], h2=gases['H2'],
                        n2=gases['N2'], c2h4=gases['C2H4'], date=DateWise)

            graph.append(gas.findExplosibility())

        data['result'] = graph

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


@login_required
def youngs_ratio_graph_ajax(request):
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

        data_list = gasModel_auto.objects.filter(date_time__range=(
            date_from, date_to
        ), node_id=node_id).values('sensor_name', 'sensor_name').annotate(day=TruncDay('date_time'),
                                                                          avg=Avg(NullIf('sensor_value', Value(0))))

        DateWiseData = {}
        for d in data_list:
            DateWiseData[d['day']] = []
        for d in data_list:
            list = {'name': d['sensor_name'], 'avg': d['avg']}
            DateWiseData[d['day']].append(list)
        gases = {}

        for DateWise in DateWiseData:
            gases['CO'] = gases['CO2'] = gases['CH4'] = gases['O2'] = gases['H2'] = gases['N2'] = gases['C2H4'] = 0
            for gas in DateWiseData[DateWise]:
                gases[gas['name']] = gas['avg']

            # Total = gases['CO'] + gases['CO2'] + gases['CH4'] + gases['O2'] + gases['H2'] + gases['N2'] + gases[
            #     'C2H4']
            # try:
            #     gases['CO'] = (gases['CO'] / Total) * 100
            # except:
            #     gases['CO'] = 0
            # try:
            #     gases['CO2'] = (gases['CO2'] / Total) * 100
            # except:
            #     gases['CO2'] = 0
            # try:
            #     gases['CH4'] = (gases['CH4'] / Total) * 100
            # except:
            #     gases['CH4'] = 0
            # try:
            #     gases['O2'] = (gases['O2'] / Total) * 100
            # except:
            #     gases['O2'] = 0
            # try:
            #     gases['H2'] = (gases['H2'] / Total) * 100
            # except:
            #     gases['H2'] = 0
            # try:
            #     gases['N2'] = (gases['N2'] / Total) * 100
            # except:
            #     gases['N2'] = 0
            # try:
            #     gases['C2H4'] = (gases['C2H4'] / Total) * 100
            # except:
            #     gases['C2H4'] = 0

            gas = Gasdb(co=gases['CO'], co2=gases['CO2'], ch4=gases['CH4'], o2=gases['O2'], h2=gases['H2'],
                        n2=gases['N2'], c2h4=gases['C2H4'], date=DateWise)
            graph.append(gas.graph())

        data['result'] = graph

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


@login_required
def locate_node(request, mine_id, node_id, template_name='node/locate_node.html'):
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


@login_required
def ellicots_ajax(request):
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

        data_list = gasModel_auto.objects.filter(date_time__range=(
            date_from, date_to
        ), node_id=node_id).values('sensor_name', 'sensor_name').annotate(day=TruncDay('date_time'),
                                                                          avg=Avg('sensor_value'))

        DateWiseData = {}
        for d in data_list:
            DateWiseData[d['day']] = []
        for d in data_list:
            list = {'name': d['sensor_name'], 'avg': d['avg']}
            DateWiseData[d['day']].append(list)
        gases = {}

        for DateWise in DateWiseData:
            gases['CO'] = gases['CO2'] = gases['CH4'] = gases['O2'] = gases['H2'] = gases['N2'] = gases['C2H4'] = 0
            for gas in DateWiseData[DateWise]:
                gases[gas['name']] = gas['avg']

            gas = Gasdb(co=gases['CO'], co2=gases['CO2'], ch4=gases['CH4'], o2=gases['O2'], h2=gases['H2'],
                        n2=gases['N2'], c2h4=gases['C2H4'], date=DateWise)

            graph.append(gas.graph())

        data['result'] = graph

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)




def isNum(data):
    try:
        int(data)
        return True
    except ValueError:
        return False





