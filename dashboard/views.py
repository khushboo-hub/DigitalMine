from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from .models import MineDetails,Sensor,Node

# Create your views here.

@login_required
def dashboard_calling(request):

    data={}
    mine_table = MineDetails.objects.all()
    data['mine_table'] = mine_table

    first_mine=MineDetails.objects.values_list('id','name')[0]## work for first mine in list
    data['first_mine_id']=first_mine[0]
    data['first_mine_name'] = first_mine[1]
    ### --find first gas node under this mine,and show some gas values like ch4,co2 etc on that node
    # first_node=Node.objects.filter('mine_id',1).values_list('id','name')
    # data['node']=first_node
    ###--end
    print (data)
    return render(request, "index.html",data)
