from django import forms
from . models import homeModel

class homeForm(forms.Form):
    wbt1 = forms.FloatField(label="WBT (Wet-Bulb Temperature)", widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'Eg. 0.74', 'max_length': '254'}))
    dbt1 = forms.FloatField(label="DBT (Dry Bulb Temperature)", widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'Eg. 0.74', 'max_length': '254'}))

class EraseForm(forms.Form):
    pass

class DisplayForm(forms.Form):
    pass
