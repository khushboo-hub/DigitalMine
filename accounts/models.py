
from django import forms
from django.core.exceptions import ValidationError
from django.db import models
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from employee1.models import MineDetails

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



class profile_extension(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)
    profile_avatar = models.ImageField(upload_to='employee_image/', null=True, blank=True)
    mine_id=models.ForeignKey(MineDetails,on_delete=models.CASCADE,blank=True,null=True)

    def __str__(self):
        return self.user_id

    class Meta:
        db_table = "profile_extension"


