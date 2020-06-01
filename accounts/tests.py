from django.test import TestCase, Client


# Create your tests here.
class LoginTestCase(TestCase):
    c = Client(enforce_csrf_checks=True)
    try:
        response = c.post('accounts/login', {'username': 'admin','password':'admin'})
        print(response.status_code)
    except Exception as e:
        print(e)
        pass

