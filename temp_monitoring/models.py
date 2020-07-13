import math
from django.db import models
from datetime import date, datetime
from django.utils.timezone import now

class temperature(models.Model):
    wbt = models.FloatField(default=0.00)
    dbt = models.FloatField(default=0.00)

    date = models.DateField(default=now)

    def analysis(self):
        swbt = 610.5 * (2.713 ** ((self.wbt * 17.27) / (self.wbt + 273.3)))

        sdbt = 610.5 * (2.713 ** ((self.dbt * 17.27) / (self.dbt + 273.3)))

        vp = swbt - ((0.000644 * 101000.00) * (self.dbt - self.wbt))

        relativeHumidity = (vp / sdbt) * 100
        moistureContent = 622 * (vp / (101000.00 - vp))

        enthalpy = (1.005 * self.dbt) + (moistureContent * (2.5016 + (0.0018 * self.dbt)))
        sigmaHeat = enthalpy - (0.004187 * moistureContent * self.wbt)

        dewPointTemp = ((237.3 * math.log(vp / 610.5)) / 17.27) - math.log(vp / 610.5)

        if (dewPointTemp <= 30.5):
            dewPointTempm = "Normal"
        else:
            dewPointTempm = "Danger"
        if (relativeHumidity > 99):
            relativeHumiditym = "Normal"
        else:
            relativeHumiditym = "Danger"

        data = {
            'relativeHumidity': relativeHumidity,
            'relativeHumidity_msg': relativeHumiditym,
            'moistureContent': moistureContent,
            'enthalpy': enthalpy,
            'sigmaHeat': sigmaHeat,
            'dewpoint': dewPointTemp,
            'dewpoint_msg': dewPointTempm,

        }
        return data

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
    rel_hum_status = models.CharField(max_length=100, default="Normal")
    dew_status = models.CharField(max_length=100, default="Normal")
    ip_address = models.CharField(max_length=100, null=True, blank=True)

    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = "temp_monitoring_automatic"
