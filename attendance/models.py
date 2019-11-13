from django.db import models

# Create your models here.
from employee1.models import MineDetails, EmployeeShiftAssign, Employee1, MineShift


class EmployeeAttendance(models.Model):
    mine_id = models.IntegerField(null=True, blank=True)
    shift_id = models.IntegerField(null=True, blank=True)
    emp_id = models.IntegerField(null=True, blank=True)
    ab_pr_date = models.DateField(max_length=255, null=True, blank=True)
    ab_pr = models.CharField(max_length=255, null=True,blank=True)
    leave_type = models.CharField(max_length=255, null=True, blank=True)
    leave_no = models.IntegerField(null=True, blank=True)

    class Meta:
        db_table = "attendance_emp"

