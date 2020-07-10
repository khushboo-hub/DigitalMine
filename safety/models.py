from django.db import models
from employee.models import MineDetails
class Safety(models.Model):
    objects=None
    mine=models.ForeignKey(MineDetails,on_delete=models.CASCADE,null=True,blank=True)
    owner=models.CharField(max_length=200)
    agent=models.CharField(max_length=200)
    manager=models.CharField(max_length=200)
    status_report=models.DateField()
    class Meta:
        db_table="safety"
        
        
        
class SafetyTable(models.Model):
    safety_id=models.ForeignKey(Safety,on_delete=models.CASCADE,null=True,blank=True)
    print_hazard=models.CharField(max_length=200)
    mit_date=models.DateField(null=True,blank=True)
    auditable_work=models.CharField(max_length=200)
    comp_date=models.DateField(null=True,blank=True)
    remarks=models.CharField(max_length=200)
    class Meta:
       db_table="safetytable"     