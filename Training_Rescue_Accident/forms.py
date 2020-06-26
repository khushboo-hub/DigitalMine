from dateutil.utils import today

from employee.models import MineDetails
from employee.models import Employee
from .models import training_attendance,training_attendance_details
from .models import Rescue_Records, Accident_Records
from django import forms
from datetime import date


class Training_Form(forms.ModelForm):

    mine_id = forms.ModelChoiceField(queryset=MineDetails.objects.all(),
                                     widget=forms.Select(attrs={
                                    'class': 'form-control'}),
                                    empty_label="Select Mine")

    shift_id = forms.CharField(widget=forms.Select(attrs={
                           'class': 'form-control',
                           'required':False
                       }))

    training_date = forms.DateField(widget=forms.TextInput(attrs={
        'class': 'form-control datepicker',
        'value': date.today()
    }))

    training_date = forms.DateField(initial=today,widget=forms.TextInput(attrs={"class":"form-control"}))

    training_type = forms.CharField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control',
        'required': 'true'
    }))
    training_tittle = forms.CharField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control',
        'required': 'true'
    }))
    training_desc = forms.CharField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control',
        'required': 'true'
    }))


    class Meta():
        model = training_attendance
        fields = "__all__"

class training_attendance_details_form(forms.ModelForm):
    TRUE_FALSE_CHOICES = (
        ("Yes", 'Yes'),
        ("No", 'No')
    )

    training_attendance_id = forms.CharField(widget=forms.Select(attrs={
            'class': 'form-control',
            'required':False
        }))


    emp_id = forms.CharField(widget=forms.TextInput(attrs={
                           'class': 'form-control',
                           'required':False
                       }))
    is_present = forms.ChoiceField(choices = TRUE_FALSE_CHOICES,widget=forms.Select(), required=True)
    class Meta():
        model = training_attendance_details
        fields = "__all__"

class Training_Rescue_Accident_Form(forms.ModelForm):
    date_parent = forms.DateField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control datepicker',
        'value': date.today()
    }))

    class Meta():
        model = Employee
        fields = ['mine']


class Rescue_Form(forms.ModelForm):
    mine= forms.ModelChoiceField(queryset=MineDetails.objects.all(),
                                     widget=forms.Select(attrs={
                                         'class': 'form-control'}),
                                     empty_label="---Select Mine---")

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
        'class': 'form-control',
        # 'name':'states[]',
        # 'multiple':'multiple',
        # 'placeholer':'Add Miners',
        # 'required': 'true'
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
        'class': 'form-control',
        # 'name':'states[]',
        # 'multiple':'multiple',
        # 'placeholer':'Add Miners',
        # 'required': 'true'
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
