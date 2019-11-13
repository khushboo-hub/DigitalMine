from django.urls import path

from Controlling import views

app_name = 'Controlling'

urlpatterns = [
  path('', views.bulb_on_off_page, name='bulb_on_off_page'),
  # path('show_database', views.show_database, name='show_database'),
]