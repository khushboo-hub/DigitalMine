######  Created By: Dewangshu Pandit
######  Created On: 26/10/2018
######  Model table for database fields for Slope Monitoring : tables (Slope_location,)
from datetime import datetime

from django.db import models

from employee.models import MineDetails


class Slope_location(models.Model):
    mine_name=models.ForeignKey(MineDetails,on_delete=models.CASCADE,null=True,blank=True)
    location_name = models.CharField(max_length=200)
    tag_no = models.CharField(max_length=200, null=True, blank=True)
    x_axis =  models.FloatField(null=True, blank=True)
    y_axis =  models.FloatField(null=True, blank=True)
    json_url = models.CharField(max_length=200, null=True, blank=True)
    description = models.CharField(max_length=200, null=True, blank=True)
    created_date = models.DateField()
    modified_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.location_name

    class Meta:
        db_table = "slope_location"


class Slope_sensor(models.Model):
    mine_name = models.ForeignKey(MineDetails,on_delete=models.CASCADE,null=True,blank=True)
    location_id = models.ForeignKey(Slope_location,on_delete=models.CASCADE,null=True,blank=True)#models.IntegerField()
    sensor_name = models.CharField(max_length=200)
    sensor_unit = models.CharField(max_length=50)
    tag_no = models.CharField(max_length=200, null=True, blank=True)
    level_1_warning_unit = models.IntegerField()
    level_2_warning_unit = models.IntegerField()
    level_3_warning_unit = models.IntegerField()
    level_1_color = models.CharField(max_length=50,null=True,blank=True,default='#ADFF2F')## Default Green Color
    level_2_color = models.CharField(max_length=50,null=True,blank=True,default='#FFA500')## Default Orange Color
    level_3_color = models.CharField(max_length=50,null=True,blank=True,default='#FF0000')## Default Red Color
    level_1_msg = models.CharField(max_length=200,null=True,blank=True,default='Slope Condition:First Stage Warning Message , Please be Careful.')
    level_2_msg = models.CharField(max_length=200,null=True,blank=True,default='Slope Condition:Second Stage Warning Message , Please be alert situation is not good.')
    level_3_msg = models.CharField(max_length=200,null=True,blank=True,default='Slope Condition:Third Stage Warning Message , Please  leave the mine')

    level_1_audio = models.FileField(upload_to='Slope_warning_audio/',null=True,blank=True)
    level_2_audio = models.FileField(upload_to='Slope_warning_audio/',null=True,blank=True)
    level_3_audio = models.FileField(upload_to='Slope_warning_audio/',null=True,blank=True)

    ip_address = models.CharField(max_length=100)
    interval_time = models.IntegerField(null=True,blank=True,default='30')


    audio_play_type = models.CharField(max_length=10,default='mp3only')

    description = models.CharField(max_length=200, null=True, blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = "slope_sensor"

class Slope_sensor_data(models.Model):
    sensor_id = models.IntegerField()
    sensor_value = models.CharField(max_length=50,null=True,blank=True,default='0.0')
    created_date = models.DateTimeField(default=datetime.now, blank=True)

    class Meta:
        db_table = "slope_sensor_data"

class Slope_sensor_flag(models.Model):
    sensor_id = models.IntegerField()
    limit = models.IntegerField()# flag value
    type = models.CharField(max_length=10,null=True,blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(auto_now=True)
    pause_waring_duration_end_datetime = models.DateTimeField(default=datetime.now, blank=True)

    class Meta:
        db_table = "slope_sensor_flag"

