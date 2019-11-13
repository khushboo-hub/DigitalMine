
from django import forms
from django.core.exceptions import ValidationError
from django.db import models
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.utils.timezone import now


class sms_configuration(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)
    url = models.CharField(max_length=1000, null=True,blank=True)
    auth_key = models.CharField(max_length=255, null=True, blank=True)
    sender_id = models.CharField(max_length=255, null=True, blank=True)
    valid_till = models.DateField(max_length=255, null=True, blank=True)
    counter=models.IntegerField(null=True, blank=True,default=0)
    limit=models.IntegerField(null=True, blank=True,default=0)
    created_date = models.DateField(max_length=255, null=True, blank=True, default=now, editable=False)
    def __str__(self):
        return self.pk

    class Meta:
        db_table = "sms_configuration"


