

from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.core.mail import send_mail, EmailMessage
from django.http import HttpResponse, JsonResponse, QueryDict, FileResponse
from django.shortcuts import render, get_object_or_404


# from DGMS_Forms.utils import Render
from apps import settings
from employee.models import Employee
from .forms import DGMS_COALMINE_ANNUAL_Annexure_I_Forms, \
    DGMS_COALMINE_ANNUAL_Annexure_I_Forms_Subtable_1, DGMS_COALMINE_ANNUAL_Annexure_I_Forms_Subtable_2, \
    DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms, DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms_Subtable_1, \
    DGMS_COALMINE_ANNUAL_Annexure_I_Forms_Subtable_3, DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms_Subtable_2, \
    DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms_Subtable_3, DGMS_OilMines_ANNUAL_Annexure_III_Forms, \
    DGMS_OilMines_ANNUAL_Annexure_III_Forms_Subtable_1, DGMS_OilMines_ANNUAL_Annexure_III_Forms_Subtable_2, \
    DGMS_CoalMine_Table_A_Form, DGMS_CoalMine_Table_B_Form, DGMS_CoalMine_Table_C_Form, DGMS_CoalMine_Table_D_Form, \
    DGMS_CoalMine_Table_E_Form, First_Schedule_Form_iii, sendMailForm, ventilationForm, First_Schedule_Form_v_Form, \
    development_permission_form, identification_report_of_the_problem_form, extract_or_reduce_pillars_forms, \
    metal_mine_extract_permission_form
from .models import MineDetails, MiningRole, DGMS_CoalMine_Annual_Annexure_I, \
    DGMS_CoalMine_Annual_Annexure_I_Subtable_1, DGMS_CoalMine_Annual_Annexure_I_Subtable_2, \
    DGMS_MetelliferousMine_Annual_Annexure_II, \
    DGMS_CoalMine_Annual_Annexure_I_Subtable_3, \
    DGMS_MetalliferousMines_ANNUAL_Annexure_II_Subtable_3, DGMS_MetalliferousMines_Annual_Annexure_II_Subtable_2, \
    DGMS_MetalliferousMine_Annual_Annexure_II_Subtable_1, DGMS_OilMines_Annual_Annexure_III, \
    DGMS_OilMines_Annual_Annexure_III_Subtable_1, DGMS_OilMines_Annual_Annexure_III_Subtable_2, \
    DGMS_CoalMine_Table_A_Model, DGMS_CoalMine_Table_B_Model, DGMS_CoalMine_Table_C_Model, DGMS_CoalMine_Table_D_Model, \
    DGMS_CoalMine_Table_E_Model, First_Schedule_Form_iii_Model, ventilation_Model, First_schedule_form_v_Model, \
    development_permission_model, identification_report_of_the_problem_model, extract_or_reduce_pillars_models, \
    metal_mine_extract_permission_model

# Create your views here.
from django.shortcuts import render, redirect


@login_required
def Add_DGMS_CoalMine_Annual_Annexure_I(request, template_name='AnnualReport/Add_DGMS_CoalMine_Annual_Annexure_I.html'):
    if request.method == "POST":
        # print(request.POST)
        form = DGMS_COALMINE_ANNUAL_Annexure_I_Forms(request.POST, request.FILES)

        if form.is_valid():
            my_id = form.save()

            spem_length = len(request.POST.getlist('spem_designation'))
            as_length = len(request.POST.getlist('accident_statistics_year'))
            cre_length = len(request.POST.getlist('cre_grade'))

            spem_designation_list = request.POST.getlist('spem_designation')
            spem_no_requried_list = request.POST.getlist('spem_no_requried')
            spem_no_available_list = request.POST.getlist('spem_no_available')
            spem_short_surplus_list = request.POST.getlist('spem_short_surplus')

            for key_value in range(spem_length):
                spem_list = {
                    'spem_designation': spem_designation_list[key_value],
                    'spem_no_requried': spem_no_requried_list[key_value],
                    'spem_no_available': spem_no_available_list[key_value],
                    'spem_short_surplus': spem_short_surplus_list[key_value],
                    'base_column_id': my_id.id

                }
                sub_form_1 = DGMS_COALMINE_ANNUAL_Annexure_I_Forms_Subtable_1(spem_list)
                if sub_form_1.is_valid():
                    sub_form_1.save()
                else:
                    print("Sub Part Invalid")

            accident_statistics_year_list = request.POST.getlist('accident_statistics_year')
            accident_statistics_fatal_number_list = request.POST.getlist('accident_statistics_fatal_number')
            accident_statistics_fatal_no_of_persion_killed_list = request.POST.getlist(
                'accident_statistics_fatal_no_of_persion_killed')
            accident_statistics_fatal_no_of_persion_injured_list = request.POST.getlist(
                'accident_statistics_fatal_no_of_persion_injured')
            accident_statistics_serious_list = request.POST.getlist('accident_statistics_serious')
            accident_statistics_serious_injured_list = request.POST.getlist('accident_statistics_serious_injured')
            accident_statistics_reportable_number_list = request.POST.getlist('accident_statistics_reportable_number')
            accident_statistics_reportable_injured_list = request.POST.getlist('accident_statistics_reportable_injured')
            accident_statistics_minor_number_list = request.POST.getlist('accident_statistics_minor_number')
            accident_statistics_minor_injured_list = request.POST.getlist('accident_statistics_minor_injured')

            for key_values in range(as_length):
                as_list = {
                    'accident_statistics_year': accident_statistics_year_list[key_values],
                    'accident_statistics_fatal_number': accident_statistics_fatal_number_list[key_values],
                    'accident_statistics_fatal_no_of_persion_killed':
                        accident_statistics_fatal_no_of_persion_killed_list[key_values],
                    'accident_statistics_fatal_no_of_persion_injured':
                        accident_statistics_fatal_no_of_persion_injured_list[key_values],
                    'accident_statistics_serious': accident_statistics_serious_list[key_values],
                    'accident_statistics_serious_injured': accident_statistics_serious_injured_list[key_values],
                    'accident_statistics_reportable_number': accident_statistics_reportable_number_list[key_values],
                    'accident_statistics_reportable_injured': accident_statistics_reportable_injured_list[key_values],
                    'accident_statistics_minor_number': accident_statistics_minor_number_list[key_values],
                    'accident_statistics_minor_injured': accident_statistics_minor_injured_list[key_values],
                    'base_column_id': my_id.id

                }
                sub_form_2 = DGMS_COALMINE_ANNUAL_Annexure_I_Forms_Subtable_2(as_list)
                if sub_form_2.is_valid():
                    sub_form_2.save()
                else:
                    print("Sub Part2 Invalid")
            cre_grade_list = request.POST.getlist('cre_grade')
            cre_2_list = request.POST.getlist('cre_2')
            cre_3_list = request.POST.getlist('cre_3')
            cre_4_list = request.POST.getlist('cre_4')
            cre_5_list = request.POST.getlist('cre_5')
            cre_6_list = request.POST.getlist('cre_6')
            cre_7_list = request.POST.getlist('cre_7')
            cre_8_list = request.POST.getlist('cre_8')
            cre_9_list = request.POST.getlist('cre_9')
            cre_10_list = request.POST.getlist('cre_10')
            cre_11_list = request.POST.getlist('cre_11')

            for key_value in range(cre_length):
                cre_list = {
                    'cre_grade': cre_grade_list[key_value],
                    'cre_2': cre_2_list[key_value],
                    'cre_3': cre_3_list[key_value],
                    'cre_4': cre_4_list[key_value],
                    'cre_5': cre_5_list[key_value],
                    'cre_6': cre_6_list[key_value],
                    'cre_7': cre_7_list[key_value],
                    'cre_8': cre_8_list[key_value],
                    'cre_9': cre_9_list[key_value],
                    'cre_10': cre_10_list[key_value],
                    'cre_11': cre_11_list[key_value],
                    'base_column_id': my_id.id

                }
                sub_form_3 = DGMS_COALMINE_ANNUAL_Annexure_I_Forms_Subtable_3(cre_list)
                if sub_form_3.is_valid():
                    sub_form_3.save()
                else:
                    print("Sub Part 3 Invalid")
        else:
            print("Form Invalid")
        return redirect('DGMS_Forms:Manage_DGMS_CoalMine_Annual_Annexure_I')
    else:
        form = DGMS_COALMINE_ANNUAL_Annexure_I_Forms()
    sub_form_1 = DGMS_COALMINE_ANNUAL_Annexure_I_Forms_Subtable_1()
    sub_form_2 = DGMS_COALMINE_ANNUAL_Annexure_I_Forms_Subtable_2()
    sub_form_3 = DGMS_COALMINE_ANNUAL_Annexure_I_Forms_Subtable_3()
    return render(request, template_name,
                  {'form': form, 'sub_form_1': sub_form_1, 'sub_form_2': sub_form_2, 'sub_form_3': sub_form_3})


