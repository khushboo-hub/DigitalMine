from django.forms import forms
from datetime import date
from django import forms
from django.db import models
from datetime import date, datetime

from employee.models import MineDetails
from .models import Production_Vehicle, Production_Weighbridge,Production_Manualentry, Container_Details,Production_Tub,Production_Material_Waste,Production_DailyEntry,Production_Monthly,Production_DailyDispatch,Production_MonthlyDispatch,Production_YearlyDispatch,Production_YearlyEntry

class VehicleForm1(forms.ModelForm):

    rfid = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'RFID /  आर.एफ.आइ.डी '
    }))
    vehicle_reg_no = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Vehicle Reg no '
    }))
    TYPE_OF_VEHICLE = (
        ('Tripper', 'Tripper'),
        ('Truck', 'Truck'),
    )
    type_of_vehicle = forms.CharField(widget=forms.Select(choices=TYPE_OF_VEHICLE, attrs={
        'class': 'form-control',
        'placeholder': 'Type of vehicle '
    }))

    reg_laden_weight_of_the_vehicle = forms.FloatField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Reg Laden Weight of the Vehicle(tonne/kg) '
    }))
    REG_LADEN_WEIGHT_OF_THE_VEHICLES = (
        ('Tonne', 'Tonne'),
        ('Kg', 'Kg'),
    )
    reg_laden_weight_of_the_vehicles = forms.CharField(
        widget=forms.Select(choices=REG_LADEN_WEIGHT_OF_THE_VEHICLES, attrs={
            'class': 'form-control',
            'placeholder': 'Tonne '
        }))
    o_name = forms.CharField(label='Name', max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Owner Full Name /पूरा नाम '
    }))
    o_address = forms.CharField(max_length=100, required=False, widget=forms.Textarea(attrs={
        'class': 'form-control',
        'rows': '3',
        'placeholder': 'Please Enter Owner Permanent Address here / पता '
    }))
    o_mob = forms.CharField(required=False, max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Mobile No (10 Digits Only) / मोबाइल'
    }))
    o_email = forms.EmailField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Please Enter owner Email / ईमेल '
    }))
    d_name = forms.CharField(label='Name', max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Driver Full Name /पूरा नाम '
    }))
    d_address = forms.CharField(max_length=100, required=False, widget=forms.Textarea(attrs={
        'class': 'form-control',
        'rows': '3',
        'placeholder': 'Please Enter Driver Permanent Address here / पता '
    }))
    d_email = forms.EmailField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Please Enter Driver Email / ईमेल '
    }))
    d_mob = forms.CharField(required=False, max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Mobile No (10 Digits Only) / मोबाइल'
    }))
    d_photo = forms.ImageField(required=False)
    t_name = forms.CharField(label='Name', max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Transporter Full Name /पूरा नाम '
    }))
    t_address = forms.CharField(max_length=200, required=False, widget=forms.Textarea(attrs={
        'class': 'form-control',
        'rows': '3',
        'placeholder': 'Please Enter Permanent Address here / पता '
    }))
    t_email = forms.EmailField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Please Enter Your Email / ईमेल '
    }))
    w_no = forms.CharField(label='W_no',required=False, max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Work Order No '
    }))
    dates = forms.DateField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control datepicker',
        'value': date.today()
    }))
    party_details = forms.CharField(max_length=200, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Party Details'
    }))
    sale = forms.CharField(max_length=200,required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Sale '
    }))
    grade = forms.CharField(max_length=200,required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Grade '
    }))
    source = forms.CharField(max_length=200, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Source '
    }))
    destination = forms.CharField(max_length=200, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Destination '
    }))
    validity = forms.DateField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control datepicker',
        'value': date.today()
    }))
    from datetime import date
    start_date_of_order = forms.DateField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control datepicker',
        'value': date.today()
    }))

    end_date_of_order = forms.DateField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control',
        'value': date.today()
    }))
    value_of_order = forms.DecimalField(max_digits=6,decimal_places=2, widget=forms.NumberInput(attrs=
    {
        'class': 'form-control',
        'min':'0.0'

    }))
    validity_of_tag = forms.DateField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control',
        'value': date.today()
    }))
    trip_cycle = forms.CharField(max_length=200, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Trip Cycle '
    }))

    class Meta():
        model = Production_Vehicle
        fields = ['mine_id', 'rfid', 'vehicle_reg_no', 'type_of_vehicle', 'reg_laden_weight_of_the_vehicle',
                  'reg_laden_weight_of_the_vehicles', 'o_name', 'o_address', 'o_email', 'o_mob',
                  'd_name', 'd_address', 'd_email', 'd_mob', 'd_photo', 't_name', 't_address', 't_email', 'w_no',
                  'dates', 'party_details', 'sale',
                  'grade', 'source', 'destination', 'validity', 'start_date_of_order', 'end_date_of_order',
                  'value_of_order', 'validity_of_tag',
                  'trip_cycle']

