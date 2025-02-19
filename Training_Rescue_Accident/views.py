from django.http import JsonResponse
from django.shortcuts import render, redirect, HttpResponse, get_object_or_404
from django.contrib.auth.decorators import login_required
from .models import training_attendance, training_attendance_details, Rescue_Records, Accident_Records, Employee, \
    MineShift, \
    EmployeeShiftAssign, MineDetails, Accident_Records_employees, Accident_Records_others
from .forms import Rescue_Form, Accident_Form, Training_Form, \
    training_attendance_details_form,Accident_EmployeeForm,Accident_OthersForm
# S S MISHRA
@login_required
def index(request, template_name='Training_Attendance.html'):
    print('Training Attendance.........')
    form = Training_Form()
    if request.method=="POST":
        form = Training_Form(request.POST or None)
        if form.is_valid():
            my_id = form.save()
            for key_value in range(len(request.POST.getlist('is_present'))):
                spem_list = {
                    'emp_id': request.POST.getlist("emp_id")[key_value],
                    'is_present': request.POST.getlist("is_present")[key_value],
                    'training_attendance_id': my_id.id
                }
                sub_form_1 = training_attendance_details_form(spem_list)
                print(spem_list)
                if sub_form_1.is_valid():
                   sub_form_1.save()
                else:
                    print(sub_form_1.errors)
                    print("Sub Part Invalid")
            return redirect('Training_Rescue_Accident:manage_training_attendance')
    return render(request, template_name, {'form': form})

from accounts.models import profile_extension
def manage_training_attendance(request, template_name='manage_training_attendance.html'):
    if request.user.is_superuser:
        return_data = training_attendance.objects.all().order_by('-id')
    else:
        profile=get_object_or_404(profile_extension,user_id=request.user_id)
        return_data = training_attendance.objects.filter(mine_id=profile.mine_id).order_by('-id')

    return render(request, template_name, {'return_data': return_data})

def EditEmployeeTrainingAttendance(request,id,template_name="EditEmployeeTrainingAttendance.html"):
    if request.POST:
        subTable1 = training_attendance_details.objects.filter(training_attendance_id=request.POST.get("training_attendance_id"))
        subTable1.delete()
        print(len(request.POST.getlist('is_present')))
        for key_value in range(len(request.POST.getlist('is_present'))):
            spem_list = {
                'emp_id': request.POST.getlist("emp_id")[key_value],
                'is_present': request.POST.getlist("is_present")[key_value],
                'training_attendance_id': request.POST.get("training_attendance_id")
            }
            sub_form_1 = training_attendance_details_form(spem_list)

            if sub_form_1.is_valid():
                sub_form_1.save()
            else:
                print(sub_form_1.errors)
                print("Sub Part Invalid")
        return redirect('Training_Rescue_Accident:manage_training_attendance')

    base_column = training_attendance.objects.get(id=id)
    subTable1 = training_attendance_details.objects.filter(training_attendance_id=id)
    return render(request, template_name,{'form': base_column, "subTable1": subTable1})

def ViewEmployeeTrainingAttendance(request,id,template_name="ViewEmployeeTrainingAttendance.html"):

    base_column = training_attendance.objects.get(id=id)
    subTable1 = training_attendance_details.objects.filter(training_attendance_id=id)
    return render(request, template_name,{'form': base_column, "subTable1": subTable1})

def DeleteEmployeeTrainingAttendance(request,id):
    base_column = training_attendance.objects.get(id=id)
    base_column.delete()

    subTable1 = training_attendance_details.objects.filter(
        training_attendance_id=id)
    subTable1.delete()

    return redirect('Training_Rescue_Accident:manage_training_attendance')

