##################################################################################
###     Created By: DEWANGSHU PANDIT
###     Created On: July..... -2018
###     Purpose :Tracking of Miners in underground mines
###     Any Description:Running
###     Last Modified:
###     Modified function,any:
##################################################################################
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, JsonResponse,HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from django.views.decorators.csrf import csrf_protect
from django.core import serializers
# Create your views here.
from django.shortcuts import render, redirect
from .forms import TrackingRouterForm
from .models import TrackingRouter, MineDetails, MinerTracking, Employee, MiningRole
from accounts.models import profile_extension
# ===============For matplotlib================

import json
#import matplotlib.pyplot as plt
import datetime
import random

@csrf_protect
@login_required
def init(request, template_name='MinersTracking/create_router.html'):
    err={}
    err['msg']=2
    current_user = request.user
    

    if request.user.is_superuser:
        form = TrackingRouterForm()
        book = TrackingRouter.objects.all()
    else:
        profile = get_object_or_404(profile_extension, user_id=current_user.id)
        form = TrackingRouterForm(initial={'mine_id':profile.mine_id.id})
        book = TrackingRouter.objects.filter(mine_id=profile.mine_id.id)

    # print('Profile',profile.mine_id)
    # form = TrackingRouterForm(initial={'mine_id':profile.mine_id.id})
    # form = TrackingRouterForm()


    return render(request, template_name, {'form': form, 'object_list': book,'err':err})



@csrf_protect
@login_required
def update_router(request, pk, template_name='MinersTracking/update_router.html'):
    current_user = request.user
    profile = get_object_or_404(profile_extension, user_id=current_user.id)

    book = get_object_or_404(TrackingRouter, pk=pk)
    if request.user.is_superuser:
        books = TrackingRouter.objects.all()
    else:
        books = TrackingRouter.objects.filter(mine_id=profile.mine_id.id)
    form = TrackingRouterForm(request.POST or None, instance=book)
    if form.is_valid():
        form.save()
        return redirect('MinersTracking:')
    return render(request, template_name, {'form': form, 'object_list': books,'pk':pk})


def test(request,template_name="MinersTracking/test.html"):
    data={}
    Mines=get_object_or_404(MineDetails,id=1)
    data['image']=Mines.mine_map_image
    return render(request,template_name,data)

@csrf_protect
@login_required
def create_router(request):
    response_data = {}

    if request.is_ajax():

        if request.method == 'POST':
            print('Hello Miners Tracking')
            mine = request.POST.get('mine')
            router = str(request.POST.get('router_id'))
            address = str(request.POST.get('address'))
            location = str(request.POST.get('location'))
            x_axis = request.POST.get('x_axis')
            y_axis = request.POST.get('y_axis')
            isBlock = str(request.POST.get('isBlock'))
            ip = str(request.POST.get('ip'))

            tracking_router_inst = TrackingRouter()
            tracking_router_inst.x_axis=x_axis
            tracking_router_inst.y_axis=y_axis
            tracking_router_inst.mine_id_id=mine
            tracking_router_inst.location=location
            tracking_router_inst.address=address
            tracking_router_inst.router_id=router
            tracking_router_inst.is_block=isBlock
            tracking_router_inst.ip_add=ip

            try:
                tracking_router_inst.save()
                response_data['success'] = "Router Created Successfully!!"
                response_data['book']=serializers.serialize('json', TrackingRouter.objects.filter(pk=tracking_router_inst.pk), fields=('mine_id','router_id','address','location','is_block','x_axis','y_axis','is_blocked','ip_add'))
                return JsonResponse(response_data)
            except Exception as e:
                print('Miners Tracking',e)

                response_data['error'] = "Router Already Available!"
                return JsonResponse(response_data)
    else:
        response_data['error']="Something Went Wrong!"
        return HttpResponse(response_data)

