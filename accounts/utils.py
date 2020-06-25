from django.contrib.auth.decorators import user_passes_test
from django.template.defaulttags import register


def is_manager(user):
    return user.groups.filter(name='Level1').exists()

def manager(fn=None):
    decorator = user_passes_test(is_manager)
    if fn:
        return decorator(fn)
    return decorator

@register.filter(name="manager")
def validation_filter(request):
    return is_manager(request.user)