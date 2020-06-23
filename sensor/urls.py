from django.urls import path

# from sensor import views
from . import views

# from arduino import views
app_name = 'sensor'

urlpatterns = [
    path('load_map', views.load_map, name='load_map'),

    # path('wireless_manage/<int:node_id>', views.wireless_manage, name='wireless_manage'),
    # path('wireless_add/<int:node_id>', views.wireless_add, name='wireless_add'),
    # path('wireless_edit/<int:pk>/<int:node_id>', views.wireless_edit, name='wireless_edit'),
    # path('wireless_delete/<int:pk>/<int:node_id>', views.wireless_delete, name='wireless_delete'),

    path('node_manage/', views.node_manage, name='node_manage'),
    path('node_add', views.node_add, name='node_add'),
    path('node_edit/<str:pk>', views.node_edit, name='node_edit'),
    path('node_delete/', views.node_delete, name='node_delete'),
    path('ellicots/<str:pk>', views.ellicots, name='ellicots'),
    path('line_chart_ratio_graph/<str:pk>', views.line_chart_ratio_graph, name='line_chart_ratio_graph'),
    path('line_chart_ratio_graph_ajax', views.line_chart_ratio_graph_ajax, name='line_chart_ratio_graph_ajax'),

    path('youngs_ratio_graph/<str:pk>', views.youngs_ratio_graph, name='youngs_ratio_graph'),
    path('youngs_ratio_graph_ajax', views.youngs_ratio_graph_ajax, name='youngs_ratio_graph_ajax'),
    path('ellicots_ajax', views.ellicots_ajax, name='ellicots_ajax'),

    path('locate_node/<str:mine_id>/<str:node_id>', views.locate_node, name='locate_node'),

    path('fetch_node_ajax', views.fetch_node_ajax, name='fetch_node_ajax'),

    # path('fetch_wireless', views.fetch_wireless, name='fetch_wireless'),
    #
    # path('fetch_ip', views.fetch_ip, name='fetch_ip'),

    path('manage_sensor/<str:mine_id>/<str:node_id>', views.manage_sensor, name='manage_sensor'),

    path('add_sensor/<int:mine_id>/<int:node_id>', views.add_sensor, name='add_sensor'),
    path('delete_sensor/<str:pk>', views.delete_sensor, name='delete_sensor'),
    path('edit_sensor/<str:pk>/<str:node_id>', views.edit_sensor, name='edit_sensor'),
    # path('background_view/<int:pk>', views.background_view, name='background_view'),
    path('live_data_tabular', views.live_data_tabular, name='live_data_tabular'),
    # path('background_data', views.background_data, name='background_data'),
    path('fetch_mine_ajax', views.fetch_mine_ajax, name='fetch_mine_ajax'),
    # path('fetch_sensor_values_ajax_p', views.fetch_sensor_values_ajax_p, name='fetch_sensor_values_ajax_p'),
    path('fetch_sensor_values_ajax_h', views.fetch_sensor_values_ajax_h, name='fetch_sensor_values_ajax_h'),
    path('fetch_sensor_values', views.fetch_sensor_values, name='fetch_sensor_values'),
    path('live_data_graph', views.live_data_graph, name='live_data_graph'),
    path('iframe_live_data/<int:mine_id>/<int:node_id>/<int:sensor_id>', views.iframe_live_data,
         name='iframe_live_data'),
    path('fetch_sensor_ajax', views.fetch_sensor_ajax, name='fetch_sensor_ajax'),
    path('fetch_sensors_list', views.fetch_sensors_list, name='fetch_sensors_list'),
    path('fetch_sensor_values_ajax', views.fetch_sensor_values_ajax, name='fetch_sensor_values_ajax'),
    path('report_fetch_sensor_values_ajax', views.report_fetch_sensor_values_ajax,
         name='report_fetch_sensor_values_ajax'),
    path('avg_report_fetch_sensor_values_ajax', views.avg_report_fetch_sensor_values_ajax,
         name='avg_report_fetch_sensor_values_ajax'),
    path('report_fetch_node_values_ajax', views.report_fetch_node_values_ajax, name='report_fetch_node_values_ajax'),

    path('fetch_sensor_ajax_sensor', views.fetch_sensor_ajax_sensor, name='fetch_sensor_ajax_sensor'),
    path('fetch_sensor_values_all_ajax', views.fetch_sensor_values_all_ajax, name='fetch_sensor_values_all_ajax'),

    path('sensor_wise_node', views.sensor_wise_node, name='sensor_wise_node'),
    path('sensor_wise_node_header', views.sensor_wise_node_header, name='sensor_wise_node_header'),
    path('live_map', views.live_map, name='live_map'),
    path('report_table', views.report_table, name='report_table'),  # new
    path('report_graph', views.report_graph, name='report_graph'),  # new
    path('avg_report_table', views.avg_report_table, name='avg_report_table'),

    path('fetch_map_ajax', views.fetch_map_ajax, name='fetch_map_ajax'),
    path('sensor_wise_popup', views.sensor_wise_popup, name='sensor_wise_popup'),
    path('fetch_sensor_values_ajax_sensor_table', views.fetch_sensor_values_ajax_sensor_table,
         name='fetch_sensor_values_ajax_sensor_table'),
    path('fetch_sensor_values_ajax_sensor_body', views.fetch_sensor_values_ajax_sensor_body,
         name='fetch_sensor_values_ajax_sensor_body'),
    path('fetch_map_image', views.fetch_map_image, name="fetch_map_image"),
    path('node_sensor_data', views.node_sensor_data, name='node_sensor_data'),
    path('start_save_sensor/<int:sensor_id>', views.start_save_sensor, name="start_save_sensor"),
    path('start_save_multiple_sensor/<int:mine_id>/<int:node_id>', views.start_save_multiple_sensor,
         name="start_save_multiple_sensor"),

]
