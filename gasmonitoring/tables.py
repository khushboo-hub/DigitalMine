import django_tables2 as tables
from .models import gasModel


class gasTable(tables.Table):


    class Meta:
        model = gasModel
        template_name = 'django_tables2/bootstrap.html'


