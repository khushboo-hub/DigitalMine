from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from .models import MineDetails,Node,Sensor_Node,MinerTracking,TrackingRouter,water_level_monitoring_model
from Strata.models import Strata_location
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
        mine= get_object_or_404(MineDetails,pk=mine_name)
    else:
        print('calling else')
        mine=MineDetails.objects.all()[:1].get()

    print(mine)
    current_user = request.user
    profile = get_object_or_404(profile_extension, user_id=current_user.id)
    data = {}
    mine_table = MineDetails.objects.all()
    data['mine_table'] = mine_table
    strata=Strata_location.objects.filter(mine_name=mine.id)
    water_level=water_level_monitoring_model.objects.filter(mine_id=mine.id)
    # print("Strata",strata)
    # first_mine=MineDetails.objects.values_list('id','name')[0]## work for first mine in list
    data['first_mine_id']=mine.id
    data['first_mine_name'] = mine.name
    data['selected'] = mine.id

    data['strata'] = strata
    print('WATER LEVEL')
    print(water_level)
    print('WATER LEVEL END')
    data['water_level'] = water_level
    nodes=Node.objects.filter(mine_id=mine.id)
    print('---------------------------------')
    NODES=[]

    for node in nodes:
        SENSORS = []
        Sensors = Sensor_Node.objects.filter(mine_id=mine.id,node_id=node.id)
        for sensor in Sensors:
            SENSORS.append({'mine':sensor.mine_id, 'ip':sensor.ip_add,'sensor_name':sensor.sensorname,'sensor_id':sensor.id})
            print('IP=>', sensor.ip_add)
        NODES.append({str(node.name): SENSORS})

    print(nodes)
    data['nodes'] = NODES

    for node in nodes:
        sensors=Sensor_Node.objects.filter(mine_id=profile.mine_id.id, node_id=node.id)

    return render(request, "index.html",data)

def fetchwl(request):

    data={}
    sensor_val=-1
    if request.is_ajax():

        try:
            response = requests.get('http://192.168.1.181')
            sensor_val = strip_tags(response.text)
            print("Water Level Sensor Value=>",sensor_val)
        except requests.exceptions.ConnectionError:
            sensor_val=-1
            pass

    data['result'] = str(sensor_val)
    return JsonResponse(data)

def fetchsl(request):


    data={}
    sensor_val=-1
    if request.is_ajax():
        strata = request.GET.get('strata', None)
        print('strata',strata)
        try:
            response = requests.get('http://192.168.1.201')
            sensor_val = strip_tags(response.text)
            print(" Strata Sensor Value=>",sensor_val)
        except requests.exceptions.ConnectionError:
            sensor_val = -1
            pass

    data['result'] = str(sensor_val)
    return JsonResponse(data)