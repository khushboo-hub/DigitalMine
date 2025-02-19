from datetime import date

from django.db import models
from .models import WindRoseSetting, WindRoseAddSensor, WindRoseData
from django import forms


class WindRoseSensorForm(forms.ModelForm):
    ip_address = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Enter IP Adress'
    }))

    wd_sensor_name = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'value': 'Wind Vane'
    }))

    wd_unit = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'value': 'degree'
    }))

    ws_sensor_name = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'value': 'Anemometer'
    }))

    ws_unit = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'value': 'm/s'
    }))

    rg_sensor_name = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'value': 'Rain Guage'
    }))

    rg_unit = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'value': 'mm'
    }))
    pm2_5_sensor_name = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'value': 'PM2.5'
    }))

    pm2_5_unit = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'value': 'ug/m3'
    }))
    pm10_sensor_name = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'value': 'PM10'
    }))

    pm10_unit = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'value': 'ug/m'
    }))
    humidity_sensor_name = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'value': 'DHT22'
    }))

    humidity_unit = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'value': 'percentage'
    }))
    temperature_sensor_name = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'value': 'DHT22'
    }))

    temperature_unit = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'value': 'celvin'
    }))

    so2_sensor_name = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'value': 'SO2 Sensor'
    }))

    so2_unit = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'value': 'ppm'
    }))

    no2_sensor_name = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'value': 'NO2 Sensor'
    }))

    no2_unit = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'value': 'ppm'
    }))

    class Meta():
        model = WindRoseSetting
        fields = ['ip_address', 'wd_sensor_name', 'wd_unit', 'ws_sensor_name', 'ws_unit', 'rg_sensor_name', 'rg_unit', 'pm2_5_sensor_name', 'pm2_5_unit', 'pm10_sensor_name', 'pm10_unit', 'humidity_sensor_name', 'humidity_unit', 'temperature_sensor_name', 'temperature_unit', 'so2_sensor_name', 'so2_unit', 'no2_sensor_name', 'no2_unit']




class WindRoseAddSensorForms(forms.ModelForm):
    sensor_id = forms.CharField(max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Sensor-ID'
    }))

    sensor_name = forms.CharField(max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Sensor Name'
    }))

    sensor_unit = forms.CharField(max_length=40, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Unit'
    }))

    min_range = forms.CharField(max_length=200, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Minimum Range'
    }))

    max_range = forms.CharField(max_length=200, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Maximum Range'
    }))

    desc = forms.CharField(max_length=200, required=False, widget=forms.Textarea(attrs={
        'class': 'form-control',
        'rows': '3',
        'placeholder': 'Please fill Descriptions'
    }))

    class Meta():
        model = WindRoseAddSensor
        fields = ['sensor_id', 'sensor_name', 'sensor_unit', 'min_range', 'max_range', 'desc']



