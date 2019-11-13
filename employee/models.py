from django.db import models

# Create your models here.
from django.db import models
from django.urls import reverse
from django.utils import timezone


class Employee(models.Model):
    fname = models.CharField('First Name',max_length=200 )
    lname=models.CharField('Last Name',max_length=200)
    age = models.IntegerField('Age')
    doj=models.DateField('Date of Joining',default=timezone.now)
    rfid=models.CharField('RFID',max_length=200,default="")
    # address=models.CharField('Address',max_length=500,default="")
    address=models.TextField()
    state=models.CharField(max_length=200,default="")
    email=models.EmailField(default="")
    pin=models.IntegerField(default=0)
    mob=models.IntegerField(default=0)

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('employee:employee_edit', kwargs={'pk': self.pk})