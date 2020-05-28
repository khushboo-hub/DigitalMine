from django.contrib.auth.decorators import login_required
from django.core.cache import cache
from django.db import connection
from django.shortcuts import render
from .models import MineDetails, Node, Sensor_Node, MinerTracking, TrackingRouter, water_level_monitoring_model, \
    Employee
from Strata.models import Strata_location, Strata_sensor
from accounts.models import profile_extension
from django.shortcuts import get_object_or_404
import requests
from django.utils.html import strip_tags
from django.http import HttpResponse, JsonResponse
import os


# Create your views here.

@login_required
def dashboard_calling(request):
    if request.method == "POST":
        print('calling post')
        mine_name = request.POST.get("mine_name", None)
        mine = get_object_or_404(MineDetails, pk=mine_name)
    else:
        print('calling else')
        mine = MineDetails.objects.all()[:1].get()

    print(mine)
    current_user = request.user
    profile = get_object_or_404(profile_extension, user_id=current_user.id)
    try:
        cache.set('profile_avatar', profile.profile_avatar, 3600)
    except:
        cache.set('profile_avatar', 'employee_image/male_alt_photo.svg', 30)
        # profile["profile_avatar"] = 'employee_image/male_alt_photo.svg'
        pass

    data = {}
    mine_table = MineDetails.objects.all()
    data['mine_table'] = mine_table
    strata_location = Strata_location.objects.filter(mine_name=mine.id)
    water_level = water_level_monitoring_model.objects.filter(mine_id=mine.id)
    # print("Strata",strata)
    # first_mine=MineDetails.objects.values_list('id','name')[0]## work for first mine in list
    data['first_mine_id'] = mine.id
    data['first_mine_name'] = mine.name
    data['selected'] = mine.id
    water_level_area = 0
    data['profile_avatar'] = cache.get('profile_avatar')

    try:
        water_level_area = water_level[0]
        water_level_area = water_level_area.id
    except:
        print('Except Case')
        water_level_area = 0
        pass
    iframe_strata_location = 0
    iframe_strata_sensor = 0
    data['iframe_strata_location_name'] = "No Strata Location"
    try:
        iframe_strata_location = strata_location[0]
        data['iframe_strata_location_name'] = iframe_strata_location.location_name
        iframe_strata_location = iframe_strata_location.id
        strata_sensor = Strata_sensor.objects.filter(mine_name=mine.id, location_id=iframe_strata_location)
        try:
            iframe_strata_sensor = strata_sensor[0]
            iframe_strata_sensor = iframe_strata_sensor.id
        except:
            pass

    except:
        pass
    print('ifrmae_strasta_location', iframe_strata_location)
    data['iframe_strata_location'] = iframe_strata_location

    print('ifrmae_strasta_sensor', iframe_strata_sensor)
    data['iframe_strata_sensor'] = iframe_strata_sensor

    strata_result = []
    strata = []
    for strata_loc in strata_location:
        strata = []
        strata_sensor = Strata_sensor.objects.filter(mine_name=mine.id, location_id=strata_loc.id)
        for sensor in strata_sensor:
            strata.append(
                {'id': sensor.id, 'sensor_name': sensor.sensor_name, 'strata_location_id': sensor.location_id.id})
        strata_result.append({strata_loc.location_name: strata})

    print('strataaaaaaaaaaaaaaaaa........')
    print(strata_result)
    data['strata'] = strata_result
    print('WATER LEVEL')
    print(water_level)
    print('WATER LEVEL END')
    data['water_level'] = water_level
    data['water_level_id'] = water_level_area

    nodes = Node.objects.filter(mine_id=mine.id)
    print('---------------------------------')
    NODES = []

    for node in nodes:
        SENSORS = []
        Sensors = Sensor_Node.objects.filter(mine_id=mine.id, node_id=node.id)
        for sensor in Sensors:
            SENSORS.append(
                {'mine': sensor.mine_id, 'node_id': node.id, 'ip': sensor.ip_add, 'sensor_name': sensor.sensor_name,
                 'sensor_id': sensor.id})
        NODES.append({str(node.name): SENSORS})

    print(nodes)
    data['nodes'] = NODES

    # for node in nodes:
    #     sensors=Sensor_Node.objects.filter(mine_id=profile.mine_id.id, node_id=node.id)

    return render(request, "index.html", data)


def fetchwl(request):
    data = {}
    sensor_val = -1
    if request.is_ajax():

        try:
            response = requests.get('http://192.168.1.181')
            sensor_val = strip_tags(response.text)
            print("Water Level Sensor Value=>", sensor_val)
        except requests.exceptions.ConnectionError:
            sensor_val = -1
            pass

    data['result'] = str(sensor_val)
    return JsonResponse(data)


def fetchsl(request):
    data = {}
    sensor_val = -1
    if request.is_ajax():
        strata = request.GET.get('strata', None)
        print('strata', strata)
        try:
            response = requests.get('http://192.168.1.201')
            sensor_val = strip_tags(response.text)
            print(" Strata Sensor Value=>", sensor_val)
        except requests.exceptions.ConnectionError:
            sensor_val = -1
            pass

    data['result'] = str(sensor_val)
    return JsonResponse(data)


def hi(request):
    return render(request, 'hi.html')


def export(request, mine):
    data = {}
    node = []
    # node.append(
    #     {
    #         'container': "#custom-colored",
    #         'nodeAlign': "BOTTOM",
    #         'connectors': {
    #             'type': 'step'
    #         },
    #         'node': {
    #             'HTMLclass': 'nodeExample1'
    #         }
    # })
    # employees = Employee.objects.filter(mine_id=mine).order_by('mining_role_id')



    hirarchy = ""
    # for emp in employees:
    #     print(emp[0],emp[1],emp[3])
    if not request.is_ajax():
        try:
            sql = "SELECT t1.id,t1.name as Name,t1.immediate_staff_id,t2.name as Parent FROM employee t1 LEFT JOIN employee t2 ON t1.immediate_staff_id = t2.id where t1.mine_id = 8"
            cursor = connection.cursor()
            cursor.execute(sql)
            employees = cursor.fetchall()
            # employees = Employee.objects.filter(mine_id=mine)

            for emp in employees:
                # print(emp.name)
                if emp[3] == None or emp[3] == 4:
                    node.append(
                        {
                            'id': emp[0],
                            'title': emp[1],
                            'parent':None,
                            'parentName': None
                        })
                else:
                    # parent = Employee.objects.get(id=emp.immediate_staff_id)
                    node.append({
                        'id':emp[0],
                        'title':emp[1],
                        'parent':emp[2],
                        'parentName':emp[3]
                                 })

            data['result'] = node
        except Exception as e:
            print(e)
            data['result'] = 'none'
            pass

    return JsonResponse(data)
