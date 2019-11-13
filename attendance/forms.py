from employee1.models import MineDetails
from employee1.models import Employee1
from .models import EmployeeAttendance
from django import forms
from datetime import date
class AttendenceForm(forms.ModelForm):
    date_parent = forms.DateField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control datepicker',
        'value': date.today()
    }))

    class Meta():
        model = Employee1
        fields = ['mine', 'date_parent']