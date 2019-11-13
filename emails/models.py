
from django import forms
from django.core.exceptions import ValidationError
from django.db import models
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.utils.timezone import now


class emails(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)
    type = models.CharField(max_length=1000, null=True,blank=True)
    subject = models.CharField(max_length=1000, null=True, blank=True)
    email = models.CharField(max_length=1000, null=True, blank=True)
    email_to = models.CharField(max_length=1000, null=True, blank=True)
    email_from = models.CharField(max_length=1000, null=True, blank=True)
    sent_on = models.DateTimeField(max_length=255, null=True, blank=True,default=now, editable=False)
    attachment = models.FileField(upload_to="emails", null=True,blank=True)

    def __str__(self):
        return self.pk

    class Meta:
        db_table = "emails"


