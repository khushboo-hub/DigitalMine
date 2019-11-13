from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from django.contrib.auth import login as auth_login, authenticate
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.template.loader import render_to_string
from django.contrib.auth.models import User
from django.core.mail import EmailMessage
from theme import views as homeViews
from django.contrib import messages
from django.core import serializers
import datetime
from .forms import SmsConfigurationForm
from .models import sms_configuration
import requests

@login_required
def index(request, template_name='SMS/index.html'):
    current_user = request.user
    book = get_object_or_404(User, pk=current_user.id)
    form = SmsConfigurationForm()
    books = sms_configuration.objects.all()
    SEND(8083475746,"Hello World")
    if request.method == "POST":
        form = SmsConfigurationForm(request.POST or None)
        # print(form.errors.as_data())
        if form.is_valid():
            fs = form.save(commit=False)
            fs.user_id = book
            fs.save()
            return render(request, template_name,
                          {'form': form, 'book': books, 'button': 'Configure SMS', 'no_add_button': 'hidden'})
        # 'book': book
    return render(request, template_name,
                  {'form': form, 'book': books, 'button': 'Add News to BulletIn', 'no_add_button': 'hidden'})


def SEND(to,msg):
    sms = get_object_or_404(sms_configuration,pk=1)
    querystring = {"AUTH_KEY":sms.auth_key,"message":msg,"senderId":sms.sender_id,"routeId":"11","mobileNos":to,"smsContentType":"english"}

    headers = {
        'Cache-Control': "no-cache"
    }

    response = requests.request("GET", sms.url, headers=headers, params=querystring)

    print(response.text)


