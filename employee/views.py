import datetime

import requests

from background_task import background
from django.contrib import messages
from django.core import serializers
from django.contrib.auth.decorators import login_required, user_passes_test
from django.http import HttpResponse, JsonResponse

# Create your views here.
from django.shortcuts import render, redirect, get_object_or_404
from django.views.generic import TemplateView

from accounts.utils import manager
from employee.forms import EmployeeForm, RateOfMinimumWageForm, MedicalReportForm, search_employee_form
from setting.utils import decrypt
from .forms import MineDetailsForm, MiningRoleForm, MiningShiftForm
from .models import MineDetails, MiningRole, MineShift, EmployeeShiftAssign, RateOfMinimumWages, \
    MedicalReport
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from accounts.tokens import account_activation_token
from django.utils.http import urlsafe_base64_encode
from django.core.mail import EmailMessage
from django.utils.encoding import force_bytes
from accounts.models import profile_extension, User
from employee.models import Employee
from django.db import IntegrityError
from django.utils.crypto import get_random_string
from django.template.defaulttags import register

# Create your views here.
@login_required
def employee_manage(request, template_name='employee/employee_manage.html'):
    data = {}
    current_user = request.user
    profile = get_object_or_404(profile_extension, user_id=current_user.id)

    if request.user.is_superuser:
        book = Employee.objects.all()
    else:
        book = Employee.objects.filter(mine_id=profile.mine_id.id)

    data['object_list'] = book
    return render(request, template_name, data)


@login_required
def employee_add(request, template_name='employee/employee_add.html'):
    if request.user.is_superuser:
        form = EmployeeForm()
        form.fields['mining_role'].queryset = MiningRole.objects.filter(mine_id=-1)
        form.fields['immediate_staff'].queryset = Employee.objects.filter(mine_id=-1)
    else:
        profile = get_object_or_404(profile_extension, user_id=request.user.id)
        if profile.mine_id is not None:
            form = EmployeeForm(initial={'mine': profile.mine_id})
            form.fields['mine'].widget.attrs['readonly'] = True
            form.fields['mining_role'].queryset = MiningRole.objects.filter(mine_id=profile.mine_id.id)
            form.fields['immediate_staff'].queryset = Employee.objects.filter(mine_id=profile.mine_id.id)
            # form.fields['mine'].queryset=MineDetails.objects.all()
        else:
            form = EmployeeForm()
            form.fields['mining_role'].queryset = MiningRole.objects.filter(mine_id=-1)
            form.fields['immediate_staff'].queryset = Employee.objects.filter(mine_id=-1)

    if request.method == 'POST':
        form = EmployeeForm(request.POST or None, request.FILES or None)
        # form.fields['mine'].widget.attrs['disabled'] = False
        if form.is_valid():
            employee = form.save()
            # fs=profile_extension()
            # fs.mine_id=employee.mine
            # fs.user_id=employee.id
            # fs.profile_avatar=employee.photo
            # fs.save()
        return redirect('employee:employee_manage')

    return render(request, template_name, {'form': form})


@login_required
def get_dropdownlist(request):
    data = {}
    if request.is_ajax():

        result = {}
        id = request.GET.get('id', None)
        args = request.GET.get('args', None)
        args = args.split(',')

        if 'role' in args:
            result['role'] = serializers.serialize('json', MiningRole.objects.filter(mine_id=id), fields=('id', 'name'))
        if 'immediate_staff' in args:
            result['immediate_staff'] = serializers.serialize('json', Employee.objects.filter(mine_id=id),
                                                              fields=('id', 'name'))
        data['result'] = result
    else:
        data['error'] = 'Something went wrong!'
    return JsonResponse(data)


@login_required
def employee_edit(request, pk, template_name='employee/employee_add.html'):
    book = get_object_or_404(Employee, pk=pk)
    form = EmployeeForm(request.POST or None, request.FILES or None, instance=book)
    form.fields['mine'].widget.attrs['readonly'] = True
    form.fields['mining_role'].queryset = MiningRole.objects.filter(mine_id=book.mine_id)
    form.fields['immediate_staff'].queryset = Employee.objects.filter(mine_id=book.mine_id)
    if form.is_valid():
        try:
            form.save()
            return redirect('employee:employee_manage')
        except Exception as e:
            print("error msg-->", e)

    return render(request, template_name, {'form': form})


