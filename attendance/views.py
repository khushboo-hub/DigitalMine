from django.http import JsonResponse
from django.shortcuts import render, redirect, HttpResponse, get_object_or_404
from django.contrib.auth.decorators import login_required
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from .models import EmployeeAttendance, Employee, MineShift, EmployeeShiftAssign, MineDetails
from .forms import AttendenceForm
from .serializers import AttendanceSerializer
@login_required
def index(request, template_name='attendance_index.html'):
    form = AttendenceForm()
    return render(request, template_name, {'form': form})


@login_required
def add_att(request):
    t_length = len(request.POST.getlist('mine_id'))
    mine_id_list = request.POST.getlist('mine_id')
    shift_id_list = request.POST.getlist('shift_id')
    emp_id_list = request.POST.getlist('emp_id')
    ab_pr_date_id_list = request.POST.getlist('ab_pr_date')
    ab_pr_id_list = request.POST.getlist('ab_pr')
    leave_type_id_list = request.POST.getlist('leave_type')
    # print('type',leave_type_id_list)
    leave_no_id_list = request.POST.getlist('leave_no')
    for key_value in range(t_length):
        inst = EmployeeAttendance()
        inst.mine_id = get_object_or_404(MineDetails, id=mine_id_list[key_value])
        inst.shift_id = get_object_or_404(MineShift, id=shift_id_list[key_value])
        inst.emp_id = get_object_or_404(Employee, id=emp_id_list[key_value])
        inst.ab_pr_date = ab_pr_date_id_list[key_value]
        inst.ab_pr = ab_pr_id_list[key_value]
        inst.leave_type = leave_type_id_list[key_value]
        inst.leave_no = leave_no_id_list[key_value]
        try:
            inst.save()
        except Exception as e:
            print('Exception', e)
            pass

    return redirect('attendance:attendance_manage')


@login_required
def attendance_manage(request, template_name='attendance_manage.html'):
    emp_show = EmployeeAttendance.objects.all()
    # print('emp show',emp_show)
    emp_data = {}
    employee_data = {}

    for emp in emp_show:
        employee = {}
        emp_details = Employee.objects.filter(mine_id=emp.mine_id_id, id=emp.emp_id_id)
        mine_details = MineDetails.objects.filter(id=emp.mine_id_id)
        for ob in emp_details:
            employee['emp_name'] = str(ob.name)

        for mine in mine_details:
            employee['mine_name'] = str(mine.name)

        employee['shift_id'] = str(emp.shift_id)
        shift_table = MineShift.objects.get(id=emp.shift_id_id)
        employee['shift_name'] = str(shift_table.shift_name) + '(' + str(shift_table.time_from) + '--' + str(
            shift_table.time_to) + ')'
        employee['ab_pr_date'] = str(emp.ab_pr_date)
        employee['ab_pr'] = str(emp.ab_pr)
        employee['leave_type'] = str(emp.leave_type)
        employee['leave_no'] = str(emp.leave_no)

        employee_data[str(emp.id)] = employee
    emp_data['dt_store'] = employee_data

    # print(emp_data)
    form = AttendenceForm()
    return render(request, template_name, {'form': form})


@login_required
def ajax_show_attendence(request):
    data = {}
    # print('hello')
    if request.is_ajax():
        mine_id = request.GET.get('mine_id', None)
        print('Mine ID', mine_id)
        date_from = request.GET.get('date_from', None)
        date_to = request.GET.get('date_to', None)
        # print(date_from + " " + date_to)

        try:
            attendance_records = []
            data['present'] = 0
            data['absent'] = 0
            if mine_id == "None":
                attendance_details = EmployeeAttendance.objects.filter(ab_pr_date__range=[date_from, date_to]).order_by(
                    '-id')
            else:
                attendance_details = EmployeeAttendance.objects.filter(mine_id=mine_id,
                                                                       ab_pr_date__range=[date_from, date_to]).order_by(
                    '-id')
            counter = 0
            for attendance in attendance_details:
                print('ateen', attendance)
                attend = {}
                mine_details = MineDetails.objects.get(id=attendance.mine_id_id)
                mine_name = mine_details.name
                employee_table = Employee.objects.get(id=attendance.emp_id_id)
                emp_name = employee_table.name
                employee_shift = MineShift.objects.get(id=attendance.shift_id_id)
                shift_name = employee_shift.shift_name
                print('shift name', shift_name)
                if attendance.ab_pr == 'Present':
                    data['present'] += 1
                else:
                    data['absent'] += 1
                counter += 1
                attendance_records.append({'id': counter,
                                           'mine_name': mine_name,
                                           'emp_name': emp_name,
                                           'shift_name': shift_name,
                                           'date': attendance.ab_pr_date,
                                           'ab_pr': attendance.ab_pr,
                                           'leave_type': attendance.leave_type,
                                           'leave_no': str(attendance.leave_no),
                                           })

                # attendance_records[str(attendance.id)] = attend

            data['result'] = attendance_records
            data['total'] = len(attendance_records)
            data['present']
            return JsonResponse(data)
        except Exception as e:
            print('Exception', e)
            pass

    data['result'] = "Not Ajax"
    return JsonResponse(data)


@login_required
def fetch_shift(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        employee_shift = MineShift.objects.filter(mine_id=mine_id)
        # print(employee_shift.query)
        emp_data = []
        for r in employee_shift:
            emp_data.append({'id': r.pk, 'shift_name': r.shift_name + "(" + r.time_from + "-" + r.time_to + ")"})

        data['result'] = emp_data
    else:
        data['result'] = "Something Went Wrong!"

    return JsonResponse(data)


@login_required
def fetch_employee_list(request):
    data = {}
    employee = []
    if request.is_ajax():
        mine_id = request.GET.get('mine_id', None)
        shift_id = request.GET.get('shift_id', None)
        employees = Employee.objects.filter(mine_id=mine_id, shift_id=shift_id)
        for emp in employees:
            employee.append({
                'mine_id': emp.mine_id,
                'mine_name': emp.mine.name,
                'shift_id': emp.shift_id_id,
                'shift_name': emp.shift_id.shift,
                'emp_id': emp.id,
                'emp_name': emp.name,
                'designation':emp.designation,
                'father_name':emp.father_name,
                'mobile':emp.mob,
                'email':emp.email

            })
        data['result'] = employee
        # print(assigned_data)
    else:
        data['result'] = "Something Wen't Wrong!"

    return JsonResponse(data)
#========================================================================================================
class AttendanceAPIView(APIView):
    def post(self, request):
        serializer = AttendanceSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(status=status.HTTP_201_CREATED)