from django.urls import path

from emails import views

app_name = 'emails'
urlpatterns = [
    path('', views.index, name='index'),
    path('cyto',views.cyto,name='cyto'),
]