@login_required
def employee_delete(request, pk):
    book = get_object_or_404(Employee, pk=pk)
    book.delete()
    return redirect('employee:employee_manage')


@login_required
def more_details_ajax(request):
    data = {}
    if request.is_ajax():

        emp_id = request.GET.get('id', None)

        try:
            employees = Employee.objects.filter(id=emp_id)
            data['result'] = serializers.serialize('json', employees, fields=('name',
                                                                              'father_name',
                                                                              'dob',
                                                                              'present_address',
                                                                              'permanent_address',
                                                                              'email',
                                                                              'mob',
                                                                              'state',
                                                                              'city',
                                                                              'pin',
                                                                              'gender',
                                                                              'marital_status',
                                                                              'spouse_name',
                                                                              'nationality',
                                                                              'photo',
                                                                              'mine',
                                                                              'rfid',
                                                                              'designation',
                                                                              'token_no',
                                                                              'date_of_joining',
                                                                              'retirement_date',
                                                                              'job_type',
                                                                              'mining_role',
                                                                              'cat_type',
                                                                              'immediate_staff',
                                                                              'is_rescue',
                                                                              'blood_group',
                                                                              'medical_status',
                                                                              'aadhaar_no',
                                                                              'pan_no',
                                                                              'voter_id_no',
                                                                              'medical_ins_no',
                                                                              'bank_name',
                                                                              'bank_ac_no',
                                                                              'bank_ifsc',
                                                                              'bank_pf_no',
                                                                              'edu_course_name',
                                                                              'edu_board_name',
                                                                              'edu_year',
                                                                              'edu_percent',
                                                                              ))

            mine_name = ""
            mining_role = ""
            for e in employees:
                mine_name = str(e.mine)
                mining_role = str(e.mining_role)

            data['mine_name'] = mine_name
            data['mining_role'] = mining_role
            return JsonResponse(data)

        except:
            data['error'] = "Something Went Wrong"

    data['error'] = "Something Went Wrong"
    return JsonResponse(data)


@login_required
def generate_login_details_ajax(request):
    data = {}
    if request.is_ajax():
        try:
            email = request.POST.get('email')
            password = request.POST.get('pass')

            username = request.POST.get('username')
            print('username', username)
            print('pass', password)
            print('email', email)
            data['result'] = email
            try:
                user = User.objects.create_user(username=username,
                                                email=email,
                                                password=password)

                current_site = get_current_site(request)
                sendverifyemail(current_site.domain, user.username, email, urlsafe_base64_encode(force_bytes(user.pk)),
                                account_activation_token.make_token(user))
                user.is_active = False
                user.save()
                employee = get_object_or_404(Employee, email=email)
                fs = profile_extension()
                fs.user_id = user
                fs.mine_id = employee.mine
                fs.profile_avatar = employee.photo
                fs.save()

                data['confirm_registration'] = 'Please confirm your email address to complete the registration'
                data['username'] = username
                data['password'] = password
                data['success'] = "Account Creation Successfully! User need to Confirm email to login!"
                return JsonResponse(data)

            except IntegrityError as e:
                data['ie'] = "Account with this username and email address already exists!"
                return JsonResponse(data)
        except Exception as e:
            print('error', e)
            data['ie'] = "Something went wrong.Try again later"
            user.delete()
            fs.delete()
            return JsonResponse(data)
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


@background(schedule=1)
def sendverifyemail(domain, user, email, uid, token):
    print('Email Background', domain, user, email, uid, token)
    mail_subject = 'Activate your Miner account.'
    message = render_to_string('acc_active_email.html', {
        'user': user,
        'domain': domain,
        'uid': uid,
        'token': token,
    })
    to_email = email
    email = EmailMessage(
        mail_subject, message, to=[to_email]
    )
    try:
        email.send()
        return True
    except Exception as e:
        print('error', e)
        sendverifyemail(domain, user, email, uid, token)


