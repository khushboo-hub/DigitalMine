from django import forms

class FireForm(forms.Form):
    o2 = forms.FloatField(label=' O2%',widget=forms.NumberInput(attrs={
        'class':'form-control',
        'min':0,
    }))
    co = forms.FloatField(label=' CO%', widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'min': 0,
    }))
    ch4 = forms.FloatField(label=' CH4%', widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'min': 0,
    }))
    co2 = forms.FloatField(label=' CO2%', widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'min': 0,
    }))
    h2 = forms.FloatField(label=' H2%', widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'min': 0,
    }))
    n2 = forms.FloatField(label=' N2%', widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'min': 0,
    }))
    c2h4 = forms.FloatField(label=' C2H4%', widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'min': 0,
    }))

    date=forms.DateField(label='Entry Date',widget=forms.DateTimeInput(attrs={
            'class': 'form-control datetimepicker-input',
            'data-target': '#datetimepicker1'
        }))


class EraseForm(forms.Form):
    pass

class DisplayForm(forms.Form):
    pass

class AnalysisForm(forms.Form):
    pass

class TrendForm(forms.Form):
    pass

class PredictForm(forms.Form):
    startdate = forms.DateField(label=' StartDate')
    enddate = forms.DateField(label=' EndDate')

class SerialInputForm(forms.Form):
    pass

class EditForm(forms.Form):
    pass

class DeviceForm(forms.Form):
    port_no = forms.CharField(max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'ex: COM5 '
    }))
    baud_rate = forms.CharField(max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'ex: 9600'
    }))