# @login_required
# def add_Training_Rescue_Accident(request):# delete function
#     t_length = len(request.POST.getlist('mine_id'))
#     mine_id_list = request.POST.getlist('mine_id')
#     shift_id_list = request.POST.getlist('shift_id')
#     emp_id_list = request.POST.getlist('emp_id')
#     training_type_id_list = request.POST.getlist('training_type')
#     training_date_id_list = request.POST.getlist('training_date')
#     is_ab_pr_id_list = request.POST.getlist('is_ab_pr')
#     training_ab_pr_from_id_list = request.POST.getlist('training_ab_pr_from')
#     training_ab_pr_to_id_list = request.POST.getlist('training_ab_pr_to')
#     training_count_id_list = request.POST.getlist('training_count')
#     training_remarks_id_list = request.POST.getlist('training_remarks')
#
#     for key_value in range(t_length):
#         inst = Training_Rescue_Accident()
#         t_list = {
#             'mine_id': mine_id_list[key_value],
#             'shift_id': shift_id_list[key_value],
#             'emp_id': emp_id_list[key_value],
#             'training_type': training_type_id_list[key_value],
#             'training_date': training_date_id_list[key_value],
#             'is_ab_pr': is_ab_pr_id_list[key_value],
#             'training_ab_pr_from': training_ab_pr_from_id_list[key_value],
#             'training_ab_pr_to': training_ab_pr_to_id_list[key_value],
#             'training_count': training_count_id_list[key_value],
#             'training_remarks': training_remarks_id_list[key_value],
#         }
#         inst.mine_id = t_list['mine_id']
#         inst.shift_id = t_list['shift_id']
#         inst.emp_id = t_list['emp_id']
#         inst.training_type = t_list['training_type']
#         inst.training_date = t_list['training_date']
#         inst.is_ab_pr = t_list['is_ab_pr']
#         inst.training_ab_pr_from = t_list['training_ab_pr_from']
#         inst.training_ab_pr_to = t_list['training_ab_pr_to']
#         inst.training_count = t_list['training_count']
#         inst.training_remarks = t_list['training_remarks']
#         inst.save()
#
#     return redirect('Training_Rescue_Accident:Training_Rescue_Accident_Manage')
#
#
# @login_required
# def Training_Rescue_Accident_Manage(request, template_name='Training_Rescue_Accident_Manage.html'):
#     emp_show = Training_Rescue_Accident.objects.all()
#     emp_data = {}
#     employee_data = {}
#
#     for emp in emp_show:
#         employee = {}
#         emp_details = Employee.objects.filter(mine_id=emp.mine_id, id=emp.emp_id)
#         mine_details = MineDetails.objects.filter(id=emp.mine_id)
#         for ob in emp_details:
#             employee['emp_name'] = str(ob.name)
#
#         for mine in mine_details:
#             employee['mine_name'] = str(mine.name)
#
#         employee['shift_id'] = str(emp.shift_id)
#         shift_table = MineShift.objects.get(id=emp.shift_id)
#         employee['shift_name'] = str(shift_table.shift_name) + '(' + str(shift_table.time_from) + '--' + str(
#             shift_table.time_to) + ')'
#         employee['training_date'] = str(emp.training_date)
#         employee['training_type'] = str(emp.training_type)
#         employee['ab_pr'] = str(emp.is_ab_pr)
#         employee['training_ab_pr_from'] = str(emp.training_ab_pr_from)
#         employee['training_ab_pr_to'] = str(emp.training_ab_pr_to)
#         employee['training_remarks'] = str(emp.training_remarks)
#         employee['training_count'] = str(emp.training_count)
#
#         employee_data[str(emp.id)] = employee
#     emp_data['dt_store'] = employee_data
#     print(employee_data)
#     return render(request, template_name, emp_data)


