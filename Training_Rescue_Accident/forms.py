from dateutil.utils import today

from employee.models import MineDetails, MineShift
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

    # shift_id = forms.ChoiceField(widget=forms.Select(attrs=
    # {
    #     'class': 'form-control',
    #     'required':''
    # }))
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

    incident_type = forms.CharField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control',
        'required': 'true'
    }))
    rescue_person_name = forms.ModelMultipleChoiceField(queryset=Employee.objects.all(),
                                                            widget=forms.SelectMultiple(attrs={
                                                                'class': 'form-control js-example-basic-multiple'}))
    rescued_employees_name = forms.ModelMultipleChoiceField(queryset=Employee.objects.all(),
                                                        widget=forms.SelectMultiple(attrs={'class': 'form-control js-example-basic-multiple'}))

    class Meta():
        model = Rescue_Records
        fields = ['mine', 'shift_id', 'area', 'date_fr', 'date_to', 'rescue_person_name', 'incident_type', 'rescued_employees_name']


class Accident_Form(forms.ModelForm):
    mine= forms.ModelChoiceField(queryset=MineDetails.objects.all(),
                                     widget=forms.Select(attrs={
                                         'class': 'form-control'}),
                                     empty_label="------Select Mine------")
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


    class Meta():
        model = Accident_Records
        fields = '__all__'

class Accident_EmployeeForm(forms.ModelForm):


    employee_name = forms.ModelMultipleChoiceField(queryset=Employee.objects.all(),
                                                        widget=forms.Select(attrs={
                                                            'class': 'form-control js-example-basic-multiple'}))

    employee_cause = forms.CharField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control'
    }))

    class Meta():
        model = Accident_Records
        fields = '__all__'

class Accident_OthersForm(forms.ModelForm):


    person_name = forms.CharField(widget=forms.TextInput(attrs={
        'class':'form-control'
    }))


    age = forms.IntegerField(widget=forms.NumberInput(attrs=
    {
        'class': 'form-control'
    }))
    nature_of_employment = forms.CharField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control'
    }))
    others_cause = forms.CharField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control'
    }))

    class Meta():
        model = Accident_Records
        fields = '__all__'