########WeightBridge########


class WeighbridgeForm1(forms.ModelForm):
    w_name = forms.CharField(label='Name', max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Weightbridge Full Name /पूरा नाम '
    }))
    location = forms.CharField(label='Name', max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Location'
    }))
    desc = forms.CharField(max_length=200, required=False, widget=forms.Textarea(attrs={
        'class': 'form-control',
        'rows': '3',
        'placeholder': 'Please Enter Description here'
    }))
    wb_code=forms.CharField(label='Name', max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'weighbridge code'
    }))

    class Meta():
        model = Production_Weighbridge
        fields = ['mine_id', 'wb_code', 'location', 'desc','w_name']

#####manualentry######

class ManualentryForm1(forms.ModelForm):
    datetime_in=forms.DateTimeField(widget=forms.TextInput(attrs=
    {
        'class':  'form-control'
    }))
    datetime_out=forms.DateTimeField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control'
    }))
    trip_time=forms.CharField(max_length=200,widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Trip Time '
    }))
    tm_name=forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'TM Name '
    }))
    wb_code=forms.CharField(label='Name', max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Weighbridge Code '
    }))
    first_wt=forms.IntegerField(label='Name', widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'First weight',
        'type': 'number'
    }))
    second_wt=forms.IntegerField(label='Name', widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Second weight',
        'type': 'number'
    }))
    net_wt=forms.IntegerField(label='Name', widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Net weight',
        'type': 'number'
    }))
    weight_unit = forms.CharField(label='Name', max_length=100, widget=forms.TextInput( attrs={
            'class': 'form-control',

        }))
    type=forms.CharField(label='Name', max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Type'
    }))
    PRODUCTION_TYPE = (
        ('Coal', 'Coal'),
        ('Ore', 'Ore'),
    )
    production_type=forms.CharField(widget=forms.Select(choices=PRODUCTION_TYPE, attrs={
        'class': 'form-control',
        'placeholder': 'Production Type'
    }))
    entry_date = forms.DateField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control datepicker',
        'value': date.today()
    }))
    class Meta():
        model = Production_Manualentry
        fields=['mine_id','weighbridge_id','vehicle_id','datetime_in','datetime_out','trip_time','tm_name','wb_code',
                'first_wt','second_wt','net_wt','type','production_type','entry_date','weight_unit']

#####container_details######

class ContainerdetailsForm1(forms.ModelForm):
    name_of_the_tub = forms.CharField(label='Name', max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Name of the tub '
    }))

    initial_weight = forms.IntegerField(label='Name', widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Initial Weight',
        'type': 'number'

    }))

    laden_weight =  forms.IntegerField(label='Name',widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'laden Weight',
        'type': 'number'
    }))
    WEIGHT_UNIT = (
        ('Tonne', 'Tonne'),
        ('Kg', 'Kg'),
    )
    weight_unit=  forms.CharField(
        widget=forms.Select(choices=WEIGHT_UNIT, attrs={
            'class': 'form-control',
            'placeholder': 'Tonne '
        }))

    class Meta():
        model = Container_Details
        fields = ['name_of_the_tub', 'initial_weight', 'laden_weight', 'weight_unit']