@login_required
def fetch_shift(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        employee_shift = MineShift.objects.values_list().filter(mine_id=mine_id)
        data = {}
        i = 0
        emp_data = []
        for r in employee_shift:
            emp_data.append(str(r[0]) + ',' + str(r[1]) + ',' + str(r[2]) + ',' + str(r[3]) + ',' + str(r[4]))
            i = i + 1
            data['result'] = emp_data
            # print(data)
    else:
        data['result'] = "Something Wen't Wrong!"

    return JsonResponse(data)


@login_required
def fetch_employee_list(request):
    data = {}
    if request.is_ajax():
        mine_shift_id = request.GET.get('id', None)
        shift_table = MineShift.objects.get(id=mine_shift_id)
        mine_table = MineDetails.objects.get(id=shift_table.mine_id)
        employee_shift_assign = EmployeeShiftAssign.objects.values_list().filter(mine_shift_id=mine_shift_id)
        data = {}
        i = 0
        assigned_data = []
        for r in employee_shift_assign:  ##### 0-id
            emp_table = Employee.objects.get(id=str(r[1]))
            assigned_data.append(str(r[0]) + ',' + str(r[1]) + ',' + str(r[2]) + ',' + str(emp_table.name) + ',' + str(
                emp_table.id) + ',' + str(mine_table.id) + ',' + str(
                mine_table.name))  # 0-mine_shift_id 1-employee_id,2-shift_name
            i = i + 1
            data['result'] = assigned_data
    else:
        data['result'] = "Something Wen't Wrong!"

    return JsonResponse(data)


@login_required
def Rescue_index(request, template_name='Rescue_index.html'):
    if request.method == "POST":
        form = Rescue_Form(request.POST or None)
        if form.is_valid():
            form.save()
            return redirect('Training_Rescue_Accident:Rescue_Manage')
        else:
            print("Invalid!")
    else:
        form = Rescue_Form()
    return render(request, template_name, {'form': form})


@login_required
def Rescue_Manage(request, template_name='Rescue_Manage.html'):
    emp_data={}
    emp_show = Rescue_Records.objects.all()

    emp_data['dt_store'] = emp_show
    return render(request, template_name, emp_data)


@login_required
def Accident_index(request, template_name='Accident_index.html'):
    if request.method == "POST":
        form1 = Accident_Form(request.POST or None)
        employee_id = request.POST.getlist('employee_id_post')
        employee_names=request.POST.getlist('employee_name_post')
        employee_killed_or_injured_post = request.POST.getlist('employee_killed_or_injured_post')
        employee_cause_post = request.POST.getlist('employee_cause_post')

        person_name_post = request.POST.getlist('person_name_post')
        others_killed_or_injured_post = request.POST.getlist('others_killed_or_injured_post')
        sex_post = request.POST.getlist('sex_post')
        age_post = request.POST.getlist('age_post')
        nature_of_employment_post = request.POST.getlist('nature_of_employment_post')
        others_cause_post = request.POST.getlist('others_cause_post')
        employee_obj=[]
        others_obj=[]
        print('form errors',form1.errors)
        if form1.is_valid():
            print("valid")
            form_id=form1.save()

            for i in range(0,len(employee_id)):
                employee_obj.append(Accident_Records_employees(accident_record=form_id,
                                                               employee_id_id=employee_id[i],
                                                               employee_name=employee_names[i],
                                                               killed_or_injured=employee_killed_or_injured_post[i],
                                                               cause=employee_cause_post[i]))


            for i in range(0,len(person_name_post)):
                others_obj.append(Accident_Records_others(accident_id=form_id,
                                                          killed_or_injured=others_killed_or_injured_post[i],
                                                          name= person_name_post[i],
                                                          age=age_post[i],
                                                          sex=sex_post[i],
                                                          nature_of_employment=nature_of_employment_post[i],
                                                          cause=others_cause_post[i]))

            Accident_Records_employees.objects.bulk_create(employee_obj)
            Accident_Records_others.objects.bulk_create(others_obj)


            return redirect('Training_Rescue_Accident:Accident_Manage')
        else:
            print("Invalid!")
    else:
        form1 = Accident_Form()
        form2=Accident_EmployeeForm()
        form3 = Accident_OthersForm()
        return render(request, template_name, {'form1': form1,'form2':form2,'form3':form3})


@login_required
def Accident_Manage(request, template_name='Accident_Manage.html'):
    emp_data={}
    emp_show = Accident_Records.objects.all()

    emp_data['dt_store'] = emp_show

    return render(request, template_name, emp_data)

@login_required
def ViewAccidentRecords(request,pk,template_name='ViewAccidentRecords.html'):
    acccident=Accident_Records.objects.get(pk=pk)
    employees=Accident_Records_employees.objects.filter(accident_record=acccident)
    others=Accident_Records_others.objects.filter(accident_id=acccident)
    return render(request,template_name,{'accident':acccident,'employees':employees,'others':others})

@login_required
def fetch_miners_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('mine_id', None)
        miners = Employee.objects.filter(mine_id=mine_id)
        mn = []
        for m in miners:
            mn.append({'id': m.id, 'name': str(m.name_with_email())})
        data['result'] = mn
        return JsonResponse(data)
    data['result'] = "Not Ajax"
    return JsonResponse(data)


@login_required
def rescue_record_submit_ajax(request):
    data = {}
    if request.is_ajax() and request.method == "POST":
        mine_id = request.POST.get('mine_id')
        shift_id = request.POST.get('shift_id')
        area = request.POST.get('area')
        date_from = request.POST.get('date_from')
        date_to = request.POST.get('date_to')
        resq_no = request.POST.get('resq_no')
        resq_per_name = request.POST.get('resq_per_name')
        acc_type = request.POST.get('acc_type')
        rescued_no = request.POST.get('rescued_no')
        rescued_per_name = request.POST.get('rescued_per_name')

        rescue_record_instance = Rescue_Records()
        rescue_record_instance.mine_id = str(mine_id)
        rescue_record_instance.shift_id = shift_id
        rescue_record_instance.area = area
        rescue_record_instance.date_fr = date_from
        rescue_record_instance.date_to = date_to
        rescue_record_instance.rescue_dep_num = resq_no
        rescue_record_instance.rescue_person_name = resq_per_name
        rescue_record_instance.incident_type = acc_type
        rescue_record_instance.employee_rescued_num = rescued_no
        rescue_record_instance.rescued_employees_name = rescued_per_name

        try:
            rescue_record_instance.save()
            data['success'] = "Rescue Record Saved Successfully!"
        except Exception as e:
            print(e)
            data['error'] = "Rescue Record Already Saved!"

        return JsonResponse(data)

    data['error'] = "Something Went Wrong!"
    return JsonResponse(data)


@login_required
def accident_record_submit_ajax(request):
    data = {}
    if request.is_ajax() and request.method == "POST":
        mine_id = request.POST.get('mine_id')
        shift_id = request.POST.get('shift_id')
        situation = request.POST.get('situation')
        name_address = request.POST.get('name_address')
        vill_pin = request.POST.get('vill_pin')
        date_time = request.POST.get('date_time')
        accident_location = request.POST.get('accident_location')
        killed_num = request.POST.get('killed_num')
        injured_num = request.POST.get('injured_num')
        accident_cause_description = request.POST.get('accident_cause_description')
        person_names = request.POST.get('person_names')
        nature_of_employment = request.POST.get('nature_of_employment')
        age = request.POST.get('age')
        sex = request.POST.get('sex')
        cause_of_death_or_injury = request.POST.get('cause_of_death_or_injury')

        accident_record_instance = Accident_Records()
        accident_record_instance.mine_id = str(mine_id)
        accident_record_instance.shift_id = shift_id
        accident_record_instance.situation_mines = situation
        accident_record_instance.name_address = name_address
        accident_record_instance.vil_pin = vill_pin
        accident_record_instance.date_hour_accident = date_time
        accident_record_instance.accident_location = accident_location
        accident_record_instance.killed_num = killed_num
        accident_record_instance. injured_num = injured_num
        accident_record_instance.accident_cause_description = accident_cause_description
        accident_record_instance.person_names = person_names
        accident_record_instance.emp_nat = nature_of_employment
        accident_record_instance.age = age
        accident_record_instance.sex = sex
        accident_record_instance.injury_death_cause=cause_of_death_or_injury

        try:
            accident_record_instance.save()
            data['success'] = "Rescue Record Saved Successfully!"
        except Exception as e:
            print(e)
            data['error'] = "Rescue Record Already Saved!"+e

        return JsonResponse(data)

    data['error'] = "Something Went Wrong!"
    return JsonResponse(data)
