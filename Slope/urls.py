
from django.urls import path

from Slope import views

app_name='Slope'

urlpatterns = [
    path('convergence_add_location', views.convergence_add_location, name='convergence_add_location'),
    path('convergence_manage_location', views.convergence_manage_location, name='convergence_manage_location'),
    path('convergence_edit_location/<int:pk>', views.convergence_edit_location, name='convergence_edit_location'),
    path('convergence_delete_location/<int:pk>', views.convergence_delete_location, name='convergence_delete_location'),


    path('add_sensor_in_location', views.add_sensor_in_location, name='add_sensor_in_location'),
    path('fetch_location_ajax', views.fetch_location_ajax, name='fetch_location_ajax'),
    path('manage_sensor_in_location', views.manage_sensor_in_location, name='manage_sensor_in_location'),
    path('delete_sensor/<int:pk>', views.delete_sensor, name='delete_sensor'),

    path('live_data_tabular', views.live_data_tabular, name='live_data_tabular'),
    path('fetch_sensor_details',views.fetch_sensor_details,name='fetch_sensor_details'),
    path('fetch_sensor_ajax', views.fetch_sensor_ajax, name='fetch_sensor_ajax'),
    path('fetch_sensor_values_ajax', views.fetch_sensor_values_ajax, name='fetch_sensor_values_ajax'),
    path('get_data_from_node_mcu', views.get_data_from_node_mcu, name='get_data_from_node_mcu'),#####testing only

    path('show_sensor_graph', views.show_sensor_graph, name='show_sensor_graph'),
    path('iframe_show_sensor_graph/<int:mine_id>/<int:location_id>/<int:sensors_id>', views.iframe_show_sensor_graph, name='iframe_show_sensor_graph'),
    path('start_save_sensor/<int:sensor_id>', views.start_save_sensor, name='start_save_sensor'),
    path('date_range_tabular', views.date_range_tabular, name='date_range_tabular'),
    path('fetch_sensor_date_range', views.fetch_sensor_date_range, name='fetch_sensor_date_range'),

    path('show_graph_date_range', views.show_graph_date_range, name='show_graph_date_range'),
    path('ajx_sensor_graph_date_range', views.ajx_sensor_graph_date_range, name='ajx_sensor_graph_date_range'),
    path('warning_level_information', views.warning_level_information, name='warning_level_information'),
    path('multi_sensor_warning', views.multi_sensor_warning, name='multi_sensor_warning'),

    path('fetch_sensor_common_values_ajax', views.fetch_sensor_common_values_ajax, name='fetch_sensor_common_values_ajax'),
    path('edit_sensor_in_location/<int:sensor_id>', views.edit_sensor_in_location,name='edit_sensor_in_location'),
    path('audio_setting/<int:sensor_id>', views.audio_setting,name='audio_setting'),
    path('fetch_map_image', views.fetch_map_image, name='fetch_map_image'),
    path('daily_report', views.daily_report, name='daily_report'),
    path('warning_report', views.warning_report, name='warning_report'),
    path('show_json', views.show_json, name='show_json'),
    # path('show_strata_location',views.show_strata_location,name='show_strata_location'),
    path('slope_live_table', views.slope_live_table, name='slope_live_table'),
    path('slope_location_jsonurl', views.slope_location_jsonurl, name='slope_location_jsonurl'),
    path('fetch_datafrom_jsonurl', views.fetch_datafrom_jsonurl, name='fetch_datafrom_jsonurl'),
    path('slope_live_table_dynamic', views.slope_live_table_dynamic, name='slope_live_table_dynamic'),
    path('fetch_datafrom_jsonurl_dynamic', views.fetch_datafrom_jsonurl_dynamic, name='fetch_datafrom_jsonurl_dynamic'),
    
    path('graph_from_thingspeak', views.graph_from_thingspeak, name='graph_from_thingspeak'),
    

]