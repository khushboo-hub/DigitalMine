from django.conf.urls import url
from gasmonitoring import views
from django.views.generic import ListView, DetailView
from django.urls import path
from .models import gasModel

app_name = 'gasmonitoring'

urlpatterns = [
    path('',views.index, name = 'index'),
    path('gas_delete/<int:pk>', views.gas_delete, name='gas_delete'),
    ]