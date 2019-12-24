from datetime import datetime

from django.db import models

# Create your models here.
from employee1.models import MineDetails


class water_level_monitoring_model(models.Model):
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=True, blank=True)
    area_name = models.CharField(max_length=200, null=True, blank=True)

    distance_bet_roof_and_water = models.CharField(max_length=50, null=True, blank=True)

    alarm_water_level_1 = models.CharField(max_length=200, null=True, blank=True)
    alarm_water_level_2 = models.CharField(max_length=200, null=True, blank=True)
    alarm_water_level_3 = models.CharField(max_length=200, null=True, blank=True)

    level_1_msg = models.CharField(max_length=200, null=True, blank=True,default='First Stage Warning Message , Please be Careful.')
    level_2_msg = models.CharField(max_length=200, null=True, blank=True,default='Second Stage Warning Message , Please be alert situation is not good.')
    level_3_msg = models.CharField(max_length=200, null=True, blank=True,default='Third Stage Warning Message , Please  leave the underground')

    level_1_audio = models.FileField(upload_to='water_warning_audio/', null=True, blank=True)
    level_2_audio = models.FileField(upload_to='water_warning_audio/', null=True, blank=True)
    level_3_audio = models.FileField(upload_to='water_warning_audio/', null=True, blank=True)

    ip_address = models.CharField(max_length=200, null=True, blank=True)
    desc = models.CharField(max_length=200, null=True, blank=True)

    audio_play_type = models.CharField(max_length=10, default='mp3only')

    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(auto_now=True)

    moter_start_level = models.CharField(max_length=200, null=True, blank=True)
    moter_stop_level = models.CharField(max_length=200, null=True, blank=True)

    class Meta:
        db_table = "water_level_monitoring_sensor"

class water_level_monitoring_data_acquisition_model(models.Model):
    sensor_id = models.IntegerField()
    sensor_value = models.CharField(max_length=50,null=True,blank=True,default='0.0')
    created_date = models.DateTimeField(default=datetime.now, blank=True)

    class Meta:
        db_table = "water_level_acquisition_data"
