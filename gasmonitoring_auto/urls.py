from django.conf.urls import url
from gasmonitoring_auto import views
from django.views.generic import ListView, DetailView
from django.urls import path
from .models import gasModel_auto

app_name='gasmonitoring_auto'

urlpatterns = [
    #path('',views.index, name = 'index'),
    path('gas_delete/<int:pk>', views.gas_delete, name='gas_delete'),
    path('background_view', views.background_view, name='background_view'),
    ]