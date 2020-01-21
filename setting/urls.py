
from django.urls import path
from setting import views


app_name='setting'

urlpatterns = [
    path('manage_constant', views.manage_constant,name='manage_constant'),
    path('add_constant', views.add_constant, name='add_constant'),
    path('edit_constant/<int:id>', views.edit_constant,name='edit_constant'),
    path('delete_constant/<int:id>', views.delete_constant,name='delete_constant'),
    path('globalWarningFunction', views.globalWarningFunction,name='globalWarningFunction'),
]
