from django.contrib.auth.decorators import login_required
import math
from django_tables2 import RequestConfig
from django.shortcuts import render, redirect
from django.http import HttpResponse
from typing import Any
from django.template import Template,Context
from .tables import gasTable
from django.shortcuts import get_object_or_404
from . models import gasModel
from .forms import gasForm
from .forms import EraseForm
from .forms import DisplayForm


@login_required
def index(request):
    CH4 = CO = CO2 = O2 = H2S = NO2 = SO2 = H2 = He= 0.0
    CH4M = COM = CO2M = O2M = H2SM = NO2M = SO2M = H2M = HeM = " "
    form=gasForm()
    if request.method == 'POST':
        form = gasForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            gas_object = gasModel()
            gas_object.CH4 = data['CH4']
            gas_object.CO = data['CO']
            gas_object.CO2 = data['CO2']
            gas_object.O2 = data['O2']
            gas_object.H2S = data['H2S']
            gas_object.NO2 = data['NO2']
            gas_object.SO2 = data['SO2']
            gas_object.H2 = data['H2']
            gas_object.He = data['He']
            CH4 = data['CH4']
            CO = data['CO']
            CO2 = data['CO2']
            O2 = data['O2']
            H2S = data['H2S']
            NO2 = data['NO2']
            SO2 = data['SO2']
            H2 = data['H2']
            He = data['He']
            ##message calculation
                ##CH4
            if (CH4 >= 0.75) & (CH4 < 1 ):
                CH4M = "Alarming"
            elif (CH4 >= 1) & (CH4 < 1.25):
                    CH4M = "Critical"
            elif (CH4 >= 1.25):
                    CH4M = "Evacuate"
            else:
                CH4M = "Normal"
            if (CO >= 200) & (CO < 400 ):
                COM = "Alarming"
            elif (CO >= 400) & (CO < 800 ):
                COM = "Critical"
            elif (CO >= 800):
                    COM = "Evacuate"
            else:
                COM = "Normal"

            if (CO2 <= 30.5):
                CO2M = "Normal"
            else:
                CO2M = "Evacuate"

            if (O2 >= 21):
                O2M = "Normal"
            elif (O2 < 21) & (O2 >= 17):
                O2M = "Alarming"
            else:
                O2M = "Critical"

            if (H2S >= 10) & (H2S < 50 ):
                H2SM = "Alarming"
            elif (H2S >= 50) & (H2S < 100 ):
                H2SM = "Critical"
            elif (H2S >= 100):
                    H2SM = "Evacuate"
            else:
                H2SM = "Normal"
            if (NO2 >= 10) & (NO2 < 30 ):
                NO2M = "Alarming"
            elif (NO2 >= 30) & (NO2 < 60 ):
                NO2M = "Critical"
            elif (NO2 >= 60):
                    NO2M = "Evacuate"
            else:
                NO2M = "Normal"
            if (SO2 >= 5) & (SO2 < 10 ):
                SO2M = "Alarming"
            elif (SO2 >= 10) & (SO2 < 50 ):
                SO2M = "Critical"
            elif (SO2 >= 50):
                    SO2M = "Evacuate"
            else:
                SO2M = "Normal"
            if (H2 > 0.000055):
                H2M = "Alarming"
            else:
                H2M = "Normal"
            if (He > 0.000524):
                HeM = "Alarming"
            else:
                HeM = "Normal"

            gas_object.CH4_ALERT = CH4M
            gas_object.CO_ALERT = COM
            gas_object.CO2_ALERT = CO2M
            gas_object.O2_ALERT = O2M
            gas_object.H2S_ALERT = H2SM
            gas_object.NO2_ALERT = NO2M
            gas_object.SO2_ALERT = SO2M
            gas_object.H2_ALERT = H2M
            gas_object.He_ALERT = HeM

            # DEBUG
            # print(gas_object.CH4_ALERT)
            gas_object.save()

    gases = gasModel.objects.all()
    return render(request,'gasmonitoring/home.html', {'form':form,'tb':gases})


@login_required
def gas_delete(request, pk):
    gas_del= get_object_or_404(gasModel, pk=pk)
    gas_del.delete()
    return redirect('gasmonitoring:index')