from django import forms


class DeviceForm(forms.Form):
    port_no = forms.CharField(max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'ex: COM5 '
    }))
    baud_rate = forms.CharField(max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'ex: 9600'
    }))