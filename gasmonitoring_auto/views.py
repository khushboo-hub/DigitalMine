# MM
from __future__ import unicode_literals
from django.contrib.auth.decorators import login_required
import math
from django_tables2 import RequestConfig
from django.shortcuts import render, redirect
from django.http import HttpResponse
from typing import Any
from django.template import Template,Context
from .tables import gasTable
from django.shortcuts import get_object_or_404
from . models import gasModel_auto
from .forms import gasForm
from .forms import EraseForm
from .forms import DisplayForm
import serial
import matplotlib.pyplot as plt
from drawnow import *
from background_task import background


CH4G = []
COG = []
CO2 = []
O2 = []
H2S = []
NO2 = []
SO2 = []
H2 = []
He = []

#print(arduinoData)
plt.ion()  # Tell matplotlib you want interactive mode to plot live data
cnt = 0


@background(schedule=5)
def index():
    pass
    # CH4 = CO = CO2 = O2 = H2S = NO2 = SO2 = H2 = He= 0.0
    # CH4M = COM = CO2M = O2M = H2SM = NO2M = SO2M = H2M = HeM = " "
    #
    # arduinoData = serial.Serial('COM16', 9600)  # Creating our serial object named arduinoData
    # while (arduinoData.inWaiting() == 0):  # Wait here until there is data
    #     pass  # do nothing
    # arduinoString = arduinoData.readline()  # read the line of text from the serial port
    # dataArray = arduinoString.split(b',')  # Split it into an array called dataArray
    # CH4 = float(dataArray[0])
    # CO = float(dataArray[1])  # Convert first element to floating number and put in temp
    # CO2 = float(dataArray[2])  # Convert second element to floating number and put in P
    # O2 = float(dataArray[3])
    # H2S = float(dataArray[4])
    # NO2 = float(dataArray[5])
    # SO2 = float(dataArray[6])
    # H2 = float(dataArray[7])
    # He = float(dataArray[8])
    # print(CH4, CO, CO2, O2, H2S, NO2, SO2, H2, He)
    # f = gasModel_auto()
    # f.CH4 = dataArray[0]
    # f.CO = dataArray[1]
    # f.CO2 = dataArray[2]
    # f.O2 = dataArray[3]
    # f.H2S = dataArray[4]
    # f.NO2 = dataArray[5]
    # f.SO2 = dataArray[6]
    # f.H2 = dataArray[7]
    # f.He = dataArray[8]
    #
    # if (CH4 >= 420.00) & (CH4 < 490.00):
    #     CH4M = "Alarming"
    #     #print(CH4)
    # elif (CH4 >= 491.00) & (CH4 < 520.00):
    #         CH4M = "Critical"
    # elif (CH4 >= 520.00):
    #         CH4M = "Evacuate"
    # else:
    #     CH4M = "Normal"
    #
    #
    # if (CO >= 410.00) & (CO < 450.00):
    #       COM = "Alarming"
    # elif (CO >= 451.00) & (CO < 490.00):
    #        COM = "Critical"
    # elif (CO >= 490.00):
    #        COM = "Evacuate"
    # else:
    #     COM = "Normal"
    #
    # if (CO2 <= 450.00):
    #     CO2M = "Normal"
    # else:
    #     CO2M = "Evacuate"
    #
    # if (O2 >= 440.00):
    #      O2M = "Normal"
    # elif (O2 < 440.00) & (O2 >= 415.00):
    #        O2M = "Alarming"
    # else:
    #     O2M = "Critical"
    #
    # if (H2S >= 400.00) & (H2S < 405.00):
    #       H2SM = "Alarming"
    # elif (H2S >= 405.00) & (H2S < 410.00):
    #       H2SM = "Critical"
    # elif (H2S >= 410.00):
    #        H2SM = "Evacuate"
    # else:
    #     H2SM = "Normal"
    # if (NO2 >= 350.00) & (NO2 < 380.00):
    #       NO2M = "Alarming"
    # elif (NO2 >= 380.00) & (NO2 < 410.00):
    #        NO2M = "Critical"
    # elif (NO2 >= 410.00):
    #        NO2M = "Evacuate"
    # else:
    #     NO2M = "Normal"
    # if (SO2 >= 360.00) & (SO2 < 380.00):
    #      SO2M = "Alarming"
    # elif (SO2 >= 380.00) & (SO2 < 400.00):
    #        SO2M = "Critical"
    # elif (SO2 >= 400.00):
    #        SO2M = "Evacuate"
    # else:
    #     SO2M = "Normal"
    # if (H2 > 420.00):
    #      H2M = "Alarming"
    # else:
    #     H2M = "Normal"
    # if (He > 350.00):
    #      HeM = "Alarming"
    # else:
    #     HeM = "Normal"
    #
    # f.CH4_ALERT = CH4M
    # f.CO_ALERT = COM
    # f.CO2_ALERT = CO2M
    # f.O2_ALERT = O2M
    # f.H2S_ALERT = H2SM
    # f.NO2_ALERT = NO2M
    # f.SO2_ALERT = SO2M
    # f.H2_ALERT = H2M
    # f.He_ALERT = HeM
    # f.save()
    # print(CH4M)
    # print(COM)
    # print(CO2M)
    # print(O2M)
    # print(H2SM)
    # print(NO2M)
    # print(SO2M)
    # print(H2M)
    # print(HeM)



def gas_delete(request, pk):
    pass
    # gas_del = get_object_or_404(gasModel_auto, pk=pk)
    # gas_del.delete()
    # return redirect('gasmonitoring_auto:background_view')


@login_required
def background_view(request):
    # index(repeat=10)
    #return HttpResponse("Hello world !")
    form = gasForm()
    gases = gasModel_auto.objects.all()
    return render(request, 'gasmonitoring_auto/home.html',{'form': form, 'tb': gases})