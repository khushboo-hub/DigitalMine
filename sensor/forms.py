from datetime import date

from django import forms
from .models import Node,Wireless,Sensor_Node

class NodeForm(forms.ModelForm):

    nodeid = forms.CharField( max_length=200,widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder':'Node ID (Ex: N001)'
        }))
    name = forms.CharField( max_length=200,widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder':'Name (Ex: Node1)'
        }))
    location = forms.CharField( max_length=200,widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder':'Location (Ex: Near Pillar 17)'
        }))
    # ip_add= forms.CharField(max_length=200, widget=forms.TextInput(attrs={
    #     'class': 'form-control',
    #     'placeholder': 'IP1 (Ex: 192.168.1.1)'
    # }))
    x_axis = forms.FloatField(widget=forms.TextInput(attrs={
        'class': 'form-control'
        # 'placeholder': 'X Axis (Ex: 17)'
    }))
    y_axis = forms.FloatField(widget=forms.TextInput(attrs={
        'class': 'form-control'
        # 'placeholder': 'Y Axis (Ex: 18)'
    }))
    photo1 = forms.ImageField()
    photo2 = forms.ImageField()
    description = forms.CharField( max_length=200,widget=forms.Textarea(attrs={
            'class': 'form-control',
            'placeholder':'Description (Ex: )'
        }))
    class Meta():
        model = Node
        fields = ['mine_id', 'nodeid', 'name', 'location', 'x_axis', 'y_axis', 'photo1', 'photo2', 'description','isgoaf']

class Sensor_NodeForm(forms.ModelForm):
    sensorid = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Node ID (Ex: S001)'
    }))
    ip_add = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder': 'IP1 (Ex: 192.168.1.1)'
    }))
    sensorname = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Node ID (Ex: CH2)',
        'style': 'text-transform:uppercase;'
    }))
    sensorunit = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Node ID (Ex: 10 ppm)'
    }))
    thresholdlimit = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Node ID (Ex: 100 ppm)'
    }))
    sensorunit1 = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Node ID (Ex: 100 ppm)'
    }))
    sensorunit2 = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Node ID (Ex: 150 ppm)'
    }))
    sensorunit3 = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Node ID (Ex: 200 ppm)'
    }))
    sensormsg1 = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Node ID (Ex: Enter first level message)'
    }))
    sensormsg2 = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Node ID (Ex: Enter second level message)'
    }))
    sensormsg3 = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Node ID (Ex: Enter third level message)'
    }))
    greenlevel = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    yellowlevel = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    redlevel = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    description = forms.CharField(max_length=200, widget=forms.Textarea(attrs={
        'class': 'form-control',
        'placeholder': 'Description (Ex: )'
    }))
    YES_NO = [
        ('Yes', 'Yes'),
        ('No', 'No'),
    ]
    isgoaf = forms.BooleanField(widget=forms.RadioSelect(attrs={
        'class':'yesy',
    },choices=[(True, 'Yes'),
                                                            (False, 'No')]))

    class Meta():
        model = Sensor_Node
        fields = ['ip_add', 'sensorid', 'sensorname', 'sensorunit', 'thresholdlimit', 'sensorunit1', 'sensorunit2', 'sensorunit3', 'sensormsg1', 'sensormsg2', 'sensormsg3', 'greenlevel', 'yellowlevel', 'redlevel', 'description']

# class SensorForm(forms.ModelForm):
#     sensorid = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
#         'class': 'form-control',
#         'placeholder': 'Sensor ID (Ex: S001)'
#     }))
#     sensorname = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
#         'class': 'form-control',
#         'placeholder': 'Sensor Name (Ex: CH4 )'
#     }))
#     minrange = forms.IntegerField( widget=forms.TextInput(attrs={
#         'class': 'form-control',
#         'placeholder': 'Min Range (Ex: 25)'
#     }))
#     maxrange = forms.IntegerField( widget=forms.TextInput(attrs={
#         'class': 'form-control',
#         'placeholder': 'Max Range (Ex: 56)'
#     }))
#     sensorunit = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
#         'class': 'form-control',
#         'placeholder': 'Sensor Unit (Ex: ppm)'
#     }))
#     thresholdlimit = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
#         'class': 'form-control',
#         'placeholder': 'Threshold Limit (Ex: 45)'
#     }))
#     greenlevel = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
#         'class': 'form-control',
#         'placeholder': 'Green Level (Ex: 25)'
#     }))
#     yellowlevel = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
#         'class': 'form-control',
#         'placeholder': 'Yellow Level (Ex: 30)'
#     }))
#     redlevel = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
#         'class': 'form-control',
#         'placeholder': 'Red Level (Ex: 52)'
#     }))
#     photo = forms.ImageField()
#
#     class Meta:
#         model = Sensor
#         fields = ['id','sensorid','sensorname','minrange','maxrange','sensorunit','thresholdlimit','greenlevel','yellowlevel','redlevel','photo']

class WirelessForm(forms.ModelForm):
    ipaddress = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'IP Address (Ex: 192.168.0.204)'
    }))
    name = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Name (Ex: WN001)'
    }))

    class Meta:
        model = Wireless
        fields = ['id','ipaddress','name']


class gasModel_autoForm(forms.Form):
    CH4 = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Eg. 0.75'}))
    CO = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Eg. 200'}))
    CO2 = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Eg. 30.5'}))
    O2 = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Eg. 21'}))
    H2S = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Eg. 10'}))
    NO2 = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Eg. 10'}))
    SO2 = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Eg. 5'}))
    H2 = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Eg. 0.055'}))
    He = forms.FloatField(widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Eg. 0.0524'}))

