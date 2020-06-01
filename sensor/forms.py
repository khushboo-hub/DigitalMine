from datetime import date

from django import forms
from .models import Node, Sensor_Node


class NodeForm(forms.ModelForm):
    node_id = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Node ID (Ex: N001)'
    }))
    name = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Name (Ex: Node1)'
    }))
    location = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Location (Ex: Near Pillar 17)'
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
    description = forms.CharField(max_length=200, widget=forms.Textarea(attrs={
        'class': 'form-control',
        'placeholder': 'Description (Ex: )'
    }))

    class Meta():
        model = Node
        fields = ['mine_id', 'node_id', 'name', 'location', 'x_axis', 'y_axis', 'photo1', 'photo2', 'description',
                  'isgoaf']


class Sensor_NodeForm(forms.ModelForm):
    sensor_id = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Node ID (Ex: S001)'
    }))
    ip_add = forms.GenericIPAddressField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'IP (Ex: 192.168.1.1)'
    }))
    GAS_SENSOR_CHOICES = (
        ('CO', 'CO'),
        ('CO2', 'CO2'),
        ('CH4', 'CH4'),
        ('O2', 'O2'),
        ('H2', 'H2'),
        ('N2', 'N2'),
        ('C2H4', 'C2H4')
    )
    sensor_name = forms.CharField(max_length=200, widget=forms.Select(choices=GAS_SENSOR_CHOICES,attrs={
        'class': 'form-control',
        'placeholder': 'Node ID (Ex: CH2)',
        'style': 'text-transform:uppercase;'
    }))
    sensor_unit = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Node ID (Ex:  ppm)'
    }))
    sensor_threshold_limit = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Node ID (Ex: 100 ppm)'
    }))
    level_1_warning_unit = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'ex: 5 ',
        'data-toggle': "tooltip",
        'data-placement': "right",
        'title': "Tips: Conversion should be 5"

    }))
    level_2_warning_unit = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'ex: 8 ',
        'data-toggle': "tooltip",
        'data-placement': "right",
        'title': "Tips: Conversion should be 8"
    }))
    level_3_warning_unit = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'ex: 10 ',
        'data-toggle': "tooltip",
        'data-placement': "right",
        'title': "Tips: Conversion should be 10"
    }))
    level_1_color = forms.CharField(required=False, initial='#ADFF2F',
                                    widget=forms.TextInput(attrs={'class': "jscolor  form-control", "id": "color1","value":"ADFF2F"}))
    level_2_color = forms.CharField(required=False, initial='#FFA500',
                                    widget=forms.TextInput(attrs={'class': "jscolor form-control", "id": "color2","value":"FFA500"}))
    level_3_color = forms.CharField(required=False, initial='#FF0000',
                                    widget=forms.TextInput(attrs={'class': "jscolor  form-control", "id": "color3","value":"FF0000"}))
    level_1_msg = forms.CharField(required=False,
                                  initial='Environment Condition:First Stage Warning Message , Please be Careful.',
                                  widget=forms.TextInput(attrs={'class': 'form-control', }))
    level_2_msg = forms.CharField(required=False,
                                  initial='Environment Condition:Second Stage Warning Message , Please be alert situation is not good.',
                                  widget=forms.TextInput(attrs={'class': 'form-control', }))
    level_3_msg = forms.CharField(required=False,
                                  initial='Environment Condition:Third Stage Warning Message , Please  leave the underground',
                                  widget=forms.TextInput(attrs={'class': 'form-control', }))

    interval_time = forms.CharField(initial=30, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': '30 Sec '
    }))
    description = forms.CharField(required=False,
                                  widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'if any info'}))

    level_1_audio = forms.FileField(required=False)
    level_2_audio = forms.FileField(required=False)
    level_3_audio = forms.FileField(required=False)

    CHOICES = [('text2voice', 'Text message to voice convert'),
               ('mp3only', 'Play uploaded mp3 only')]
    audio_play_type = forms.ChoiceField(choices=CHOICES, initial='text2voice',
                                        widget=forms.RadioSelect(attrs={"class": "audio_play_type"}))

    description = forms.CharField(max_length=200, widget=forms.Textarea(attrs={
        'class': 'form-control',
        'placeholder': 'Description (Ex: )'
    }))


    class Meta():
        model = Sensor_Node
        fields = ['ip_add', 'sensor_id', 'sensor_name', 'sensor_unit', 'sensor_threshold_limit', 'level_1_warning_unit',
                  'level_2_warning_unit',
                  'level_3_warning_unit', 'level_1_color', 'level_2_color', 'level_3_color', 'level_1_msg', 'level_2_msg',
                  'level_3_msg', 'interval_time', 'level_1_audio', 'level_2_audio',
                  'level_3_audio', 'audio_play_type',
                  'description']


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

# class WirelessForm(forms.ModelForm):
#     ipaddress = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
#         'class': 'form-control',
#         'placeholder': 'IP Address (Ex: 192.168.0.204)'
#     }))
#     name = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
#         'class': 'form-control',
#         'placeholder': 'Name (Ex: WN001)'
#     }))
#
#     class Meta:
#         model = Wireless
#         fields = ['id', 'ipaddress', 'name']


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
