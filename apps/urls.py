from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.models import User
from django.urls import include, path
from django.contrib import admin


from theme import views

urlpatterns = [

    path('admin/', admin.site.urls),
    path('', views.home),
    path('base_layout',views.base_layout,name='base_layout'),

    path('employee/',include('employee.urls',namespace='employee')),
    path('MinersTracking/',include('MinersTracking.urls',namespace='MinersTracking')),
    path('FireExp/',include('FireExp.urls',namespace='FireExp')),
    path('Controlling/',include('Controlling.urls',namespace='Controlling')),
    path('DGMS_Forms/',include('DGMS_Forms.urls',namespace='DGMS_Forms')),
    path('Strata/',include('Strata.urls',namespace='Strata')),
    path('theme/',include('theme.urls',namespace='theme')),


    path('accounts/', include('accounts.urls')),
    path('snippets/', include('snippets.urls')),
    path('gasmonitoring/', include('gasmonitoring.urls', namespace='gasmonitoring')),
    path('temp_monitoring/', include('temp_monitoring.urls', namespace='temp_monitoring')),
    path('gasmonitoring_wifi/', include('gasmonitoring_wifi.urls', namespace='gasmonitoring_wifi')),
    path('inventory_management/', include('inventory_management.urls', namespace='inventory_management')),

    path('attendance/', include('attendance.urls', namespace='attendance')),
    path('Training_Rescue_Accident/', include('Training_Rescue_Accident.urls', namespace='Training_Rescue_Accident')),
    path('ProductionMonitoring/', include('ProductionMonitoring.urls',namespace='ProductionMonitoring')),
    path('sensor/', include('sensor.urls', namespace='sensor')),### prasanjit dey(gas monitoring)
    path('water_level_monitoring/', include('water_level_monitoring.urls', namespace='water_level_monitoring')),### SS MISHRA(water monitoring)
    # path('tags_input/', include('tags_input.urls', namespace='tags_input')),
    path('sms/', include('SMS.urls', namespace='sms')),
    path('news/', include('news.urls', namespace='news')),
    path('emails/', include('emails.urls', namespace='emails')),
    path('dashboard/', include('dashboard.urls', namespace='dashboard')),
    path('wm_test/', include('wm_test.urls', namespace='weather_monitoring')),
    path('setting/', include('setting.urls', namespace='setting')),
    path('Slope/', include('Slope.urls', namespace='Slope')),
    path('safety/', include('safety.urls', namespace='safety')),
    # path('',include('pwa.urls')),
]



if settings.DEBUG:
    import debug_toolbar
    urlpatterns = [
                      path('__debug__/', include(debug_toolbar.urls)),
                      # For django versions before 2.0:
                      # url(r'^__debug__/', include(debug_toolbar.urls)),
                  ] + urlpatterns

    urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)


handler404 = 'apps.views.error_404_view'