@csrf_protect
@login_required
def edit_router(request):
    response_data = {}
    if request.is_ajax():
        if request.method == 'POST':
            pk = request.POST.get('pk')
            mine = request.POST.get('mine')
            router = str(request.POST.get('router_id'))
            address = str(request.POST.get('address'))
            location = str(request.POST.get('location'))
            x_axis = request.POST.get('x_axis')
            y_axis = request.POST.get('y_axis')
            isBlock = str(request.POST.get('isBlock'))
            ip = str(request.POST.get('ip'))

            tracking_router_inst = get_object_or_404(TrackingRouter, pk=pk)
            tracking_router_inst.x_axis = x_axis
            tracking_router_inst.y_axis = y_axis
            tracking_router_inst.mine_id_id = mine
            tracking_router_inst.location = location
            tracking_router_inst.address = address
            tracking_router_inst.router_id = router
            tracking_router_inst.is_block = isBlock
            tracking_router_inst.ip_add = ip

            try:
                tracking_router_inst.save()
                response_data['success'] = "Router Updated Successfully!!"
                #  response_data['book']=serializers.serialize('json', TrackingRouter.objects.filter(pk=tracking_router_inst.pk), fields=('mine_id','router_id','address','location','is_block','x_axis','y_axis','is_blocked','ip_add'))
                return JsonResponse(response_data)
            except:
                response_data['error'] = "Router Already Available!"
                return JsonResponse(response_data)
    else:
        response_data['error'] = "Something Went Wrong!"
        return JsonResponse(response_data)


@login_required
def delete_router(request):
    data={}

    if request.is_ajax():
        if request.method == 'POST':
            pk=request.POST.get('id')
            print(pk)
            try:
                book =TrackingRouter.objects.get(pk=pk)
                print(book)
                book.delete()
                data['success'] = "Router Deteled Successfully!"
                return JsonResponse(data)
            except TrackingRouter.DoesNotExist:
                data['error'] ="Something Went Wrong!"
                print('Error')
                return JsonResponse(data)
    data['error'] = "Something Went Wrong!"
    return JsonResponse(data)


@login_required
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
    return render(request, "MinersTracking/load_map.html", data)


def get_miners_data(request):
    # return HttpResponse("R001-M001") ## demo for show in graph

    # ------tracking details for a mine-----

    ###-----for .net application test
    data = {}
    tracking_data = []
    miner_id = 'M002'
    tracking_table = MinerTracking.objects.filter(transmitter_id=miner_id).order_by('-id')[0]
    tracking_data.append(str(tracking_table.router_id) + ',' + str(tracking_table.transmitter_id))
    data['result'] = tracking_data
    #print(data)
    return JsonResponse(data)


def live_tracking_in_tabular(request, template_name='MinersTracking/live_tracking_in_tabular.html'):
    form = TrackingRouterForm(request.POST)
    return render(request, template_name, {'form': form})


def ajax_tracking_data(request):  ### for tabular format live data last 10 records
    data = {}

    if request.is_ajax():
        emp_name = "---"
        mine_name = "---"
        router_name = "---"
        router_location="---"
        tracking_details={}
        mine_id = request.GET.get('id', None)
        date_from = request.GET.get('date_from', None)
        date_to = request.GET.get('date_to', None)
        print(date_from + " " + date_to)

        try:
            tracking_details = MinerTracking.objects.filter(mine_id=mine_id,created_date__range=[date_from, date_to]).order_by('-id')[:10]
            mine_details = MineDetails.objects.get(id=mine_id)
            mine_name = mine_details.name

        except:
            pass
        i = 0
        tracking_datas ={}
        for r in tracking_details:  ##0-id,1-mine_id,2-router_id,3-transmetr_id,4-emergency,5-ip,6-created_date
            tracking_data={}

            employee_table = []
            router_table = []
            try:
                router_table = TrackingRouter.objects.get(router_id=str(r.router_id))
                router_name = router_table.router_id
                router_location = str(router_table.location)

            except:
                pass


            try:
                employee_table = Employee.objects.get(rfid=str(r.transmitter_id))
                emp_name = employee_table.name

            except:
                pass

            tracking_data={'id':r.id,
                           'mine_name':mine_name,
                           'emp_name':emp_name,
                           'miner_id':r.transmitter_id,
                           'router_id':r.router_id,
                           'router_location':router_location,
                           'emergency':r.emergency,
                           'time':str(r.created_date),
                           'ip_add':str(r.ip_add)}
            tracking_datas[str(r.id)]=tracking_data

            # tracking_data.append(
            #     str(r[6]) + ',' + mine_name + ',' + emp_name + ',' + str(r[3]) + ',' + router_name + ',' + str(
            #         r[4]) + ',' + str(r[5]))
            # i = i + 1
        data['result'] = tracking_datas
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


