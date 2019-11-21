##################################################################################
#     Created By: DEWANGSHU PANDIT
#     Created On: Apr/-/July -2018
#     Purpose :Mine Management,Role,Heirarchy,Medical, Employee Management etc
#     Any Description:
#     Last Modified:
#     Modified function,any:
##################################################################################

import datetime

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
###################
import serial
from django.core import serializers
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, JsonResponse

# Create your views here.
from django.shortcuts import render, redirect, get_object_or_404, render_to_response
from django.views.generic import TemplateView
from employee1.forms import EmployeeForm1
from .forms import MineDetailsForm, MiningRoleForm, MiningShiftForm
from .models import SensorData, MineDetails, MiningRole, MineShift, EmployeeShiftAssign
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from accounts.tokens import account_activation_token
from django.utils.http import urlsafe_base64_encode
from django.core.mail import EmailMessage
from django.utils.encoding import force_bytes
from accounts.models import profile_extension, User
import re
from django.db import IntegrityError

# Create your views here.
@login_required
def employee_manage(request, template_name='employee1/employee_manage.html'):
    current_user = request.user
    profile = get_object_or_404(profile_extension, user_id=current_user.id)

    if request.user.is_superuser:
        book = Employee1.objects.all()
    else:
        book=Employee1.objects.filter(mine_id=profile.mine_id.id)
    data = {}
    data['object_list'] = book
    for b in book:
        print(b.photo)
    return render(request, template_name, data)


@login_required
@login_required
def employee_add(request, template_name='employee1/employee_add.html'):
    current_user=request.user
    profile = get_object_or_404(profile_extension, user_id=current_user.id)
    role=MiningRole.objects.filter(mine=profile.mine_id.id).values_list('id','name')
    print(role)
    print('Profile',profile.mine_id)
    if profile.mine_id is not None:
        print('Here Inside')
        form = EmployeeForm1(profile.mine_id.id,initial={'mine': profile.mine_id.id})
        role=MiningRole.objects.filter(mine=profile.mine_id)
        for r in role:
            print(r)
    else:
        print('Else Part')
        form = EmployeeForm1()

    if request.method == 'POST':
        form = EmployeeForm1(request.POST or None, request.FILES)
        # print(request.POST)
        if form.is_valid():
            form.save()
        return redirect('employee1:employee_manage')

    return render(request, template_name, {'form': form})

@login_required
def employee_edit(request, pk, template_name='employee1/employee_add.html'):
    book = get_object_or_404(Employee1, pk=pk)
    print("book",book)
    # print(pk)
    # print(book)
    current_user=request.user

    form = EmployeeForm1(book.mine_id,request.POST or None, request.FILES or None, instance=book)
    print('Form Errors',form.errors)
    # print(form.errors)
    if form.is_valid():
        print('form is valid')
        try:
            form.save()
            print("form saved")
            return redirect('employee1:employee_manage')
        except Exception as e:
            print('ERROR')
            print("error msg-->", e)
    return render(request, template_name, {'form': form})


@login_required
def employee_delete(request, pk):
    book = get_object_or_404(Employee1, pk=pk)
    book.delete()
    return redirect('employee1:employee_manage')