def Manage_DGMS_CoalMine_Annual_Annexure_I(request):
    annexure_i_part_a = DGMS_CoalMine_Annual_Annexure_I.objects.all().order_by('-id')
    return render(request, "AnnualReport/Manage_DGMS_CoalMine_Annual_Annexure_I.html",
                  {'annexure_i_part_a': annexure_i_part_a})


def Edit_DGMS_CoalMine_Annual_Annexure_I(request, id):
    base_data = get_object_or_404(DGMS_CoalMine_Annual_Annexure_I, id=id)
    form = DGMS_COALMINE_ANNUAL_Annexure_I_Forms(request.POST or None, request.FILES or None, instance=base_data)
    if request.method == "POST":
        if form.is_valid():
            my_id = form.save()

            spem_length = len(request.POST.getlist('spem_designation'))
            as_length = len(request.POST.getlist('accident_statistics_year'))
            cre_length = len(request.POST.getlist('cre_grade'))

            spem_designation_list = request.POST.getlist('spem_designation')
            spem_no_requried_list = request.POST.getlist('spem_no_requried')
            spem_no_available_list = request.POST.getlist('spem_no_available')
            spem_short_surplus_list = request.POST.getlist('spem_short_surplus')

            subTable1 = DGMS_CoalMine_Annual_Annexure_I_Subtable_1.objects.filter(base_column_id=id)
            subTable1.delete()
            for key_value in range(spem_length):
                spem_list = {
                    'spem_designation': spem_designation_list[key_value],
                    'spem_no_requried': spem_no_requried_list[key_value],
                    'spem_no_available': spem_no_available_list[key_value],
                    'spem_short_surplus': spem_short_surplus_list[key_value],
                    'base_column_id': my_id.id

                }
                sub_form_1 = DGMS_COALMINE_ANNUAL_Annexure_I_Forms_Subtable_1(spem_list)
                if sub_form_1.is_valid():
                    sub_form_1.save()
                else:
                    print("Sub Part Invalid")

            accident_statistics_year_list = request.POST.getlist('accident_statistics_year')
            accident_statistics_fatal_number_list = request.POST.getlist('accident_statistics_fatal_number')
            accident_statistics_fatal_no_of_persion_killed_list = request.POST.getlist(
                'accident_statistics_fatal_no_of_persion_killed')
            accident_statistics_fatal_no_of_persion_injured_list = request.POST.getlist(
                'accident_statistics_fatal_no_of_persion_injured')
            accident_statistics_serious_list = request.POST.getlist('accident_statistics_serious')
            accident_statistics_serious_injured_list = request.POST.getlist('accident_statistics_serious_injured')
            accident_statistics_reportable_number_list = request.POST.getlist('accident_statistics_reportable_number')
            accident_statistics_reportable_injured_list = request.POST.getlist('accident_statistics_reportable_injured')
            accident_statistics_minor_number_list = request.POST.getlist('accident_statistics_minor_number')
            accident_statistics_minor_injured_list = request.POST.getlist('accident_statistics_minor_injured')

            subTable2 = DGMS_CoalMine_Annual_Annexure_I_Subtable_2.objects.filter(base_column_id=id)
            subTable2.delete()
            for key_values in range(as_length):
                as_list = {
                    'accident_statistics_year': accident_statistics_year_list[key_values],
                    'accident_statistics_fatal_number': accident_statistics_fatal_number_list[key_values],
                    'accident_statistics_fatal_no_of_persion_killed':
                        accident_statistics_fatal_no_of_persion_killed_list[key_values],
                    'accident_statistics_fatal_no_of_persion_injured':
                        accident_statistics_fatal_no_of_persion_injured_list[key_values],
                    'accident_statistics_serious': accident_statistics_serious_list[key_values],
                    'accident_statistics_serious_injured': accident_statistics_serious_injured_list[key_values],
                    'accident_statistics_reportable_number': accident_statistics_reportable_number_list[key_values],
                    'accident_statistics_reportable_injured': accident_statistics_reportable_injured_list[key_values],
                    'accident_statistics_minor_number': accident_statistics_minor_number_list[key_values],
                    'accident_statistics_minor_injured': accident_statistics_minor_injured_list[key_values],
                    'base_column_id': my_id.id

                }
                sub_form_2 = DGMS_COALMINE_ANNUAL_Annexure_I_Forms_Subtable_2(as_list)
                if sub_form_2.is_valid():
                    sub_form_2.save()
                else:
                    print("Sub Part2 Invalid")

            cre_grade_list = request.POST.getlist('cre_grade')
            cre_2_list = request.POST.getlist('cre_2')
            cre_3_list = request.POST.getlist('cre_3')
            cre_4_list = request.POST.getlist('cre_4')
            cre_5_list = request.POST.getlist('cre_5')
            cre_6_list = request.POST.getlist('cre_6')
            cre_7_list = request.POST.getlist('cre_7')
            cre_8_list = request.POST.getlist('cre_8')
            cre_9_list = request.POST.getlist('cre_9')
            cre_10_list = request.POST.getlist('cre_10')
            cre_11_list = request.POST.getlist('cre_11')

            subTable3 = DGMS_CoalMine_Annual_Annexure_I_Subtable_3.objects.filter(base_column_id=id)
            subTable3.delete()

            for key_value in range(cre_length):
                cre_list = {
                    'cre_grade': cre_grade_list[key_value],
                    'cre_2': cre_2_list[key_value],
                    'cre_3': cre_3_list[key_value],
                    'cre_4': cre_4_list[key_value],
                    'cre_5': cre_5_list[key_value],
                    'cre_6': cre_6_list[key_value],
                    'cre_7': cre_7_list[key_value],
                    'cre_8': cre_8_list[key_value],
                    'cre_9': cre_9_list[key_value],
                    'cre_10': cre_10_list[key_value],
                    'cre_11': cre_11_list[key_value],
                    'base_column_id': my_id.id

                }
                sub_form_3 = DGMS_COALMINE_ANNUAL_Annexure_I_Forms_Subtable_3(cre_list)
                if sub_form_3.is_valid():
                    sub_form_3.save()
                else:
                    print("Sub Part 3 Invalid")

        else:
            print("Form Invalid")
        return redirect('DGMS_Forms:Manage_DGMS_CoalMine_Annual_Annexure_I')
    else:
        subTable1 = DGMS_CoalMine_Annual_Annexure_I_Subtable_1.objects.filter(base_column_id=id)
        subTable2 = DGMS_CoalMine_Annual_Annexure_I_Subtable_2.objects.filter(base_column_id=id)
        subTable3 = DGMS_CoalMine_Annual_Annexure_I_Subtable_3.objects.filter(base_column_id=id)
        # return_data = DGMS_CoalMine_Annual_Annexure_I.objects.get(id=id)
        return render(request, "AnnualReport/Edit_DGMS_CoalMine_Annual_Annexure_I.html",
                      {'form': form, "subTable1": subTable1, "subTable2": subTable2, "subTable3": subTable3})


def View_DGMS_CoalMine_Annual_Annexure_I(request, id):
    return_data = DGMS_CoalMine_Annual_Annexure_I.objects.get(id=id)
    subTable1 = DGMS_CoalMine_Annual_Annexure_I_Subtable_1.objects.filter(base_column_id=id)
    subTable2 = DGMS_CoalMine_Annual_Annexure_I_Subtable_2.objects.filter(base_column_id=id)
    subTable3 = DGMS_CoalMine_Annual_Annexure_I_Subtable_3.objects.filter(base_column_id=id)

    return render(request, "AnnualReport/View_DGMS_CoalMine_Annual_Annexure_I.html",
                  {'form': return_data, "subTable1": subTable1, "subTable2": subTable2, "subTable3": subTable3})
    # params = {
    #     'form': return_data,
    #     "subTable1": subTable1,
    #     "subTable2": subTable2,
    #     "subTable3": subTable3,
    #     'request': request
    # }

    # return Render.render('AnnualReport/View_core_DGMS_CoalMine_Annual_Annexure_I.html', params)


