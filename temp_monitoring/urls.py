from django.conf.urls import url
from temp_monitoring import views
from django.views.generic import ListView, DetailView
from django.urls import path

app_name = 'temp_monitoring'

urlpatterns = [
    path('', views.index, name='index'),
    path('show', views.tables, name='tables'),
    path('delete/<int:pk>', views.delete, name='delete'),
    path('live_temp_data/', views.live_temp_data, name='live_temp_data'),
    path('fetch_sensor_values_ajax/', views.fetch_sensor_values_ajax, name='fetch_sensor_values_ajax'),
    path('start_save_sensor/', views.start_save_sensor, name='start_save_sensor')
    ]