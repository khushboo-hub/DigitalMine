from django.db import models

# Create your models here.
from employee.models import MineDetails, EmployeeShiftAssign, Employee, MineShift


class Training_Rescue_Accident(models.Model):
    mine_id = models.IntegerField(null=True, blank=True)
    shift_id = models.IntegerField(null=True, blank=True)
    emp_id = models.IntegerField(null=True, blank=True)
    training_type = models.CharField(max_length=255, null=True, blank=True)
    training_date = models.CharField(max_length=255, null=True, blank=True)
    is_ab_pr = models.CharField(max_length=255, null=True, blank=True)
    training_ab_pr_from = models.CharField(max_length=255, null=True, blank=True)
    training_ab_pr_to = models.CharField(max_length=255, null=True,blank=True)
    training_remarks = models.CharField(max_length=255, null=True, blank=True)
    training_count = models.IntegerField(null=True, blank=True)

    class Meta:
        db_table = "training_rescue_accident"

class Rescue_Records(models.Model):
    mine = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=True, blank=True)
    shift_id = models.IntegerField(null=True, blank=True)
    area = models.CharField(max_length=255, null=True, blank=True)
    date_fr = models.DateTimeField(max_length=255, null=True, blank=True)
    date_to = models.DateTimeField(max_length=255, null=True, blank=True)
    rescue_dep_num = models.IntegerField(null=True, blank=True)
    rescue_person_name = models.CharField(max_length=255, null=True, blank=True)
    incident_type = models.CharField(max_length=255, null=True, blank=True)
    employee_rescued_num = models.IntegerField(null=True, blank=True)
    rescued_employees_name = models.CharField(max_length=255, null=True, blank=True)

    class Meta:
        db_table = "rescue_records"

class Accident_Records(models.Model):
    mine = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=True, blank=True)
    shift_id = models.IntegerField(null=True, blank=True)
    situation_mines = models.CharField(max_length=255, null=True, blank=True)
    name_address = models.CharField(max_length=255, null=True, blank=True)
    vil_pin = models.CharField(max_length=255, null=True, blank=True)
    date_hour_accident = models.DateTimeField(max_length=255, null=True, blank=True)
    accident_location = models.CharField(max_length=255, null=True, blank=True)
    killed_num = models.IntegerField(null=True, blank=True)
    injured_num = models.IntegerField(null=True, blank=True)
    accident_cause_description = models.CharField(max_length=255, null=True, blank=True)
    person_names = models.CharField(max_length=255, null=True, blank=True)
    emp_nat = models.CharField(max_length=255, null=True, blank=True)
    age = models.IntegerField(null=True, blank=True)
    sex = models.CharField(max_length=255, null=True, blank=True)
    injury_death_cause = models.CharField(max_length=255, null=True, blank=True)

    class Meta:
        db_table = "accident_records"

