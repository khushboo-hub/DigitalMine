from django.contrib.auth.decorators import login_required
import serial
from django.http import JsonResponse
from django.shortcuts import render, redirect, HttpResponse
# Create your views here.


@login_required
def com_data():
    pass
    # while True:
    #     while (arduinoData.inWaiting() == 0):  # Wait here until there is data
    #         arduinoString = arduinoData.readline()  # read the line of text from the serial port
    #         dataArray = arduinoString.split(b',')  # Split it into an array called dataArray
    #         ch4d = float(dataArray[0])  # Convert first element to floating number
    #         print(ch4d)



@login_required
def ch4_index(request):
    return render(request, 'gas_live_ch4.html')



@login_required
def ch4(request):
    try:
        arduinoData = serial.Serial('com17', 9600)  # Creating our serial object named arduino_Data
        arduinoString = arduinoData.readline()  # read the line of text from the serial port
        dataArray = arduinoString.split(b',')  # Split it into an array called dataArray
        ch4d = float(dataArray[0])  # Convert first element to floating number
        return HttpResponse(ch4d)

    except Exception as e:
        # return HttpResponse(str(e))
        print(str(e))


@login_required
def co_index(request):
    return render(request, 'gas_live_co.html')



@login_required
def co(request):
    # sr = serial.Serial("com17", 9600)
    # st = list(str(sr.readline(), 'utf-8'))
    # sr.close()
    # dd = str(''.join(st[:]))
    return HttpResponse(str(dd))



@login_required
def co2_index(request):
    return render(request, 'gas_live_co2.html')



@login_required
def co2(request):
    # sr = serial.Serial("com17", 9600)
    # st = list(str(sr.readline(), 'utf-8'))
    # sr.close()
    # dd = str(''.join(st[:]))
    # print(dd)
    return HttpResponse(str(dd))



@login_required
def o2_index(request):
    return render(request, 'gas_live_o2.html')



@login_required
def o2(request):
    # sr = serial.Serial("com17", 9600)
    # st = list(str(sr.readline(), 'utf-8'))
    # sr.close()
    # dd = str(''.join(st[:]))
    # print(dd)
    return HttpResponse(str(dd))



@login_required
def h2s_index(request):
    return render(request, 'gas_live_h2s.html')



@login_required
def h2s(request):
    # sr = serial.Serial("com17", 9600)
    # st = list(str(sr.readline(), 'utf-8'))
    # sr.close()
    # dd = str(''.join(st[:]))
    # print(dd)
    return HttpResponse(str(dd))



@login_required
def no2_index(request):
    return render(request, 'gas_live_no2.html')



@login_required
def no2(request):
    # sr = serial.Serial("com17", 9600)
    # st = list(str(sr.readline(), 'utf-8'))
    # sr.close()
    # dd = str(''.join(st[:]))
    # print(dd)
    return HttpResponse(str(dd))


@login_required
def so2_index(request):
    return render(request, 'gas_live_so2.html')



@login_required
def so2(request):
    # sr = serial.Serial("com17", 9600)
    # st = list(str(sr.readline(), 'utf-8'))
    # sr.close()
    # dd = str(''.join(st[:]))
    # print(dd)
    return HttpResponse(str(dd))



@login_required
def h2_index(request):
    return render(request, 'gas_live_h2.html')



@login_required
def h2(request):
    # sr = serial.Serial("com17", 9600)
    # st = list(str(sr.readline(), 'utf-8'))
    # sr.close()
    # dd = str(''.join(st[:]))
    # print(dd)
    return HttpResponse(str(dd))


@login_required
def he_index(request):
    return render(request, 'gas_live_h2.html')


@login_required
def he(request):
    # sr = serial.Serial("com17", 9600)
    # st = list(str(sr.readline(), 'utf-8'))
    # sr.close()
    # dd = str(''.join(st[:]))
    # print(dd)
    return HttpResponse(str(dd))