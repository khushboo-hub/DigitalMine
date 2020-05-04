from django.urls import path

#from sensor import views
from . import views
#from arduino import views
app_name = 'sensor'

urlpatterns = [
  # path('sensor_manage/<int:arduino_id>', views.sensor_manage, name='sensor_manage'),
  # path('sensor1_manage/<int:wireless_id>', views.sensor1_manage, name='sensor1_manage'),
  # path('new/<int:arduino_id>', views.sensor_add, name='sensor_add'),
  # path('new1/<int:wireless_id>', views.sensor1_add, name='sensor1_add'),
  # path('edit/<int:pk>/<int:arduino_id>', views.sensor_edit, name='sensor_edit'),
  # path('edit/<int:pk>/<int:wireless_id>', views.sensor1_edit, name='sensor1_edit'),
  # path('delete/<int:pk>/<int:arduino_id>', views.sensor_delete, name='sensor_delete'),
  # path('delete/<int:pk>/<int:wireless_id>', views.sensor1_delete, name='sensor1_delete'),
  path('load_map', views.load_map, name='load_map'),

  path('wireless_manage/<int:node_id>', views.wireless_manage, name='wireless_manage'),
  path('wireless_add/<int:node_id>', views.wireless_add, name='wireless_add'),
  path('wireless_edit/<int:pk>/<int:node_id>', views.wireless_edit, name='wireless_edit'),
  path('wireless_delete/<int:pk>/<int:node_id>', views.wireless_delete, name='wireless_delete'),



  path('node_manage/<int:pk>', views.node_manage, name='node_manage'),
  path('node_add', views.node_add, name='node_add'),
  path('node_edit/', views.node_edit, name='node_edit'),
  path('node_delete/', views.node_delete, name='node_delete'),

  # path('nodesensor_manage', views.nodesensor_manage, name='nodesensor_manage'),
  # path('nodesensor_add', views.nodesensor_add, name='nodesensor_add'),
  # path('nodesensor_edit/<int:pk>', views.nodesensor_edit, name='nodesensor_edit'),
  # path('nodesensor_delete/<int:pk>', views.nodesensor_delete, name='nodesensor_delete'),


  # path('connection_manage', views.connection_manage, name='connection_manage'),
  # path('connection_add', views.connection_add, name='connection_add'),
  # path('connection_edit/<int:pk>', views.connection_edit, name='connection_edit'),
  # path('connection_delete/<int:pk>', views.connection_delete, name='connection_delete'),
  path('fetch_node', views.fetch_node, name='fetch_node'),
  # path('fetch_arduino', views.fetch_arduino, name='fetch_arduino'),
  path('fetch_wireless', views.fetch_wireless, name='fetch_wireless'),
  # path('fetch_port', views.fetch_port, name='fetch_port'),
  path('fetch_ip', views.fetch_ip, name='fetch_ip'),
  # path('save_connection', views.save_connection, name='save_connection'),

  path('manage_sensor/<int:mine_id>/<int:node_id>', views.manage_sensor, name='manage_sensor'),
  path('add_sensor/<int:mine_id>/<int:node_id>', views.add_sensor, name='add_sensor'),
  # path('sensor_edit/<int:pk>', views.add_sensor, name='edit sensor'),
  path('delete_sensor/<int:pk>/<int:node_id>', views.delete_sensor, name='delete_sensor'),
  path('edit_sensor/<int:pk>/<int:node_id>', views.edit_sensor, name='edit_sensor'),
  path('background_view/<int:pk>', views.background_view, name='background_view'),
  path('live_data_tabular', views.live_data_tabular, name='live_data_tabular'),
  path('background_data', views.background_data, name='background_data'),
  path('fetch_mine_ajax', views.fetch_mine_ajax, name='fetch_mine_ajax'),
  path('fetch_sensor_values_ajax_p', views.fetch_sensor_values_ajax_p, name='fetch_sensor_values_ajax_p'),
  path('fetch_sensor_values_ajax_h', views.fetch_sensor_values_ajax_h, name='fetch_sensor_values_ajax_h'),
  path('fetch_sensor_values', views.fetch_sensor_values, name='fetch_sensor_values'),
  path('live_data_graph', views.live_data_graph, name='live_data_graph'),
  path('iframe_live_data/<int:mine_id>/<int:node_id>/<int:sensor_id>', views.iframe_live_data, name='iframe_live_data'),
  path('fetch_sensor_ajax', views.fetch_sensor_ajax, name='fetch_sensor_ajax'),
  path('fetch_sensor_values_ajax', views.fetch_sensor_values_ajax, name='fetch_sensor_values_ajax'),
  path('fetch_sensor_ajax_sensor', views.fetch_sensor_ajax_sensor, name='fetch_sensor_ajax_sensor'),
  path('fetch_sensor_values_all_ajax', views.fetch_sensor_values_all_ajax, name='fetch_sensor_values_all_ajax'),
  path('fetch_sensor_values_ajax_CH4', views.fetch_sensor_values_ajax_CH4, name='fetch_sensor_values_ajax_CH4'),
  path('fetch_sensor_values_ajax_CO', views.fetch_sensor_values_ajax_CO, name='fetch_sensor_values_ajax_CO'),
  path('fetch_sensor_values_ajax_O2', views.fetch_sensor_values_ajax_O2, name='fetch_sensor_values_ajax_O2'),
  path('fetch_sensor_values_ajax_H2S', views.fetch_sensor_values_ajax_H2S, name='fetch_sensor_values_ajax_H2S'),
  path('fetch_sensor_values_ajax_NO2', views.fetch_sensor_values_ajax_NO2, name='fetch_sensor_values_ajax_NO2'),
  path('fetch_sensor_values_ajax_SO2', views.fetch_sensor_values_ajax_SO2, name='fetch_sensor_values_ajax_SO2'),
  path('fetch_sensor_values_ajax_H2', views.fetch_sensor_values_ajax_H2, name='fetch_sensor_values_ajax_H2'),
  path('fetch_sensor_values_ajax_CO2', views.fetch_sensor_values_ajax_CO2, name='fetch_sensor_values_ajax_CO2'),
  path('sensor_wise_node', views.sensor_wise_node, name='sensor_wise_node'),
  path('live_map', views.live_map, name='live_map'),
  path('fetch_map_ajax', views.fetch_map_ajax, name='fetch_map_ajax'),
  path('sensor_wise_popup', views.sensor_wise_popup, name='sensor_wise_popup'),
  path('fetch_sensor_values_ajax_sensor_table', views.fetch_sensor_values_ajax_sensor_table, name='fetch_sensor_values_ajax_sensor_table'),
  path('fetch_sensor_values_ajax_sensor_body', views.fetch_sensor_values_ajax_sensor_body, name='fetch_sensor_values_ajax_sensor_body'),
  path('fetch_map_image', views.fetch_map_image, name="fetch_map_image"),
  path('node_sensor_data', views.node_sensor_data,name='node_sensor_data'),
  path('start_save_sensor/<int:sensor_id>',views.start_save_sensor,name="start_save_sensor"),
  path('start_save_multiple_sensor/<int:mine_id>/<int:node_id>',views.start_save_multiple_sensor,name="start_save_multiple_sensor"),


]




