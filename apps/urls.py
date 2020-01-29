from django.conf import settings
from django.conf.urls.static import static
from django.urls import include, path
from django.contrib import admin
from django.conf.urls import handler404
from theme import views
# from temp_monitoring import views
# from gasmonitoring import views
# from gasmonitoring_auto import views
# from gasmonitoring_live import views
# from gasmonitoring_auto.views import index

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home),

    path('employee/',include('employee.urls',namespace='employee')),    ### Currently Not used : Created by:Dewangshu Earlier for testing
    path('MinersTracking/',include('MinersTracking.urls',namespace='MinersTracking')), ### Tracking Module(Created:Dewangshu, Dated: June-July-2018)
    path('FireExp/',include('FireExp.urls',namespace='FireExp')), ### Gas Monitoring/Sub-Module(Monitoring of Goaf Area,Created:Dewangshu, DATED: Aug-2018)
    path('Controlling/',include('Controlling.urls',namespace='Controlling')),## Testing purpose for Controlling mines like Light,Fan etc(Created:Dewangshu,Dated:sep-18)
    path('DGMS_Forms/',include('DGMS_Forms.urls',namespace='DGMS_Forms')),## Different forms/report of subimmion to DGMS(Created:Dewangshu,Dated:13-10-18)
    path('Strata/',include('Strata.urls',namespace='Strata')),## For Starta Monitoring(Convergence,load etc)(Created:Dewangshu,Dated:26-10-18)
    path('theme/',include('theme.urls',namespace='theme')),


    path('accounts/', include('accounts.urls')),
    path('snippets/', include('snippets.urls')),
    path('gasmonitoring/', include('gasmonitoring.urls', namespace='gasmonitoring')),
    path('gasmonitoring_auto/', include('gasmonitoring_auto.urls', namespace='gasmonitoring_auto')),
    path('gasmonitoring_live/', include('gasmonitoring_live.urls', namespace='gasmonitoring_live')),
    path('temp_monitoring', include('temp_monitoring.urls', namespace='temp_monitoring')),
    path('gasmonitoring_wifi/', include('gasmonitoring_wifi.urls', namespace='gasmonitoring_wifi')),
    path('inventory_management/', include('inventory_management.urls', namespace='inventory_management')),

    path('attendance/', include('attendance.urls', namespace='attendance')),
    path('Training_Rescue_Accident/', include('Training_Rescue_Accident.urls', namespace='Training_Rescue_Accident')),
    path('ProductionMonitoring/', include('ProductionMonitoring.urls',namespace='ProductionMonitoring')),
    path('sensor/', include('sensor.urls', namespace='sensor')),### prasanjit dey(gas monitoring)
    path('water_level_monitoring/', include('water_level_monitoring.urls', namespace='water_level_monitoring')),### SS MISHRA(water monitoring)
    path('tags_input/', include('tags_input.urls', namespace='tags_input')),
    path('sms/', include('SMS.urls', namespace='sms')),
    path('news/', include('news.urls', namespace='news')),
    path('emails/', include('emails.urls', namespace='emails')),
    path('dashboard/', include('dashboard.urls', namespace='dashboard')),
    path('wm_test/', include('wm_test.urls', namespace='weather_monitoring')),
    path('setting/', include('setting.urls', namespace='setting')),
]

if settings.DEBUG:
    import debug_toolbar
    urlpatterns = [
                      path('__debug__/', include(debug_toolbar.urls)),
                      # For django versions before 2.0:
                      # url(r'^__debug__/', include(debug_toolbar.urls)),
                  ] + urlpatterns
        # urlpatterns += static(settings.MEDIA_URL,
        #                       document_root=settings.MEDIA_ROOT)


handler404 = 'apps.views.error_404_view'