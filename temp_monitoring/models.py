from django.db import models
from datetime import date, datetime

class homeModel(models.Model):
    wbt = models.FloatField(default=0.00)
    dbt = models.FloatField(default=0.00)
    relativeHumidity = models.FloatField(default=0.00)
    dewPointTemp = models.FloatField(default=0.00)
    moistureContent = models.FloatField(default=0.00)
    enthalpy = models.FloatField(default=0.00)
    sigmaHeat = models.FloatField(default=0.00)
    rel_hum_status = models.CharField(max_length=100,default="Normal")
    dew_status = models.CharField(max_length=100,default="Normal")

    class Meta:
        db_table = "temp_monitoring_manual"


class temp_monitoring_automatic(models.Model):
    wbt = models.FloatField(default=0.00)
    dbt = models.FloatField(default=0.00)
    relativeHumidity = models.FloatField(default=0.00)
    dewPointTemp = models.FloatField(default=0.00)
    moistureContent = models.FloatField(default=0.00)
    enthalpy = models.FloatField(default=0.00)
    sigmaHeat = models.FloatField(default=0.00)
    rel_hum_status = models.CharField(max_length=100,default="Normal")
    dew_status = models.CharField(max_length=100,default="Normal")
    ip_address=models.CharField(max_length=100,null=True,blank=True)

    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = "temp_monitoring_automatic"