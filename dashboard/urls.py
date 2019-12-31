from django.urls import path

from dashboard import views

app_name = 'dashboard'

urlpatterns = [
    path('', views.dashboard_calling, name='dashboard_calling'),
    path('fetchwl',views.fetchwl,name="fetchwl"),
    path('fetchsl',views.fetchsl,name="fetchsl"),
]
