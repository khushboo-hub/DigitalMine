from datetime import date
from .models import sms_configuration
from django import forms

class SmsConfigurationForm(forms.ModelForm):
    url = forms.CharField(max_length=200, required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Enter The URL'
    }))
    auth_key = forms.CharField(max_length=200, required=True, widget=forms.PasswordInput(attrs={
        'class': 'form-control',
        'placeholder': 'Enter The Auth Key'
    }))

    sender_id = forms.CharField(max_length=200, required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Enter The Sender Id'
    }))

    valid_till = forms.DateField(widget=forms.TextInput(attrs={
        'id': 'valid_till',
        'class': 'form-control',
        'placeholder': 'Valid Till',
    }))
    limit=forms.IntegerField(min_value=1, label="Limit", widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'size':'10'
    }))


    class Meta():
        model = sms_configuration
        fields = ['url','auth_key','sender_id','counter','limit','valid_till']