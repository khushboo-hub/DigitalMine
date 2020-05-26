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

class Notification(models.Model):
    type = models.IntegerField()
    message = models.CharField(db_column='Message', max_length=100)  # Field name made lowercase.
    time = models.DateTimeField()
    isread = models.IntegerField(default=False)

    class Meta:
        managed = False
        db_table = 'notification'