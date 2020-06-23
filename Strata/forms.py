from django import forms
from .models import Strata_location, Strata_sensor, Strata_sensor_flag
from datetime import datetime


class Strata_location_Form(forms.ModelForm):
    #location_name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'ex: 7D/52L'}))
    tag_no = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'tg669'}))
    x_axis = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'ex:12'
    }))
    y_axis = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'ex: 28 '
    }))
    description = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'if any info'}))
    created_date = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}))


    class Meta():
        model = Strata_location
        fields = ['mine_name','location_name' ,'tag_no','x_axis','y_axis','description','created_date']

class Strata_sensor_Form(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(Strata_sensor_Form, self).__init__(*args, **kwargs)  # populates the post


    sensor_name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control','placeholder': 'ex: Convergence Indicator'}))
    sensor_unit = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'ex:mm,Pa,mPa,kPa etc'}))
    tag_no = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'ex:Tag009 (optional field)'
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
        'data-placement' : "right",
        'title' : "Tips: Conversion should be 8"
    }))
    level_3_warning_unit = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'ex: 10 ',
        'data-toggle': "tooltip",
        'data-placement': "right",
        'title': "Tips: Conversion should be 10"
    }))
    level_1_color = forms.CharField(required=False, initial='#ADFF2F', widget=forms.TextInput(attrs={'class': 'jscolor form-control',"id":"color1"}))
    level_2_color = forms.CharField(required=False, initial='#FFA500', widget=forms.TextInput(attrs={'class': 'jscolor form-control',"id":"color2" }))
    level_3_color = forms.CharField(required=False, initial='#FF0000' , widget=forms.TextInput(attrs={'class': 'jscolor form-control',"id":"color3" }))
    level_1_msg = forms.CharField(required=False, initial='Strata Condition:First Stage Warning Message , Please be Careful.', widget=forms.TextInput(attrs={'class': 'form-control', }))
    level_2_msg = forms.CharField(required=False, initial='Strata Condition:Second Stage Warning Message , Please be alert situation is not good.',widget=forms.TextInput(attrs={'class': 'form-control', }))
    level_3_msg = forms.CharField(required=False, initial='Strata Condition:Third Stage Warning Message , Please  leave the underground',widget=forms.TextInput(attrs={'class': 'form-control', }))

    ip_address = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'ex: 192.168.1.5'

    }))
    interval_time = forms.CharField(initial=30,widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': '30 Sec '
    }))
    description = forms.CharField(required=False,widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'if any info'}))


    level_1_audio = forms.FileField(required=False)
    level_2_audio = forms.FileField(required=False)
    level_3_audio = forms.FileField(required=False)

    CHOICES = [('text2voice', 'Text message to voice convert'),
               ('mp3only', 'Play uploaded mp3 only')]
    audio_play_type = forms.ChoiceField(choices=CHOICES,initial='text2voice', widget=forms.RadioSelect(attrs={"class":"audio_play_type"}))

    class Meta():
        model = Strata_sensor
        fields = ['mine_name','location_id','sensor_name','sensor_unit','tag_no','level_1_warning_unit','level_2_warning_unit','level_3_warning_unit','level_1_color',
                  'level_2_color','level_3_color','level_1_msg','level_2_msg','level_3_msg','ip_address','description','interval_time','level_1_audio','level_2_audio',
                  'level_3_audio','audio_play_type']

class Live_data_tabular(forms.ModelForm):
    class Meta():
        model=Strata_sensor
        fields=['mine_name']

class Strata_sensor_flag_Form(forms.ModelForm):
    sensor_id = forms.IntegerField()
    limit = forms.IntegerField()  # flag value
    type = forms.CharField()
    pause_waring_duration_end_datetime =  forms.DateTimeField(widget=forms.TextInput(attrs={"id":"datetimepicker1","class":"form-control","value":datetime.now()}))


    class Meta():
        model = Strata_sensor_flag
        fields = "__all__"