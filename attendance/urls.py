from django.urls import path, include

from . import views

app_name = 'attendance'

urlpatterns = [

    path('', views.index, name='index'),
    path('attendance_manage', views.attendance_manage, name='attendance_manage'),
    path('add_att', views.add_att, name='add_att'),
    path('fetch_shift', views.fetch_shift, name='fetch_shift'),
    path('fetch_employee_list', views.fetch_employee_list, name='fetch_employee_list'),
    path('ajax_show_attendence',views.ajax_show_attendence,name='ajax_show_attendence'),
    path("api-v1",views.AttendanceAPIView.as_view())
]