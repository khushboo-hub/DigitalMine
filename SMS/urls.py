from django.urls import path

from SMS import views

app_name = 'sms'
urlpatterns = [
    path('', views.index, name='index'),
    # path('update_news/<int:pk>',views.update_news,name='update_news'),
    # path('get_news_ajax/',views.get_news_ajax,name='get_news_ajax'),
    # path('update_news_download_number_ajax/',views.update_news_download_number_ajax,name='update_news_download_number_ajax'),
    # path('delete_news_ajax/',views.delete_news_ajax,name='delete_news_ajax'),
]
