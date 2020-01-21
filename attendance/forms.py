from employee.models import MineDetails
from employee.models import Employee
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
        model = Employee
        fields = ['mine', 'date_parent']