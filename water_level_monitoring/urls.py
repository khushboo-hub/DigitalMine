
from django.urls import path

from water_level_monitoring import views

app_name='water_level_monitoring'

urlpatterns = [
    path('add_water_sensor', views.add_water_sensor,name='add_water_sensor'),
    path('manage_water_sensor', views.manage_water_sensor, name='manage_water_sensor'),
    path('edit_water_sensor/<int:id>', views.edit_water_sensor, name='edit_water_sensor'),
    path('delete_water_sensor/<int:id>', views.delete_water_sensor, name='delete_water_sensor'),
    path('live_data_water_sensor', views.live_data_water_sensor, name='live_data_water_sensor'),
    path('show_graph_water_sensor', views.show_graph_water_sensor, name='show_graph_water_sensor'),
    path('iframe_show_graph_water_sensor/<int:mine_id>/<int:location>', views.iframe_show_graph_water_sensor, name='iframe_show_graph_water_sensor'),
    path('water_data_bet_two_datetime', views.water_data_bet_two_datetime, name='water_data_bet_two_datetime'),
    path('fetch_water_data_bet_two_datetime', views.fetch_water_data_bet_two_datetime, name='fetch_water_data_bet_two_datetime'),
    path('fetch_location_ajax', views.fetch_location_ajax, name='fetch_location_ajax'),
    path('fetch_sensor_details', views.fetch_sensor_details, name='fetch_sensor_details'),
    path('fetch_water_level_ajax', views.fetch_water_level_ajax, name='fetch_water_level_ajax'),
    path('start_save_water_data/<int:sensor_id>', views.start_save_water_data, name='start_save_water_data'),
    path('graph_water_data_bet_two_datetime', views.graph_water_data_bet_two_datetime, name='graph_water_data_bet_two_datetime'),

    path('warning_water_data_bet_two_datetime', views.warning_water_data_bet_two_datetime, name='warning_water_data_bet_two_datetime'),
    path('warning_fetch_water_data_bet_two_datetime', views.warning_fetch_water_data_bet_two_datetime, name='warning_fetch_water_data_bet_two_datetime'),
    path('warning_fetch_water_data_bet_two_datetime', views.warning_fetch_water_data_bet_two_datetime, name='warning_fetch_water_data_bet_two_datetime'),
    path('warning_report', views.warning_report, name='warning_report'),
    
]