from django.urls import path
from . import views

app_name = 'Training_Rescue_Accident'

urlpatterns = [
    path('', views.index, name='index'),# for training attendance
    path('manage_training_attendance', views.manage_training_attendance, name='manage_training_attendance'),# for manage training attendance
    path('EditEmployeeTrainingAttendance/<int:id>', views.EditEmployeeTrainingAttendance, name='EditEmployeeTrainingAttendance'),# for edit training attendance
    path('ViewEmployeeTrainingAttendance/<int:id>', views.ViewEmployeeTrainingAttendance, name='ViewEmployeeTrainingAttendance'),# for view training attendance
    path('DeleteEmployeeTrainingAttendance/<int:id>', views.DeleteEmployeeTrainingAttendance, name='DeleteEmployeeTrainingAttendance'),# for Delete training attendance

    path('fetch_shift', views.fetch_shift, name='fetch_shift'),
    path('fetch_employee_list', views.fetch_employee_list, name='fetch_employee_list'),
    #path('add_Training_Rescue_Accident', views.add_Training_Rescue_Accident, name='add_Training_Rescue_Accident'),# delete
    #path('Training_Rescue_Accident_Manage', views.Training_Rescue_Accident_Manage, name='Training_Rescue_Accident_Manage'),# delete
    path('Accident_index', views.Accident_index, name='Accident_index'),
    path('Accident_Manage', views.Accident_Manage, name='Accident_Manage'),
    path('Rescue_index', views.Rescue_index, name='Rescue_index'),
    path('Rescue_Manage', views.Rescue_Manage, name='Rescue_Manage'),
    path('fetch_miners_ajax',views.fetch_miners_ajax,name='fetch_miners_ajax'),
    path('rescue_record_submit_ajax',views.rescue_record_submit_ajax,name='rescue_record_submit_ajax'),
    path('accident_record_submit_ajax', views.accident_record_submit_ajax, name='accident_record_submit_ajax')
]