#####Weighbridge_despatch######

class Production_Tub_Form1(forms.ModelForm):

    laden_weight = forms.IntegerField(label='Name', widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Average Weight',
        'type': 'number'
    }))
    no_of_trip=forms.IntegerField(label='Name', widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Initial Weight',
        'type': 'number'
    }))
    total_weight = forms.IntegerField(label='Name', widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Total Weight',
        'type': 'number'
    }))
    destination = forms.CharField(max_length=200, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Destination '
    }))
    datetime_in = forms.DateTimeField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control'
    }))
    class Meta():
        model = Production_Tub
        fields = ['mine_id','name_of_the_tub','laden_weight','no_of_trip', 'total_weight', 'destination','datetime_in']


######production_using_wastematerial#######
class Production_WasteMaterial_Form1(forms.ModelForm):
    net_weight = forms.IntegerField(label='Name', widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Net Weight',
        'type': 'number'
    }))

    PRODUCTION_TYPE = (
    ('Coal', 'Coal'),
    ('Ore', 'Ore'),
    )
    production_type = forms.CharField(widget=forms.Select(choices=PRODUCTION_TYPE, attrs={
    'class': 'form-control',
    'placeholder': 'Production Type'
    }))

    datetime_in = forms.DateTimeField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control'
    }))

    class Meta():
        model = Production_Material_Waste
        fields = ['mine_id','vehicle_id','weighbridge_id','net_weight','production_type','datetime_in']


######production_dailyentry#######


class Production_DailyEntry_Form1(forms.ModelForm):
    total_weight = forms.IntegerField(label='Name', widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Total Weight',
        'type': 'number'
    }))
    PRODUCTION_TYPE = (
        ('Coal', 'Coal'),
        ('Ore', 'Ore'),
    )
    production_type = forms.CharField(widget=forms.Select(choices=PRODUCTION_TYPE, attrs={
        'class': 'form-control',
        'placeholder': 'Production Type'
    }))

    dates = forms.DateField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control datepicker',
        'value': date.today()
    }))

    WEIGHT_UNIT = (
        ('Tonne', 'Tonne'),
        ('Kg', 'Kg'),
    )
    weight_unit = forms.CharField(
        widget=forms.Select(choices=WEIGHT_UNIT, attrs={
            'class': 'form-control',
            'placeholder': 'Tonne '
        }))

    class Meta():
        model = Production_DailyEntry
        fields = ['mine_id','shift_name','total_weight','weight_unit','production_type', 'dates']

class Production_Monthly_Form1(forms.ModelForm):
    PRODUCTION_TYPE = (
        ('Coal', 'Coal'),
        ('Ore', 'Ore'),
    )
    production_type = forms.CharField(widget=forms.Select(choices=PRODUCTION_TYPE, attrs={
        'class': 'form-control',
        'placeholder': 'Production Type'
    }))
    total_weight = forms.IntegerField(label='Name', widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Total Weight',
        'type': 'number'
    }))

    month = forms.IntegerField(label='Name', max_value=12, min_value=1, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Month',
        'min': '01',
        'max': '12',
    }))
    years = forms.CharField(max_length=4,required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Year',
        'type': 'number',
        'min': '1800',
        'max': '2999'

    }))
    WEIGHT_UNIT = (
        ('Tonne', 'Tonne'),
        ('Kg', 'Kg'),
    )

    weight_unit = forms.CharField(
        widget=forms.Select(choices=WEIGHT_UNIT, attrs={
            'class': 'form-control',
            'placeholder': 'Tonne '
        }))
    class Meta():
        model = Production_Monthly
        fields = ['mine_id','production_type','total_weight','weight_unit','month','years']
#### daily Dispatch ######