def Delete_DGMS_CoalMine_Annual_Annexure_I(request, id):
    base_column = DGMS_CoalMine_Annual_Annexure_I.objects.get(id=id)
    base_column.delete()

    subTable1 = DGMS_CoalMine_Annual_Annexure_I_Subtable_1.objects.filter(base_column_id=id)
    subTable1.delete()

    subTable2 = DGMS_CoalMine_Annual_Annexure_I_Subtable_2.objects.filter(base_column_id=id)
    subTable2.delete()

    subTable3 = DGMS_CoalMine_Annual_Annexure_I_Subtable_3.objects.filter(base_column_id=id)
    subTable3.delete()

    return redirect('DGMS_Forms:Manage_DGMS_CoalMine_Annual_Annexure_I')


# -----------------------------Ajax Call Function------------------------------------------------------------------------------------
def fetch_mine(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        mine_details = MineDetails.objects.values_list().filter(id=mine_id)

        data = {}
        mine_data = {}
        for r in mine_details:
            mine_data['id'] = str(r[0])
            mine_data['name'] = str(r[1])
            mine_data['area'] = str(r[2])
            mine_data['state'] = str(r[3])
            mine_data['date_of_opening'] = str(r[12])
            mine_data['district'] = str(r[10])
            mine_data['lin_no'] = str(r[13])
            mine_data['pin'] = str(r[11])
            mine_data['tehsil_taluka_subdivision'] = str(r[9])
            mine_data['village_area_road'] = str(r[8])

        data['result'] = mine_data
    # print(mine_data)

    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_mine_manager(request):
    data = {}
    mine_manager = {}
    if request.is_ajax():
        mine_id = request.GET.get("id", None)
        mine_role_id = MiningRole.objects.values_list('id').filter(name='Manager')
        emp_details = Employee.objects.values_list("id", "name", "mob", "email", "address", "city", "state",
                                                    "pin").filter(mine_id=mine_id, mining_role_id=mine_role_id[0])

        if not emp_details:
            mine_manager["id"] = ""
            mine_manager["name"] = ""
            mine_manager["mob"] = ""
            mine_manager["email"] = ""
            mine_manager["address"] = ""
            mine_manager["city"] = ""
            mine_manager["state"] = ""
            mine_manager["pin"] = ""
        else:
            emp_details = list(emp_details[0])
            mine_manager["id"] = emp_details[0]
            mine_manager["name"] = emp_details[1]
            mine_manager["mob"] = emp_details[2]
            mine_manager["email"] = emp_details[3]
            mine_manager["address"] = emp_details[4]
            mine_manager["city"] = emp_details[5]
            mine_manager["state"] = emp_details[6]
            mine_manager["pin"] = emp_details[7]

        data["result"] = mine_manager

    else:
        data["result"] = "Not valid Ajax"
    return JsonResponse(data)


# =======================@ Metalliferous Mines @=========================================================================
@login_required
def Add_DGMS_MetalliferousMines_Annual_Annexure_II(request):
    if request.method == "POST":
        form = DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms(request.POST, request.FILES)

        if form.is_valid():
            my_id = form.save()

            spem_length = len(request.POST.getlist('spem_designation'))

            spem_designation_list = request.POST.getlist('spem_designation')
            spem_no_requried_list = request.POST.getlist('spem_no_requried')
            spem_no_available_list = request.POST.getlist('spem_no_available')
            spem_short_surplus_list = request.POST.getlist('spem_short_surplus')

            for key_value in range(spem_length):
                spem_list = {
                    'spem_designation': spem_designation_list[key_value],
                    'spem_no_requried': spem_no_requried_list[key_value],
                    'spem_no_available': spem_no_available_list[key_value],
                    'spem_short_surplus': spem_short_surplus_list[key_value],
                    'base_column_id': my_id.id

                }
                sub_form_1 = DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms_Subtable_1(spem_list)
                if sub_form_1.is_valid():
                    sub_form_1.save()
                else:
                    print("Sub Part 1 Invalid")

            as_length = len(request.POST.getlist('accident_statistics_year'))

            accident_statistics_year_list = request.POST.getlist('accident_statistics_year')
            accident_statistics_fatal_number_list = request.POST.getlist('accident_statistics_fatal_number')
            accident_statistics_fatal_no_of_persion_killed_list = request.POST.getlist(
                'accident_statistics_fatal_no_of_persion_killed')
            accident_statistics_fatal_no_of_persion_injured_list = request.POST.getlist(
                'accident_statistics_fatal_no_of_persion_injured')
            accident_statistics_serious_list = request.POST.getlist('accident_statistics_serious')
            accident_statistics_serious_injured_list = request.POST.getlist('accident_statistics_serious_injured')
            accident_statistics_reportable_number_list = request.POST.getlist('accident_statistics_reportable_number')
            accident_statistics_reportable_injured_list = request.POST.getlist('accident_statistics_reportable_injured')
            accident_statistics_minor_number_list = request.POST.getlist('accident_statistics_minor_number')
            accident_statistics_minor_injured_list = request.POST.getlist('accident_statistics_minor_injured')

            for key_values in range(as_length):
                as_list = {
                    'accident_statistics_year': accident_statistics_year_list[key_values],
                    'accident_statistics_fatal_number': accident_statistics_fatal_number_list[key_values],
                    'accident_statistics_fatal_no_of_persion_killed':
                        accident_statistics_fatal_no_of_persion_killed_list[key_values],
                    'accident_statistics_fatal_no_of_persion_injured':
                        accident_statistics_fatal_no_of_persion_injured_list[key_values],
                    'accident_statistics_serious': accident_statistics_serious_list[key_values],
                    'accident_statistics_serious_injured': accident_statistics_serious_injured_list[key_values],
                    'accident_statistics_reportable_number': accident_statistics_reportable_number_list[key_values],
                    'accident_statistics_reportable_injured': accident_statistics_reportable_injured_list[key_values],
                    'accident_statistics_minor_number': accident_statistics_minor_number_list[key_values],
                    'accident_statistics_minor_injured': accident_statistics_minor_injured_list[key_values],
                    'base_column_id': my_id.id

                }
                sub_form_2 = DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms_Subtable_2(as_list)
                if sub_form_2.is_valid():
                    sub_form_2.save()
                else:
                    print("Sub Part2 Invalid")

            cre_length = len(request.POST.getlist('cre_1'))

            cre_1_list = request.POST.getlist('cre_1')
            cre_2_list = request.POST.getlist('cre_2')
            cre_3_list = request.POST.getlist('cre_3')
            cre_4_list = request.POST.getlist('cre_4')
            cre_5_list = request.POST.getlist('cre_5')
            cre_6_list = request.POST.getlist('cre_6')
            cre_7_list = request.POST.getlist('cre_7')
            cre_8_list = request.POST.getlist('cre_8')
            cre_9_list = request.POST.getlist('cre_9')
            cre_10_list = request.POST.getlist('cre_10')
            cre_11_list = request.POST.getlist('cre_11')
            cre_12_list = request.POST.getlist('cre_12')

            for key_value in range(cre_length):
                cre_list = {
                    'cre_1': cre_1_list[key_value],
                    'cre_2': cre_2_list[key_value],
                    'cre_3': cre_3_list[key_value],
                    'cre_4': cre_4_list[key_value],
                    'cre_5': cre_5_list[key_value],
                    'cre_6': cre_6_list[key_value],
                    'cre_7': cre_7_list[key_value],
                    'cre_8': cre_8_list[key_value],
                    'cre_9': cre_9_list[key_value],
                    'cre_10': cre_10_list[key_value],
                    'cre_11': cre_11_list[key_value],
                    'cre_12': cre_12_list[key_value],
                    'base_column_id': my_id.id
                }
                sub_form_3 = DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms_Subtable_3(cre_list)
                if sub_form_3.is_valid():
                    sub_form_3.save()
                else:
                    print("Sub Part 3 Invalid")
        else:
            print("Form Invalid")
        return redirect('DGMS_Forms:Manage_DGMS_MetalliferousMines_Annual_Annexure_II')
    else:
        form = DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms()
    sub_form_1 = DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms_Subtable_1()
    sub_form_2 = DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms_Subtable_2()
    sub_form_3 = DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms_Subtable_3()

    return render(request, "AnnualReport/Add_DGMS_MetelliferousMine_Annual_Annexure_II.html",
                  {'form': form, 'sub_form_1': sub_form_1, 'sub_form_2': sub_form_2, 'sub_form_3': sub_form_3})


def Manage_DGMS_MetalliferousMines_Annual_Annexure_II(request):
    metelliferous_mine = DGMS_MetelliferousMine_Annual_Annexure_II.objects.all().order_by('-id')
    return render(request, "AnnualReport/Manage_DGMS_MetalliferousMines_Annual_Annexure_II.html",
                  {'metelliferous_mine': metelliferous_mine})


def View_DGMS_MetalliferousMines_Annual_Annexure_II(request, id):
    # base_column: object = DGMS_MetelliferousMine_Annual_Annexure_II.objects.get(id=id)
    base_column: object = DGMS_MetelliferousMine_Annual_Annexure_II.objects.get(id=id)
    subTable1 = DGMS_MetalliferousMine_Annual_Annexure_II_Subtable_1.objects.filter(base_column_id=id)
    subTable2 = DGMS_MetalliferousMines_Annual_Annexure_II_Subtable_2.objects.filter(base_column_id=id)
    subTable3 = DGMS_MetalliferousMines_ANNUAL_Annexure_II_Subtable_3.objects.filter(base_column_id=id)

    return render(request, "AnnualReport/View_DGMS_MetalliferousMines_Annual_Annexure_II.html",
                  {'form': base_column, "subTable1": subTable1, "subTable2": subTable2, "subTable3": subTable3})


def Delete_DGMS_MetalliferousMines_Annual_Annexure_II(request, id):
    base_column = DGMS_MetelliferousMine_Annual_Annexure_II.objects.get(id=id)
    base_column.delete()

    subTable1 = DGMS_MetalliferousMine_Annual_Annexure_II_Subtable_1.objects.filter(base_column_id=id)
    subTable1.delete()

    subTable2 = DGMS_MetalliferousMines_Annual_Annexure_II_Subtable_2.objects.filter(base_column_id=id)
    subTable2.delete()

    subTable3 = DGMS_MetalliferousMines_ANNUAL_Annexure_II_Subtable_3.objects.filter(base_column_id=id)
    subTable3.delete()

    return redirect('DGMS_Forms:Manage_DGMS_MetalliferousMines_Annual_Annexure_II')


def Edit_DGMS_MetalliferousMines_Annual_Annexure_II(request, id):
    base_data = get_object_or_404(DGMS_MetelliferousMine_Annual_Annexure_II, id=id)
    form = DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms(request.POST or None, request.FILES or None,
                                                            instance=base_data)
    if request.method == "POST":
        if form.is_valid():
            my_id = form.save()

            spem_length = len(request.POST.getlist('spem_designation'))

            spem_designation_list = request.POST.getlist('spem_designation')
            spem_no_requried_list = request.POST.getlist('spem_no_requried')
            spem_no_available_list = request.POST.getlist('spem_no_available')
            spem_short_surplus_list = request.POST.getlist('spem_short_surplus')

            subTable1 = DGMS_MetalliferousMine_Annual_Annexure_II_Subtable_1.objects.filter(base_column_id=id)
            subTable1.delete()

            for key_value in range(spem_length):
                spem_list = {
                    'spem_designation': spem_designation_list[key_value],
                    'spem_no_requried': spem_no_requried_list[key_value],
                    'spem_no_available': spem_no_available_list[key_value],
                    'spem_short_surplus': spem_short_surplus_list[key_value],
                    'base_column_id': my_id.id

                }
                sub_form_1 = DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms_Subtable_1(spem_list)
                if sub_form_1.is_valid():
                    sub_form_1.save()
                else:
                    print("Sub Part 1 Invalid")

            as_length = len(request.POST.getlist('accident_statistics_year'))

            accident_statistics_year_list = request.POST.getlist('accident_statistics_year')
            accident_statistics_fatal_number_list = request.POST.getlist('accident_statistics_fatal_number')
            accident_statistics_fatal_no_of_persion_killed_list = request.POST.getlist(
                'accident_statistics_fatal_no_of_persion_killed')
            accident_statistics_fatal_no_of_persion_injured_list = request.POST.getlist(
                'accident_statistics_fatal_no_of_persion_injured')
            accident_statistics_serious_list = request.POST.getlist('accident_statistics_serious')
            accident_statistics_serious_injured_list = request.POST.getlist('accident_statistics_serious_injured')
            accident_statistics_reportable_number_list = request.POST.getlist('accident_statistics_reportable_number')
            accident_statistics_reportable_injured_list = request.POST.getlist('accident_statistics_reportable_injured')
            accident_statistics_minor_number_list = request.POST.getlist('accident_statistics_minor_number')
            accident_statistics_minor_injured_list = request.POST.getlist('accident_statistics_minor_injured')

            subTable2 = DGMS_MetalliferousMines_Annual_Annexure_II_Subtable_2.objects.filter(base_column_id=id)
            subTable2.delete()

            for key_values in range(as_length):
                as_list = {
                    'accident_statistics_year': accident_statistics_year_list[key_values],
                    'accident_statistics_fatal_number': accident_statistics_fatal_number_list[key_values],
                    'accident_statistics_fatal_no_of_persion_killed':
                        accident_statistics_fatal_no_of_persion_killed_list[
                            key_values],
                    'accident_statistics_fatal_no_of_persion_injured':
                        accident_statistics_fatal_no_of_persion_injured_list[
                            key_values],
                    'accident_statistics_serious': accident_statistics_serious_list[key_values],
                    'accident_statistics_serious_injured': accident_statistics_serious_injured_list[key_values],
                    'accident_statistics_reportable_number': accident_statistics_reportable_number_list[key_values],
                    'accident_statistics_reportable_injured': accident_statistics_reportable_injured_list[key_values],
                    'accident_statistics_minor_number': accident_statistics_minor_number_list[key_values],
                    'accident_statistics_minor_injured': accident_statistics_minor_injured_list[key_values],
                    'base_column_id': my_id.id

                }
                sub_form_2 = DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms_Subtable_2(as_list)
                if sub_form_2.is_valid():
                    sub_form_2.save()
                else:
                    print("Sub Part2 Invalid")

            cre_length = len(request.POST.getlist('cre_1'))

            cre_1_list = request.POST.getlist('cre_1')
            cre_2_list = request.POST.getlist('cre_2')
            cre_3_list = request.POST.getlist('cre_3')
            cre_4_list = request.POST.getlist('cre_4')
            cre_5_list = request.POST.getlist('cre_5')
            cre_6_list = request.POST.getlist('cre_6')
            cre_7_list = request.POST.getlist('cre_7')
            cre_8_list = request.POST.getlist('cre_8')
            cre_9_list = request.POST.getlist('cre_9')
            cre_10_list = request.POST.getlist('cre_10')
            cre_11_list = request.POST.getlist('cre_11')
            cre_12_list = request.POST.getlist('cre_12')

            subTable3 = DGMS_MetalliferousMines_ANNUAL_Annexure_II_Subtable_3.objects.filter(base_column_id=id)
            subTable3.delete()

            for key_value in range(cre_length):
                cre_list = {
                    'cre_1': cre_1_list[key_value],
                    'cre_2': cre_2_list[key_value],
                    'cre_3': cre_3_list[key_value],
                    'cre_4': cre_4_list[key_value],
                    'cre_5': cre_5_list[key_value],
                    'cre_6': cre_6_list[key_value],
                    'cre_7': cre_7_list[key_value],
                    'cre_8': cre_8_list[key_value],
                    'cre_9': cre_9_list[key_value],
                    'cre_10': cre_10_list[key_value],
                    'cre_11': cre_11_list[key_value],
                    'cre_12': cre_12_list[key_value],
                    'base_column_id': my_id.id
                }
                sub_form_3 = DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms_Subtable_3(cre_list)
                if sub_form_3.is_valid():
                    sub_form_3.save()
                else:
                    print("Sub Part 3 Invalid")
        else:
            print("Form Invalid")
        return redirect('DGMS_Forms:Manage_DGMS_MetalliferousMines_Annual_Annexure_II')
    else:
        subTable1 = DGMS_MetalliferousMine_Annual_Annexure_II_Subtable_1.objects.filter(base_column_id=id)
        subTable2 = DGMS_MetalliferousMines_Annual_Annexure_II_Subtable_2.objects.filter(base_column_id=id)
        subTable3 = DGMS_MetalliferousMines_ANNUAL_Annexure_II_Subtable_3.objects.filter(base_column_id=id)

    return render(request, "AnnualReport/Edit_DGMS_MetalliferousMines_Annual_Annexure_II.html",
                  {'form': form, "subTable1": subTable1, "subTable2": subTable2, "subTable3": subTable3})


# ======================================================================================================================
# ================================================= Oil Mines ==========================================================
# ======================================================================================================================
def Manage_DGMS_OilMines_Annual_Annexure_III(request):
    oil_mines = DGMS_OilMines_Annual_Annexure_III.objects.all().order_by('-id')
    return render(request, "AnnualReport/Manage_DGMS_OilMines_Annual_Annexure_III.html", {'oil_mines': oil_mines})


def Add_DGMS_OilMines_Annual_Annexure_III(request):
    if request.method == "POST":
        form = DGMS_OilMines_ANNUAL_Annexure_III_Forms(request.POST, request.FILES)
        if form.is_valid():
            my_id = form.save()

            spem_length = len(request.POST.getlist('spem_designation'))

            spem_designation_list = request.POST.getlist('spem_designation')
            spem_no_requried_list = request.POST.getlist('spem_no_requried')
            spem_no_available_list = request.POST.getlist('spem_no_available')
            spem_short_surplus_list = request.POST.getlist('spem_short_surplus')
            for key_value in range(spem_length):
                spem_list = {
                    'spem_designation': spem_designation_list[key_value],
                    'spem_no_requried': spem_no_requried_list[key_value],
                    'spem_no_available': spem_no_available_list[key_value],
                    'spem_short_surplus': spem_short_surplus_list[key_value],
                    'base_column_id': my_id.id
                }
                sub_form_1 = DGMS_OilMines_ANNUAL_Annexure_III_Forms_Subtable_1(spem_list)
                if sub_form_1.is_valid():
                    sub_form_1.save()
                else:
                    print("Sub Part 1 Invalid")

            as_length = len(request.POST.getlist('accident_statistics_year'))

            accident_statistics_year_list = request.POST.getlist('accident_statistics_year')
            accident_statistics_fatal_number_list = request.POST.getlist('accident_statistics_fatal_number')
            accident_statistics_fatal_no_of_persion_killed_list = request.POST.getlist(
                'accident_statistics_fatal_no_of_persion_killed')
            accident_statistics_fatal_no_of_persion_injured_list = request.POST.getlist(
                'accident_statistics_fatal_no_of_persion_injured')
            accident_statistics_serious_list = request.POST.getlist('accident_statistics_serious')
            accident_statistics_serious_injured_list = request.POST.getlist('accident_statistics_serious_injured')
            accident_statistics_reportable_number_list = request.POST.getlist('accident_statistics_reportable_number')
            accident_statistics_reportable_injured_list = request.POST.getlist('accident_statistics_reportable_injured')
            accident_statistics_minor_number_list = request.POST.getlist('accident_statistics_minor_number')
            accident_statistics_minor_injured_list = request.POST.getlist('accident_statistics_minor_injured')

            for key_values in range(as_length):
                as_list = {
                    'accident_statistics_year': accident_statistics_year_list[key_values],
                    'accident_statistics_fatal_number': accident_statistics_fatal_number_list[key_values],
                    'accident_statistics_fatal_no_of_persion_killed':
                        accident_statistics_fatal_no_of_persion_killed_list[key_values],
                    'accident_statistics_fatal_no_of_persion_injured':
                        accident_statistics_fatal_no_of_persion_injured_list[key_values],
                    'accident_statistics_serious': accident_statistics_serious_list[key_values],
                    'accident_statistics_serious_injured': accident_statistics_serious_injured_list[key_values],
                    'accident_statistics_reportable_number': accident_statistics_reportable_number_list[key_values],
                    'accident_statistics_reportable_injured': accident_statistics_reportable_injured_list[key_values],
                    'accident_statistics_minor_number': accident_statistics_minor_number_list[key_values],
                    'accident_statistics_minor_injured': accident_statistics_minor_injured_list[key_values],
                    'base_column_id': my_id.id

                }
                sub_form_2 = DGMS_OilMines_ANNUAL_Annexure_III_Forms_Subtable_2(as_list)
                if sub_form_2.is_valid():
                    sub_form_2.save()
                else:
                    print("Sub Part2 Invalid")
        else:
            print("Form Invalid")
        return redirect('DGMS_Forms:Manage_DGMS_OilMines_Annual_Annexure_III')
    else:
        form = DGMS_OilMines_ANNUAL_Annexure_III_Forms()
    sub_form_1 = DGMS_OilMines_ANNUAL_Annexure_III_Forms_Subtable_1()
    sub_form_2 = DGMS_OilMines_ANNUAL_Annexure_III_Forms_Subtable_2()

    return render(request, "AnnualReport/Add_DGMS_OilMines_Annual_Annexure_III.html",
                  {'form': form, 'sub_form_1': sub_form_1, 'sub_form_2': sub_form_2})


def View_DGMS_OilMines_Annual_Annexure_III(request, id):
    # base_column: object = DGMS_OilMines_Annual_Annexure_III.objects.get(id=id)
    base_column = DGMS_OilMines_Annual_Annexure_III.objects.get(id=id)
    subTable1 = DGMS_OilMines_Annual_Annexure_III_Subtable_1.objects.filter(base_column_id=id)
    subTable2 = DGMS_OilMines_Annual_Annexure_III_Subtable_2.objects.filter(base_column_id=id)

    return render(request, "AnnualReport/View_DGMS_OilMines_Annual_Annexure_III.html",
                  {'form': base_column, "subTable1": subTable1, "subTable2": subTable2})


def Edit_DGMS_OilMines_Annual_Annexure_III(request, id):
    base_data = get_object_or_404(DGMS_OilMines_Annual_Annexure_III, id=id)
    form = DGMS_OilMines_ANNUAL_Annexure_III_Forms(request.POST or None, request.FILES or None, instance=base_data)
    if request.method == "POST":
        if form.is_valid():
            my_id = form.save()

            spem_length = len(request.POST.getlist('spem_designation'))

            spem_designation_list = request.POST.getlist('spem_designation')
            spem_no_requried_list = request.POST.getlist('spem_no_requried')
            spem_no_available_list = request.POST.getlist('spem_no_available')
            spem_short_surplus_list = request.POST.getlist('spem_short_surplus')

            subTable1 = DGMS_OilMines_Annual_Annexure_III_Subtable_1.objects.filter(base_column_id=id)
            subTable1.delete()

            for key_value in range(spem_length):
                spem_list = {
                    'spem_designation': spem_designation_list[key_value],
                    'spem_no_requried': spem_no_requried_list[key_value],
                    'spem_no_available': spem_no_available_list[key_value],
                    'spem_short_surplus': spem_short_surplus_list[key_value],
                    'base_column_id': my_id.id

                }
                sub_form_1 = DGMS_OilMines_ANNUAL_Annexure_III_Forms_Subtable_1(spem_list)
                if sub_form_1.is_valid():
                    sub_form_1.save()
                else:
                    print("Sub Part 1 Invalid")

            as_length = len(request.POST.getlist('accident_statistics_year'))

            accident_statistics_year_list = request.POST.getlist('accident_statistics_year')
            accident_statistics_fatal_number_list = request.POST.getlist('accident_statistics_fatal_number')
            accident_statistics_fatal_no_of_persion_killed_list = request.POST.getlist(
                'accident_statistics_fatal_no_of_persion_killed')
            accident_statistics_fatal_no_of_persion_injured_list = request.POST.getlist(
                'accident_statistics_fatal_no_of_persion_injured')
            accident_statistics_serious_list = request.POST.getlist('accident_statistics_serious')
            accident_statistics_serious_injured_list = request.POST.getlist('accident_statistics_serious_injured')
            accident_statistics_reportable_number_list = request.POST.getlist('accident_statistics_reportable_number')
            accident_statistics_reportable_injured_list = request.POST.getlist('accident_statistics_reportable_injured')
            accident_statistics_minor_number_list = request.POST.getlist('accident_statistics_minor_number')
            accident_statistics_minor_injured_list = request.POST.getlist('accident_statistics_minor_injured')

            subTable2 = DGMS_OilMines_Annual_Annexure_III_Subtable_2.objects.filter(base_column_id=id)
            subTable2.delete()

            for key_values in range(as_length):
                as_list = {
                    'accident_statistics_year': accident_statistics_year_list[key_values],
                    'accident_statistics_fatal_number': accident_statistics_fatal_number_list[key_values],
                    'accident_statistics_fatal_no_of_persion_killed':
                        accident_statistics_fatal_no_of_persion_killed_list[
                            key_values],
                    'accident_statistics_fatal_no_of_persion_injured':
                        accident_statistics_fatal_no_of_persion_injured_list[
                            key_values],
                    'accident_statistics_serious': accident_statistics_serious_list[key_values],
                    'accident_statistics_serious_injured': accident_statistics_serious_injured_list[key_values],
                    'accident_statistics_reportable_number': accident_statistics_reportable_number_list[key_values],
                    'accident_statistics_reportable_injured': accident_statistics_reportable_injured_list[key_values],
                    'accident_statistics_minor_number': accident_statistics_minor_number_list[key_values],
                    'accident_statistics_minor_injured': accident_statistics_minor_injured_list[key_values],
                    'base_column_id': my_id.id

                }
                sub_form_2 = DGMS_OilMines_ANNUAL_Annexure_III_Forms_Subtable_2(as_list)
                if sub_form_2.is_valid():
                    sub_form_2.save()
                else:
                    print("Sub Part2 Invalid")
        else:
            print("Form Invalid")
        return redirect('DGMS_Forms:Manage_DGMS_OilMines_Annual_Annexure_III')
    else:
        subTable1 = DGMS_OilMines_Annual_Annexure_III_Subtable_1.objects.filter(base_column_id=id)
        subTable2 = DGMS_OilMines_Annual_Annexure_III_Subtable_2.objects.filter(base_column_id=id)

    return render(request, "AnnualReport/Edit_DGMS_OilMines_Annual_Annexure_III.html",
                  {'form': form, "subTable1": subTable1, "subTable2": subTable2})


def Delete_DGMS_OilMines_Annual_Annexure_III(request, id):
    base_column = DGMS_OilMines_Annual_Annexure_III.objects.get(id=id)
    base_column.delete()

    subTable1 = DGMS_OilMines_Annual_Annexure_III_Subtable_1.objects.filter(base_column_id=id)
    subTable1.delete()

    subTable2 = DGMS_OilMines_Annual_Annexure_III_Subtable_2.objects.filter(base_column_id=id)
    subTable2.delete()

    return redirect('DGMS_Forms:Manage_DGMS_OilMines_Annual_Annexure_III')


# =======================================================================================================================
def Manage_DGMS_CoalMine_table_A(request):
    form = DGMS_CoalMine_Table_A_Model.objects.all().order_by('-id')
    return render(request, "AnnualReport/Manage_DGMS_CoalMine_table_A.html", {'form': form})


def Add_DGMS_CoalMine_table_A(request):
    if request.method == "POST":
        form = DGMS_CoalMine_Table_A_Form(request.POST)
        if form.is_valid():
            form.save()
        else:
            print("Form Invalid")
        return redirect('DGMS_Forms:Manage_DGMS_CoalMine_table_A')
    else:
        form = DGMS_CoalMine_Table_A_Form()
    return render(request, "AnnualReport/Add_DGMS_CoalMine_table_A.html", {'form': form})


def Edit_DGMS_CoalMine_table_A(request, id):
    base_data = get_object_or_404(DGMS_CoalMine_Table_A_Model, id=id)
    form = DGMS_CoalMine_Table_A_Form(request.POST or None, request.FILES or None, instance=base_data)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('DGMS_Forms:Manage_DGMS_CoalMine_table_A')

    return render(request, "AnnualReport/Edit_DGMS_CoalMine_table_A.html", {'form': form})


def View_DGMS_CoalMine_table_A(request, id):
    form = DGMS_CoalMine_Table_A_Model.objects.get(id=id)
    return render(request, "AnnualReport/View_DGMS_CoalMine_table_A.html", {'form': form})


def Delete_DGMS_CoalMine_table_A(request, id):
    base_column = DGMS_CoalMine_Table_A_Model.objects.get(id=id)
    base_column.delete()
    return redirect('DGMS_Forms:Manage_DGMS_CoalMine_table_A')


# =======================================================================================================================
# =======================================================================================================================
def Add_DGMS_CoalMine_table_B(request):
    if request.method == "POST":
        form = DGMS_CoalMine_Table_B_Form(request.POST)
        if form.is_valid():
            form.save()
        else:
            print("Form Invalid")
        return redirect('DGMS_Forms:Manage_DGMS_CoalMine_table_B')
    else:
        form = DGMS_CoalMine_Table_B_Form()
    return render(request, "AnnualReport/Add_DGMS_CoalMine_table_B.html", {"form": form})


def Manage_DGMS_CoalMine_table_B(request):
    form = DGMS_CoalMine_Table_B_Model.objects.all().order_by('-id')
    return render(request, "AnnualReport/Manage_DGMS_CoalMine_table_B.html", {'form': form})


def Edit_DGMS_CoalMine_table_B(request, id):
    base_data = get_object_or_404(DGMS_CoalMine_Table_B_Model, id=id)
    form = DGMS_CoalMine_Table_B_Form(request.POST or None, request.FILES or None, instance=base_data)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('DGMS_Forms:Manage_DGMS_CoalMine_table_B')

    return render(request, "AnnualReport/Edit_DGMS_CoalMine_table_B.html", {'form': form})


def View_DGMS_CoalMine_table_B(request, id):
    form = DGMS_CoalMine_Table_B_Model.objects.get(id=id)
    return render(request, "AnnualReport/View_DGMS_CoalMine_table_B.html", {'form': form})


def Delete_DGMS_CoalMine_table_B(request, id):
    base_column = DGMS_CoalMine_Table_B_Model.objects.get(id=id)
    base_column.delete()
    return redirect('DGMS_Forms:Manage_DGMS_CoalMine_table_B')


# =======================================================================================================================
def Add_DGMS_CoalMine_table_C(request):
    if request.method == "POST":
        form = DGMS_CoalMine_Table_C_Form(request.POST)
        if form.is_valid():
            form.save()
        else:
            print("Form Invalid")
        return redirect('DGMS_Forms:Manage_DGMS_CoalMine_table_C')
    else:
        form = DGMS_CoalMine_Table_C_Form()
    return render(request, "AnnualReport/Add_DGMS_CoalMine_table_C.html", {"form": form})


def Manage_DGMS_CoalMine_table_C(request):
    form = DGMS_CoalMine_Table_C_Model.objects.all().order_by('-id')
    return render(request, "AnnualReport/Manage_DGMS_CoalMine_table_C.html", {'form': form})


def Edit_DGMS_CoalMine_table_C(request, id):
    base_data = get_object_or_404(DGMS_CoalMine_Table_C_Model, id=id)
    form = DGMS_CoalMine_Table_C_Form(request.POST or None, request.FILES or None, instance=base_data)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('DGMS_Forms:Manage_DGMS_CoalMine_table_C')
    return render(request, "AnnualReport/Edit_DGMS_CoalMine_table_C.html", {'form': form})


def View_DGMS_CoalMine_table_C(request, id):
    form = DGMS_CoalMine_Table_C_Model.objects.get(id=id)
    return render(request, "AnnualReport/View_DGMS_CoalMine_table_C.html", {'form': form})


def Delete_DGMS_CoalMine_table_C(request, id):
    base_column = DGMS_CoalMine_Table_C_Model.objects.get(id=id)
    base_column.delete()
    return redirect('DGMS_Forms:Manage_DGMS_CoalMine_table_C')


def Add_DGMS_CoalMine_table_D(request):
    if request.method == "POST":
        form = DGMS_CoalMine_Table_D_Form(request.POST)
        if form.is_valid():
            form.save()
        else:
            print("Form Invalid")
        return redirect('DGMS_Forms:Manage_DGMS_CoalMine_table_D')
    else:
        form = DGMS_CoalMine_Table_D_Form()
    return render(request, "AnnualReport/Add_DGMS_CoalMine_table_D.html", {'form': form})


def Manage_DGMS_CoalMine_table_D(request):
    form = DGMS_CoalMine_Table_D_Model.objects.all().order_by('-id')
    return render(request, "AnnualReport/Manage_DGMS_CoalMine_table_D.html", {'form': form})


def Edit_DGMS_CoalMine_table_D(request, id):
    base_data = get_object_or_404(DGMS_CoalMine_Table_D_Model, id=id)
    form = DGMS_CoalMine_Table_D_Form(request.POST or None, request.FILES or None, instance=base_data)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('DGMS_Forms:Manage_DGMS_CoalMine_table_D')
    return render(request, "AnnualReport/Edit_DGMS_CoalMine_table_D.html", {'form': form})


def View_DGMS_CoalMine_table_D(request, id):
    form = DGMS_CoalMine_Table_D_Model.objects.get(id=id)
    return render(request, "AnnualReport/View_DGMS_CoalMine_table_D.html", {'form': form})


def Delete_DGMS_CoalMine_table_D(request, id):
    base_column = DGMS_CoalMine_Table_D_Model.objects.get(id=id)
    base_column.delete()
    return redirect('DGMS_Forms:Manage_DGMS_CoalMine_table_D')


def Add_DGMS_CoalMine_table_E(request):
    if request.method == "POST":
        form = DGMS_CoalMine_Table_E_Form(request.POST)
        if form.is_valid():
            form.save()
        else:
            print("Form Invalid")
        return redirect('DGMS_Forms:Manage_DGMS_CoalMine_table_E')
    else:
        form = DGMS_CoalMine_Table_E_Form()
    return render(request, "AnnualReport/Add_DGMS_CoalMine_table_E.html", {'form': form})


def Manage_DGMS_CoalMine_table_E(request):
    form = DGMS_CoalMine_Table_E_Model.objects.all().order_by('-id')
    return render(request, "AnnualReport/Manage_DGMS_CoalMine_table_E.html", {'form': form})


def Edit_DGMS_CoalMine_table_E(request, id):
    base_data = get_object_or_404(DGMS_CoalMine_Table_E_Model, id=id)
    form = DGMS_CoalMine_Table_E_Form(request.POST or None, request.FILES or None, instance=base_data)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('DGMS_Forms:Manage_DGMS_CoalMine_table_E')
    return render(request, "AnnualReport/Edit_DGMS_CoalMine_table_E.html", {'form': form})


def View_DGMS_CoalMine_table_E(request, id):
    form = DGMS_CoalMine_Table_E_Model.objects.get(id=id)
    return render(request, "AnnualReport/View_DGMS_CoalMine_table_E.html", {'form': form})


def Delete_DGMS_CoalMine_table_E(request, id):
    base_column = DGMS_CoalMine_Table_E_Model.objects.get(id=id)
    base_column.delete()
    return redirect('DGMS_Forms:Manage_DGMS_CoalMine_table_E')


def Add_First_Schedule_Form_iii(request):
    if request.method == "POST":
        form = form = First_Schedule_Form_iii(request.POST, request.FILES)
        if form.is_valid():
            form.save()
        else:
            print("Form Invalid")
        return redirect('DGMS_Forms:Manage_First_Schedule_Form_iii')
    else:
        form = First_Schedule_Form_iii()
    return render(request, "AnnualReport/Add_First_Schedule_Form_iii.html", {'form': form})


def Manage_First_Schedule_Form_iii(request):
    form = First_Schedule_Form_iii_Model.objects.all().order_by('-id')
    return render(request, "AnnualReport/Manage_First_Schedule_Form_iii.html", {'form': form})


def Delete_First_Schedule_Form_iii(request, id):
    base_column = First_Schedule_Form_iii_Model.objects.get(id=id)
    base_column.delete()
    return redirect('DGMS_Forms:Manage_First_Schedule_Form_iii')


def Edit_First_Schedule_Form_iii(request, id):
    base_data = get_object_or_404(First_Schedule_Form_iii_Model, id=id)
    form = First_Schedule_Form_iii(request.POST or None, request.FILES or None, instance=base_data)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('DGMS_Forms:Manage_First_Schedule_Form_iii')
    return render(request, "AnnualReport/Edit_First_Schedule_Form_iii.html", {'form': form})


def View_First_Schedule_Form_iii(request, id):
    form = First_Schedule_Form_iii_Model.objects.get(id=id)
    return render(request, "AnnualReport/View_First_Schedule_Form_iii.html", {'form': form})


# =======================================================================================================================
def sendMail(request):
    if request.method == 'POST':
        form = sendMailForm(request.POST, request.FILES)
        if form.is_valid():
            custom_post = form.cleaned_data
            to_address = custom_post.get('to_address')
            mail_subject = custom_post.get('subject')
            mail_html_content = custom_post.get('msg_body')
            to = to_address.split(",")
            as_length = len(to)
            for key_values in range(as_length):
                email = EmailMessage(mail_subject, mail_html_content, "", [to[key_values]])
                email.content_subtype = "html"
                # ===============  working Area =========================
                for customData in request.FILES.getlist('attachment'):
                    email.attach(customData.name, customData.read(), 'application/pdf')
                # =======================================================
                res = email.send()
                if res:
                    messages.success(request, 'Email submission successfully')
                else:
                    messages.success(request, 'Email submission failed')
            # return HttpResponse(res)
    form = sendMailForm()
    return render(request, "AnnualReport/sendMail.html", {'form': form})


# ======================================================================================================================
def some(request, *args, **kwargs):
    return HttpResponse("pass")
    # return_data = DGMS_CoalMine_Annual_Annexure_I.objects.get(id=2)
    # subTable1 = DGMS_CoalMine_Annual_Annexure_I_Subtable_1.objects.filter(base_column_id=2)
    # subTable2 = DGMS_CoalMine_Annual_Annexure_I_Subtable_2.objects.filter(base_column_id=2)
    # subTable3 = DGMS_CoalMine_Annual_Annexure_I_Subtable_3.objects.filter(base_column_id=2)

    # params = {'form': return_data, "subTable1": subTable1, "subTable2": subTable2, "subTable3": subTable3,
    #           'request': request}
    # file = Render.render_to_file('AnnualReport/View_core_DGMS_CoalMine_Annual_Annexure_I.html',
    #                              params)  # AnnualReport/View_DGMS_CoalMine_Annual_Annexure_I.html
    # fd = open(file[1], 'rb')

    # mail_subject = "DGMS Mail Testing files"
    # mail_html_content = "Hello Your are received Testing Mail from CSIR-CIMFR. For Testing Only"
    # email = EmailMessage(mail_subject, mail_html_content, "", ['shyamd148@gmail.com'])
    # email.content_subtype = "html"
    # email.attach(file[0], fd.read(), 'application/pdf')
    # res = email.send()
    # # return HttpResponse('%s' % res)
    # return redirect('DGMS_Forms:Manage_DGMS_CoalMine_Annual_Annexure_I')


def mail(request):
    mail_subject = "DGMS Mail Testing"
    mail_html_content = "Hello Your are received Testing Mail from CSIR-CIMFR. For Testing Only"
    email = EmailMessage(mail_subject, mail_html_content, "", ['shyamd148@gmail.com'])
    email.content_subtype = "html"

    fd = open('C:\\Users\\Dr. S K Chaulya\\Desktop\\resume-samples.pdf', 'rb')
    email.attach('DGMS_Form.pdf', fd.read(), 'application/pdf')
    res = email.send()
    return HttpResponse('%s' % res)


# ====================================================================================================================
def AddVentilation(request):
    if request.method == "POST":
        form = ventilationForm(request.POST)
        if form.is_valid():
            form.save()
        else:
            print("Form Invalid")
        return redirect('DGMS_Forms:ManageVentilation')
    else:
        form = ventilationForm()
    return render(request, "miscellaneous/AddVentilation.html", {'form': form})


def ManageVentilation(request):
    form = ventilation_Model.objects.all().order_by('-id')
    return render(request, "miscellaneous/ManageVentilation.html", {'form': form})


def DeleteVentilation(request, id):
    base_column = ventilation_Model.objects.get(id=id)
    base_column.delete()
    return redirect('DGMS_Forms:ManageVentilation')


def EditVentilation(request, id):
    base_data = get_object_or_404(ventilation_Model, id=id)
    form = ventilationForm(request.POST or None, request.FILES or None, instance=base_data)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('DGMS_Forms:ManageVentilation')
    return render(request, "miscellaneous/AddVentilation.html", {'form': form})


def ViewVentilation(request, id):
    form = ventilation_Model.objects.get(id=id)
    return render(request, "miscellaneous/viewVentilation.html", {'form': form})


# =====================================================================================================================
def Add_First_Schedule_Form_V(request):
    if request.method == "POST":
        form = First_Schedule_Form_v_Form(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('DGMS_Forms:Manage_First_Schedule_Form_V')
        else:
            print("Form Invalid")
    else:
        form = First_Schedule_Form_v_Form()
    return render(request, "AnnualReport/Add_First_Schedule_Form_V.html", {'form': form})


def Manage_First_Schedule_Form_V(request):
    form = First_schedule_form_v_Model.objects.all().order_by('-id')
    return render(request, "AnnualReport/Manage_First_Schedule_Form_v.html", {'form': form})


def Edit_First_Schedule_Form_V(request, id):
    base_data = get_object_or_404(First_schedule_form_v_Model, id=id)
    form = First_Schedule_Form_v_Form(request.POST or None, request.FILES or None, instance=base_data)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('DGMS_Forms:Manage_First_Schedule_Form_V')
    return render(request, "AnnualReport/Edit_First_Schedule_Form_V.html", {'form': form})


def View_First_Schedule_Form_V(request, id):
    form = First_schedule_form_v_Model.objects.get(id=id)
    return render(request, "AnnualReport/View_First_Schedule_Form_V.html", {'form': form})


def Delete_First_Schedule_Form_V(request, id):
    base_column = First_schedule_form_v_Model.objects.get(id=id)
    base_column.delete()
    return redirect('DGMS_Forms:Manage_First_Schedule_Form_V')


# =======================================================================================================================
def add_development_permission(request):
    if request.method == "POST":
        form = development_permission_form(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('DGMS_Forms:manage_development_permission')
        else:
            print("Form Invalid")
    else:
        form = development_permission_form()
    return render(request, "permission/add_development_permission.html", {'form': form})


def manage_development_permission(request):
    form = development_permission_model.objects.all().order_by('-id')
    return render(request, "permission/manage_development_permission.html", {'form': form})


def edit_development_permission(request, id):
    base_data = get_object_or_404(development_permission_model, id=id)
    form = development_permission_form(request.POST or None, request.FILES or None, instance=base_data)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('DGMS_Forms:manage_development_permission')
    return render(request, "permission/add_development_permission.html", {'form': form})


def view_development_permission(request, id):
    form = development_permission_model.objects.get(id=id)
    return render(request, "permission/view_development_permission.html", {'form': form})


def delete_development_permission(request, id):
    base_column = development_permission_model.objects.get(id=id)
    base_column.delete()
    return redirect('DGMS_Forms:manage_development_permission')


# ======================================================================================================================
def add_identification_report_of_the_problem(request):
    if request.method == "POST":
        form = identification_report_of_the_problem_form(request.POST)
        if form.is_valid():
            form.save()
            return redirect('DGMS_Forms:manage_identification_report_of_the_problem')
        else:
            print("Form Invalid")
    else:
        form = identification_report_of_the_problem_form()
    return render(request, "miscellaneous/add_identification_report_of_the_problem.html", {'form': form})


def manage_identification_report_of_the_problem(request):
    form = identification_report_of_the_problem_model.objects.all().order_by('-id')
    return render(request, "miscellaneous/manage_identification_report_of_the_problem.html", {'form': form})


def edit_identification_report_of_the_problem(request, id):
    base_data = get_object_or_404(identification_report_of_the_problem_model, id=id)
    form = identification_report_of_the_problem_form(request.POST or None, request.FILES or None, instance=base_data)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('DGMS_Forms:manage_identification_report_of_the_problem')
    return render(request, "miscellaneous/add_identification_report_of_the_problem.html", {'form': form})

def view_identification_report_of_the_problem(request, id):
    form = identification_report_of_the_problem_model.objects.get(id=id)
    return render(request, "miscellaneous/view_identification_report_of_the_problem.html", {'form': form})

def delete_identification_report_of_the_problem(request, id):
    base_column = identification_report_of_the_problem_model.objects.get(id=id)
    base_column.delete()
    return redirect('DGMS_Forms:manage_identification_report_of_the_problem')
#=============================================================================================================================
def add_extract_or_reduce_pillars(request):
    if request.method == "POST":
        form = extract_or_reduce_pillars_forms(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('DGMS_Forms:manage_extract_or_reduce_pillars')
        else:
            print("Form Invalid")
    else:
        form = extract_or_reduce_pillars_forms()
    return render(request, "miscellaneous/add_extract_or_reduce_pillars.html", {'form': form})

def manage_extract_or_reduce_pillars(request):
    form = extract_or_reduce_pillars_models.objects.all().order_by('-id')
    return render(request, "miscellaneous/manage_extract_or_reduce_pillars.html", {'form': form})

def edit_extract_or_reduce_pillars(request, id):
    base_data = get_object_or_404(extract_or_reduce_pillars_models, id=id)
    form = extract_or_reduce_pillars_forms(request.POST or None, request.FILES or None, instance=base_data)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('DGMS_Forms:manage_extract_or_reduce_pillars')
    return render(request, "miscellaneous/add_extract_or_reduce_pillars.html", {'form': form})

def view_extract_or_reduce_pillars(request, id):
    form = extract_or_reduce_pillars_models.objects.get(id=id)
    return render(request, "miscellaneous/view_extract_or_reduce_pillars.html", {'form': form})

def delete_extract_or_reduce_pillars(request, id):
    base_column = extract_or_reduce_pillars_models.objects.get(id=id)
    base_column.delete()
    return redirect('DGMS_Forms:manage_extract_or_reduce_pillars')
#=======================================================================================================================
def manage_metal_mine_extract_permission(request):
    form = metal_mine_extract_permission_model.objects.all().order_by('-id')
    return render(request, "miscellaneous/manage_metal_mine_extract_permission.html", {'form': form})

def add_metal_mine_extract_permission(request):
    if request.method == "POST":
        form = metal_mine_extract_permission_form(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('DGMS_Forms:manage_metal_mine_extract_permission')
        else:
            print("Form Invalid")
    else:
        form = metal_mine_extract_permission_form()
    return render(request, "miscellaneous/add_metal_mine_extract_permission.html", {'form': form})

def edit_metal_mine_extract_permission(request, id):
    base_data = get_object_or_404(metal_mine_extract_permission_model, id=id)
    form = metal_mine_extract_permission_form(request.POST or None, request.FILES or None, instance=base_data)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('DGMS_Forms:manage_metal_mine_extract_permission')
    return render(request, "miscellaneous/add_metal_mine_extract_permission.html", {'form': form})

def view_metal_mine_extract_permission(request, id):
    form = metal_mine_extract_permission_model.objects.get(id=id)
    return render(request, "miscellaneous/view_metal_mine_extract_permission.html", {'form': form})

def delete_metal_mine_extract_permission(request, id):
    base_column = metal_mine_extract_permission_model.objects.get(id=id)
    base_column.delete()
    return redirect('DGMS_Forms:manage_metal_mine_extract_permission')