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
    emp_id = models.ForeignKey(Employee, on_delete=models.CASCADE, null=True, blank=True)
    is_present = models.CharField(max_length=3, choices=BOOL_CHOICES)

    class Meta:
        db_table = "training_attendance_details"


class Rescue_Records(models.Model):
    mine = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=True, blank=True)
    shift_id = models.ForeignKey(MineShift, on_delete=models.CASCADE, null=True, blank=True)
    area = models.CharField(max_length=255, null=True, blank=True)
    date_fr = models.DateTimeField(max_length=255, null=True, blank=True)
    date_to = models.DateTimeField(max_length=255, null=True, blank=True)
    rescue_person_name = models.ManyToManyField(Employee, blank=True, related_name='rescue')
    incident_type = models.CharField(max_length=255, null=True, blank=True)
    rescued_employees_name = models.ManyToManyField(Employee, blank=True, related_name='rescued')

    class Meta:
        db_table = "rescue_records"


class Accident_Records(models.Model):
    mine = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=True, blank=True)
    shift_id = models.ForeignKey(MineShift,on_delete=models.CASCADE,null=True,blank=True)
    situation_mines = models.CharField(max_length=255, null=True, blank=True)
    name_address = models.CharField(max_length=255, null=True, blank=True)
    vil_pin = models.CharField(max_length=255, null=True, blank=True)
    date_hour_accident = models.DateTimeField(max_length=255, null=True, blank=True)
    accident_location = models.CharField(max_length=255, null=True, blank=True)
    killed_num = models.IntegerField(null=True, blank=True)
    injured_num = models.IntegerField(null=True, blank=True)
    accident_cause_description = models.CharField(max_length=255, null=True, blank=True)
    def persons(self):
        return Accident_Records_employees.objects.filter(accident_record=self.pk)

    class Meta:
        db_table = "accident_records"


class Accident_Records_employees(models.Model):
    accident_record = models.ForeignKey(Accident_Records, on_delete=models.CASCADE, null=True, blank=True)
    employee_id=models.ForeignKey(Employee,on_delete=models.CASCADE,null=True,blank=True)
    employee_name=models.CharField(max_length=50,null=True,blank=True)
    killed_or_injured=models.CharField(max_length=15,null=True,blank=True)
    cause=models.CharField(max_length=100,null=True,blank=True)
    class Meta:
        db_table="accident_record_employee"

class Accident_Records_others(models.Model):
    accident_id = models.ForeignKey(Accident_Records, on_delete=models.CASCADE)
    killed_or_injured=models.CharField(max_length=15,null=True,blank=True)
    name = models.CharField(max_length=100, null=True, blank=True)
    age = models.IntegerField(null=True, blank=True)
    sex = models.CharField(max_length=1,null=True, blank=True)
    nature_of_employment=models.CharField(max_length=50,null=True,blank=True)
    cause = models.CharField(max_length=255, null=True, blank=True)

    class Meta:
        db_table = "accident_records_others"

class RESCUE_Others(models.Model):
    RESCUE_OR_RESCUED = (('', ''),
                         ('R', 'RESCUE'),
                         ('D', 'RESCUED'))

    SEX = (('M', 'MALE'),
           ('F', 'FEMALE'))
    rescue_id = models.ForeignKey(Rescue_Records, on_delete=models.CASCADE)
    rescue_or_rescued = models.CharField(max_length=1, choices=RESCUE_OR_RESCUED)
    name = models.CharField(max_length=100, null=True, blank=True)
    age = models.IntegerField(null=True, blank=True)
    sex = models.CharField(max_length=1, choices=SEX, null=True, blank=True)

    class Meta:
        db_table = "rescue_records_others"