@login_required
def all_mine_page(request, template_name='MinersTracking/all_mine_page.html'):
    book = MineDetails.objects.all()
    return render(request, template_name, {'object_list': book})


import hashlib

@login_required
def live_tracking_in_map(request, mine_id, template_name='MinersTracking/live_tracking_in_map.html'):
    # print('Here')
    data = {}
    mine_data = MineDetails.objects.filter(id=mine_id)[0]
    data['mine'] = mine_data
    routers = TrackingRouter.objects.filter(mine_id_id=mine_id)
    data['routers'] = routers
    miners = Employee.objects.filter(mine_id=mine_id)
    miner=[]
    for m in miners:
        try:
            mining_role_details = MiningRole.objects.get(id=m.mining_role_id)
            mining_role = mining_role_details.type
        except:
            mining_role='officer'
            pass
        if mining_role == 'worker':
            css = 'MinerWorkerIcon'
        elif mining_role == 'officer':
            css = 'MinerOfficerIcon'
        hash_object = hashlib.sha512(str(m.id).encode())
        miner.append({'id':hash_object.hexdigest(),'name':m.name,'css':css})

    data['miners'] = miner

    return render(request, template_name, data)

@login_required
def iframe_live_tracking_in_map(request, mine_id, template_name='MinersTracking/iframe_live_tracking_in_map.html'):
    data = {}
    mine_data = MineDetails.objects.values_list().filter(id=mine_id)[0]
    data['mine_data'] = mine_data
    routers = TrackingRouter.objects.values_list().filter(mine_id_id=mine_id)
    data['routers'] = routers
    miners = Employee.objects.filter(mine_id=mine_id)
    print(miners)
    data['miners'] = miners

    return render(request, template_name, data)

@login_required
def live_tracking_in_map_(request, mine_id, template_name='MinersTracking/live_tracking_in_map_.html'):
    data = {}
    mine_data = MineDetails.objects.values_list().filter(id=mine_id)[0]
    data['mine_data'] = mine_data
    routers = TrackingRouter.objects.values_list().filter(mine_id_id=mine_id)
    data['routers'] = routers
    miners = Employee.objects.filter(mine_id=mine_id)
    data['miners'] = miners
    return render(request, template_name, data)


def get_miners_data1(request):
    data = {}

    if request.is_ajax():
        emp_name = "---"
        mine_name = "---"
        router_name = "---"
        mine_id = 0
        mine_id = request.GET.get('id', None)
        try:
            tracking_details = MinerTracking.objects.values_list().filter(mine_id=mine_id).order_by('-id')[:10]
            mine_details = MineDetails.objects.get(id=mine_id)
            mine_name = mine_details.name
        except:
            pass
        i = 0
        tracking_data = []
        # tracking_details=[]
        for r in tracking_details:  ##0-id,1-mine_id,2-router_id,3-transmetr_id,4-emergency,5-ip,6-created_date
            employee_table = []
            router_table = []

            try:
                router_table = TrackingRouter.objects.get(router_id=str(r[2]))
                router_name = router_table.router_id
            except:
                pass

            try:
                employee_table = Employee.objects.get(rfid=str(r[3]))
                emp_name = employee_table.name
            except:
                pass
            tracking_data.append(
                str(r[6]) + ',' + mine_name + ',' + emp_name + ',' + str(r[3]) + ',' + router_name + ',' + str(
                    r[4]) + ',' + str(r[5]))
            i = i + 1
        data['result'] = tracking_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


####### single miners tracking#######

def single_miner_page(request, template_name='MinersTracking/single_miner_page.html'):
    data = {}
    mine_table = MineDetails.objects.all()
    data['object_list'] = mine_table
    return render(request, template_name, data)


def miner_path_history_page(request, template_name='MinersTracking/MinerPathHistory.html'):
    data = {}
    mine_table = MineDetails.objects.all()
    data['object_list'] = mine_table
    return render(request, template_name, data)


