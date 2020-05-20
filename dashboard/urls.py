from django.urls import path
from django.views.generic import TemplateView

from dashboard import views

app_name = 'dashboard'

urlpatterns = [
    path('', views.dashboard_calling, name='dashboard_calling'),
    path('fetchwl',views.fetchwl,name="fetchwl"),
    path('fetchsl',views.fetchsl,name="fetchsl"),
    path('hi',views.hi,name="hi"),
    path('export/<int:mine>',views.export,name="export"),
    path('404',TemplateView.as_view(template_name='404.html'),name="404"),
    path('buttons',TemplateView.as_view(template_name='buttons.html'),name="buttons"),
    path('cards',TemplateView.as_view(template_name='cards.html'),name="cards"),
    path('charts',TemplateView.as_view(template_name='charts.html'),name="charts"),
    path('forgot-password.html',TemplateView.as_view(template_name='forgot-password.html'),name="forgot-password"),
    path('logins.html',TemplateView.as_view(template_name='logins.html'),name="login"),
    path('register.html',TemplateView.as_view(template_name='register.html'),name="register"),
    path('tables',TemplateView.as_view(template_name='tables.html'),name="tables"),
    path('utilities-animation.html',TemplateView.as_view(template_name='utilities-animation.html'),name="utilities"),
]
