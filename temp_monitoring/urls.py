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
    path('temp_monitoring/live_temp_data/', views.live_temp_data, name='live_temp_data'),
    path('temp_monitoring/fetch_sensor_values_ajax/', views.fetch_sensor_values_ajax, name='fetch_sensor_values_ajax'),
    path('temp_monitoring/start_save_sensor/', views.start_save_sensor, name='start_save_sensor')
    ]