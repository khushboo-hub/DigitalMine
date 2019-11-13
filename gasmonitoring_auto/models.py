from django.db import models
from django.utils import timezone
class gasModel_auto(models.Model):
    CH4 = models.FloatField(default=0.00)
    CH4_ALERT = models.CharField(max_length=10, default='Null')
    CO = models.FloatField(default=0.00)
    CO_ALERT = models.CharField(max_length=10, default='Null')
    CO2 = models.FloatField(default=0.00)
    CO2_ALERT = models.CharField(max_length=10, default='Null')
    O2 = models.FloatField(default=0.00)
    O2_ALERT = models.CharField(max_length=10, default='Null')
    H2S = models.FloatField(default=0.00)
    H2S_ALERT = models.CharField(max_length=10, default='Null')
    NO2 = models.FloatField(default=0.00)
    NO2_ALERT = models.CharField(max_length=10, default='Null')
    SO2 = models.FloatField(default=0.00)
    SO2_ALERT = models.CharField(max_length=10, default='Null')
    H2 = models.FloatField(default=0.00)
    H2_ALERT = models.CharField(max_length=10, default='Null')
    He = models.FloatField(default=0.00)
    He_ALERT = models.CharField(max_length=10, default='Null')
    dt = models.DateTimeField(default=timezone.now)

    class Meta:
        db_table = "gasmonitoring_auto"