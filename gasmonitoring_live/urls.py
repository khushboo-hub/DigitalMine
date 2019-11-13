from django.urls import path
from . import views

app_name = 'gasmonitoring_live'

urlpatterns = [
    path('', views.ch4_index, name='ch4_index'),
    path('ch4', views.ch4, name='ch4'),
    path('co_index', views.co_index, name='co_index'),
    path('co', views.ch4, name='co'),
    path('co2_index', views.co2_index, name='co2_index'),
    path('co2', views.co2, name='co2'),
    path('o2_index', views.o2_index, name='o2_index'),
    path('o2', views.o2, name='o2'),
    path('h2s_index', views.h2s_index, name='h2s_index'),
    path('h2s', views.h2s, name='h2s'),
    path('no2_index', views.no2_index, name='no2_index'),
    path('no2', views.no2, name='no2'),
    path('so2_index', views.so2_index, name='so2_index'),
    path('so2', views.so2, name='so2'),
    path('h2_index', views.h2_index, name='h2_index'),
    path('h2', views.h2, name='h2'),
    path('he_index', views.he_index, name='he_index'),
    path('he', views.he, name='he'),
]