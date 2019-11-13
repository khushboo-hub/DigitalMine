from django.contrib import admin
from .models import Sensor,Arduino,Node,Nodesensor

# Register your models here.
admin.site.register(Sensor)
admin.site.register(Arduino)
admin.site.register(Node)
admin.site.register(Nodesensor)