@login_required
def more_details_ajax(request):
    data = {}
    if request.is_ajax():

        emp_id = request.GET.get('id', None)

        try:
            employees = Employee1.objects.filter(id=emp_id)
            data['result'] = serializers.serialize('json', employees, fields=('name',
                                                                              'father_name',
                                                                              'dob',
                                                                              'address',
                                                                              'email',
                                                                              'mob',
                                                                              'state',
                                                                              'city',
                                                                              'pin',
                                                                              'gender',
                                                                              'marital_status',
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

            print(mine_name)
            print(mining_role)
            data['mine_name'] = mine_name
            data['mining_role'] = mining_role
            return JsonResponse(data)

        except:
            data['error'] = "Something Went Wrong"

    data['error'] = "Something Went Wrong"
    return JsonResponse(data)
from accounts.models import profile_extension
from employee1.models import Employee1
@login_required
def generate_login_details_ajax(request):
    data = {}
    if request.is_ajax():
        # miner_id = request.POST.get('miner_id')
        # email=request.POST.get('email')
        try:
            email = request.POST.get('email')
            password = request.POST.get('pass')
            username = request.POST.get('username')
            print('username',username)
            data['result'] = email
            user = User.objects.create_user(username=username,
                                            email=email,
                                            password=password)

            user.is_active = False
            user.save()
            employee=get_object_or_404(Employee1, email=email)
            fs = profile_extension()
            fs.user_id = user
            fs.mine_id=employee.mine
            fs.save()
            current_site = get_current_site(request)
            mail_subject = 'Activate your Miner account.'
            message = render_to_string('acc_active_email.html', {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': account_activation_token.make_token(user),
            })
            to_email = email
            email = EmailMessage(
                mail_subject, message, to=[to_email]
            )
            email.send()
            data['confirm_registration'] = 'Please confirm your email address to complete the registration'
            data['username'] = username
            data['password'] = password
            data['success'] = "Account Creation Successfully! User need to Confirm email to login!"
            return JsonResponse(data)
        except IntegrityError as e:
            print(e)
            data['ie']="Account with this username and email address already exists!"
    data['error'] = "Something Went Wrong!"
    return JsonResponse(data)


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
def getsensordata(request):
    # try:
    #     print("------Reading collection starts now------")
    #     sr = serial.Serial("COM3",9600)
    #     st = list(str(sr.readline(),'utf-8'))
    #     sr.close()
    #     print("------Reading collection ends successfully------")
    #     #return  str(''.join(st[:]))
    #     return HttpResponse(str(''.join(st[:])))
    # except Exception as e:
    #     return HttpResponse("<h2>Please Connect The Arduino Properly and Check PORT.</br></h2><small>"+str(e)+"</small>")

    ################################Testing for insert data continue##############
    # i=1
    # while True:
    #     f = SensorData()
    #     f.data1=340+i
    #     f.save()
    #     # i+=1
    #
    # # f.data1="3545"
    # # f.save()
    # return HttpResponse("Data Inserted Success")

    #################################################################################

    #############CONTINUOUS INSERT DATA FROM ARDUINO ##########

    try:
        while True:
            sr = serial.Serial("COM4", 9600)
            st = list(str(sr.readline(), 'utf-8'))
            sr.close()
            ard_data = str(''.join(st[:]))
            f = SensorData()
            f.data1 = ard_data
            f.save()
    except Exception as e:
        ####################
        fig, ax = plt.subplots()
        line, = ax.plot(np.random.rand(10))
        ax.set_ylim(0, 1)

        def update(data):
            line.set_ydata(data)
            return line,

        def data_gen():
            while True:
                yield np.random.rand(10)

        ani = animation.FuncAnimation(fig, update, data_gen, interval=1000)
        plt.show()
        ###################
        return HttpResponse(
            "<h2>Please Connect The Arduino Properly and Check PORT.</br></h2><small>" + str(e) + "</small>")


@login_required
def add_mine(request, template_name='mine/mine_add.html'):
    form = MineDetailsForm(request.POST, request.FILES)
    # print(request.POST)
    if form.is_valid():
        form.save()

        return redirect('employee1:manage_mine')
    return render(request, template_name, {'form': form,'action':'Add Mine','mine_name':''})


@login_required
def manage_mine(request, template_name='mine/mine_manage.html'):
    # book = Employee1.objects.all()
    book = MineDetails.objects.all()
    data = {}
    data['object_list'] = book
    return render(request, template_name, data)


@login_required
def edit_mine(request, pk, template_name='mine/mine_add.html'):
    book = get_object_or_404(MineDetails, pk=pk)
    print(book)
    form = MineDetailsForm(request.POST or None,request.FILES or None, instance=book)
    if form.is_valid():
        form.save()
        return redirect('employee1:manage_mine')
    return render(request, template_name, {'form': form,'action':'Manage Mine','mine_name':'('+str(book.name)+')'})


@login_required
def delete_mine(request, pk):
    book = get_object_or_404(MineDetails, pk=pk)
    # print(book)
    book.delete()
    return redirect('employee1:manage_mine')


###############################    Mining Role Functions   ############################

@login_required
def add_mining_role(request, template_name='mine/add_mining_role.html'):
    current_user = request.user
    profile = get_object_or_404(profile_extension, user_id=current_user.id)
    form = MiningRoleForm(profile.mine_id.id,request.POST)  # Passed Mine id as an argument
    mine_name=MineDetails.objects.get(id=profile.mine_id.id)
    if form.is_valid():
        fs=form.save(commit=False)
        fs.mine_id=profile.mine_id.id
        fs.save()
        return redirect('employee1:manage_mining_role')

    return render(request, template_name, {'form': form,'mine_name':mine_name})


@login_required
def manage_mining_role(request, template_name='mine/manage_mining_role.html'):
    # book = Employee1.objects.all()
    book = MiningRole.objects.all()
    current_user = request.user
    profile = get_object_or_404(profile_extension, user_id=current_user.id)
    mine_name=MineDetails.objects.get(id=profile.mine_id.id)
    try:
        current_user=request.user
        profile=get_object_or_404(profile_extension,user_id=current_user.id)
        print('PRofile ID',str(profile.mine_id.id))
        book = MiningRole.objects.filter(mine_id=profile.mine_id.id)
    except:
        pass
    data = {}
    data['object_list'] = book
    data['mine_name']=mine_name
    return render(request, template_name, data)


@login_required
def edit_mining_role(request, pk, template_name='mine/add_mining_role.html'):
    current_user = request.user
    profile = get_object_or_404(profile_extension, user_id=current_user.id)
    book = get_object_or_404(MiningRole, pk=pk)
    form = MiningRoleForm(request.POST or None, instance=book)
    mine_name=MineDetails.objects.get(id=profile.mine_id.id)
    if profile.mine_id is None:
        roles=MiningRole.objects.all()
    else:
        roles=MiningRole.objects.filter(mine_id=profile.mine_id.id)

    selected_role=book.parent_role
    if book.parent_role is None:
        selected_role=""
    else:
        selected_role=book.parent_role.id
    if form.is_valid():
        form.save()
        return redirect('employee1:manage_mining_role')
    return render(request, template_name, {'form': form,'roles':roles,'selected_role':selected_role,'mine_name':mine_name})


@login_required
def delete_mining_role(request, pk):
    book = get_object_or_404(MiningRole, pk=pk)
    book.delete()
    return redirect('employee1:manage_mining_role')


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
    form = MiningShiftForm(request.POST)
    # print(form)
    # return HttpResponse("ok")

    object = MineShift()
    try:
        if form.is_valid():
            object.shift_name = request.POST.get("shift_name")
            object.description = request.POST.get("description")
            object.time_from = request.POST.get("time_from")
            object.time_to = request.POST.get("time_to")
            object.mine_id = mine_id
            # print(request.POST)
            # form.save()
            object.save()

            return redirect('/employee1/manage_mining_shift/' + str(mine_id))
        # else:
        #     return  HttpResponse("some error")
    except Exception as e:
        return HttpResponse("Exception mera he " + str(e))
    return render(request, template_name, {'form': form, 'mine_name': mine_name})


@login_required
def edit_mining_shift(request, pk, mine_id, template_name='mine/add_mining_shift.html'):
    book = get_object_or_404(MineShift, pk=pk)
    form = MiningShiftForm(request.POST or None, instance=book)
    if form.is_valid():
        form.save()
        return redirect('/employee1/manage_mining_shift/' + str(mine_id))
    return render(request, template_name, {'form': form})


@login_required
def delete_mining_shift(request, pk, mine_id):
    book = get_object_or_404(MineShift, pk=pk)
    book.delete()
    return redirect('/employee1/manage_mining_shift/' + str(mine_id))


@login_required
def update_shift_link(request, pk):
    emp_table = Employee1.objects.get(id=pk)
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
    return render(request, "employee1/employee_shift.html", data)


@login_required
def update_shift_link_ajax(request):
    data = {}
    if request.is_ajax():
        miner_id = request.GET.get('miner_id')
        mode = request.GET.get('mode')
        mine_shift_id = request.GET.get('mine_shift_id')
        if mode == '0':
            try:
                emp_table = Employee1.objects.get(id=miner_id)

                emp_name = emp_table.name
                data['employee_name'] = str(emp_name)
                mine_id = emp_table.mine_id
                mine_name = emp_table.mine
                # print(str(emp_name)+" "+str(mine_id)+" "+str(mine_name))
                # mine_shift_table = MineShift.objects.values_list().filter(mine_id=mine_id)
                data['result'] = serializers.serialize('json', MineShift.objects.filter(mine_id=mine_id), fields=('id',
                                                                                                                  'shift_name',
                                                                                                                  'time_from',
                                                                                                                  'time_to',
                                                                                                                  'mine_id',
                                                                                                                  'description',
                                                                                                                  'created_date'))

                EmployeeShift = EmployeeShiftAssign.objects.filter(employee_id=miner_id).order_by('-id')[0]
                print(EmployeeShift.employee_id)

                # mine_shift.append({'id':mine_row.id,'shift_name':mine_row.shift_name,'time_from':mine_row.time_from,'time_to':mine_row.time_to})  # 3rd attribute

                # data['emp_id'] = emp_table.id
                # data['emp_name'] = emp_name
                # data['mine_id'] = mine_id
                # data['mine_name'] = mine_name
                data['assigned_shift'] = str(EmployeeShift.mine_shift_id)

                return JsonResponse(data)
            except Exception as e:
                print(e)
                data['error'] = "Something Went Wrong!"
                return JsonResponse(data)
        elif mode == '1':
            print('Mode 2')
            print(mine_shift_id)
            # try:
            #     obj = EmployeeShiftAssign.objects.get(employee_id=miner_id)
            #     now = datetime.datetime.now()
            #     curr_date = now.strftime("%Y-%m-%d")
            #     obj.modified_date = curr_date
            #     obj.mine_shift_id = str(mine_shift_id)
            #     obj.save()
            # except EmployeeShiftAssign.DoesNotExist:
            obj = EmployeeShiftAssign()
            obj.employee_id = miner_id
            print(mine_shift_id)
            obj.mine_shift_id = mine_shift_id
            now = datetime.datetime.now()
            curr_date = now.strftime("%Y-%m-%d")
            obj.assign_date = curr_date
            obj.created_date = curr_date
            obj.modified_date = curr_date
            obj.save()
        data['success'] = "Shift Updated Successfully"
        # data['error'] = "Something Went Wrong!"
        return JsonResponse(data)

    data['error'] = "Something Went Wrong!"
    return JsonResponse(data)


@login_required
def save_updated_shift(request):
    print(request.POST)
    obj = EmployeeShiftAssign()
    obj.employee_id = request.POST.get("employee_id")
    obj.mine_shift_id = request.POST.get("mine_shift_id")
    obj.save()
    return redirect('employee1:employee_manage')
    # return HttpResponse(request.POST.get("employee_id"))


@login_required
def details_employee_shift_assign(request, emp_id):
    final_data1 = {}
    final_data = []

    i = 0
    shiftassign_table = EmployeeShiftAssign.objects.values_list().filter(employee_id=emp_id)

    miner = get_object_or_404(Employee1, pk=emp_id)

    for assign_row in shiftassign_table:
        data = {}
        data['assign_date'] = assign_row[4]
        mine_shift_id = assign_row[2]
        shift_table = MineShift.objects.get(id=mine_shift_id)
        data['shift_name'] = shift_table.shift_name
        data['time_from'] = shift_table.time_from
        data['time_to'] = shift_table.time_to
        final_data.append([])
        final_data[i] = data
        i = i + 1
    # print(final_data)
    # return HttpResponse("<pre>"+str(final_data)+"</pre>")
    final_data1['data'] = final_data
    final_data1['miner_name'] = str(miner.name)
    # print(final_data1)
    # return HttpResponse(final_data1)
    return render(request, "employee1/shift_assign_report.html", final_data1)


@login_required
def update_medical(request, emp_id):
    emp_table = Employee1.objects.get(id=emp_id)
    emp_name = emp_table.name
    mine_name = emp_table.mine
    ################ FIND AGE ################
    dob = emp_table.dob
    dob1 = str(dob)
    dob_year = str(dob1[:4])
    now = datetime.datetime.now()
    curr_date = now.strftime("%Y-%m-%d")
    curr_date_year = str(curr_date[:4])
    age = (int(curr_date_year) - int(dob_year))
    #########################################

    data = {}
    data['emp_id'] = emp_id
    data['emp_name'] = emp_name
    data['mine_name'] = mine_name
    data['age'] = age
    return render(request, "employee1/update_medical.html", data)


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
    # subject = request.POST.get('topic', '')
    # message = request.POST.get('message', '')
    # from_email = request.POST.get('email', '')
    #
    # if subject and message and from_email:
    #     try:
    #         # send_mail(subject, message, from_email, ['change@this.com'])
    #     except BadHeaderError:
    #         return HttpResponse('Invalid header found.')
    #     return HttpResponseRedirect('/contact/thankyou/')
    # else:
    #     return render_to_response('contactsus.html', {'form': ContactForm()})
    #
    # return render_to_response('contactsus.html', {'form': ContactForm()},
    #                           RequestContext(request))


def thankyou(request):
    return render_to_response('thankyou.html')


@login_required
def checkifuserfieldempty(request):
    data = {}
    total = 0
    if request.is_ajax():

        current_user = request.user
        book = get_object_or_404(User, pk=current_user.id)
        # print(book.first_name)
        # print(book.last_name)
        if book.first_name in [None, ''] or book.last_name in [None, '']:
            # print("Is None")
            data['result'] = 1
        else:
            data['result'] = 0
            # print('Not Empty')
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
        data['mine']=str(profile.mine_id)
        print(profile.profile_avatar)
        return JsonResponse(data)

    data['error'] = "Something Went Wrong!"
    return JsonResponse(data)
