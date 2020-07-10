from django.db import models

# Create your models here.


# def load_data(apps, schema_editor):
#     DataSet1 = apps.get_model("setting", "setting")
#
#     DataSet1(
#          name="receiver_email",
#          value="shyam@gmail.com,rohit@gmail.com",
#          desc="List of email-id which will be receive mail",
#          ).save()
from employee.models import Employee


class setting(models.Model):
    name = models.CharField(max_length=500, default="", null=True, blank=True)
    value = models.CharField(max_length=500, default="", null=True, blank=True)
    desc = models.CharField(max_length=500, default="", null=True, blank=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    class Meta:
        db_table = "setting"

# class Migration(migrations.Migration):
#     dependencies = [
#         ('setting', '0007_auto_20200107_0934'),
#     ]
#
#     operations = [
#         migrations.RunPython(load_data)
#     ]
from django.utils.timezone import now
class Notification(models.Model):
    employee_id=models.ForeignKey(Employee,on_delete=models.CASCADE,null=True,blank=True)
    type = models.IntegerField()
    message = models.CharField(max_length=100,null=True,blank=True)  # Field name made lowercase.
    created_date = models.DateTimeField(default=now)
    isread = models.IntegerField(default=0)

    class Meta:
        db_table = 'notification'
        unique_together = ('type', 'message')