class Production_DailyDispatch_Form1(forms.ModelForm):
    total_weight = forms.IntegerField(label='Name', widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Total Weight',
        'type': 'number'
    }))
    PRODUCTION_TYPE = (
        ('Coal', 'Coal'),
        ('Ore', 'Ore'),
    )
    production_type = forms.CharField(widget=forms.Select(choices=PRODUCTION_TYPE, attrs={
        'class': 'form-control',
        'placeholder': 'Production Type'
    }))

    WEIGHT_UNIT = (
        ('Tonne', 'Tonne'),
        ('Kg', 'Kg'),
    )
    weight_unit = forms.CharField(
        widget=forms.Select(choices=WEIGHT_UNIT, attrs={
            'class': 'form-control',
            'placeholder': 'Tonne '
        }))
    dates = forms.DateField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control datepicker',
        'value': date.today()
    }))

    class Meta():
        model = Production_DailyDispatch
        fields = ['mine_id', 'shift_name','total_weight','weight_unit','production_type','dates']


####monthly dispatch######
class Production_MonthlyDispatch_Form1(forms.ModelForm):
    total_weight = forms.IntegerField(label='Name', widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Total Weight',
        'type': 'number'
    }))
    PRODUCTION_TYPE = (
        ('Coal', 'Coal'),
        ('Ore', 'Ore'),
    )
    production_type = forms.CharField(widget=forms.Select(choices=PRODUCTION_TYPE, attrs={
        'class': 'form-control',
        'placeholder': 'Production Type'
    }))

    month = forms.IntegerField(label='Name',max_value=12,min_value=1, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Month',
        'min': '01',
        'max': '12',
    }))
    years = forms.CharField(max_length=4, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Year',
        'type': 'number',
        'min': '1800',
        'max': '2999'
    }))

    WEIGHT_UNIT = (
        ('Tonne', 'Tonne'),
        ('Kg', 'Kg'),
    )
    weight_unit = forms.CharField(
        widget=forms.Select(choices=WEIGHT_UNIT, attrs={
            'class': 'form-control',
            'placeholder': 'Tonne '
        }))

    class Meta():
        model = Production_MonthlyDispatch
        fields = ['mine_id','total_weight','weight_unit','production_type', 'month','years']

######Yearly dispatch########
class Production_YearlyDispatch_Form1(forms.ModelForm):
    total_weight = forms.IntegerField(label='Name', widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Total Weight',
        'type': 'number'
    }))
    PRODUCTION_TYPE = (
        ('Coal', 'Coal'),
        ('Ore', 'Ore'),
    )
    production_type = forms.CharField(widget=forms.Select(choices=PRODUCTION_TYPE, attrs={
        'class': 'form-control',
        'placeholder': 'Production Type'
    }))
    years = forms.CharField(max_length=4, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Year',
        'type': 'number',
        'min':'1800',
        'max':'2999'
    }))
    WEIGHT_UNIT = (
        ('Tonne', 'Tonne'),
        ('Kg', 'Kg'),
    )
    weight_unit = forms.CharField(
        widget=forms.Select(choices=WEIGHT_UNIT, attrs={
            'class': 'form-control',
            'placeholder': 'Tonne '
        }))

    class Meta():
        model = Production_YearlyDispatch
        fields = ['mine_id','total_weight','weight_unit','production_type','years' ]
######yearlyentry#######
class Production_YearlyEntry_Form1(forms.ModelForm):
    total_weight = forms.IntegerField(label='Name', widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Total Weight',
        'type': 'number'
    }))
    PRODUCTION_TYPE = (
        ('Coal', 'Coal'),
        ('Ore', 'Ore'),
    )
    production_type = forms.CharField(widget=forms.Select(choices=PRODUCTION_TYPE, attrs={
        'class': 'form-control',
        'placeholder': 'Production Type'
    }))

    years = forms.CharField(max_length=4, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Year',
        'type':'number',
        'min': '1800',
        'max': '2999'
    }))
    WEIGHT_UNIT = (
        ('Tonne', 'Tonne'),
        ('Kg', 'Kg'),
    )
    weight_unit = forms.CharField(
        widget=forms.Select(choices=WEIGHT_UNIT, attrs={
            'class': 'form-control',
            'placeholder': 'Tonne '
        }))

    class Meta():
        model = Production_YearlyEntry
        fields = ['mine_id','total_weight','weight_unit','production_type','years' ]
