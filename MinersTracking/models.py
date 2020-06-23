from datetime import datetime

import math
from django.db import models

# Create your models here.
from django.db import models
from employee.models import MineDetails,Employee,MiningRole
from django.utils import timezone


class TrackingRouter(models.Model):
    IS_BLOCK=(('Yes','Yes'),('No','No'))

    mine_id=models.ForeignKey(MineDetails,on_delete=models.CASCADE)
    router_id=models.CharField(max_length=200)
    address=models.CharField(max_length=200)
    location=models.CharField(max_length=200,null=True,blank=True)
    is_block =models.CharField(max_length=100,blank=True,choices=IS_BLOCK)
    x_axis = models.FloatField(null=True, blank=True)
    y_axis = models.FloatField(null=True, blank=True)
    ip_add = models.CharField(max_length=200, null=True, blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.router_id
    class Meta:
        db_table="tracking_router"
        unique_together = ('mine_id','router_id')

class MinerTracking(models.Model):
    mine_id = models.IntegerField(default=0)
    router_id=models.CharField(max_length=200)
    transmitter_id=models.CharField(max_length=200)
    emergency=models.IntegerField(default=0)
    ip_add = models.CharField(max_length=200, null=True, blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)


    def Try(self):
        return self.id
    def whenpublished(self):
        now = timezone.now()
        diff = now - self.created_date

        if diff.days == 0 and diff.seconds >= 0 and diff.seconds < 60:
            seconds = diff.seconds

            if seconds == 1:
                return str(seconds) + "second ago"

            else:
                return str(seconds) + " seconds ago"

        if diff.days == 0 and diff.seconds >= 60 and diff.seconds < 3600:
            minutes = math.floor(diff.seconds / 60)

            if minutes == 1:
                return str(minutes) + " minute ago"

            else:
                return str(minutes) + " minutes ago"

        if diff.days == 0 and diff.seconds >= 3600 and diff.seconds < 86400:
            hours = math.floor(diff.seconds / 3600)

            if hours == 1:
                return str(hours) + " hour ago"

            else:
                return str(hours) + " hours ago"

        # 1 day to 30 days
        if diff.days >= 1 and diff.days < 30:
            days = diff.days

            if days == 1:
                return str(days) + " day ago"

            else:
                return str(days) + " days ago"

        if diff.days >= 30 and diff.days < 365:
            months = math.floor(diff.days / 30)

            if months == 1:
                return str(months) + " month ago"

            else:
                return str(months) + " months ago"

        if diff.days >= 365:
            years = math.floor(diff.days / 365)

            if years == 1:
                return str(years) + " year ago"

            else:
                return str(years) + " years ago"


    class Meta:
        db_table="miner_tracking"