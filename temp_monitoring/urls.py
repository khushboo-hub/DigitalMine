from django.conf.urls import url
from temp_monitoring import views
from django.views.generic import ListView, DetailView
from django.urls import path
from .models import homeModel

app_name = 'temp_monitoring'

urlpatterns = [
    path('', views.index, name='index'),
    path('temp_monitoring/show/', views.tables, name='tables'),
    path('temp_monitoring/delete/', views.delete, name='delete'),
    ]