from django import forms
from . models import temperature
from datetime import datetime

class temperatureForm(forms.ModelForm):
    wbt = forms.FloatField(label="WBT (Wet-Bulb Temperature)", widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'Eg. 0.74', 'max_length': '254'}))
    dbt = forms.FloatField(label="DBT (Dry Bulb Temperature)", widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'Eg. 0.74', 'max_length': '254'}))
    date = forms.DateField(initial=datetime.today(),label="Date", widget=forms.DateInput())

    class Meta():
        model = temperature
        fields = '__all__'

class EraseForm(forms.Form):
    pass

class DisplayForm(forms.Form):
    pass
