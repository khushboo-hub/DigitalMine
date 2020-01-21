from datetime import datetime

from django.db import models

# Create your models here.
from django.db import models
from employee.models import MineDetails,Employee,MiningRole


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

    class Meta:
        db_table="miner_tracking"