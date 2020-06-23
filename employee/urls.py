from django.urls import path

from employee import views
from django.views.decorators.cache import  cache_page

app_name = 'employee'

urlpatterns = [

    path('add_mine', views.add_mine, name='add_mine'),
    path('manage_mine', views.manage_mine, name='manage_mine'),
    path('edit_mine/<int:pk>', views.edit_mine, name='edit_mine'),
    path('delete_mine/<int:pk>', views.delete_mine, name='delete_mine'),
    path('show_role_chart/', views.show_role_chart, name='show_role_chart'),
    path('fetch_role_ajax/', views.fetch_role_ajax, name='fetch_role_ajax'),
    path('get_dropdownlist',views.get_dropdownlist,name='get_dropdownlist'),

    path('', views.employee_manage, name='employee_manage'),
    path('new',views.employee_add, name='employee_add'),
    path('edit/<int:pk>', views.employee_edit, name='employee_edit'),
    path('delete/<int:pk>', views.employee_delete, name='employee_delete'),
    path('more_details_ajax', views.more_details_ajax, name='more_details_ajax'),
    path('generate_login_details_ajax', views.generate_login_details_ajax, name='generate_login_details_ajax'),
    path('update_shift_link_ajax', views.update_shift_link_ajax, name="update_shift_link_ajax"),
    path('minimum_wage', views.MinimumWage, name='minimum_wage'),#new
    path('manage_minimum_wage', views.ManageMinimumWage, name='manage_minimum_wage'),#new

    # path('getsensordata', views.getsensordata, name='getsensordata'),

    path('add_mine', views.add_mine, name='add_mine'),
    path('manage_mine', views.manage_mine, name='manage_mine'),
    path('edit_mine/<str:pk>', views.edit_mine, name='edit_mine'),
    path('delete_mine/<str:pk>', views.delete_mine, name='delete_mine'),
    path('show_role_chart/', views.show_role_chart, name='show_role_chart'),
    path('fetch_role_ajax/', views.fetch_role_ajax, name='fetch_role_ajax'),

    path('add_mining_role', views.add_mining_role, name='add_mining_role'),
    path('manage_mining_role', views.manage_mining_role, name='manage_mining_role'),
    path('edit_mining_role/<int:pk>', views.edit_mining_role, name='edit_mining_role'),
    path('delete_mining_role/<int:pk>', views.delete_mining_role, name='delete_mining_role'),
    path('mine_role_fetch_ajax', views.mine_role_fetch_ajax, name='mine_role_fetch_ajax'),

    path('manage_mining_shift/<int:mine_id>', views.manage_mining_shift, name='manage_mining_shift'),
    path('add_mining_shift/<int:mine_id>', views.add_mining_shift, name='add_mining_shift'),
    path('edit_mining_shift/<int:pk>/<int:mine_id>', views.edit_mining_shift, name='edit_mining_shift'),
    path('delete_mining_shift/<int:pk>/<int:mine_id>', views.delete_mining_shift, name='delete_mining_shift'),

    path('update_shift_link/<int:pk>', views.update_shift_link, name='update_shift_link'),
    path('save_updated_shift', views.save_updated_shift, name='save_updated_shift'),
    path('details_employee_shift_assign/<int:emp_id>', views.details_employee_shift_assign,
         name='details_employee_shift_assign'),
    path('update_medical/<int:emp_id>', views.update_medical, name='update_medical'),

    # ----------------------MM---------------------------------
    path('aboutus/', views.AboutUsPageView.as_view(), name='aboutus'),
    path('aboutiot/', views.AboutIotPageView.as_view(), name='aboutiot'),
    path('aboutdigitalmine/', views.AboutDigitalminePageView.as_view(), name='aboutdigitalmine'),
    path('contactus/', views.ContactUsPageView.as_view(), name='contactus'),
    path('checkifuserfieldempty',views.checkifuserfieldempty,name='checkifuserfieldempty'),
    path('profile_ajax/',views.profile_ajax,name='profile_ajax'),
    path('validate_token',views.validate_token,name='validate_token'),
]
