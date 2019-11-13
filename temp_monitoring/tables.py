import django_tables2 as tables
from .models import homeModel


class homeTable(tables.Table):


    class Meta:
        model = homeModel
        template_name = 'django_tables2/bootstrap.html'


