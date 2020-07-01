from django.db import models

# Create your models here.
from employee.models import MineDetails, EmployeeShiftAssign, Employee, MineShift


class training_attendance(models.Model):
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=True, blank=True)
    shift_id = models.ForeignKey(MineShift, on_delete=models.CASCADE, null=True, blank=True)
    training_date = models.CharField(max_length=255, null=True, blank=True)
    training_type = models.CharField(max_length=255, null=True, blank=True)
    training_tittle = models.CharField(max_length=255, null=True, blank=True)
    training_desc = models.CharField(max_length=255, null=True, blank=True)

    class Meta:
        db_table = "training_attendance"

class training_attendance_details(models.Model):
    BOOL_CHOICES = (("Yes", 'Yes'), ("No", 'No'))
    training_attendance_id = models.ForeignKey(training_attendance, on_delete=models.CASCADE, null=True, blank=True)
    emp_id =  models.ForeignKey(Employee, on_delete=models.CASCADE, null=True, blank=True)
    is_present = models.CharField(max_length=3, choices=BOOL_CHOICES)

    class Meta:
        db_table = "training_attendance_details"

class Rescue_Records(models.Model):
    mine = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=True, blank=True)
    shift_id = models.ForeignKey(MineShift,on_delete=models.CASCADE,null=True, blank=True)
    area = models.CharField(max_length=255, null=True, blank=True)
    date_fr = models.DateTimeField(max_length=255, null=True, blank=True)
    date_to = models.DateTimeField(max_length=255, null=True, blank=True)
    # rescue_dep_num = models.IntegerField(null=True, blank=True)
    # rescue_person_name = models.CharField(max_length=255, null=True, blank=True)
    rescue_person_name = models.ManyToManyField(Employee, null=True, blank=True,related_name='rescue')
    incident_type = models.CharField(max_length=255, null=True, blank=True)
    # employee_rescued_num = models.IntegerField(null=True, blank=True)
    # rescued_employees_name = models.CharField(max_length=255, null=True, blank=True)
    rescued_employees_name = models.ManyToManyField(Employee, null=True, blank=True,related_name='rescued')

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

