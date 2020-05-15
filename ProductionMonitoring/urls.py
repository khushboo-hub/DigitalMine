from django.urls import path
from ProductionMonitoring import views



app_name = 'ProductionMonitoring'

urlpatterns = [
    path('', views.vehicle_add, name='vehicle_add'),
    path('new', views.vehicle_manage, name='vehicle_manage'),
    path('edit/<int:pk>', views.vehicle_edit, name='vehicle_edit'),
    path('delete/<int:pk>', views.vehicle_delete, name='vehicle_delete'),
    path('weighbridge_add', views.weighbridge_add, name='weighbridge_add'),
    path('weighbridge_manage', views.weighbridge_manage, name='weighbridge_manage'),
    path('weighbridge_edit/<int:pk>', views.weighbridge_edit, name='weighbridge_edit'),
    path('weighbridge_delete/<int:pk>', views.weighbridge_delete, name='weighbridge_delete'),
    path('manualentry_add', views.manualentry_add, name='manualentry_add'),
    path('manualentry_manage', views.manualentry_manage, name='manualentry_manage'),
    path('manualentry_edit/<int:pk>', views.manualentry_edit, name='manualentry_edit'),
    path('manualentry_delete/<int:pk>', views.manualentry_delete, name='manualentry_delete'),
    path('fetch_laden_weight_ajax', views.fetch_laden_weight_ajax, name='fetch_laden_weight_ajax'),
    path('fetch_weightunit_ajax', views.fetch_weightunit_ajax, name='fetch_weightunit_ajax'),
    path('fetch_location_ajax', views.fetch_location_ajax, name='fetch_location_ajax'),
    path('fetch_vehicle_ajax', views.fetch_vehicle_ajax, name='fetch_vehicle_ajax'),
    path('fetch_weighbridge_ajax', views.fetch_weighbridge_ajax, name='fetch_weighbridge_ajax'),
    path('report_data', views.report_data, name='report_data'),
    path('fetch_report_ajax', views.fetch_report_ajax, name='fetch_report_ajax'),
    path('container_details_add', views.container_details_add, name='container_details_add'),
    path('container_details_manage', views.container_details_manage, name='container_details_manage'),
    path('container_details_edit/<int:pk>', views.container_details_edit, name='container_details_edit'),
    path('container_details_delete/<int:pk>', views.container_details_delete, name='container_details_delete'),
    path('production_despatch_add', views.production_despatch_add, name='production_despatch_add'),
    path('fetch_laden_ajax', views.fetch_laden_ajax, name='fetch_laden_ajax'),
    path('report_production_dispatch', views.report_production_dispatch, name='report_production_dispatch'),
    path('fetch_report_dispatch_ajax', views.fetch_report_dispatch_ajax, name='fetch_report_dispatch_ajax'),
    path('production_tub_add', views.production_tub_add, name='production_tub_add'),
    path('production_wastematerial_add', views.production_wastematerial_add, name='production_wastematerial_add'),
    path('production_dailyentry_add', views.production_dailyentry_add, name='production_dailyentry_add'),
    path('production_monthly_add', views.production_monthly_add, name='production_monthly_add'),
    path('fetch_unit_ajax', views.fetch_unit_ajax, name='fetch_unit_ajax'),
    path('fetch_unit1_ajax', views.fetch_unit1_ajax, name='fetch_unit1_ajax'),
    path('production_dailydispatch_add', views.production_dailydispatch_add, name='production_dailydispatch_add'),
    path('production_monthlydispatch_add', views.production_monthlydispatch_add, name='production_monthlydispatch_add'),
    path('production_yearlydispatch_add', views.production_yearlydispatch_add, name='production_yearlydispatch_add'),
    path('fetch_shift_ajax', views.fetch_shift_ajax, name='fetch_shift_ajax'),
    path('production_yearlyentry_add', views.production_yearlyentry_add, name='production_yearlyentry_add'),
    path('report_dailyentry', views.report_dailyentry, name='report_dailyentry'),
    path('report_monthlyentry', views.report_monthlyentry, name='report_monthlyentry'),
    path('report_yearlyentry', views.report_yearlyentry, name='report_yearlyentry'),
    path('fetch_report_daily_ajax', views.fetch_report_daily_ajax, name='fetch_report_daily_ajax'),
    path('fetch_report_month_ajax', views.fetch_report_month_ajax, name='fetch_report_month_ajax'),
    path('fetch_report_year_ajax', views.fetch_report_year_ajax, name='fetch_report_year_ajax'),
    path('report_dailydispatch', views.report_dailydispatch, name='report_dailydispatch'),
    path('report_monthlydispatch', views.report_monthlydispatch, name='report_monthlydispatch'),
    path('report_yearlydispatch', views.report_yearlydispatch, name='report_yearlydispatch'),
    path('fetch_report_dailydispatch_ajax', views.fetch_report_dailydispatch_ajax, name='fetch_report_dailydispatch_ajax'),
    path('fetch_report_monthlydispatch_ajax', views.fetch_report_monthlydispatch_ajax, name='fetch_report_monthlydispatch_ajax'),
    path('fetch_report_yearlydispatch_ajax', views.fetch_report_yearlydispatch_ajax, name='fetch_report_yearlydispatch_ajax'),
    path('report_dailyprod_dispatch', views.report_dailyprod_dispatch,name='report_dailyprod_dispatch'),
    path('fetch_report_daily_prod_dispatch_ajax', views.fetch_report_daily_prod_dispatch_ajax, name='fetch_report_daily_prod_dispatch_ajax'),
    path('live_video_ip', views.live_video_ip, name='live_video_ip'),
    path('live_video_webcam', views.live_video_webcam, name='live_video_webcam'),
    path('live_video_ip_151', views.live_video_ip_151, name='live_video_ip_151'),
    path('tracking',views.tracking,name='tracking'),
]






