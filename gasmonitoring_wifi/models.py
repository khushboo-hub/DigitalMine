# Create your models here.
from django.db import models
# Create your models here.
from employee.models import MineDetails


class AreaModel(models.Model):
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=True, blank=True)
    areaName = models.CharField(max_length=400, null=True, blank=True)
    desc = models.CharField(max_length=400, null=True, blank=True)
    IpAddress = models.CharField(max_length=200, null=True, blank=True)

    class Meta:
        db_table = "FireExp_area"


class Fire_exp_gasesWifi(models.Model):
    Area_id = models.IntegerField(null=True, blank=True)
    o2 = models.FloatField()
    co = models.FloatField()
    ch4 = models.FloatField()
    co2 = models.FloatField()
    h2 = models.FloatField()
    n2 = models.FloatField()
    c2h4 = models.FloatField()
    graham_ratio = models.FloatField()
    graham_msg = models.TextField()
    young_ratio = models.FloatField()
    young_msg = models.TextField()
    coco2_ratio = models.FloatField()
    coco2_msg = models.TextField()
    jtr_ratio = models.FloatField()
    jtr_msg = models.TextField()
    chra_ratio = models.FloatField()
    chra_msg = models.TextField()
    explosm_result = models.TextField()
    date = models.DateField()

    class Meta:
        db_table = "Fire_exp_gaseswifi"
