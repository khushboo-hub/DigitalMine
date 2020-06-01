from django.db import models

# Create your models here.
from employee.models import MineDetails
from django.contrib.auth.models import User

class Carousal(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)
    file = models.ImageField(upload_to='carousal/')
    active= models.CharField(max_length=1, null=True, blank=True)
    mine = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return self.pk

    class Meta:
        db_table="carousal"