def fetch_miner_location(request):
    data = {}
    if request.is_ajax():
        miner_id = request.GET.get('miner_id', None)
        miner_details = MinerTracking.object.values_list().filter(transmitter_id=miner_id)
        #for r in miner_details:
            #print(r)
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_miner_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        miner_details = Employee.objects.filter(mine_id=mine_id)
        router_details = TrackingRouter.objects.filter(mine_id=mine_id)
        mine_details = MineDetails.objects.filter(id=mine_id)

        miner_data = {}
        mine_data = {}
        for m in miner_details:
            miner_data_temp = {}
            miner_data["Miner" + str(m.id)] = {}
            ###0-id,2-name,15-rfid
            miner_data_temp['name'] = str(m.name)
            miner_data_temp['rfid'] = str(m.rfid)
            miner_data["Miner" + str(m.id)] = miner_data_temp
            # miner_data.append(str(r[0])+','+str(r[2])+','+str(r[15]))

        router_datas = {}
        for r in router_details:
            router_data = {}
            str_new = "mapMarker" + str(r.id)
            router_datas[str_new] = {}
            router_data['cordX'] = str(r.x_axis)
            router_data['cordY'] = str(r.y_axis)
            icon='/static/image/router.svg'
            if r.is_block == 'Yes':
                icon='/static/image/blockedrouter.svg'
            elif r.is_block == 'No':
                icon='/static/image/router.svg'
            router_data['icon'] = icon
            router_model_data = {'title': str(r.router_id), 'content': "<b>Address: </b>"+str(r.address)+"<br><b>Location: </b>"+str(r.location)}
            router_data['modal'] = router_model_data
            router_datas[str_new] = router_data
            ###0-id,2-router_routerrend(str(xx[0])+','+str(xx[2])+','+str(xx[3])+','+str(xx[4])+','+str(xx[5])+','+str(xx[8])+','+str(xx[6])+','+str(xx[7]))

        for mm in mine_details:
            ###1-mine_name,6-map
            mine_data['name'] = str(mm.name)
            mine_data['image_url'] = str(mm.mine_map_image)
            # mine_data.append(str(mm[1])+','+str(mm[6]))
        # for r in router_details:
        #     router_name=str(r[2])
        #     miners_in_router={}
        #     #print(router_name)
        #
        #     #for mmr in miners_in_router:
        #         # print(mmr)

        data['result'] = miner_data
        data['routers'] = router_datas
        data['mine'] = mine_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def get_single_miners_data(request):
    data = {}
    mining_role=""
    if request.is_ajax():
        miner_id = request.GET.get('id', None)

        try:
            tracking_table = MinerTracking.objects.filter(transmitter_id=miner_id).order_by('-id')[0]
            router_id = tracking_table.router_id
            router_details = TrackingRouter.objects.filter(router_id=router_id).order_by('-id')[0]
            miner_details = Employee.objects.filter(rfid=miner_id).order_by('-id')[0]
        except:
            data['error']="Something Went Wrong!";
            return JsonResponse(data)

        try:
            mining_role_details = MiningRole.objects.get(id=miner_details.mining_role_id)
            mining_role = mining_role_details.type
            print(mining_role)
        except:
            pass
        #print(router_id)
        single_miner_data = {}

        single_miner_data['cordX'] = str(router_details.x_axis)
        single_miner_data['cordY'] = str(router_details.y_axis)
        icon = '/static/image/miner.svg'
        if mining_role == 'worker':
            icon = '/static/image/miner_worker.svg'
        elif mining_role == 'officer':
            icon = '/static/image/miner_officer.svg'

        single_miner_data['icon'] = icon
        current_time = datetime.datetime.now()
        last_record_time = tracking_table.created_date
        # print("Prev Time", last_record_time)
        # print("Current Time", current_time)
        timediff = current_time - last_record_time
        # print(timediff)
        single_miner_data_model_data = {'title': str(miner_details.name) + "||" + router_id,
                                        'content': "<small><strong>Address :</strong> " + str(
                                            router_details.address) + "</br><strong>Location : </strong>" + str(
                                            router_details.location) + "</br></small><small>" + str(
                                            timediff) + " ago</small>"}
        single_miner_data['modal'] = single_miner_data_model_data

        data[miner_id] = single_miner_data
    else:
        data['result'] = "Not Ajax"
        ###0-id,2-router_id,3-address,4-location,5-is_block,6-x_axix,7-y_axix,8-ip
        # router_data.append(str(xx[0])+','+str(xx[2])+','+str(xx[3])+','+str(xx[4])+','+str(xx[5])+','+str(xx[8])+','+str(xx[6])+','+str(xx[7]))
    return JsonResponse(data)

