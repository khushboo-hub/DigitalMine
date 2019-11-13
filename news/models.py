
from django import forms
from django.core.exceptions import ValidationError
from django.db import models
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.utils.timezone import now


class news_bulletin(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)
    news = models.CharField(max_length=1000, null=True,blank=True)
    created_on = models.DateField(max_length=255, null=True, blank=True,default=now, editable=False)
    updated_on = models.DateField(max_length=255, null=True, blank=True)
    valid_till = models.DateField(max_length=255, null=True, blank=True)
    download_link = models.FileField(upload_to="news_bulletin", null=True,blank=True)
    download_number=models.IntegerField(null=True, blank=True,default=0)

    def __str__(self):
        return self.pk

    class Meta:
        db_table = "news_bulletin"


