from django.urls import path

from employee import views

app_name = 'employee'

urlpatterns = [
  path('', views.employee_manage, name='employee_manage'),
  path('new', views.employee_add, name='employee_add'),
  path('edit/<int:pk>', views.employee_edit, name='employee_edit'),
  path('delete/<int:pk>', views.employee_delete, name='employee_delete'),
  path('getsensordata', views.getsensordata, name='getsensordata'),
  path('show_graph', views.show_graph, name='show_graph'),
  path('get_data_for_graph', views.get_data_for_graph, name='get_data_for_graph'),
]