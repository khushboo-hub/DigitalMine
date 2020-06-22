from django.urls import path

from FireExp import views

app_name = 'FireExp'

urlpatterns = [
  path('', views.manual_entry, name='manual_entry'),
  path('show_database', views.show_database, name='show_database'),
  path('import', views.import_from_file, name='import_from_file'),
  path('analysis_button', views.analysis_button, name='analysis_button'),
  path('explosibility/<int:page>', views.explosibility, name='explosibility'),
  



  path('automatic_entry', views.automatic_entry, name='automatic_entry'),
  path('trends', views.trends, name='trends'),
  path('test_graph', views.test_graph, name='test_graph'),
  path('line_chart_gas_ratios', views.line_chart_gas_ratios, name='line_chart_gas_ratios'),
  path('fetch_gas_ratios_ajax', views.fetch_gas_ratios_ajax, name='fetch_gas_ratios_ajax'),
  path('young_co_ratio_page', views.young_co_ratio_page, name='young_co_ratio_page'),
  path('fetch_young_co_ajax', views.fetch_young_co_ajax, name='fetch_young_co_ajax'),
]