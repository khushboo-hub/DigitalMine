from django.conf import settings
from django_hosts import patterns, host

host_patterns = patterns('',
    host(r'www', settings.ROOT_URLCONF, name='www'),  # <-- The `name` we used to in the `DEFAULT_HOST` setting
    host(r'news', 'news.urls', name='news'),
    # host('news/', 'news.urls', namespace='news')),
)