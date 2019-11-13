##################################################################################
###     Created By: DEWANGSHU PANDIT
###     Created On: 27/28 - Sep -2018
###     Purpose :Controlling of fan, bulb in underground mines via remotely , etc
###     Any Description:
###     Last Modified:
###     Modified function,any:
##################################################################################
import datetime

###################
import serial
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import render
import time


# Create your views here.
from .forms import DeviceForm

@login_required
def bulb_on_off_page(request, template_name='controlling/bulb_on_off_page.html'):
    bulb_img=""
    if request.method == 'POST' and 'bulb_on' in request.POST:
        form = DeviceForm(request.POST)
        if form.is_valid():
            port_no = form.cleaned_data['port_no']
            baud_rate = form.cleaned_data['baud_rate']
            try:
                arduino = serial.Serial(port_no,baud_rate)
                print("The LED is on...")
                time.sleep(1)
                arduino.write("H".encode())
                arduino.close()
                bulb_img="/static/image/on_bulb.jpg"
            except Exception as e:
                return HttpResponse("<h2>Please Connect The Arduino Properly and Check PORT.</br></h2><small>"+str(e)+"</small>")
    elif request.method == 'POST' and 'bulb_off' in request.POST:
        form = DeviceForm(request.POST)
        if form.is_valid():
            port_no = form.cleaned_data['port_no']
            baud_rate = form.cleaned_data['baud_rate']
            try:
                arduino = serial.Serial(port_no, baud_rate)
                print("The LED is on...")
                time.sleep(1)
                arduino.write("L".encode())
                arduino.close()
                bulb_img = "/static/image/off_bulb.jpg"
            except Exception as e:
                return HttpResponse(
                    "<h2>Please Connect The Arduino Properly and Check PORT.</br></h2><small>" + str(e) + "</small>")

    else:
        form=DeviceForm()
    resultdict = {'form':form,'bulb_img':bulb_img}
    return render(request, template_name,resultdict)




# Create your views here.
