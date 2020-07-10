from django.contrib import admin

# Register your models here.
from attendance.models import SetAttendanceFromAPIModel
admin.site.register(SetAttendanceFromAPIModel)