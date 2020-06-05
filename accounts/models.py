
from django import forms
from django.db import models
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from employee.models import MineDetails
from django.contrib.sessions.models import Session
from django.conf import settings

class SignupForm(UserCreationForm):
    email = forms.EmailField(max_length=200, help_text='Required')

    class Meta:
        model = User
        unique = ('email')
        fields = ('first_name','last_name','username', 'email','password1', 'password2')

    def clean_email(self):
        email = self.cleaned_data.get('email')
        username = self.cleaned_data.get('username')
        if email and User.objects.filter(email=email).exclude(username=username).exists():
            raise forms.ValidationError(u'Email addresses must be unique.')
        return email


# from gdstorage.storage import GoogleDriveStorage
# gd_storage = GoogleDriveStorage()

class profile_extension(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)
    profile_avatar = models.ImageField(upload_to='employee_image/', null=True, blank=True)
    mine_id=models.ForeignKey(MineDetails,on_delete=models.CASCADE,blank=True,null=True)

    def __str__(self):
        return self.user_id

    class Meta:
        db_table = "profile_extension"

from django.utils.timezone import now
class UserSession(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL,on_delete=models.CASCADE)
    session = models.ForeignKey(Session,on_delete=models.CASCADE)
    ip = models.CharField(max_length=255, null=True, blank=True)
    time = models.DateTimeField(default=now)
    useragent = models.CharField(max_length=255,null=True,blank=True)

    class Meta:
        db_table = "usersession"


