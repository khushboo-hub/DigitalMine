import os

from django.contrib.auth.decorators import login_required
from django.http import HttpResponseBadRequest, JsonResponse
from django.shortcuts import render, HttpResponse, get_object_or_404
from accounts.models import profile_extension, User
from django.shortcuts import render, redirect, get_object_or_404
from SMS import views as sms
from .forms import CarousalPhotoUploadForm
from .models import Carousal
from django.core import serializers
from employee1.models import MineDetails
from accounts.models import profile_extension
import datetime
from django.core.mail import EmailMessage
from django.core.mail import send_mail, get_connection
@login_required
def home(request):
    # sms.SEND(8083475746, "Hello World")
    current_user = request.user
    book = get_object_or_404(User, pk=current_user.id)
    profile = {}

    ip = get_client_ip(request)
    print("IP Address: ", ip)




    try:
        profile = profile_extension.objects.get(user_id=book)
    except:
        profile["profile_avatar"] = 'employee_image/male_alt_photo.svg'
        pass

    return render(request, "home1.html", {'profile': profile})


def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip


@login_required
def front_page(request, template_name='front_page.html'):
    profile_ex = get_object_or_404(profile_extension, user_id=request.user.id)
    carousal=Carousal.objects.filter(mine_id=profile_ex.mine_id,active='1')
    C = []
    for c in carousal:
        C.append(c.file)

    return render(request, template_name,{'Carousal':C})


@login_required
def upload_picture(request, uid=None):
    """
    Photo upload / dropzone handler
    :param request:
    :param uid: Optional picture UID when re-uploading a file.
    :return:
    """
    form = CarousalPhotoUploadForm(request.POST, request.FILES or None)
    if form.is_valid():
        pic = request.FILES['file']
        # [...] Process whatever you do with that file there. I resize it, create thumbnails, etc.
        # Get an instance of picture model (defined below)
        picture = Carousal()
        picture.file = pic
        picture.user_id = request.user
        print
        profile_ex = get_object_or_404(profile_extension, user_id=request.user.id)
        picture.mine = profile_ex.mine_id
        print(profile_ex.mine_id)
        picture.save()
        return HttpResponse('Image upload succeeded.')
    return HttpResponseBadRequest("Image is not valid.")


@login_required
def get_upload_path(instance, filename):
    """ creates unique-Path & filename for upload """
    ext = filename.split('.')[-1]
    filename = "%s.%s" % (instance.p_uid, ext)
    d = datetime.date.today()
    username = instance.author.username

    # Create the directory structure
    return os.path.join(
        'userpics', username, d.strftime('%Y'), d.strftime('%m'), filename
    )


@login_required
def get_all_carousal_images_ajax(request):
    data = {}
    if request.is_ajax():
        carousal = Carousal.objects.filter(user_id=request.user)
        data['result'] = serializers.serialize('json', carousal, fields=('id', 'file', 'active'))

        return JsonResponse(data)

    data['error'] = "Something Went Wrong!"
    return JsonResponse(data)


@login_required
def activate_carousal(request):
    data = {}
    try:
        if request.is_ajax():
            selected_images = request.GET.getlist('selected_images[]')
            profile_ex = get_object_or_404(profile_extension, user_id=request.user.id)
            Carousal.objects.filter(mine_id=profile_ex.mine_id).update(active=0)
            for selected in selected_images:
                carousal = get_object_or_404(Carousal, pk=selected)
                carousal.active = '1'
                carousal.save()
            data['success'] = 'Activated Successfully!'
            return JsonResponse(data)
    except:
        pass
    data['error'] = 'Something Went Wrong!'
    return JsonResponse(data)


@login_required
def delete_carousal(request):
    data = {}
    if request.is_ajax():
        id = request.POST.get('id')
        try:
            Carousal.objects.filter(pk=id).delete()
            data['success'] = "Success"
            return JsonResponse(data)
        except:
            pass

    data['error'] = 'Something Went Wrong!'
    return JsonResponse(data)