def get_single_miner_path_data(request):
    data = {}
    if request.is_ajax():
        mining_role=""
        mine_id = request.GET.get('mine_id', None)
        miner_id = request.GET.get('miner_id', None)
        date_from = request.GET.get('date_from', None)
        date_to = request.GET.get('date_to', None)
        print(date_from+" "+date_to)
        miner_details = Employee.objects.filter(mine_id=mine_id,rfid=miner_id).order_by('-id')[0]
        miner_table = MinerTracking.objects.filter(transmitter_id=miner_id,mine_id=mine_id,created_date__range=[date_from, date_to]).order_by('id')
        router_table = TrackingRouter.objects.filter(mine_id_id=mine_id)
        router_details={}
        try:
            mining_role_details = MiningRole.objects.get(id= miner_details.mining_role_id)
            mining_role = mining_role_details.type
            print("Mining Role="+mining_role)
        except:
            pass

        for rt in router_table:
            router_details[rt.router_id]=rt

        miner_path={}
        for mt in miner_table:
            miner_detail={}

            miner_detail_modal={}
            miner_detail['RouterId']=str(mt.router_id)
            #print(router_details[mt.router_id])
            miner_detail['cordX']=str(router_details[mt.router_id].x_axis)
            miner_detail['cordY']=str(router_details[mt.router_id].y_axis)
            icon = '/static/image/miner.svg'
            if mining_role == 'worker':
                icon = '/static/image/miner_worker.svg'
            elif mining_role == 'officer':
                # icon='/static/image/mine-cart.svg'
                icon = '/static/image/miner_officer.svg'
            miner_detail['icon']=icon
            print(icon)
            miner_detail_modal={'title': str(miner_details.name), 'content': str(miner_details.present_address)}
            miner_detail['modal']=miner_detail_modal
            miner_path[str(mt.id)] =miner_detail

        data['result']=miner_path
    else:
        data['result'] = "Not Ajax"

    return JsonResponse(data)

def get_all_miners_data(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        miner_details = Employee.objects.filter(mine_id=mine_id)
        # for r in router_details:
        #   print(r)

        for m in miner_details:
            tracking_table = {}

            miner_id = m.rfid
            try:
                mining_role_details=MiningRole.objects.get(id=m.mining_role_id)
                mining_role=mining_role_details.type
            except:
                pass
            # print(miner_id)
            try:
                tracking_table = MinerTracking.objects.filter(transmitter_id=miner_id, mine_id=mine_id).order_by('-id').first()
            except MinerTracking.DoesNotExist:
                tracking_table = None
                pass
            if tracking_table != None:
                router_id = tracking_table.router_id
                try:
                    router_details = TrackingRouter.objects.filter(router_id=router_id).order_by('-id')[0]
                except:
                    router_details=None


                try:
                    miner_details = Employee.objects.filter(rfid=miner_id).order_by('-id')[0]
                except:
                    miner_details=None
                    pass
                single_miner_data = {}
                if router_details != None:
                    single_miner_data['cordX'] = str(router_details.x_axis+random.uniform(-1.5, 1.5))
                    single_miner_data['cordY'] = str(router_details.y_axis+random.uniform(-1.5, 1.5))
                    single_miner_data['emergency']=str(tracking_table.emergency)
                    single_miner_data['miner_name']=str(miner_details.name)
                    icon='/static/image/miner.svg'
                    iconClass='MinerIcon'
                    if mining_role=='worker':
                        icon='/static/image/miner_worker.svg'
                        iconClass='MinerWorkerIcon'
                    elif mining_role=='officer':
                        # icon='/static/image/mine-cart.svg'
                        iconClass = 'MinerOfficerIcon'
                        icon='/static/image/miner_officer.svg'

                    single_miner_data['icon'] = icon
                    hash_object = hashlib.sha512(str(m.id).encode())
                    single_miner_data['id']=hash_object.hexdigest()
                    single_miner_data['iconClass']=iconClass
                    single_miner_data['router_id']=str(router_details.router_id)
                    timediff = tracking_table.whenpublished()
                    single_miner_data_model_data = {'title': str(miner_details.name)+"||"+router_id, 'content': "<small><strong>Address :</strong> "+str(router_details.address)+"</br><strong>Location : </strong>"+str(router_details.location)+"</br></small><small>"+str(timediff)+" ago</small>"}
                    single_miner_data['modal'] = single_miner_data_model_data
                    data[miner_id] = single_miner_data

    else:
        data['result'] = "Not Ajax"
    # print(data)
    return JsonResponse(data)
