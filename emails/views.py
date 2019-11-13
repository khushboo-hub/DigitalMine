from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.models import User
from django.http import HttpResponse, JsonResponse
from .models import emails


@login_required
def index(request, template_name='EMAIL/index.html'):
    current_user = request.user
    book = get_object_or_404(User, pk=current_user.id)
    email = emails.objects.all()
    return render(request, template_name,{'email':email})


@login_required
def on_email_send(request, send_to, send_from, sent_on, subject, email_text, attachment):
    data = {}
    email_instance = emails()
    email_instance.user_id = request.user.id
    email_instance.subject = subject
    email_instance.email = email_text
    email_instance.sent_on = sent_on
    email_instance.email_from = send_from
    email_instance.email_to = send_to
    email_instance.attachment = attachment
    try:
        email_instance.save()
        data['success'] = "Successful!"
        return JsonResponse(data)

    except:
        pass

    data['error'] = "Something Went Wrong!"
    return JsonResponse(data)

@login_required
def cyto(request,template_name='EMAIL/cyto.html'):
    return render(request,template_name)