@login_required
def show_role_chart(request):
    return render(request, 'mine/role_hierarchy.html')


@login_required
def fetch_role_ajax(request):
    data = []
    if request.is_ajax():
        book = MiningRole.objects.values_list()
        # data['object_list'] = str(book)
        print(data)
        for r in book:
            # print(r[1])
            if str(r[1]) == ('None'):
                data.append("{id" + ':' + str(r[0]) + ",name:" + str(r[2]) + ",parent:0},")
            else:
                data.append("{id" + ':' + str(r[0]) + ",name:" + str(r[2]) + ",parent:" + str(r[1]) + "},")
        print(data)
        return HttpResponse(data)

    data.append({'error': "Something Went Wrong!"})
    return HttpResponse(data)


@login_required
def add_mine(request, template_name='mine/mine_add.html'):
    form = MineDetailsForm()

    if request.method == 'POST':
        form = MineDetailsForm(request.POST or None, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('employee:manage_mine')
        # return render(request, template_name, {'form': form, 'action': 'ADD', 'mine_name': ''})
    return render(request, template_name, {'form': form, 'action': 'ADD', 'mine_name': ''})


@login_required
def manage_mine(request, template_name='mine/mine_manage.html'):
    # book = Employee.objects.all()
    book = MineDetails.objects.all()
    data = {}
    data['object_list'] = book
    return render(request, template_name, data)


@login_required
def edit_mine(request, pk, template_name='mine/mine_add.html'):
    pk = decrypt(pk)
    book = get_object_or_404(MineDetails, pk=pk)
    form = MineDetailsForm(request.POST or None, request.FILES or None, instance=book)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('employee:manage_mine')
    return render(request, template_name, {'form': form, 'action': 'EDIT', 'mine_name': '(' + str(book.name) + ')'})


@login_required
def delete_mine(request, pk):
    pk = decrypt(pk)
    book = get_object_or_404(MineDetails, pk=pk)
    book.delete()
    return redirect('employee:manage_mine')


###############################    Mining Role Functions   ############################

@login_required
def add_mining_role(request, template_name='mine/add_mining_role.html'):
    data = {}
    admin_or_not = 0
    mine_name = ""
    if request.user.is_superuser:
        admin_or_not = 1
        form = MiningRoleForm()
        mine_name = "Super User"
        form.fields['parent_role'].queryset = MiningRole.objects.filter(mine_id=-1)
    else:
        try:
            profile = get_object_or_404(profile_extension, user_id=request.user.id)
            admin_or_not = 0
            form = MiningRoleForm(initial={'mine': profile.mine_id})  # Passed Mine id as an argument
            form.fields['mine'].widget = form.fields['mine'].hidden_widget()
            form.fields['parent_role'].queryset = MiningRole.objects.filter(mine_id=profile.mine_id_id)
            mine_name = MineDetails.objects.get(id=profile.mine_id.id)

        except Exception as e:
            form = []
            data['is_not_assigned'] = True

    if request.method == "POST":

        if not request.user.is_superuser:
            mine = MineDetails.objects.get(pk=profile.mine_id.id)
            form = MiningRoleForm(request.POST or None, initial={'mine': mine})
            form.fields['parent_role'].queryset = MiningRole.objects.filter(mine_id=profile.mine_id_id)
            form.fields['mine'].widget = form.fields['mine'].hidden_widget()
        else:
            form = MiningRoleForm(request.POST or None)

        if form.is_valid():
            form.save()
            messages.success(request, 'Changes successfully saved.')
            return redirect('employee:manage_mining_role')
        else:
            messages.error(request, 'Role name Already exists')
    data['form'] = form
    data['mine_name'] = mine_name
    data['admin'] = admin_or_not
    data['action'] = 'ADD'
    data['title'] = 'Add Role'

    return render(request, template_name, data)


@login_required
def edit_mining_role(request, pk, template_name='mine/add_mining_role.html'):
    data = {}
    current_user = request.user
    profile = get_object_or_404(profile_extension, user_id=current_user.id)
    book = get_object_or_404(MiningRole, pk=pk)

    admin_or_not = 0
    if request.user.is_superuser:
        form = MiningRoleForm(request.POST or None, instance=book)
        form.fields['parent_role'].queryset = MiningRole.objects.filter(mine_id=book.mine_id)
        mine_name = "Super User"
        admin_or_not = 1
    else:
        try:
            form = MiningRoleForm(request.POST or None, instance=book)
            form.fields['parent_role'].queryset = MiningRole.objects.filter(mine_id=book.mine_id)
            mine_name = MineDetails.objects.get(id=profile.mine_id.id)
            admin_or_not = 0
        except Exception as e:
            data['is_not_assigned'] = True

    if request.method == "POST":
        if form.is_valid():
            fs = form.save(commit=False)
            if not request.user.is_superuser:
                fs.mine_id = profile.mine_id.id
            fs.save()
            messages.success(request, 'Changes successfully saved.')
            return redirect('employee:manage_mining_role')
        print(form.errors)

    return render(request, template_name,
                  {'form': form, 'mine_name': mine_name, 'action': 'EDIT', 'admin': admin_or_not})


@login_required
def delete_mining_role(request, pk):
    book = get_object_or_404(MiningRole, pk=pk)
    book.delete()
    return redirect('employee:manage_mining_role')


@login_required
def mine_role_fetch_ajax(request):
    data = {}
    if request.is_ajax():
        mine = request.GET.get('mine_id')
        data['result'] = serializers.serialize('json', MiningRole.objects.filter(mine_id=mine), fields=('id', 'name'
                                                                                                        ))
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


@login_required
def manage_mining_role(request, template_name='mine/manage_mining_role.html'):
    data = {}
    if request.user.is_superuser:
        book = MiningRole.objects.all()
        data['object_list'] = book
        data['mine_name'] = "Super User"
    else:
        try:
            profile = request.user.profile_extension_set.values('mine_id')[0]
            book = MiningRole.objects.filter(mine_id=profile['mine_id'])
            data['object_list'] = book
            data['mine_name'] = MineDetails.objects.get(id=profile['mine_id']).name
        except Exception as e:
            data['is_not_assigned'] = True
    data['title'] = 'Manage Role'
    return render(request, template_name, data)


####################### Mining Shift ######################

@login_required
def manage_mining_shift(request, mine_id, template_name='mine/manage_mining_shift.html'):
    book = MineShift.objects.filter(mine_id=mine_id)
    data = {}
    data['object_list'] = book
    data['mine_id'] = mine_id

    mine_table = MineDetails.objects.get(id=mine_id)
    data['mine_name'] = mine_table.name
    return render(request, template_name, data)


@login_required
def add_mining_shift(request, mine_id, template_name='mine/add_mining_shift.html'):
    mine_table = MineDetails.objects.get(id=mine_id)
    mine_name = mine_table.name
    mine_id = mine_table.id
    form = MiningShiftForm()
    # print(form)
    # return HttpResponse("ok")
    if request.method == "POST":
        form = MiningShiftForm(request.POST or None)
        object = MineShift()
        try:
            if form.is_valid():
                object.shift_name = request.POST.get("shift_name")
                object.description = request.POST.get("description")
                object.time_from = request.POST.get("time_from")
                object.time_to = request.POST.get("time_to")
                object.mine_id = mine_id

                object.save()

                return redirect('/employee/manage_mining_shift/' + str(mine_id))
        except Exception as e:
            messages.error(request, 'Oops!, Something went wrong!')
            pass
    return render(request, template_name, {'form': form, 'mine_name': mine_name, 'mine_id': mine_id})


@login_required
def edit_mining_shift(request, pk, mine_id, template_name='mine/add_mining_shift.html'):
    book = get_object_or_404(MineShift, pk=pk)
    mine_table = MineDetails.objects.get(id=mine_id)
    mine_name = mine_table.name
    mine_id = mine_table.id
    form = MiningShiftForm(request.POST or None, instance=book)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('/employee/manage_mining_shift/' + str(mine_id))
    return render(request, template_name, {'form': form, 'mine_name': mine_name, 'mine_id': mine_id})


@login_required
def delete_mining_shift(request, pk, mine_id):
    book = get_object_or_404(MineShift, pk=pk)
    book.delete()
    return redirect('/employee/manage_mining_shift/' + str(mine_id))


@login_required
def update_shift_link(request, pk):
    emp_table = Employee.objects.get(id=pk)
    emp_name = emp_table.name
    mine_id = emp_table.mine_id
    mine_name = emp_table.mine
    mine_shift_table = MineShift.objects.values_list().filter(mine_id=mine_id)
    for mine_row in mine_shift_table:
        print(mine_row[2])  # 3rd attribute
    # return HttpResponse("ok")
    data = {}
    data['emp_id'] = emp_table.id
    data['emp_name'] = emp_name
    data['mine_id'] = mine_id
    data['mine_name'] = mine_name
    data['mine_shift_table'] = mine_shift_table
    return render(request, "employee/employee_shift.html", data)


@login_required
def update_shift_link_ajax(request):
    data = {}
    if request.is_ajax():
        miner_id = request.GET.get('miner_id')
        miner = Employee.objects.get(id=miner_id)
        mode = request.GET.get('mode')
        mine_shift_id = request.GET.get('mine_shift_id')
        if mode == '0':
            try:
                emp_table = Employee.objects.get(id=miner_id)
                emp_name = emp_table.name
                data['employee_name'] = str(emp_name)
                mine_id = emp_table.mine_id
                data['result'] = serializers.serialize('json', MineShift.objects.filter(mine_id=mine_id), fields=('id',
                                                                                                                  'shift_name',
                                                                                                                  'shift',
                                                                                                                  'time_from',
                                                                                                                  'time_to',
                                                                                                                  'mine_id',
                                                                                                                  'description',
                                                                                                                  'created_date'))

                data['assigned_shift'] = str(emp_table.shift_id_id)

                return JsonResponse(data)
            except Exception as e:
                print(e)
                data['error'] = "Something Went Wrong!"
                return JsonResponse(data)
        elif mode == '1':
            shift_id = MineShift.objects.get(pk=mine_shift_id)
            try:
                obj = EmployeeShiftAssign()
                obj.employee_id = miner
                obj.shift_id = shift_id
                now = datetime.datetime.now()
                curr_date = now.strftime("%Y-%m-%d")
                obj.assign_date = curr_date
                obj.created_date = curr_date
                obj.modified_date = curr_date
                obj.save()
            except Exception as e:
                print(e)

        data['success'] = "Shift Updated Successfully"
        # data['error'] = "Something Went Wrong!"
        return JsonResponse(data)

    data['error'] = "Something Went Wrong!"
    return JsonResponse(data)


@login_required
def MinimumWage(request, template_name='employee/minimum_wage.html'):
    form = RateOfMinimumWageForm()
    if request.method == "POST":
        form = RateOfMinimumWageForm(request.POST or None)
        print('form errors', form.errors)
        if form.is_valid():
            form.save()
            return redirect('employee:manage_minimum_wage')
    return render(request, template_name, {'form': form})


@login_required
def ManageMinimumWage(request, template_name='employee/manage_minimum_wage.html'):
    minimum_wage = RateOfMinimumWages.objects.filter(mine_id=1)
    form = RateOfMinimumWageForm()
    mine_table = MineDetails.objects.all()
    selected = 0
    if request.method == "POST":
        selected = request.POST.get('mine_id')
        minimum_wage = RateOfMinimumWages.objects.filter(mine_id=selected)
        selected = int(selected)

    return render(request, template_name, {'data': minimum_wage, 'mine': mine_table, 'selected': selected})


@login_required
def save_updated_shift(request):
    print(request.POST)
    obj = EmployeeShiftAssign()
    obj.employee_id = request.POST.get("employee_id")
    obj.mine_shift_id = request.POST.get("mine_shift_id")
    obj.save()
    return redirect('employee:employee_manage')
    # return HttpResponse(request.POST.get("employee_id"))


@login_required
def details_employee_shift_assign(request, emp_id, template_name="employee/shift_assign_report.html"):
    data = {}
    shiftassign_table = EmployeeShiftAssign.objects.all()
    print('Shift Assign Table',shiftassign_table)
    data['result'] = shiftassign_table

    return render(request, template_name, data)


@register.filter(name='calculateage')
def related_deltas(obj, pk):
    if obj == "age":
        return MedicalReport.age(MedicalReport, pk)
    elif obj == "nextdate":
        return MedicalReport.nextdate(MedicalReport, pk)
    elif obj == "lastdate":
        return MedicalReport.lastdate(MedicalReport, pk)


@login_required
def update_medical(request, emp_id, template_name='employee/update_medical.html'):
    emp_table = Employee.objects.get(id=emp_id)
    data = {}
    form = MedicalReportForm(initial={'employee_id': emp_table.id})
    data['form'] = form
    data['employee_name'] = emp_table.name
    data['mine_name'] = emp_table.mine.name
    data['emp_id'] = emp_id
    data['medical_history'] = MedicalReport.objects.filter(employee_id=emp_id)
    try:
        data['medical'] = MedicalReport.objects.filter(employee_id=emp_id).order_by('-id')[0]
    except:
        pass
    if request.method == "POST":
        form = MedicalReportForm(request.POST or None, request.FILES or None)
        print('FORM ERRORS', form.errors)
        if form.is_valid():
            fs = form.save(commit=False)
            fs.mine_id = emp_table.mine
            fs.employee_id = emp_table
            fs.save()
            messages.success(request, 'Successfully')

    return render(request, template_name, data)


######################################################################
# ----------------------MM---------------------------------

class AboutUsPageView(TemplateView):
    template_name = "aboutus.html"


class AboutIotPageView(TemplateView):
    template_name = "aboutiot.html"


class AboutDigitalminePageView(TemplateView):
    template_name = "aboutdigitalmine.html"


class ContactUsPageView(TemplateView):
    template_name = "contactus.html"


# MM

def contactview(request):
    pass


def thankyou(request, template='thankyou.html'):
    return render(request, template)


@login_required
def checkifuserfieldempty(request):
    data = {}
    if request.is_ajax():

        current_user = request.user
        book = get_object_or_404(User, pk=current_user.id)
        if book.first_name in [None, ''] or book.last_name in [None, '']:
            data['result'] = 1
        else:
            data['result'] = 0
        return JsonResponse(data)

    data['result'] = 0
    return JsonResponse(data)


@login_required
def profile_ajax(request):
    data = {}
    if request.is_ajax():
        current_user = request.user
        book = get_object_or_404(User, pk=current_user.id)
        profile = profile_extension.objects.get(user_id=book)
        data['profile_avatar'] = str(profile.profile_avatar)
        data['mine'] = str(profile.mine_id)
        if request.user.is_superuser:
            data['admin'] = 1
        else:
            data['admin'] = 0
        return JsonResponse(data)

    data['error'] = "Something Went Wrong!"
    return JsonResponse(data)

@login_required
def validate_token(request):
    data = {}
    available = 0
    if request.is_ajax():
        print(request)
        token = request.GET.get('token')

        try:
            check = get_object_or_404(Employee, token_no=token)
            print('check user', check.id, request.user.id)
            if not check.id == request.user.id:
                token = get_random_string()
                available = 1
        except:
            pass
        data['result'] = {"token": token, "available": available}
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


@background(schedule=10)
def notify_user():
    # lookup user by id and send them a message
    print('NOTIFTY USER')
#-------------------------------------------------------------------------------------------------
# for search employee
def search_emp(request):
    form = search_employee_form()
    return render(request,"employee/search_emp.html",{'form':form})
