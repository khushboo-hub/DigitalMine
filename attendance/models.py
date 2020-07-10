from django.db import models
# Create your models here.
from employee.models import MineDetails, EmployeeShiftAssign, Employee, MineShift,MiningRole

class EmployeeAttendance(models.Model):

    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=False, blank=False)
    shift_id = models.ForeignKey(MineShift, on_delete=models.CASCADE, null=False, blank=False)
    emp_id = models.ForeignKey(Employee, on_delete=models.CASCADE, null=False, blank=False)
    ab_pr_date = models.DateField(max_length=255, null=False, blank=False)
    ABPR = (
        ('Present', 'Present'),
        ('Absent', 'Absent'),
    )
    ab_pr = models.CharField(max_length=255,choices=ABPR, null=False,blank=False)
    leave_type = models.CharField(max_length=255, null=True, blank=True)
    leave_no = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = "attendance_emp"
        unique_together = ('mine_id', 'shift_id','emp_id','ab_pr_date')

class SetAttendanceFromAPIModel(models.Model):
    emp_id = models.ForeignKey(Employee, on_delete=models.CASCADE, null=False, blank=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = "employee_attendance"

