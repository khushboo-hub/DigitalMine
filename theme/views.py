import os

from django.contrib.auth.decorators import login_required
from accounts.models import User
from django.shortcuts import render, redirect, get_object_or_404

from employee.models import MedicalReport
from employee.views import notify_user
from accounts.models import profile_extension
import datetime
from django.core.cache import cache

from setting.models import Notification
from django.utils import timezone

@login_required
def home(request):
    notify_user()
    data={}
    template_name = "home.html"
    try:
        if request.session['lang'] == 'in':
            template_name = "in/home.html"
    except:
        pass
    # sms.SEND(8083475746, "Hello World")
    current_user = request.user


    profile = {}
    try:
        profile = profile_extension.objects.get(user_id=current_user.id)
        cache.set('profile_avatar', profile.profile_avatar, 3600)

    except:
        book = get_object_or_404(User, pk=current_user.id)
        book_extension, created = profile_extension.objects.get_or_create(user_id=book)
        # cache.set('profile_avatar','employee_image/male_alt_photo.svg', 30)
        profile["profile_avatar"] = 'employee_image/male_alt_photo.svg'
        pass
    medical=[]
    EmployeesNotif=Notification.objects.filter(type=10).values('employee_id').distinct()
    for emp in EmployeesNotif:
        message=Notification.objects.order_by('-id').filter(employee_id=emp['employee_id'])[0]
        medical.append({'message':message.message})
    data['notification']={'medical':medical}
    data['profile_avatar']=cache.get('profile_avatar')
    return render(request, template_name, data)


def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip


def user_from_session_key(session_key):
    """
    Returns the User related to the given Django session key.
    """
    from django.conf import settings
    from django.contrib.auth import SESSION_KEY, BACKEND_SESSION_KEY, load_backend
    from django.contrib.auth.models import AnonymousUser

    session_engine = __import__(settings.SESSION_ENGINE, {}, {}, [''])
    session_wrapper = session_engine.SessionStore(session_key)
    session = session_wrapper.load()
    user_id = session.get(SESSION_KEY)
    backend_id = session.get(BACKEND_SESSION_KEY)

    if user_id and backend_id:
        auth_backend = load_backend(backend_id)
        user = auth_backend.get_user(user_id)

        if user:
            return user

    return AnonymousUser()

# @login_required
# def front_page(request, template_name='front_page.html'):
#     profile_ex = get_object_or_404(profile_extension, user_id=request.user.id)
#     carousal=Carousal.objects.filter(mine_id=profile_ex.mine_id,active='1')
#     C = []
#     for c in carousal:
#         C.append(c.file)
#         print('Carousal Image=>',c.file)
#
#     return render(request, template_name,{'Carousal':C})


# @login_required
# def upload_picture(request, uid=None):
#     """
#     Photo upload / dropzone handler
#     :param request:
#     :param uid: Optional picture UID when re-uploading a file.
#     :return:
#     """
#     form = CarousalPhotoUploadForm(request.POST, request.FILES or None)
#     if form.is_valid():
#         pic = request.FILES['file']
#         # [...] Process whatever you do with that file there. I resize it, create thumbnails, etc.
#         # Get an instance of picture model (defined below)
#         picture = Carousal()
#         picture.file = pic
#         picture.user_id = request.user
#
#         profile_ex = get_object_or_404(profile_extension, user_id=request.user.id)
#         picture.mine = profile_ex.mine_id
#         print('Profile Ex',profile_ex.mine_id)
#         picture.save()
#         return HttpResponse('Image upload succeeded.')
#     return HttpResponseBadRequest("Image is not valid.")
#

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


# @login_required
# def get_all_carousal_images_ajax(request):
#     data = {}
#     if request.is_ajax():
#         carousal = Carousal.objects.filter(user_id=request.user)
#         data['result'] = serializers.serialize('json', carousal, fields=('id', 'file', 'active'))
#
#         return JsonResponse(data)
#
#     data['error'] = "Something Went Wrong!"
#     return JsonResponse(data)
#

# @login_required
# def activate_carousal(request):
#     data = {}
#     try:
#         if request.is_ajax():
#             selected_images = request.GET.getlist('selected_images[]')
#             profile_ex = get_object_or_404(profile_extension, user_id=request.user.id)
#             Carousal.objects.filter(mine_id=profile_ex.mine_id).update(active=0)
#             for selected in selected_images:
#                 carousal = get_object_or_404(Carousal, pk=selected)
#                 carousal.active = '1'
#                 carousal.save()
#             data['success'] = 'Activated Successfully!'
#             return JsonResponse(data)
#     except:
#         pass
#     data['error'] = 'Something Went Wrong!'
#     return JsonResponse(data)
#
#
# @login_required
# def delete_carousal(request):
#     data = {}
#     if request.is_ajax():
#         id = request.POST.get('id')
#         try:
#             Carousal.objects.filter(pk=id).delete()
#             data['success'] = "Success"
#             return JsonResponse(data)
#         except:
#             pass
#
#     data['error'] = 'Something Went Wrong!'
#     return JsonResponse(data)


def start_background_tast(request):
    os.system('manage.py process_tasks')
    return redirect(request.META.get('HTTP_REFERER'))

def base_layout(request):
	template='home.html'
	return render(request,template)