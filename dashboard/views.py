from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from .models import MineDetails,Sensor,Node
import requests
from django.utils.html import strip_tags
from django.http import HttpResponse, JsonResponse
# Create your views here.

@login_required
def dashboard_calling(request):
    data={}
    mine_table = MineDetails.objects.all()
    data['mine_table'] = mine_table

    first_mine=MineDetails.objects.values_list('id','name')[0]## work for first mine in list
    data['first_mine_id']=first_mine[0]
    data['first_mine_name'] = first_mine[1]
    return render(request, "index.html",data)

def fetchwl(request):

    data={}
    sensor_val=0
    if request.is_ajax():

        try:
            response = requests.get('http://192.168.1.181')
            sensor_val = strip_tags(response.text)
            print("Sensor Value=>",sensor_val)
        except:
            sensor_val=0
            pass

    data['result'] = sensor_val
    return JsonResponse(data)