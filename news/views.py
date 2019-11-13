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
from .forms import NewsBulletInForm
from .models import news_bulletin
from django.core import serializers
import datetime

@login_required
def index(request, template_name='NEWS/index.html'):
    current_user = request.user
    book = get_object_or_404(User, pk=current_user.id)
    form = NewsBulletInForm(request.POST or None, instance=book)
    books = news_bulletin.objects.all()

    if request.method == "POST":
        form = NewsBulletInForm(request.POST or None, request.FILES or None)
        # print(form.errors.as_data())
        if form.is_valid():
            fs = form.save(commit=False)
            fs.user_id = book
            fs.save()
            return render(request, template_name, {'form': form, 'book': books,'button':'Add News to BulletIn','no_add_button':'hidden'})
        # 'book': book
    return render(request, template_name, {'form': form, 'book': books,'button':'Add News to BulletIn','no_add_button':'hidden'})


def get_news_ajax(request):
    data = {}

    if request.is_ajax():
        data['result'] = serializers.serialize('json', news_bulletin.objects.filter(valid_till__gte=datetime.date.today()), fields=('news', 'download_link'))
        return JsonResponse(data)
    data['error'] = "Something Went Wrong!"
    return JsonResponse(data)

def update_news(request,pk,template_name='NEWS/index.html'):
    book = get_object_or_404(news_bulletin, pk=pk)
    form = NewsBulletInForm(request.POST or None, request.FILES or None,instance=book)
    books = news_bulletin.objects.all()

    if request.method == "POST":
        if form.is_valid():
            fs = form.save(commit=False)
            fs.updated_on = datetime.datetime.now()
            fs.save()
            form.save()
            return render(request, template_name, {'form': form, 'book': books,'button':'Update News BulletIn'})
    return render(request, template_name, {'form': form, 'book': books,'button':'Update News BulletIn'})

def update_news_download_number_ajax(request):
    data = {}
    if request.is_ajax():
        current_user = request.user
        news_id = request.GET.get('id')
        print(news_id)
        try:
            book=get_object_or_404(news_bulletin, pk=news_id)
            book.download_number += 1
            book.save()
            data['result'] = "Success"
            return JsonResponse(data)
        except:
            pass
    data['error'] = "Something Went Wrong!"
    return JsonResponse(data)


def delete_news_ajax(request):
    data = {}
    if request.is_ajax():
        news_id = request.POST.get('id')
        print(news_id)
        try:
            book=get_object_or_404(news_bulletin, pk=news_id)
            book.delete()
            data['success'] = "Deleted Successfully!"
            return JsonResponse(data)
        except:
            pass
    data['error'] = "Something Went Wrong!"
    return JsonResponse(data)
