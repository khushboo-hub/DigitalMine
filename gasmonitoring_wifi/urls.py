from django.urls import path

from gasmonitoring_wifi import views

app_name = 'gasmonitoring_wifi'

urlpatterns = [
    path('add_goaf_area', views.add_goaf_area, name='add_goaf_area'),

    path('manage_goaf_area', views.manage_goaf_area, name='manage_goaf_area'),
    path('edit_area/<int:pk>', views.edit_area, name='edit_area'),
    path('delete_area/<int:pk>', views.delete_area, name='delete_area'),
    path('analysis_wifi/<int:pk>', views.analysis_wifi, name='analysis_wifi'),

    path('show_area/', views.show_area, name='show_area'),
    path('fetch_area_ajax', views.fetch_area_ajax, name='fetch_area_ajax'),
    path('fetch_WiFiData_ajax', views.fetch_WiFiData_ajax, name='fetch_WiFiData_ajax'),

    path('line_chart_gas_ratios_wifi/', views.line_chart_gas_ratios_wifi, name='line_chart_gas_ratios_wifi'),
    path('fetch_gas_ratios_ajax_wifi', views.fetch_gas_ratios_ajax_wifi, name='fetch_gas_ratios_ajax_wifi'),
    path('young_co_ratio_page_wifi', views.young_co_ratio_page_wifi, name='young_co_ratio_page_wifi'),
    path('fetch_young_co_ajax_wifi', views.fetch_young_co_ajax_wifi, name='fetch_young_co_ajax_wifi'),

    path('show_wifi_report', views.show_wifi_report, name='show_wifi_report'),
    path('fetch_Report_ajax', views.fetch_Report_ajax, name='fetch_Report_ajax'),

]
