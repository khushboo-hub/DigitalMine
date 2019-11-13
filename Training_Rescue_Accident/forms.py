from employee1.models import MineDetails
from employee1.models import Employee1
from .models import Training_Rescue_Accident
from .models import Rescue_Records, Accident_Records
from django import forms
from datetime import date


class Training_Rescue_Accident_Form(forms.ModelForm):
    date_parent = forms.DateField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control datepicker',
        'value': date.today()
    }))

    class Meta():
        model = Employee1
        fields = ['mine']


class Rescue_Form(forms.ModelForm):
    shift_id = forms.CharField(widget=forms.Select(attrs=
    {
        'class': 'form-control',
        'required':''
    }))
    area = forms.CharField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control',
        'required': 'true'
    }))

    date_fr = forms.DateTimeField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control',
        'required': 'true',
        'id':'date_fr_de'
    }))

    date_to = forms.DateTimeField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control datepicker',
        'required': 'true'
    }))

    rescue_dep_num = forms.IntegerField(widget=forms.NumberInput(attrs=
    {
        'class': 'form-control',
        'min':'0',
        'required': 'true'
    }))

    rescue_person_name = forms.CharField(widget=forms.Select(attrs=
    {
        'class': 'form-control js-example-basic-multiple',
        'name':'states[]',
        'multiple':'multiple',
        'placeholer':'Add Miners',
        'required': 'true'
    }))

    incident_type = forms.CharField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control',
        'required': 'true'
    }))

    employee_rescued_num = forms.IntegerField(widget=forms.NumberInput(attrs=
    {
        'class': 'form-control',
        'required': 'true'
    }))

    rescued_employees_name = forms.CharField(widget=forms.Select(attrs=
    {
        'class': 'form-control js-example-basic-multiple',
        'name':'states[]',
        'multiple':'multiple',
        'placeholer':'Add Miners',
        'required': 'true'
    }))

    class Meta():
        model = Rescue_Records
        fields = ['mine', 'shift_id', 'area', 'date_fr', 'date_to', 'rescue_dep_num', 'rescue_person_name', 'incident_type', 'employee_rescued_num', 'rescued_employees_name']


class Accident_Form(forms.ModelForm):
    shift_id = forms.CharField(widget=forms.Select(attrs=
    {
        'class': 'form-control'
    }))

    situation_mines = forms.CharField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control'
    }))

    name_address = forms.CharField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control'
    }))

    vil_pin = forms.CharField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control'
    }))
    date_hour_accident = forms.DateTimeField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control datepicker',
        'required': 'true'
    }))

    accident_location = forms.CharField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control'
    }))
    #
    killed_num = forms.IntegerField(widget=forms.NumberInput(attrs=
    {
        'class': 'form-control'
    }))

    injured_num = forms.IntegerField(widget=forms.NumberInput(attrs=
    {
        'class': 'form-control'
    }))
    #
    accident_cause_description = forms.CharField(widget=forms.Textarea(attrs=
    {
        'class': 'form-control'
    }))

    person_names = forms.CharField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control'
    }))
    emp_nat = forms.CharField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control'
    }))

    age = forms.IntegerField(widget=forms.NumberInput(attrs=
    {
        'class': 'form-control'
    }))

    sex = forms.CharField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control'
    }))

    injury_death_cause = forms.CharField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control'
    }))


    class Meta():
        model = Accident_Records
        fields = '__all__'
