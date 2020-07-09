from django.urls import path
from safety import views 
from django.views.decorators.cache import  cache_page
app_name='safety'
urlpatterns=[
    path('',views.safe,name='safe'),
   # path('index',views.index),
    path('show/<int:pk>',views.show,name='show'),
    path('fetch_dropdownlist',views.fetch_dropdownlist,name='fetch_dropdownlist'),
    path('edit/<int:pk>',views.edit,name='edit'),
    path('manage',views.manage,name='manage'),
    path('delete/<int:pk>',views.delete,name='delete'),
            ]