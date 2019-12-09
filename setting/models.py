from django.db import models

# Create your models here.
class setting(models.Model):
    name = models.CharField(max_length=500, default="", null=True, blank=True)
    value = models.CharField(max_length=500, default="", null=True, blank=True)
    desc = models.CharField(max_length=500, default="", null=True, blank=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    class Meta:
        db_table = "setting"

