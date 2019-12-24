from django import forms

from water_level_monitoring.models import water_level_monitoring_model


class add_water_sensor_form(forms.ModelForm):
    # mine_id = forms.CharField( widget=forms.TextInput(attrs={
    #     'class': 'form-control',
    #     'placeholder': 'Mine'
    # }))
    area_name = forms.CharField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Area Name',
        'requried':'required'
    }))
    distance_bet_roof_and_water = forms.CharField(required=True, widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ex. 100',}))
    alarm_water_level_1 = forms.CharField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Ex. 10',
        'requried': 'required'
    }))
    alarm_water_level_2 = forms.CharField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Ex. 20',
        'requried': 'required'
    }))

    alarm_water_level_3 = forms.CharField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder':  'Ex. 30',
        'requried': 'required'
    }))
    level_1_msg = forms.CharField(required=False,initial='First Stage Warning Message , Please be Careful.',
                                  widget=forms.TextInput(attrs={'class': 'form-control', }))
    level_2_msg = forms.CharField(required=False,
                                  initial='Second Stage Warning Message , Please be alert situation is not good.',
                                  widget=forms.TextInput(attrs={'class': 'form-control', }))
    level_3_msg = forms.CharField(required=False,
                                  initial='Third Stage Warning Message , Please  leave the underground',
                                  widget=forms.TextInput(attrs={'class': 'form-control', }))

    level_1_audio = forms.FileField(required=False)
    level_2_audio = forms.FileField(required=False)
    level_3_audio = forms.FileField(required=False)

    CHOICES = [('text2voice', 'Text message to voice convert'),
               ('mp3only', 'Play uploaded mp3 only')]
    audio_play_type = forms.ChoiceField(choices=CHOICES, initial='text2voice',
                                        widget=forms.RadioSelect(attrs={"class": "audio_play_type"}))

    ip_address = forms.CharField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'ex: 192.168.1.5 '
    }))

    desc = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'if any info'
    }))
    moter_start_level = forms.CharField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'ex: 50'
    }))
    moter_stop_level = forms.CharField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'ex: 20 '
    }))


    class Meta():
        model = water_level_monitoring_model
        fields = ['mine_id', 'area_name','alarm_water_level_1','alarm_water_level_2','alarm_water_level_3','ip_address', 'desc','level_1_msg','level_2_msg','level_3_msg','level_1_audio','level_2_audio','level_3_audio','audio_play_type','distance_bet_roof_and_water','moter_start_level','moter_stop_level']
