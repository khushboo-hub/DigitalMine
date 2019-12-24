from django.urls import path

from MinersTracking import views

app_name = 'MinersTracking'

urlpatterns = [
  path('', views.init, name='init'),
  path('create_router/', views.create_router, name='create_router'),
  path('update_router/<int:pk>',views.update_router,name='update_router'),
  path('edit_router/',views.edit_router,name='edit_router'),
  path('delete_router/', views.delete_router, name='delete_router'),
  path('load_map', views.load_map, name='load_map'),
  path('get_miners_data', views.get_miners_data, name='get_miners_data'),
  path('live_tracking_in_tabular', views.live_tracking_in_tabular, name='live_tracking_in_tabular'),
  path('ajax_tracking_data', views.ajax_tracking_data, name='ajax_tracking_data'),
  path('all_mine_page', views.all_mine_page, name='all_mine_page'),
  path('live_tracking_in_map/<int:mine_id>', views.live_tracking_in_map, name='live_tracking_in_map'),
  path('iframe_live_tracking_in_map/<int:mine_id>', views.iframe_live_tracking_in_map, name='iframe_live_tracking_in_map'),
  path('live_tracking_in_map_/<int:mine_id>', views.live_tracking_in_map_, name='live_tracking_in_map_'),
  path('get_miners_data1', views.get_miners_data1, name='get_miners_data1'),
  path('single_miner_page', views.single_miner_page, name='single_miner_page'),
  path('miner_path_history_page', views.miner_path_history_page, name='miner_path_history_page'),

  path('fetch_miner_ajax', views.fetch_miner_ajax, name='fetch_miner_ajax'),
  path('get_single_miners_data', views.get_single_miners_data, name='get_single_miners_data'),
  path('get_single_miner_path_data',views.get_single_miner_path_data,name='get_single_miner_path_data'),
  path('get_all_miners_data', views.get_all_miners_data, name='get_all_miners_data'),

]