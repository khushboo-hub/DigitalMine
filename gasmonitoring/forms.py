from django import forms
from . models import gasModel

class gasForm(forms.Form):
    CH4 = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'Eg. 0.74', 'max_length': '254'}))
    CO = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'Eg. 200'}))
    CO2 = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'Eg. 30.5'}))
    O2 = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'Eg. 21'}))
    H2S = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'Eg. 10'}))
    NO2 = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'Eg. 10'}))
    SO2 = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'Eg. 5'}))
    H2 = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'Eg. 0.55'}))
    He = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'Eg. 0.52'}))

class EraseForm(forms.Form):
    pass

class DisplayForm(forms.Form):
    pass
