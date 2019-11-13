from django import forms

from .models import AreaModel


class AreaForm(forms.ModelForm):
    # mine_id = forms.CharField( widget=forms.TextInput(attrs={
    #     'class': 'form-control',
    #     'placeholder': 'Mine'
    # }))
    areaName = forms.CharField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Area'
    }))
    areaName.widget.attrs['required'] = 'required'

    desc = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'if any info'
    }))

    IpAddress = forms.CharField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'ex: 192.168.1.5 '
    }))

    class Meta():
        model = AreaModel
        fields = ['mine_id', 'areaName', 'desc', 'IpAddress']


class ExplosiveAreaForm(forms.ModelForm):
    class Meta():
        model = AreaModel
        fields = ['mine_id']


class FireForm(forms.Form):
    o2 = forms.FloatField(label=' O2%')
    co = forms.FloatField(label=' CO%')
    ch4 = forms.FloatField(label=' CH4%')
    co2 = forms.FloatField(label=' CO2%')
    h2 = forms.FloatField(label=' H2%')
    n2 = forms.FloatField(label=' N2%')
    c2h4 = forms.FloatField(label=' C2H4%')
    date = forms.DateField(label='Entry Date')
