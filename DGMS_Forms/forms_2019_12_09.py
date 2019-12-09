from datetime import date

from django import forms
from .models import DGMS_CoalMine_Annual_Annexure_I, DGMS_CoalMine_Annual_Annexure_I_Subtable_1, \
    DGMS_CoalMine_Annual_Annexure_I_Subtable_2, DGMS_CoalMine_Annual_Annexure_I_Subtable_3, \
    DGMS_MetelliferousMine_Annual_Annexure_II, DGMS_MetalliferousMines_ANNUAL_Annexure_II_Subtable_3, \
    DGMS_MetalliferousMine_Annual_Annexure_II_Subtable_1, DGMS_MetalliferousMines_Annual_Annexure_II_Subtable_2, \
    DGMS_OilMines_Annual_Annexure_III_Subtable_1, DGMS_OilMines_Annual_Annexure_III_Subtable_2, \
    DGMS_OilMines_Annual_Annexure_III, DGMS_CoalMine_Table_A_Model, DGMS_CoalMine_Table_B_Model, \
    DGMS_CoalMine_Table_C_Model, DGMS_CoalMine_Table_D_Model, DGMS_CoalMine_Table_E_Model, First_Schedule_Form_iii_Model


class DGMS_COALMINE_ANNUAL_Annexure_I_Forms_Subtable_1(forms.ModelForm):
    spem_designation = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Enter Designation"
    }))
    spem_no_requried = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Enter No. required"
    }))
    spem_no_available = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Enter No. available"
    }))
    spem_short_surplus = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Enter Shortage/surplus"
    }))
    base_column_id = forms.IntegerField()

    class Meta():
        model = DGMS_CoalMine_Annual_Annexure_I_Subtable_1
        fields = ['base_column_id', 'spem_designation', 'spem_no_requried', 'spem_no_available', 'spem_short_surplus']


class DGMS_COALMINE_ANNUAL_Annexure_I_Forms_Subtable_2(forms.ModelForm):
    accident_statistics_year = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    accident_statistics_fatal_number = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    accident_statistics_fatal_no_of_persion_killed = forms.CharField(max_length=100, required=False,
                                                                     widget=forms.TextInput(attrs={
                                                                         'class': 'form-control',
                                                                     }))
    accident_statistics_fatal_no_of_persion_injured = forms.CharField(max_length=100, required=False,
                                                                      widget=forms.TextInput(attrs={
                                                                          'class': 'form-control',
                                                                      }))
    accident_statistics_serious = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    accident_statistics_serious_injured = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    accident_statistics_reportable_number = forms.CharField(max_length=100, required=False,
                                                            widget=forms.TextInput(attrs={
                                                                'class': 'form-control',
                                                            }))
    accident_statistics_reportable_injured = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control',
                                                             }))
    accident_statistics_minor_number = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    accident_statistics_minor_injured = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))

    base_column_id = forms.IntegerField()

    class Meta():
        model = DGMS_CoalMine_Annual_Annexure_I_Subtable_2
        fields = ['base_column_id', 'accident_statistics_year', 'accident_statistics_fatal_number',
                  'accident_statistics_fatal_no_of_persion_killed', 'accident_statistics_fatal_no_of_persion_injured',
                  'accident_statistics_serious', 'accident_statistics_serious_injured',
                  'accident_statistics_reportable_number', 'accident_statistics_reportable_injured',
                  'accident_statistics_minor_number', 'accident_statistics_minor_injured']


class DGMS_COALMINE_ANNUAL_Annexure_I_Forms_Subtable_3(forms.ModelForm):
    cre_grade = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    cre_2 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_2'
    }))
    cre_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_3'
    }))
    cre_4 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_4'
    }))
    cre_5 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_5'
    }))
    cre_6 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_6'
    }))
    cre_7 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_7'
    }))
    cre_8 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_8',
        'readonly': "true"
    }))
    cre_9 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_9',
        'readonly': "true"
    }))
    cre_10 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_10'
    }))
    cre_11 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_11',
        'readonly': "true"
    }))

    base_column_id = forms.IntegerField()

    class Meta():
        model = DGMS_CoalMine_Annual_Annexure_I_Subtable_3
        fields = "__all__"


class DGMS_COALMINE_ANNUAL_Annexure_I_Forms(forms.ModelForm):
    # 1 =============================================
    signature = forms.ImageField(required=True)
    # 2 =============================================
    aecm_year = forms.IntegerField(min_value=2018, max_value=2099, required=True, widget=forms.NumberInput(attrs={
        'id': "input_annual_year",
        "placeholder": "Ex:2018",
    }))
    mine_vill = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'id': 'txt_vill_area_road',
        'class': 'form-control',
        'readonly': 'true'
    }))
    mine_tehsil = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'id': 'txt_tehsil',
        'class': 'form-control',
        'readonly': 'true'
    }))
    mine_dist = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'id': 'txt_district',
        'class': 'form-control',
        'readonly': 'true'
    }))
    mine_pin = forms.CharField(max_length=10, required=False, widget=forms.TextInput(attrs={
        'id': 'txt_pin',
        'class': 'form-control',
        'readonly': 'true'
    }))
    mine_state = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'id': 'txt_state',
        'class': 'form-control',
        'readonly': 'true'
    }))
    # 3 ==============================================
    mine_dop = forms.DateField(required=False, widget=forms.TextInput(attrs={
        'id': 'date_of_opening',
        'class': 'form-control',
        'readonly': 'true'
    }))
    # 4 ==============================================
    labour_id_no = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'id': 'lin',
        'class': 'form-control',
        'readonly': 'true'
    }))
    # 5 ==============================================
    owner_name = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_telephone = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_mobile = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_email = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_vill = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_tehsil = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_dist = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_pin = forms.CharField(max_length=10, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_state = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    # 6 ==============================================
    agent_name = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_telephone = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_mobile = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_email = forms.EmailField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_vill = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_tehsil = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_dist = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_pin = forms.CharField(max_length=10, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_state = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    # 7 ===============================================
    manager_name = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'id': 'mine_manager_name',
        'class': 'form-control',
        'readonly': 'true'
    }))
    manager_telephone = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    manager_mobile = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'id': 'manager_mobile',
        'class': 'form-control',
        'readonly': 'true'
    }))
    manager_email = forms.EmailField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'id': 'manager_email',
        'class': 'form-control',
        'readonly': 'true'
    }))
    manager_vill = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'id': 'manager_vill',
        'class': 'form-control',
        'readonly': 'true'
    }))
    manager_tehsil = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    manager_dist = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'id': 'manager_dist',
        'class': 'form-control',
        'readonly': 'true'
    }))
    manager_pin = forms.CharField(max_length=10, required=False, widget=forms.TextInput(attrs={
        'id': 'manager_pin',
        'class': 'form-control',
        'readonly': 'true'
    }))
    manager_state = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'id': 'manager_state',
        'class': 'form-control',
        'readonly': 'true'
    }))
    # 8 ===============================================
    # 9 ===============================================
    no_of_contractors = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    # 10 (1)==============================================
    dept_background_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    dept_background_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    dept_total_background_male_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control total_male_female',
        'readonly': 'true'
    }))

    cont_background_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    cont_background_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    cont_background_total_male_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control total_male_female',
        'readonly': 'true'
    }))

    dept_opencast_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    dept_opencast_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    dept_opencast_total_male_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control total_male_female',
        'readonly': 'true'
    }))

    cont_opencast_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    cont_opencast_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    cont_opencast_total_male_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control total_male_female',
        'readonly': 'true'
    }))

    dept_aboveground_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    dept_aboveground_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    dept_aboveground_total_male_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control total_male_female',
        'readonly': 'true'
    }))

    cont_aboveground_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    cont_aboveground_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    cont_aboveground_total_male_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control total_male_female',
        'readonly': 'true'
    }))
    # 10 (2) ================================================52
    wbg_number = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    wbg_day = forms.CharField(max_length=100, initial=date.today, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control datepicker',
        'readonly': 'true'
    }))
    am_number = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    am_day = forms.CharField(max_length=100, required=False, initial=date.today, widget=forms.TextInput(attrs={
        'class': 'form-control datepicker',
        'readonly': 'true'
    }))
    # 10 (3) =================================================
    dept_tmw_background_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    dept_tmw_background_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    dept_tmw_background_total_male_female = forms.CharField(max_length=100, required=False,
                                                            widget=forms.TextInput(attrs={
                                                                'class': 'form-control total_male_female',
                                                                'readonly': 'true'
                                                            }))

    dept_adnpe_background_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    dept_adnpe_background_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    dept_adnpe_background_total_male_female = forms.CharField(max_length=100, required=False,
                                                              widget=forms.TextInput(attrs={
                                                                  'class': 'form-control total_male_female',
                                                                  'readonly': 'true'
                                                              }))

    cont_tmw_background_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    cont_tmw_background_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    cont_tmw_background_total_male_female = forms.CharField(max_length=100, required=False,
                                                            widget=forms.TextInput(attrs={
                                                                'class': 'form-control total_male_female',
                                                                'readonly': 'true'
                                                            }))

    cont_adnpe_background_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    cont_adnpe_background_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    cont_adnpe_background_total_male_female = forms.CharField(max_length=100, required=False,
                                                              widget=forms.TextInput(attrs={
                                                                  'class': 'form-control total_male_female',
                                                                  'readonly': 'true'
                                                              }))

    dept_tmw_opencast_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    dept_tmw_opencast_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    dept_tmw_opencast_total_male_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control total_male_female',
        'readonly': 'true'
    }))

    dept_adnpe_opencast_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    dept_adnpe_opencast_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    dept_adnpe_opencast_total_male_female = forms.CharField(max_length=100, required=False,
                                                            widget=forms.TextInput(attrs={
                                                                'class': 'form-control total_male_female',
                                                                'readonly': 'true'
                                                            }))

    cont_tmw_opencast_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    cont_tmw_opencast_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    cont_tmw_opencast_total_male_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control total_male_female',
        'readonly': 'true'
    }))

    cont_adnpe_opencast_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    cont_adnpe_opencast_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    cont_adnpe_opencast_total_male_female = forms.CharField(max_length=100, required=False,
                                                            widget=forms.TextInput(attrs={
                                                                'class': 'form-control total_male_female',
                                                                'readonly': 'true'
                                                            }))

    dept_tmw_aboveground_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    dept_tmw_aboveground_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    dept_tmw_aboveground_total_male_female = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control total_male_female',
                                                                 'readonly': 'true'
                                                             }))

    dept_adnpe_aboveground_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    dept_adnpe_aboveground_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    dept_adnpe_aboveground_total_male_female = forms.CharField(max_length=100, required=False,
                                                               widget=forms.TextInput(attrs={
                                                                   'class': 'form-control total_male_female',
                                                                   'readonly': 'true'
                                                               }))

    cont_tmw_aboveground_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    cont_tmw_aboveground_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    cont_tmw_aboveground_total_male_female = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control total_male_female',
                                                                 'readonly': 'true'
                                                             }))

    cont_adnpe_aboveground_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    cont_adnpe_aboveground_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    cont_adnpe_aboveground_total_male_female = forms.CharField(max_length=100, required=False,
                                                               widget=forms.TextInput(attrs={
                                                                   'class': 'form-control total_male_female',
                                                                   'readonly': 'true'
                                                               }))
    # 11 =====================================================================92
    no_of_contractors_engaged = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    no_of_shift_worked = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    # 12 (A) =================================================================

    # 12 (B) ====================================================================105
    mh_1 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    mh_2 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    mh_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'readonly': 'true'
    }))
    # 13 (A) ====================================================================
    electrical_background = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control electrical'
    }))
    ongs_background = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control ongs'
    }))
    comp_air = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control comp_air'
    }))

    electrical_opencast = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control electrical'
    }))
    ongs_opencast = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control ongs'
    }))
    comp_air_opencast = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control comp_air'
    }))

    electrical_aboveground = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control electrical'
    }))
    ongs_aboveground = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control ongs'
    }))
    comp_air_aboveground = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control comp_air'
    }))

    total_electrical = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'id': 'total_electrical',
        'readonly': 'true'
    }))
    total_ongs = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'id': 'total_ongs',
        'readonly': 'true'
    }))
    total_comp_air = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'id': 'total_comp_air',
        'readonly': 'true'
    }))

    # 13 (B) ====================================================================
    lighting = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    power = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    # Part B==========================================================
    ime_npe_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    ime_npe_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    ime_npru_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    ime_npru_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    ime_npau_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    ime_npau_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    ime_no_of_p_d_m_unfit = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_npe_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_npe_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_npru_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_npru_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_npau_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_npau_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_no_of_p_d_m_unfit = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))

    no_of_workmen_req = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    no_of_workmen_provide = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    no_of_satfy_c_meeting_conduct = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))

    # Part C  =======================================================
    npe_bvt_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npe_bvt_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npruvt_bvt_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npruvt_bvt_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npauvt_bvt_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npauvt_bvt_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npe_rt_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npe_rt_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npruvt_rt_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npruvt_rt_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npauvt_rt_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npauvt_rt_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))

    # 14  =======================================================================122

    class Meta():
        model = DGMS_CoalMine_Annual_Annexure_I
        fields = ['signature', 'mine_name', 'aecm_year', 'mine_vill', 'mine_tehsil', 'mine_dist', 'mine_pin',
                  'mine_state',
                  'mine_dop', 'labour_id_no', 'owner_name', 'owner_telephone', 'owner_mobile', 'owner_email',
                  'owner_vill', 'owner_tehsil', 'owner_dist', 'owner_pin', 'owner_state', 'agent_name',
                  'agent_telephone', 'agent_mobile', 'agent_email', 'agent_vill', 'agent_tehsil', 'agent_dist',
                  'agent_pin', 'agent_state', 'manager_name', 'manager_telephone', 'manager_mobile', 'manager_email',
                  'manager_vill', 'manager_tehsil', 'manager_dist', 'manager_pin', 'manager_state', 'no_of_contractors',
                  'dept_background_male', 'dept_background_female', 'dept_total_background_male_female',
                  'cont_background_male', 'cont_background_female', 'cont_background_total_male_female',
                  'dept_opencast_male', 'dept_opencast_female', 'dept_opencast_total_male_female', 'cont_opencast_male',
                  'cont_opencast_female', 'cont_opencast_total_male_female', 'dept_aboveground_male',
                  'dept_aboveground_female', 'dept_aboveground_total_male_female', 'cont_aboveground_male',
                  'cont_aboveground_female', 'cont_aboveground_total_male_female', 'wbg_number', 'wbg_day', 'am_number',
                  'am_day', 'dept_tmw_background_male', 'dept_tmw_background_female',
                  'dept_tmw_background_total_male_female', 'dept_adnpe_background_male', 'dept_adnpe_background_female',
                  'dept_adnpe_background_total_male_female', 'cont_tmw_background_male', 'cont_tmw_background_female',
                  'cont_tmw_background_total_male_female', 'cont_adnpe_background_male', 'cont_adnpe_background_female',
                  'cont_adnpe_background_total_male_female', 'dept_tmw_opencast_male', 'dept_tmw_opencast_female',
                  'dept_tmw_opencast_total_male_female', 'dept_adnpe_opencast_male', 'dept_adnpe_opencast_female',
                  'dept_adnpe_opencast_total_male_female', 'cont_tmw_opencast_male', 'cont_tmw_opencast_female',
                  'cont_tmw_opencast_total_male_female', 'cont_adnpe_opencast_male', 'cont_adnpe_opencast_female',
                  'cont_adnpe_opencast_total_male_female', 'dept_tmw_aboveground_male', 'dept_tmw_aboveground_female',
                  'dept_tmw_aboveground_total_male_female', 'dept_adnpe_aboveground_male',
                  'dept_adnpe_aboveground_female', 'dept_adnpe_aboveground_total_male_female',
                  'cont_tmw_aboveground_male', 'cont_tmw_aboveground_female', 'cont_tmw_aboveground_total_male_female',
                  'cont_adnpe_aboveground_male', 'cont_adnpe_aboveground_female',
                  'cont_adnpe_aboveground_total_male_female', 'no_of_contractors_engaged', 'no_of_shift_worked',
                  'mh_1', 'mh_2', 'mh_3', 'electrical_background', 'ongs_background', 'comp_air',
                  'electrical_opencast', 'ongs_opencast', 'comp_air_opencast', 'electrical_aboveground',
                  'ongs_aboveground', 'comp_air_aboveground', 'total_electrical', 'total_ongs', 'total_comp_air',
                  'lighting', 'power', 'ime_npe_dept', 'ime_npe_cont', 'ime_npru_dept', 'ime_npru_cont',
                  'ime_npau_dept',
                  'ime_npau_cont', 'ime_no_of_p_d_m_unfit', 'pme_npe_dept', 'pme_npe_cont', 'pme_npru_dept',
                  'pme_npru_cont',
                  'pme_npau_dept', 'pme_npau_cont', 'pme_no_of_p_d_m_unfit', 'no_of_workmen_req',
                  'no_of_workmen_provide',
                  'no_of_satfy_c_meeting_conduct', 'npe_bvt_dept', 'npe_bvt_cont', 'npruvt_bvt_dept', 'npruvt_bvt_cont',
                  'npauvt_bvt_dept', 'npauvt_bvt_cont', 'npe_rt_dept', 'npe_rt_cont', 'npruvt_rt_dept',
                  'npruvt_rt_cont',
                  'npauvt_rt_dept', 'npauvt_rt_cont']


# ========================@ Metalliferous @==============================================================================
CHOICES = [
    ('Yes', 'Yes'),
    ('No', 'No'),
]


class DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms(forms.ModelForm):
    # 1 =============================================
    signature = forms.ImageField(required=True)
    # 2 =============================================
    aecm_year = forms.IntegerField(min_value=2018, max_value=2099, required=True,
                                   widget=forms.NumberInput(attrs={
                                       'id': "input_annual_year",
                                       "placeholder": "Ex:2018",
                                   }))
    mine_vill = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'id': 'txt_vill_area_road',
        'class': 'form-control',
        'readonly': 'true'
    }))
    mine_tehsil = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'id': 'txt_tehsil',
        'class': 'form-control',
        'readonly': 'true'
    }))
    mine_dist = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'id': 'txt_district',
        'class': 'form-control',
        'readonly': 'true'
    }))
    mine_pin = forms.CharField(max_length=10, required=False, widget=forms.TextInput(attrs={
        'id': 'txt_pin',
        'class': 'form-control',
        'readonly': 'true'
    }))
    mine_state = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'id': 'txt_state',
        'class': 'form-control',
        'readonly': 'true'
    }))
    # 3 ==============================================
    mine_dop = forms.DateField(required=False, widget=forms.TextInput(attrs={
        'id': 'date_of_opening',
        'class': 'form-control',
        'readonly': 'true'
    }))
    # 4 ==============================================
    labour_id_no = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'id': 'lin',
        'class': 'form-control',
        'readonly': 'true'
    }))
    # 5 ==============================================
    owner_name = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_telephone = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_mobile = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_email = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_vill = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_tehsil = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_dist = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_pin = forms.CharField(max_length=10, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_state = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    # 6 ==============================================
    agent_name = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_telephone = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_mobile = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_email = forms.EmailField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_vill = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_tehsil = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_dist = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_pin = forms.CharField(max_length=10, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_state = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    # 7 ===============================================
    manager_name = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'id': 'mine_manager_name',
        'class': 'form-control',
        'readonly': 'true'
    }))
    manager_telephone = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    manager_mobile = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'id': 'manager_mobile',
        'class': 'form-control',
        'readonly': 'true'
    }))
    manager_email = forms.EmailField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'id': 'manager_email',
        'class': 'form-control',
        'readonly': 'true'
    }))
    manager_vill = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'id': 'manager_vill',
        'class': 'form-control',
        'readonly': 'true'
    }))
    manager_tehsil = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    manager_dist = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'id': 'manager_dist',
        'class': 'form-control',
        'readonly': 'true'
    }))
    manager_pin = forms.CharField(max_length=10, required=False, widget=forms.TextInput(attrs={
        'id': 'manager_pin',
        'class': 'form-control',
        'readonly': 'true'
    }))
    manager_state = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'id': 'manager_state',
        'class': 'form-control',
        'readonly': 'true'
    }))
    # 8 ===============================================
    # 9 ===============================================
    no_of_contractors = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    # 10 (1)==============================================
    dept_background_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    dept_background_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    dept_total_background_male_female = forms.CharField(max_length=100, required=False,
                                                        widget=forms.TextInput(attrs={
                                                            'class': 'form-control total_male_female',
                                                            'readonly': 'true'
                                                        }))

    cont_background_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    cont_background_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    cont_background_total_male_female = forms.CharField(max_length=100, required=False,
                                                        widget=forms.TextInput(attrs={
                                                            'class': 'form-control total_male_female',
                                                            'readonly': 'true'
                                                        }))

    dept_opencast_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    dept_opencast_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    dept_opencast_total_male_female = forms.CharField(max_length=100, required=False,
                                                      widget=forms.TextInput(attrs={
                                                          'class': 'form-control total_male_female',
                                                          'readonly': 'true'
                                                      }))

    cont_opencast_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    cont_opencast_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    cont_opencast_total_male_female = forms.CharField(max_length=100, required=False,
                                                      widget=forms.TextInput(attrs={
                                                          'class': 'form-control total_male_female',
                                                          'readonly': 'true'
                                                      }))

    dept_aboveground_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    dept_aboveground_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    dept_aboveground_total_male_female = forms.CharField(max_length=100, required=False,
                                                         widget=forms.TextInput(attrs={
                                                             'class': 'form-control total_male_female',
                                                             'readonly': 'true'
                                                         }))

    cont_aboveground_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    cont_aboveground_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    cont_aboveground_total_male_female = forms.CharField(max_length=100, required=False,
                                                         widget=forms.TextInput(attrs={
                                                             'class': 'form-control total_male_female',
                                                             'readonly': 'true'
                                                         }))
    # 10 (2) ================================================52
    wbg_number = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    wbg_day = forms.CharField(max_length=100, required=False, initial=date.today, widget=forms.TextInput(attrs={
        'class': 'form-control datepicker',
        'readonly': 'true'
    }))
    am_number = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    am_day = forms.CharField(max_length=100, required=False, initial=date.today, widget=forms.TextInput(attrs={
        'class': 'form-control datepicker',
        'readonly': 'true'
    }))
    # 10 (3) =================================================
    dept_tmw_background_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    dept_tmw_background_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    dept_tmw_background_total_male_female = forms.CharField(max_length=100, required=False,
                                                            widget=forms.TextInput(attrs={
                                                                'class': 'form-control total_male_female',
                                                                'readonly': 'true'
                                                            }))

    dept_adnpe_background_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    dept_adnpe_background_female = forms.CharField(max_length=100, required=False,
                                                   widget=forms.TextInput(attrs={
                                                       'class': 'form-control female_fetch_value'
                                                   }))
    dept_adnpe_background_total_male_female = forms.CharField(max_length=100, required=False,
                                                              widget=forms.TextInput(attrs={
                                                                  'class': 'form-control total_male_female',
                                                                  'readonly': 'true'
                                                              }))

    cont_tmw_background_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    cont_tmw_background_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    cont_tmw_background_total_male_female = forms.CharField(max_length=100, required=False,
                                                            widget=forms.TextInput(attrs={
                                                                'class': 'form-control total_male_female',
                                                                'readonly': 'true'
                                                            }))

    cont_adnpe_background_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    cont_adnpe_background_female = forms.CharField(max_length=100, required=False,
                                                   widget=forms.TextInput(attrs={
                                                       'class': 'form-control female_fetch_value'
                                                   }))
    cont_adnpe_background_total_male_female = forms.CharField(max_length=100, required=False,
                                                              widget=forms.TextInput(attrs={
                                                                  'class': 'form-control total_male_female',
                                                                  'readonly': 'true'
                                                              }))

    dept_tmw_opencast_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    dept_tmw_opencast_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    dept_tmw_opencast_total_male_female = forms.CharField(max_length=100, required=False,
                                                          widget=forms.TextInput(attrs={
                                                              'class': 'form-control total_male_female',
                                                              'readonly': 'true'
                                                          }))

    dept_adnpe_opencast_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    dept_adnpe_opencast_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    dept_adnpe_opencast_total_male_female = forms.CharField(max_length=100, required=False,
                                                            widget=forms.TextInput(attrs={
                                                                'class': 'form-control total_male_female',
                                                                'readonly': 'true'
                                                            }))

    cont_tmw_opencast_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    cont_tmw_opencast_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    cont_tmw_opencast_total_male_female = forms.CharField(max_length=100, required=False,
                                                          widget=forms.TextInput(attrs={
                                                              'class': 'form-control total_male_female',
                                                              'readonly': 'true'
                                                          }))

    cont_adnpe_opencast_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    cont_adnpe_opencast_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    cont_adnpe_opencast_total_male_female = forms.CharField(max_length=100, required=False,
                                                            widget=forms.TextInput(attrs={
                                                                'class': 'form-control total_male_female',
                                                                'readonly': 'true'
                                                            }))

    dept_tmw_aboveground_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    dept_tmw_aboveground_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    dept_tmw_aboveground_total_male_female = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control total_male_female',
                                                                 'readonly': 'true'
                                                             }))

    dept_adnpe_aboveground_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    dept_adnpe_aboveground_female = forms.CharField(max_length=100, required=False,
                                                    widget=forms.TextInput(attrs={
                                                        'class': 'form-control female_fetch_value'
                                                    }))
    dept_adnpe_aboveground_total_male_female = forms.CharField(max_length=100, required=False,
                                                               widget=forms.TextInput(attrs={
                                                                   'class': 'form-control total_male_female',
                                                                   'readonly': 'true'
                                                               }))

    cont_tmw_aboveground_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    cont_tmw_aboveground_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control female_fetch_value'
    }))
    cont_tmw_aboveground_total_male_female = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control total_male_female',
                                                                 'readonly': 'true'
                                                             }))

    cont_adnpe_aboveground_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control male_fetch_value'
    }))
    cont_adnpe_aboveground_female = forms.CharField(max_length=100, required=False,
                                                    widget=forms.TextInput(attrs={
                                                        'class': 'form-control female_fetch_value'
                                                    }))
    cont_adnpe_aboveground_total_male_female = forms.CharField(max_length=100, required=False,
                                                               widget=forms.TextInput(attrs={
                                                                   'class': 'form-control total_male_female',
                                                                   'readonly': 'true'
                                                               }))
    # 11 =====================================================================92
    no_of_contractors_engaged = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    no_of_shift_worked = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    # 12 (A) =================================================================
    # 12 (B) =================================================================
    mh_1 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    mh_2 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    mh_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'readonly': "true"
    }))
    # 13 =======================================================================
    explosive_used_in_the_mine = forms.ChoiceField(widget=forms.RadioSelect(), choices=CHOICES,
                                                   initial="Yes", required=True)
    # 14 (A) ====================================================================
    electrical_background = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control electrical'
    }))
    ongs_background = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control ongs'
    }))
    comp_air = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control comp_air'
    }))

    electrical_opencast = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control electrical'
    }))
    ongs_opencast = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control ongs'
    }))
    comp_air_opencast = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control comp_air'
    }))

    electrical_aboveground = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control electrical'
    }))
    ongs_aboveground = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control ongs'
    }))
    comp_air_aboveground = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control comp_air'
    }))

    total_electrical = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'id': 'total_electrical',
        'readonly': 'true'
    }))
    total_ongs = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'id': 'total_ongs',
        'readonly': 'true'
    }))
    total_comp_air = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'id': 'total_comp_air',
        'readonly': 'true'
    }))
    # 14 (B) ====================================================================
    lighting = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    power = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    # Part B  =======================================================
    ime_npe_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    ime_npe_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    ime_npru_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    ime_npru_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    ime_npau_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    ime_npau_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    ime_no_of_p_d_m_unfit = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_npe_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_npe_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_npru_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_npru_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_npau_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_npau_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_no_of_p_d_m_unfit = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    no_of_workmen_req = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    no_of_workmen_provide = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    no_of_satfy_c_meeting_conduct = forms.CharField(max_length=100, required=False,
                                                    widget=forms.TextInput(attrs={
                                                        'class': 'form-control'
                                                    }))

    # Part C  =======================================================
    npe_bvt_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npe_bvt_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npruvt_bvt_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npruvt_bvt_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npauvt_bvt_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npauvt_bvt_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npe_rt_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npe_rt_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npruvt_rt_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npruvt_rt_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npauvt_rt_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npauvt_rt_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))

    class Meta():
        model = DGMS_MetelliferousMine_Annual_Annexure_II
        fields = "__all__"


class DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms_Subtable_1(forms.ModelForm):
    spem_designation = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Enter Designation"
    }))
    spem_no_requried = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Enter No. required"
    }))
    spem_no_available = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Enter No. available"
    }))
    spem_short_surplus = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Enter Shortage/surplus"
    }))
    base_column_id = forms.IntegerField()

    class Meta():
        model = DGMS_MetalliferousMine_Annual_Annexure_II_Subtable_1
        fields = "__all__"


class DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms_Subtable_2(forms.ModelForm):
    accident_statistics_year = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    accident_statistics_fatal_number = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    accident_statistics_fatal_no_of_persion_killed = forms.CharField(max_length=100, required=False,
                                                                     widget=forms.TextInput(attrs={
                                                                         'class': 'form-control',
                                                                     }))
    accident_statistics_fatal_no_of_persion_injured = forms.CharField(max_length=100, required=False,
                                                                      widget=forms.TextInput(attrs={
                                                                          'class': 'form-control',
                                                                      }))
    accident_statistics_serious = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    accident_statistics_serious_injured = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    accident_statistics_reportable_number = forms.CharField(max_length=100, required=False,
                                                            widget=forms.TextInput(attrs={
                                                                'class': 'form-control',
                                                            }))
    accident_statistics_reportable_injured = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control',
                                                             }))
    accident_statistics_minor_number = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    accident_statistics_minor_injured = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))

    base_column_id = forms.IntegerField()

    class Meta():
        model = DGMS_MetalliferousMines_Annual_Annexure_II_Subtable_2
        fields = "__all__"


class DGMS_MetalliferousMines_ANNUAL_Annexure_II_Forms_Subtable_3(forms.ModelForm):
    cre_1 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_1'
    }))
    cre_2 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_2'
    }))
    cre_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_3'
    }))
    cre_4 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_4'
    }))
    cre_5 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_5'
    }))
    cre_6 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_6'
    }))
    cre_7 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_7'
    }))
    cre_8 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_8'
    }))
    cre_9 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_9',
        'readonly': "true"
    }))
    cre_10 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_10',
        'readonly': "true"
    }))
    cre_11 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_11'
    }))

    cre_12 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control cre_12'
    }))
    base_column_id = forms.IntegerField()

    class Meta():
        model = DGMS_MetalliferousMines_ANNUAL_Annexure_II_Subtable_3
        fields = "__all__"


# ==========================@ Oil Mines =================================================================================
class DGMS_OilMines_ANNUAL_Annexure_III_Forms(forms.ModelForm):
    # 1 =============================================
    signature = forms.ImageField(required=True)
    # 2 =============================================
    aecm_year = forms.IntegerField(min_value=2018, max_value=2099, required=True,
                                   widget=forms.NumberInput(attrs={
                                       'id': "input_annual_year",
                                       "placeholder": "Ex:2018",
                                   }))
    mine_vill = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'id': 'txt_vill_area_road',
        'class': 'form-control',
        'readonly': 'true'
    }))
    mine_tehsil = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'id': 'txt_tehsil',
        'class': 'form-control',
        'readonly': 'true'
    }))
    mine_dist = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'id': 'txt_district',
        'class': 'form-control',
        'readonly': 'true'
    }))
    mine_pin = forms.CharField(max_length=10, required=False, widget=forms.TextInput(attrs={
        'id': 'txt_pin',
        'class': 'form-control',
        'readonly': 'true'
    }))
    mine_state = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'id': 'txt_state',
        'class': 'form-control',
        'readonly': 'true'
    }))
    # 3 ==============================================
    mine_dop = forms.DateField(required=False, widget=forms.TextInput(attrs={
        'id': 'date_of_opening',
        'class': 'form-control',
        'readonly': 'true'
    }))
    # 4 ==============================================
    labour_id_no = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'id': 'lin',
        'class': 'form-control',
        'readonly': 'true'
    }))
    # 5 ==============================================
    owner_name = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_telephone = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_mobile = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_email = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_vill = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_tehsil = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_dist = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_pin = forms.CharField(max_length=10, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    owner_state = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    # 6 ==============================================
    agent_name = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_telephone = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_mobile = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_email = forms.EmailField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_vill = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_tehsil = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_dist = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_pin = forms.CharField(max_length=10, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    agent_state = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    # 7 ===============================================
    manager_name = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'id': 'mine_manager_name',
        'class': 'form-control',
        'readonly': 'true'
    }))
    manager_telephone = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    manager_mobile = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'id': 'manager_mobile',
        'class': 'form-control',
        'readonly': 'true'
    }))
    manager_email = forms.EmailField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'id': 'manager_email',
        'class': 'form-control',
        'readonly': 'true'
    }))
    manager_vill = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'id': 'manager_vill',
        'class': 'form-control',
        'readonly': 'true'
    }))
    manager_tehsil = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    manager_dist = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'id': 'manager_dist',
        'class': 'form-control',
        'readonly': 'true'
    }))
    manager_pin = forms.CharField(max_length=10, required=False, widget=forms.TextInput(attrs={
        'id': 'manager_pin',
        'class': 'form-control',
        'readonly': 'true'
    }))
    manager_state = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'id': 'manager_state',
        'class': 'form-control',
        'readonly': 'true'
    }))
    # 8 ===============================================
    # 9 ===============================================
    no_of_contractors = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    # 10 (1)==============================================
    classification = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    dept_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    dept_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    dept_total_male_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    cont_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    cont_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    cont_total_male_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    # 10 (2)==============================================
    wbg_number = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'style': "width:200px;",
    }))
    wbg_day = forms.CharField(max_length=100, required=False, initial=date.today, widget=forms.TextInput(attrs={
        'class': 'form-control datepicker',
        'readonly': 'true',
        'style': "width:100px;",
    }))
    # 10 (3)==============================================
    dmw_classification = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    dept_tmw_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    dept_tmw_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    dept_tmw_total_male_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    dept_adnpe_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    dept_adnpe_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    dept_adnpe_total_male_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    cont_tmw_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    cont_tmw_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    cont_tmw_total_male_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    cont_adnpe_male = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    cont_adnpe_female = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    cont_adnpe_total_male_female = forms.CharField(max_length=100, required=False,
                                                   widget=forms.TextInput(attrs={
                                                       'class': 'form-control',
                                                   }))
    # 11 ==============================================
    no_of_days_worked = forms.CharField(max_length=100, required=False,
                                        widget=forms.TextInput(attrs={
                                            'class': 'form-control',
                                        }))
    no_of_shift_worked = forms.CharField(max_length=100, required=False,
                                         widget=forms.TextInput(attrs={
                                             'class': 'form-control',
                                         }))
    # 12 ==============================================
    place_name1 = forms.CharField(max_length=100, required=False,
                                  widget=forms.TextInput(attrs={
                                      'class': 'form-control',
                                  }))
    place_name1_electrical = forms.CharField(max_length=100, required=False,
                                             widget=forms.TextInput(attrs={
                                                 'class': 'form-control electrical',
                                             }))
    place_name1_ongs = forms.CharField(max_length=100, required=False,
                                       widget=forms.TextInput(attrs={
                                           'class': 'form-control ongs',
                                       }))
    place_name1_comp_air = forms.CharField(max_length=100, required=False,
                                           widget=forms.TextInput(attrs={
                                               'class': 'form-control comp_air',
                                           }))
    place_name2 = forms.CharField(max_length=100, required=False,
                                  widget=forms.TextInput(attrs={
                                      'class': 'form-control',
                                  }))
    place_name2_electrical = forms.CharField(max_length=100, required=False,
                                             widget=forms.TextInput(attrs={
                                                 'class': 'form-control electrical',
                                             }))
    place_name2_ongs = forms.CharField(max_length=100, required=False,
                                       widget=forms.TextInput(attrs={
                                           'class': 'form-control ongs',
                                       }))
    place_name2_comp_air = forms.CharField(max_length=100, required=False,
                                           widget=forms.TextInput(attrs={
                                               'class': 'form-control comp_air',
                                           }))
    total_electrical = forms.CharField(max_length=100, required=False,
                                       widget=forms.TextInput(attrs={
                                           'class': 'form-control',
                                           'id': 'total_electrical',
                                           'readonly': 'true'
                                       }))
    total_ongs = forms.CharField(max_length=100, required=False,
                                 widget=forms.TextInput(attrs={
                                     'class': 'form-control',
                                     'id': 'total_ongs',
                                     'readonly': 'true'
                                 }))
    total_comp_air = forms.CharField(max_length=100, required=False,
                                     widget=forms.TextInput(attrs={
                                         'class': 'form-control',
                                         'id': 'total_comp_air',
                                         'readonly': 'true'
                                     }))

    lighting = forms.CharField(max_length=100, required=False,
                               widget=forms.TextInput(attrs={
                                   'class': 'form-control',
                               }))
    power = forms.CharField(max_length=100, required=False,
                            widget=forms.TextInput(attrs={
                                'class': 'form-control',
                            }))
    # 13 ==============================================
    drillig_type_of_rig = forms.CharField(max_length=100, required=False,
                                          widget=forms.TextInput(attrs={
                                              'class': 'form-control',
                                          }))
    drillig_total_no_of_units_in_use = forms.CharField(max_length=100, required=False,
                                                       widget=forms.TextInput(attrs={
                                                           'class': 'form-control',
                                                       }))
    workover_type_of_rig = forms.CharField(max_length=100, required=False,
                                           widget=forms.TextInput(attrs={
                                               'class': 'form-control',
                                           }))
    workover_total_no_of_units_in_use = forms.CharField(max_length=100, required=False,
                                                        widget=forms.TextInput(attrs={
                                                            'class': 'form-control',
                                                        }))
    other_rigs_type_of_rig = forms.CharField(max_length=100, required=False,
                                             widget=forms.TextInput(attrs={
                                                 'class': 'form-control',
                                             }))
    other_rigs_total_no_of_units_in_use = forms.CharField(max_length=100, required=False,
                                                          widget=forms.TextInput(attrs={
                                                              'class': 'form-control',
                                                          }))

    wells_drilled_type_of_rig = forms.CharField(max_length=100, required=False,
                                                widget=forms.TextInput(attrs={
                                                    'class': 'form-control',
                                                }))
    wells_drilled_total_no_of_units_in_use = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control',
                                                             }))
    wells_abandoned_type_of_rig = forms.CharField(max_length=100, required=False,
                                                  widget=forms.TextInput(attrs={
                                                      'class': 'form-control',
                                                  }))
    wells_abandoned_total_no_of_units_in_use = forms.CharField(max_length=100, required=False,
                                                               widget=forms.TextInput(attrs={
                                                                   'class': 'form-control',
                                                               }))
    gas_wells_completed_type_of_rig = forms.CharField(max_length=100, required=False,
                                                      widget=forms.TextInput(attrs={
                                                          'class': 'form-control',
                                                      }))
    gas_wells_completed_total_no_of_units_in_use = forms.CharField(max_length=100, required=False,
                                                                   widget=forms.TextInput(attrs={
                                                                       'class': 'form-control',
                                                                   }))
    oil_wells_completed_type_of_rig = forms.CharField(max_length=100, required=False,
                                                      widget=forms.TextInput(attrs={
                                                          'class': 'form-control',
                                                      }))
    oil_wells_completed_total_no_of_units_in_use = forms.CharField(max_length=100, required=False,
                                                                   widget=forms.TextInput(attrs={
                                                                       'class': 'form-control',
                                                                   }))
    gas_wells_production_type_of_rig = forms.CharField(max_length=100, required=False,
                                                       widget=forms.TextInput(attrs={
                                                           'class': 'form-control',
                                                       }))
    gas_wells_production_total_no_of_units_in_use = forms.CharField(max_length=100, required=False,
                                                                    widget=forms.TextInput(attrs={
                                                                        'class': 'form-control',
                                                                    }))
    oil_wells_production_type_of_rig = forms.CharField(max_length=100, required=False,
                                                       widget=forms.TextInput(attrs={
                                                           'class': 'form-control',
                                                       }))
    oil_wells_production_total_no_of_units_in_use = forms.CharField(max_length=100, required=False,
                                                                    widget=forms.TextInput(attrs={
                                                                        'class': 'form-control',
                                                                    }))
    oil_wells_production_discontinued_type_of_rig = forms.CharField(max_length=100, required=False,
                                                                    widget=forms.TextInput(attrs={
                                                                        'class': 'form-control',
                                                                    }))
    oil_wells_production_discontinued_total_no_of_units_in_use = forms.CharField(max_length=100, required=False,
                                                                                 widget=forms.TextInput(attrs={
                                                                                     'class': 'form-control',
                                                                                 }))
    f_l_l_well_gathering_station_type_of_rig = forms.CharField(max_length=100, required=False,
                                                               widget=forms.TextInput(attrs={
                                                                   'class': 'form-control',
                                                               }))
    f_l_l_well_gathering_station_total_no_of_units_in_use = forms.CharField(max_length=100, required=False,
                                                                            widget=forms.TextInput(attrs={
                                                                                'class': 'form-control',
                                                                            }))

    p_l_well_gathering_station_central_type_of_rig = forms.CharField(max_length=100, required=False,
                                                                     widget=forms.TextInput(attrs={
                                                                         'class': 'form-control',
                                                                     }))
    p_l_well_gathering_station_central_total_no_of_units_in_use = forms.CharField(max_length=100, required=False,
                                                                                  widget=forms.TextInput(attrs={
                                                                                      'class': 'form-control',
                                                                                  }))
    other_type_of_rig = forms.CharField(max_length=100, required=False,
                                        widget=forms.TextInput(attrs={
                                            'class': 'form-control',
                                        }))
    other_total_no_of_units_in_use = forms.CharField(max_length=100,
                                                     required=False,
                                                     widget=forms.TextInput(attrs={
                                                         'class': 'form-control',
                                                     }))
    # 14 ==============================================
    dp_oil_mt_opening = forms.CharField(max_length=100, required=False,
                                        widget=forms.TextInput(attrs={'class': 'form-control', }))
    dp_oil_mt_prod = forms.CharField(max_length=100, required=False,
                                     widget=forms.TextInput(attrs={'class': 'form-control', }))
    dp_oil_mt_value = forms.CharField(max_length=100, required=False,
                                      widget=forms.TextInput(attrs={'class': 'form-control', }))
    dp_oil_mt_to_refinery = forms.CharField(max_length=100, required=False,
                                            widget=forms.TextInput(attrs={'class': 'form-control', }))
    dp_oil_mt_to_marketing = forms.CharField(max_length=100, required=False,
                                             widget=forms.TextInput(attrs={'class': 'form-control', }))
    dp_oil_mt_for_house_consumption = forms.CharField(max_length=100, required=False,
                                                      widget=forms.TextInput(attrs={'class': 'form-control', }))
    dp_oil_mt_closing = forms.CharField(max_length=100, required=False,
                                        widget=forms.TextInput(attrs={'class': 'form-control', }))
    dp_gas_opening = forms.CharField(max_length=100, required=False,
                                     widget=forms.TextInput(attrs={'class': 'form-control', }))
    dp_gas_prod = forms.CharField(max_length=100, required=False,
                                  widget=forms.TextInput(attrs={'class': 'form-control', }))
    dp_gas_value = forms.CharField(max_length=100, required=False,
                                   widget=forms.TextInput(attrs={'class': 'form-control', }))
    dp_gas_to_refinery = forms.CharField(max_length=100, required=False,
                                         widget=forms.TextInput(attrs={'class': 'form-control', }))
    dp_gas_to_marketing = forms.CharField(max_length=100, required=False,
                                          widget=forms.TextInput(attrs={'class': 'form-control', }))
    dp_gas_for_house_consumption = forms.CharField(max_length=100, required=False,
                                                   widget=forms.TextInput(attrs={'class': 'form-control', }))
    dp_gas_closing = forms.CharField(max_length=100, required=False,
                                     widget=forms.TextInput(attrs={'class': 'form-control', }))
    # =========================================== Part B  =======================================================
    ime_npe_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    ime_npe_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    ime_npru_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    ime_npru_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    ime_npau_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    ime_npau_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    ime_no_of_p_d_m_unfit = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_npe_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_npe_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_npru_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_npru_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_npau_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_npau_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    pme_no_of_p_d_m_unfit = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    no_of_workmen_req = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    no_of_workmen_provide = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    no_of_satfy_c_meeting_conduct = forms.CharField(max_length=100, required=False,
                                                    widget=forms.TextInput(attrs={
                                                        'class': 'form-control'
                                                    }))

    # =========================================== Part C  =======================================================
    npe_bvt_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npe_bvt_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npruvt_bvt_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npruvt_bvt_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npauvt_bvt_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npauvt_bvt_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npe_rt_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npe_rt_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npruvt_rt_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npruvt_rt_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npauvt_rt_dept = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    npauvt_rt_cont = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))

    class Meta():
        model = DGMS_OilMines_Annual_Annexure_III
        fields = "__all__"


class DGMS_OilMines_ANNUAL_Annexure_III_Forms_Subtable_1(forms.ModelForm):
    spem_designation = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Enter Designation"
    }))
    spem_no_requried = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Enter No. required"
    }))
    spem_no_available = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Enter No. available"
    }))
    spem_short_surplus = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Enter Shortage/surplus"
    }))
    base_column_id = forms.IntegerField()

    class Meta():
        model = DGMS_OilMines_Annual_Annexure_III_Subtable_1
        fields = "__all__"


class DGMS_OilMines_ANNUAL_Annexure_III_Forms_Subtable_2(forms.ModelForm):
    accident_statistics_year = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    accident_statistics_fatal_number = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    accident_statistics_fatal_no_of_persion_killed = forms.CharField(max_length=100, required=False,
                                                                     widget=forms.TextInput(attrs={
                                                                         'class': 'form-control',
                                                                     }))
    accident_statistics_fatal_no_of_persion_injured = forms.CharField(max_length=100, required=False,
                                                                      widget=forms.TextInput(attrs={
                                                                          'class': 'form-control',
                                                                      }))
    accident_statistics_serious = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    accident_statistics_serious_injured = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    accident_statistics_reportable_number = forms.CharField(max_length=100, required=False,
                                                            widget=forms.TextInput(attrs={
                                                                'class': 'form-control',
                                                            }))
    accident_statistics_reportable_injured = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control',
                                                             }))
    accident_statistics_minor_number = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    accident_statistics_minor_injured = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))

    base_column_id = forms.IntegerField()

    class Meta():
        model = DGMS_OilMines_Annual_Annexure_III_Subtable_2
        fields = "__all__"


class DGMS_CoalMine_Table_A_Form(forms.ModelForm):
    year = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    working_below_ground = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    working_below_ground_a = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    all_mine_on = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    all_mine_on_a = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_overman_sirdars_2a = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_overman_sirdars_2b = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_overman_sirdars_2c = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_overman_sirdars_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_overman_sirdars_4a = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_overman_sirdars_4b = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_overman_sirdars_4c = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_overman_sirdars_4d = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_overman_sirdars_5 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_miners_loader_2a = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_miners_loader_2b = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_miners_loader_2c = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_miners_loader_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_miners_loader_4a = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_miners_loader_4b = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_miners_loader_4c = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_miners_loader_4d = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_miners_loader_5 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_others_2a = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_others_2b = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_others_2c = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_others_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_others_4a = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_others_4b = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_others_4c = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_others_4d = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    below_ground_others_5 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_overman_sirdars_2a = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_overman_sirdars_2b = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_overman_sirdars_2c = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_overman_sirdars_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_overman_sirdars_4a = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_overman_sirdars_4b = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_overman_sirdars_4c = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_overman_sirdars_4d = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_overman_sirdars_5 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_miners_loader_2a = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_miners_loader_2b = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_miners_loader_2c = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_miners_loader_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_miners_loader_4a = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_miners_loader_4b = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_miners_loader_4c = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_miners_loader_4d = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_miners_loader_5 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_others_2a = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_others_2b = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_others_2c = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_others_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_others_4a = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_others_4b = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_others_4c = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_others_4d = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    opencast_others_5 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))

    aboveground_clerical_supervisory_staff_2a = forms.CharField(max_length=100, required=False,
                                                                widget=forms.TextInput(attrs={
                                                                    'class': 'form-control',
                                                                }))
    aboveground_clerical_supervisory_staff_2b = forms.CharField(max_length=100, required=False,
                                                                widget=forms.TextInput(attrs={
                                                                    'class': 'form-control',
                                                                }))
    aboveground_clerical_supervisory_staff_2c = forms.CharField(max_length=100, required=False,
                                                                widget=forms.TextInput(attrs={
                                                                    'class': 'form-control',
                                                                }))
    aboveground_clerical_supervisory_staff_3 = forms.CharField(max_length=100, required=False,
                                                               widget=forms.TextInput(attrs={
                                                                   'class': 'form-control',
                                                               }))
    aboveground_clerical_supervisory_staff_4a = forms.CharField(max_length=100, required=False,
                                                                widget=forms.TextInput(attrs={
                                                                    'class': 'form-control',
                                                                }))
    aboveground_clerical_supervisory_staff_4b = forms.CharField(max_length=100, required=False,
                                                                widget=forms.TextInput(attrs={
                                                                    'class': 'form-control',
                                                                }))
    aboveground_clerical_supervisory_staff_4c = forms.CharField(max_length=100, required=False,
                                                                widget=forms.TextInput(attrs={
                                                                    'class': 'form-control',
                                                                }))
    aboveground_clerical_supervisory_staff_4d = forms.CharField(max_length=100, required=False,
                                                                widget=forms.TextInput(attrs={
                                                                    'class': 'form-control',
                                                                }))
    aboveground_clerical_supervisory_staff_5 = forms.CharField(max_length=100, required=False,
                                                               widget=forms.TextInput(attrs={
                                                                   'class': 'form-control',
                                                               }))
    aboveground_workers_2a = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    aboveground_workers_2b = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    aboveground_workers_2c = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    aboveground_workers_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    aboveground_workers_4a = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    aboveground_workers_4b = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    aboveground_workers_4c = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    aboveground_workers_4d = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    aboveground_workers_5 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    aboveground_others_2a = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    aboveground_others_2b = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    aboveground_others_2c = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    aboveground_others_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    aboveground_others_4a = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    aboveground_others_4b = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    aboveground_others_4c = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    aboveground_others_4d = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    aboveground_others_5 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))
    total_value = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
    }))

    class Meta():
        model = DGMS_CoalMine_Table_A_Model
        fields = "__all__"


class DGMS_CoalMine_Table_B_Form(forms.ModelForm):
    for_own_use_generated = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "For own use Generated"
    }))
    for_own_use_purchased = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "For own use Purchased or received"
    }))
    for_sale_generated = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "For sale Generated"
    }))
    for_sale_purchased = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "For sale Purchased or received"
    }))
    system_of_supply_voltage = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Voltage of supply"
    }))
    system_of_supply_periodicity = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Periodicity"
    }))
    system_of_supply_source = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Source of supply",
    }))
    above_ground_lighting = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Above Ground Lighting",
    }))
    below_ground_lighting = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Below Ground Lighting",
    }))
    above_ground_power = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Above Ground Power",
    }))
    below_ground_power = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Below Ground Power",
    }))
    high_pressure = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "High pressure",
    }))
    medium_pressure = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Medium pressure",
    }))
    in_use_number_of_units_Winding = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Number of units Winding",
    }))
    in_use_total_hp_Winding = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Total h.p. Winding",
    }))
    in_reserve_number_of_units_Winding = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Number of units Winding",
    }))
    in_reserve_total_hp_Winding = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Total h.p. Winding",
    }))
    in_use_number_of_units_Ventilation = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Number of units Ventilation",
    }))
    in_use_total_hp_Ventilation = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Total h.p. Ventilation",
    }))
    in_reserve_number_of_units_Ventilation = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control margin',
                                                                 "placeholder": "Number of units Ventilation",
                                                             }))
    in_reserve_total_hp_Ventilation = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Total h.p. Ventilation",
    }))
    in_use_number_of_units_Haulage = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Number of units Haulage",
    }))
    in_use_total_hp_Haulage = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Total h.p. Haulage",
    }))
    in_reserve_number_of_units_Haulage = forms.CharField(max_length=100, required=False,
                                                         widget=forms.TextInput(attrs={
                                                             'class': 'form-control margin',
                                                             "placeholder": "Number of units Haulage",
                                                         }))
    in_reserve_total_hp_Haulage = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Total h.p. Haulage",
    }))
    in_use_number_of_Pumping = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Number of units Pumping",
    }))
    in_use_total_hp_Pumping = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Total h.p. Pumping",
    }))
    in_reserve_number_of_units_Pumping = forms.CharField(max_length=100, required=False,
                                                         widget=forms.TextInput(attrs={
                                                             'class': 'form-control margin',
                                                             "placeholder": "Number of units Pumping",
                                                         }))
    in_reserve_total_hp_Pumping = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Total h.p. Pumping",
    }))
    in_use_number_of_units_coal_washing = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Coal washing, screening or handling plants",
    }))
    in_use_total_hp_coal_washing = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Coal washing, screening or handling plants",
    }))
    in_reserve_number_of_units_coal_washing = forms.CharField(max_length=100, required=False,
                                                              widget=forms.TextInput(attrs={
                                                                  'class': 'form-control margin',
                                                                  "placeholder": "Coal washing, screening or handling plants",
                                                              }))
    in_reserve_total_hp_coal_washing = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Coal washing, screening or handling plants",
    }))

    in_use_number_of_unit_workshop = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Worksshops including foundry, smithy etc.",
    }))
    in_use_total_hp_workshop = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Worksshops including foundry, smithy etc.",
    }))
    in_reserve_number_of_units_workshop = forms.CharField(max_length=100, required=False,
                                                          widget=forms.TextInput(attrs={
                                                              'class': 'form-control margin',
                                                              "placeholder": "Worksshops including foundry, smithy etc.",
                                                          }))
    in_reserve_total_hp_workshop = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Worksshops including foundry, smithy etc.",
    }))
    specify1 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Specify",
    }))
    specify1_in_use_no_of_unit = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Miscellaneous Number of units",
    }))
    specify1_in_use_total_hp = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Miscellaneous Total h.p.",
    }))
    specify1_in_reverse_number_of_unit = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Miscellaneous Number of units",
    }))
    specify1_in_reverse_total_hp = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Miscellaneous Total h.p.",
    }))
    # ---------------------------------------------------------------------------------------------------------------------------
    in_use_number_of_units_Winding1 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Number of units Winding",
    }))
    in_use_total_hp_Winding1 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Total h.p. Winding",
    }))
    in_reserve_number_of_units_Winding1 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Number of units Winding",
    }))
    in_reserve_total_hp_Winding1 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Total h.p. Winding",
    }))
    in_use_number_of_units_Haulage1 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Number of units Haulage",
    }))
    in_use_total_hp_Haulage1 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Total h.p. Haulage",
    }))
    in_reserve_number_of_units_Haulage1 = forms.CharField(max_length=100, required=False,
                                                          widget=forms.TextInput(attrs={
                                                              'class': 'form-control margin',
                                                              "placeholder": "Number of units Haulage",
                                                          }))
    in_reserve_total_hp_Haulage1 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Total h.p. Haulage",
    }))
    in_use_number_of_units_Ventilation1 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Number of units Ventilation",
    }))
    in_use_total_hp_Ventilation1 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Total h.p. Ventilation",
    }))
    in_reserve_number_of_units_Ventilation1 = forms.CharField(max_length=100, required=False,
                                                              widget=forms.TextInput(attrs={
                                                                  'class': 'form-control margin',
                                                                  "placeholder": "Number of units Ventilation",
                                                              }))
    in_reserve_total_hp_Ventilation1 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Total h.p. Ventilation",
    }))
    in_use_number_of_Pumping1 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Number of units Pumping",
    }))
    in_use_total_hp_Pumping1 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Total h.p. Pumping",
    }))
    in_reserve_number_of_units_Pumping1 = forms.CharField(max_length=100, required=False,
                                                          widget=forms.TextInput(attrs={
                                                              'class': 'form-control margin',
                                                              "placeholder": "Number of units Pumping",
                                                          }))
    in_reserve_total_hp_Pumping1 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Total h.p. Pumping",
    }))

    in_use_number_of_Other_portable_machines = forms.CharField(max_length=100, required=False,
                                                               widget=forms.TextInput(attrs={
                                                                   'class': 'form-control margin',
                                                                   "placeholder": "Number of units Other portable machines(dill,etc.)",
                                                               }))
    in_use_total_hp_Other_portable_machines = forms.CharField(max_length=100, required=False,
                                                              widget=forms.TextInput(attrs={
                                                                  'class': 'form-control margin',
                                                                  "placeholder": "Total h.p. Other portable machines(dill,etc.)",
                                                              }))
    in_reserve_number_of_units_Other_portable_machines = forms.CharField(max_length=100, required=False,
                                                                         widget=forms.TextInput(attrs={
                                                                             'class': 'form-control margin',
                                                                             "placeholder": "Number of units Other portable machines(dill,etc.)",
                                                                         }))
    in_reserve_total_hp_Other_portable_machines = forms.CharField(max_length=100, required=False,
                                                                  widget=forms.TextInput(attrs={
                                                                      'class': 'form-control margin',
                                                                      "placeholder": "Total h.p. Other portable machines(dill,etc.)",
                                                                  }))
    in_use_number_of_Conveyors = forms.CharField(max_length=100, required=False,
                                                 widget=forms.TextInput(attrs={
                                                     'class': 'form-control margin',
                                                     "placeholder": "Number of units Conveyors, loaders, scrapers, etc",
                                                 }))
    in_use_total_hp_Conveyors = forms.CharField(max_length=100, required=False,
                                                widget=forms.TextInput(attrs={
                                                    'class': 'form-control margin',
                                                    "placeholder": "Total h.p. Conveyors, loaders, scrapers, etc",
                                                }))
    in_reserve_number_of_units_Conveyors = forms.CharField(max_length=100, required=False,
                                                           widget=forms.TextInput(attrs={
                                                               'class': 'form-control margin',
                                                               "placeholder": "Number of units Conveyors, loaders, scrapers, etc",
                                                           }))
    in_reserve_total_hp_Conveyors = forms.CharField(max_length=100, required=False,
                                                    widget=forms.TextInput(attrs={
                                                        'class': 'form-control margin',
                                                        "placeholder": "Total h.p. Conveyors, loaders, scrapers, etc",
                                                    }))
    in_use_number_of_units_Electric_traction = forms.CharField(max_length=100, required=False,
                                                               widget=forms.TextInput(attrs={
                                                                   'class': 'form-control margin',
                                                                   "placeholder": "Number of units Electric traction (locomotives,etc.)",
                                                               }))
    in_use_total_hp_Electric_traction = forms.CharField(max_length=100, required=False,
                                                        widget=forms.TextInput(attrs={
                                                            'class': 'form-control margin',
                                                            "placeholder": "Total h.p. Electric traction (locomotives,etc.)",
                                                        }))
    in_reserve_number_of_units_Electric_traction = forms.CharField(max_length=100, required=False,
                                                                   widget=forms.TextInput(attrs={
                                                                       'class': 'form-control margin',
                                                                       "placeholder": "Number of units Electric traction (locomotives,etc.)",
                                                                   }))
    in_reserve_total_hp_Electric_traction = forms.CharField(max_length=100, required=False,
                                                            widget=forms.TextInput(attrs={
                                                                'class': 'form-control margin',
                                                                "placeholder": "Total h.p. Electric traction (locomotives,etc.)",
                                                            }))
    specify2 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Specify",
    }))
    specify2_in_use_no_of_unit = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Miscellaneous Number of units",
    }))
    specify2_in_use_total_hp = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Miscellaneous Total h.p.",
    }))
    specify2_in_reverse_number_of_unit = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Miscellaneous Number of units",
    }))
    specify2_in_reverse_total_hp = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Miscellaneous Total h.p.",
    }))
    ##==================================================================================================================
    in_use_number_of_units_b_haulage = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Number of units Haulage",
    }))
    in_use_total_hp_b_haulage = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Total h.p. Haulage",
    }))
    in_reverse_number_of_units_b_haulage = forms.CharField(max_length=100, required=False,
                                                           widget=forms.TextInput(attrs={
                                                               'class': 'form-control margin',
                                                               "placeholder": "Number of units Haulage",
                                                           }))
    in_reverse_total_hp_b_haulage = forms.CharField(max_length=100, required=False,
                                                    widget=forms.TextInput(attrs={
                                                        'class': 'form-control margin',
                                                        "placeholder": "Total h.p. Haulage",
                                                    }))
    in_use_number_of_units_b_ventilation = forms.CharField(max_length=100, required=False,
                                                           widget=forms.TextInput(attrs={
                                                               'class': 'form-control margin',
                                                               "placeholder": "Number of units Ventilation",
                                                           }))
    in_use_total_hp_b_ventilation = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Total h.p. Ventilation",
    }))
    in_reverse_number_of_units_b_ventilation = forms.CharField(max_length=100, required=False,
                                                               widget=forms.TextInput(attrs={
                                                                   'class': 'form-control margin',
                                                                   "placeholder": "Number of units Ventilation",
                                                               }))
    in_reverse_total_hp_b_ventilation = forms.CharField(max_length=100, required=False,
                                                        widget=forms.TextInput(attrs={
                                                            'class': 'form-control margin',
                                                            "placeholder": "Total h.p. Ventilation",
                                                        }))
    in_use_number_of_units_b_pumping = forms.CharField(max_length=100, required=False,
                                                       widget=forms.TextInput(attrs={
                                                           'class': 'form-control margin',
                                                           "placeholder": "Number of units Pumping",
                                                       }))
    in_use_total_hp_b_pumping = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Total h.p. Pumping",
    }))
    in_reverse_number_of_units_b_pumping = forms.CharField(max_length=100, required=False,
                                                           widget=forms.TextInput(attrs={
                                                               'class': 'form-control margin',
                                                               "placeholder": "Number of units Pumping",
                                                           }))
    in_reverse_total_hp_b_pumping = forms.CharField(max_length=100, required=False,
                                                    widget=forms.TextInput(attrs={
                                                        'class': 'form-control margin',
                                                        "placeholder": "Total h.p. Pumping",
                                                    }))
    in_use_number_of_units_b_coal_cutting_machine = forms.CharField(max_length=100, required=False,
                                                                    widget=forms.TextInput(attrs={
                                                                        'class': 'form-control margin',
                                                                        "placeholder": "Number of units Coal Cutting Machine",
                                                                    }))
    in_use_total_hp_b_coal_cutting_machine = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control margin',
                                                                 "placeholder": "Total h.p. Coal Cutting Machine",
                                                             }))
    in_reverse_number_of_units_b_coal_cutting_machine = forms.CharField(max_length=100, required=False,
                                                                        widget=forms.TextInput(attrs={
                                                                            'class': 'form-control margin',
                                                                            "placeholder": "Number of units Coal Cutting Machine",
                                                                        }))
    in_reverse_total_hp_b_coal_cutting_machine = forms.CharField(max_length=100, required=False,
                                                                 widget=forms.TextInput(attrs={
                                                                     'class': 'form-control margin',
                                                                     "placeholder": "Total h.p. Coal Cutting Machine",
                                                                 }))
    in_use_number_of_units_b_portable_machine = forms.CharField(max_length=100, required=False,
                                                                widget=forms.TextInput(attrs={
                                                                    'class': 'form-control margin',
                                                                    "placeholder": "Number of units Other portable machine (drill, etc.)",
                                                                }))
    in_use_total_hp_b_portable_machine = forms.CharField(max_length=100, required=False,
                                                         widget=forms.TextInput(attrs={
                                                             'class': 'form-control margin',
                                                             "placeholder": "Total h.p. Other portable machine (drill, etc.)",
                                                         }))
    in_reverse_number_of_units_b_portable_machine = forms.CharField(max_length=100, required=False,
                                                                    widget=forms.TextInput(attrs={
                                                                        'class': 'form-control margin',
                                                                        "placeholder": "Number of units Other portable machine (drill, etc.)",
                                                                    }))
    in_reverse_total_hp_b_portable_machine = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control margin',
                                                                 "placeholder": "Total h.p. Other portable machine (drill, etc.)",
                                                             }))

    in_use_number_of_units_b_conveyors = forms.CharField(max_length=100, required=False,
                                                         widget=forms.TextInput(attrs={
                                                             'class': 'form-control margin',
                                                             "placeholder": "Number of units Conveyors,loaders,scrapers, etc",
                                                         }))
    in_use_total_hp_b_conveyors = forms.CharField(max_length=100, required=False,
                                                  widget=forms.TextInput(attrs={
                                                      'class': 'form-control margin',
                                                      "placeholder": "Total h.p. Conveyors,loaders,scrapers, etc",
                                                  }))
    in_reverse_number_of_units_b_conveyors = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control margin',
                                                                 "placeholder": "Number of units Conveyors,loaders,scrapers, etc",
                                                             }))
    in_reverse_total_hp_b_conveyors = forms.CharField(max_length=100, required=False,
                                                      widget=forms.TextInput(attrs={
                                                          'class': 'form-control margin',
                                                          "placeholder": "Total h.p. Conveyors,loaders,scrapers, etc",
                                                      }))
    in_use_number_of_units_b_electric_traction = forms.CharField(max_length=100, required=False,
                                                                 widget=forms.TextInput(attrs={
                                                                     'class': 'form-control margin',
                                                                     "placeholder": "Number of units Electric traction (locomotives, etc.)",
                                                                 }))
    in_use_total_hp_b_electric_traction = forms.CharField(max_length=100, required=False,
                                                          widget=forms.TextInput(attrs={
                                                              'class': 'form-control margin',
                                                              "placeholder": "Total h.p. Electric traction (locomotives, etc.)",
                                                          }))
    in_reverse_number_of_units_b_electric_traction = forms.CharField(max_length=100, required=False,
                                                                     widget=forms.TextInput(attrs={
                                                                         'class': 'form-control margin',
                                                                         "placeholder": "Number of units Electric traction (locomotives, etc.)",
                                                                     }))
    in_reverse_total_hp_b_electric_traction = forms.CharField(max_length=100, required=False,
                                                              widget=forms.TextInput(attrs={
                                                                  'class': 'form-control margin',
                                                                  "placeholder": "Total h.p. Electric traction (locomotives, etc.)",
                                                              }))
    specify3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Specify",
    }))
    specify3_in_use_no_of_unit = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Miscellaneous Number of units",
    }))
    specify3_in_use_total_hp = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Miscellaneous Total h.p.",
    }))
    specify3_in_reverse_number_of_unit = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Miscellaneous Number of units",
    }))
    specify3_in_reverse_total_hp = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Miscellaneous Total h.p.",
    }))
    total_1 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Total",
    }))
    total_2 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Total",
    }))
    total_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control margin',
        "placeholder": "Total",
    }))

    class Meta():
        model = DGMS_CoalMine_Table_B_Model
        fields = "__all__"


class DGMS_CoalMine_Table_C_Form(forms.ModelForm):
    in_use_number_of_units_boilers = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Number of units Boilers",
    }))
    in_use_total_hp_boilers = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Total h.p. Boilers",
    }))
    in_reserve_number_of_units_boilers = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Number of units Boilers",
    }))
    in_reserve_total_hp_boilers = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Total h.p. Boilers",
    }))
    in_use_number_of_units_steam_turbines = forms.CharField(max_length=100, required=False,
                                                            widget=forms.TextInput(attrs={
                                                                'class': 'form-control',
                                                                "placeholder": "Number of units Steam Turbines",
                                                            }))
    in_use_total_hp_steam_turbines = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Total h.p. Steam Turbines",
    }))
    in_reserve_number_of_units_steam_turbines = forms.CharField(max_length=100, required=False,
                                                                widget=forms.TextInput(attrs={
                                                                    'class': 'form-control',
                                                                    "placeholder": "Number of units Steam Turbines",
                                                                }))
    in_reserve_total_hp_steam_turbines = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Total h.p. Steam Turbines",
    }))
    in_use_number_of_units_diesel_engines = forms.CharField(max_length=100, required=False,
                                                            widget=forms.TextInput(attrs={
                                                                'class': 'form-control',
                                                                "placeholder": "Number of units Diesel Engines",
                                                            }))
    in_use_total_hp_diesel_engines = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Total h.p. Diesel Engines",
    }))
    in_reserve_number_of_units_diesel_engines = forms.CharField(max_length=100, required=False,
                                                                widget=forms.TextInput(attrs={
                                                                    'class': 'form-control',
                                                                    "placeholder": "Number of units Diesel Engines",
                                                                }))
    in_reserve_total_hp_diesel_engines = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Total h.p. Diesel Engines",
    }))

    in_use_number_of_units_gasoline = forms.CharField(max_length=100, required=False,
                                                      widget=forms.TextInput(attrs={
                                                          'class': 'form-control',
                                                          "placeholder": "Gasoline,Gas or Oil Enginers other than Diesel Engines",
                                                      }))
    in_use_total_hp_gasoline = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Gasoline,Gas or Oil Enginers other than Diesel Engines",
    }))
    in_reserve_number_of_units_gasoline = forms.CharField(max_length=100, required=False,
                                                          widget=forms.TextInput(attrs={
                                                              'class': 'form-control',
                                                              "placeholder": "Gasoline,Gas or Oil Enginers other than Diesel Engines",
                                                          }))
    in_reserve_total_hp_gasoline = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Gasoline,Gas or Oil Enginers other than Diesel Engines",
    }))

    in_use_number_of_units_hydraulic_turbines = forms.CharField(max_length=100, required=False,
                                                                widget=forms.TextInput(attrs={
                                                                    'class': 'form-control',
                                                                    "placeholder": "Hydraulic Turbines or Water Wheels",
                                                                }))
    in_use_total_hp_hydraulic_turbines = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Hydraulic Turbines or Water Wheels",
    }))
    in_reserve_number_of_units_hydraulic_turbines = forms.CharField(max_length=100, required=False,
                                                                    widget=forms.TextInput(attrs={
                                                                        'class': 'form-control',
                                                                        "placeholder": "Hydraulic Turbines or Water Wheels",
                                                                    }))
    in_reserve_total_hp_hydraulic_turbines = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control',
                                                                 "placeholder": "Hydraulic Turbines or Water Wheels",
                                                             }))
    in_use_number_of_units_air_compressors = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control',
                                                                 "placeholder": "Air Compressors",
                                                             }))
    in_use_total_hp_air_compressors = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Air Compressors",
    }))
    in_reserve_number_of_units_air_compressors = forms.CharField(max_length=100, required=False,
                                                                 widget=forms.TextInput(attrs={
                                                                     'class': 'form-control',
                                                                     "placeholder": "Air Compressors",
                                                                 }))
    in_reserve_total_hp_air_compressors = forms.CharField(max_length=100, required=False,
                                                          widget=forms.TextInput(attrs={
                                                              'class': 'form-control',
                                                              "placeholder": "Air Compressors",
                                                          }))
    total1 = forms.CharField(max_length=100, required=False,
                             widget=forms.TextInput(attrs={
                                 'class': 'form-control',
                                 "placeholder": "total",
                             }))
    in_use_number_of_units_winding = forms.CharField(max_length=100, required=False,
                                                     widget=forms.TextInput(attrs={
                                                         'class': 'form-control',
                                                         "placeholder": "Winding",
                                                     }))
    in_use_total_hp_winding = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Winding",
    }))
    in_reserve_number_of_units_winding = forms.CharField(max_length=100, required=False,
                                                         widget=forms.TextInput(attrs={
                                                             'class': 'form-control',
                                                             "placeholder": "Winding",
                                                         }))
    in_reserve_total_hp_winding = forms.CharField(max_length=100, required=False,
                                                  widget=forms.TextInput(attrs={
                                                      'class': 'form-control',
                                                      "placeholder": "Winding",
                                                  }))
    in_use_number_of_units_ventilation = forms.CharField(max_length=100, required=False,
                                                         widget=forms.TextInput(attrs={
                                                             'class': 'form-control',
                                                             "placeholder": "Ventilation",
                                                         }))
    in_use_total_hp_ventilation = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Ventilation",
    }))
    in_reserve_number_of_units_ventilation = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control',
                                                                 "placeholder": "Ventilation",
                                                             }))
    in_reserve_total_hp_ventilation = forms.CharField(max_length=100, required=False,
                                                      widget=forms.TextInput(attrs={'class': 'form-control',
                                                                                    "placeholder": "Ventilation",
                                                                                    }))
    in_use_number_of_units_haulage = forms.CharField(max_length=100, required=False,
                                                     widget=forms.TextInput(attrs={
                                                         'class': 'form-control',
                                                         "placeholder": "Haulage",
                                                     }))
    in_use_total_hp_haulage = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Haulage",
    }))
    in_reserve_number_of_units_haulage = forms.CharField(max_length=100, required=False,
                                                         widget=forms.TextInput(attrs={
                                                             'class': 'form-control',
                                                             "placeholder": "Haulage",
                                                         }))
    in_reserve_total_hp_haulage = forms.CharField(max_length=100, required=False,
                                                  widget=forms.TextInput(attrs={'class': 'form-control',
                                                                                "placeholder": "Haulage",
                                                                                }))
    in_use_number_of_units_pumping = forms.CharField(max_length=100, required=False,
                                                     widget=forms.TextInput(attrs={
                                                         'class': 'form-control',
                                                         "placeholder": "Pumping",
                                                     }))
    in_use_total_hp_pumping = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Pumping",
    }))
    in_reserve_number_of_units_pumping = forms.CharField(max_length=100, required=False,
                                                         widget=forms.TextInput(attrs={
                                                             'class': 'form-control',
                                                             "placeholder": "Pumping",
                                                         }))
    in_reserve_total_hp_pumping = forms.CharField(max_length=100, required=False,
                                                  widget=forms.TextInput(attrs={'class': 'form-control',
                                                                                "placeholder": "Pumping",
                                                                                }))

    in_use_number_of_units_mineral_dressing_plants = forms.CharField(max_length=100, required=False,
                                                                     widget=forms.TextInput(attrs={
                                                                         'class': 'form-control',
                                                                         "placeholder": " Mineral dressing plants",
                                                                     }))
    in_use_total_hp_mineral_dressing_plants = forms.CharField(max_length=100, required=False,
                                                              widget=forms.TextInput(attrs={
                                                                  'class': 'form-control',
                                                                  "placeholder": " Mineral dressing plants",
                                                              }))
    in_reserve_number_of_units_mineral_dressing_plants = forms.CharField(max_length=100, required=False,
                                                                         widget=forms.TextInput(attrs={
                                                                             'class': 'form-control',
                                                                             "placeholder": " Mineral dressing plants",
                                                                         }))
    in_reserve_total_hp_mineral_dressing_plants = forms.CharField(max_length=100, required=False,
                                                                  widget=forms.TextInput(attrs={'class': 'form-control',
                                                                                                "placeholder": " Mineral dressing plants",
                                                                                                }))
    in_use_number_of_units_workshops = forms.CharField(max_length=100, required=False,
                                                       widget=forms.TextInput(attrs={
                                                           'class': 'form-control',
                                                           "placeholder": "Workshops including foundry,smithy etc.",
                                                       }))
    in_use_total_hp_workshops = forms.CharField(max_length=100, required=False,
                                                widget=forms.TextInput(attrs={
                                                    'class': 'form-control',
                                                    "placeholder": "Workshops including foundry,smithy etc.",
                                                }))
    in_reserve_number_of_units_workshops = forms.CharField(max_length=100, required=False,
                                                           widget=forms.TextInput(attrs={
                                                               'class': 'form-control',
                                                               "placeholder": "Workshops including foundry,smithy etc.",
                                                           }))
    in_reserve_total_hp_workshops = forms.CharField(max_length=100, required=False,
                                                    widget=forms.TextInput(attrs={'class': 'form-control',
                                                                                  "placeholder": "Workshops including foundry,smithy etc.",
                                                                                  }))
    specify1 = forms.CharField(max_length=100, required=False,
                               widget=forms.TextInput(attrs={
                                   'class': 'form-control',
                                   "placeholder": "specify",
                               }))
    in_use_number_of_units_specify1 = forms.CharField(max_length=100, required=False,
                                                      widget=forms.TextInput(attrs={
                                                          'class': 'form-control',
                                                          "placeholder": "",
                                                      }))
    in_use_total_hp_specify1 = forms.CharField(max_length=100, required=False,
                                               widget=forms.TextInput(attrs={
                                                   'class': 'form-control',
                                                   "placeholder": " ",
                                               }))
    in_reserve_number_of_units_specify1 = forms.CharField(max_length=100, required=False,
                                                          widget=forms.TextInput(attrs={
                                                              'class': 'form-control',
                                                              "placeholder": " ",
                                                          }))
    in_reserve_total_hp_specify1 = forms.CharField(max_length=100, required=False,
                                                   widget=forms.TextInput(attrs={'class': 'form-control',
                                                                                 "placeholder": " ",
                                                                                 }))
    total2 = forms.CharField(max_length=100, required=False,
                             widget=forms.TextInput(attrs={'class': 'form-control',
                                                           "placeholder": "Total",
                                                           }))

    in_use_number_of_units_iii_haulage = forms.CharField(max_length=100, required=False,
                                                         widget=forms.TextInput(attrs={
                                                             'class': 'form-control',
                                                             "placeholder": "Haulage",
                                                         }))
    in_use_total_hp_iii_haulage = forms.CharField(max_length=100, required=False,
                                                  widget=forms.TextInput(attrs={
                                                      'class': 'form-control',
                                                      "placeholder": "Haulage",
                                                  }))
    in_reserve_number_of_units_iii_haulage = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control',
                                                                 "placeholder": "Haulage",
                                                             }))
    in_reserve_total_hp_iii_haulage = forms.CharField(max_length=100, required=False,
                                                      widget=forms.TextInput(attrs={'class': 'form-control',
                                                                                    "placeholder": "Haulage",
                                                                                    }))
    in_use_number_of_units_iii_ventilation = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control',
                                                                 "placeholder": "Ventilation",
                                                             }))
    in_use_total_hp_iii_ventilation = forms.CharField(max_length=100, required=False,
                                                      widget=forms.TextInput(attrs={
                                                          'class': 'form-control',
                                                          "placeholder": "Ventilation",
                                                      }))
    in_reserve_number_of_units_iii_ventilation = forms.CharField(max_length=100, required=False,
                                                                 widget=forms.TextInput(attrs={
                                                                     'class': 'form-control',
                                                                     "placeholder": "Ventilation",
                                                                 }))
    in_reserve_total_hp_iii_ventilation = forms.CharField(max_length=100, required=False,
                                                          widget=forms.TextInput(attrs={'class': 'form-control',
                                                                                        "placeholder": "Ventilation",
                                                                                        }))
    in_use_number_of_units_iii_pumping = forms.CharField(max_length=100, required=False,
                                                         widget=forms.TextInput(attrs={
                                                             'class': 'form-control',
                                                             "placeholder": "Pumping",
                                                         }))
    in_use_total_hp_iii_pumping = forms.CharField(max_length=100, required=False,
                                                  widget=forms.TextInput(attrs={
                                                      'class': 'form-control',
                                                      "placeholder": "Pumping",
                                                  }))
    in_reserve_number_of_units_iii_pumping = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control',
                                                                 "placeholder": "Pumping",
                                                             }))
    in_reserve_total_hp_iii_pumping = forms.CharField(max_length=100, required=False,
                                                      widget=forms.TextInput(attrs={'class': 'form-control',
                                                                                    "placeholder": "Pumping",
                                                                                    }))
    in_use_number_of_units_iii_locomotives = forms.CharField(max_length=100, required=False,
                                                             widget=forms.TextInput(attrs={
                                                                 'class': 'form-control',
                                                                 "placeholder": "locomotives,etc.",
                                                             }))
    in_use_total_hp_iii_locomotives = forms.CharField(max_length=100, required=False,
                                                      widget=forms.TextInput(attrs={
                                                          'class': 'form-control',
                                                          "placeholder": "locomotives,etc.",
                                                      }))
    in_reserve_number_of_units_iii_locomotives = forms.CharField(max_length=100, required=False,
                                                                 widget=forms.TextInput(attrs={
                                                                     'class': 'form-control',
                                                                     "placeholder": "locomotives,etc.",
                                                                 }))
    in_reserve_total_hp_iii_locomotives = forms.CharField(max_length=100, required=False,
                                                          widget=forms.TextInput(attrs={'class': 'form-control',
                                                                                        "placeholder": "locomotives,etc.",
                                                                                        }))
    specify2 = forms.CharField(max_length=100, required=False,
                               widget=forms.TextInput(attrs={
                                   'class': 'form-control',
                                   "placeholder": "specify",
                               }))
    in_use_number_of_units_specify2 = forms.CharField(max_length=100, required=False,
                                                      widget=forms.TextInput(attrs={
                                                          'class': 'form-control',
                                                          "placeholder": "",
                                                      }))
    in_use_total_hp_specify2 = forms.CharField(max_length=100, required=False,
                                               widget=forms.TextInput(attrs={
                                                   'class': 'form-control',
                                                   "placeholder": " ",
                                               }))
    in_reserve_number_of_units_specify2 = forms.CharField(max_length=100, required=False,
                                                          widget=forms.TextInput(attrs={
                                                              'class': 'form-control',
                                                              "placeholder": " ",
                                                          }))
    in_reserve_total_hp_specify2 = forms.CharField(max_length=100, required=False,
                                                   widget=forms.TextInput(attrs={'class': 'form-control',
                                                                                 "placeholder": " ",
                                                                                 }))
    total3 = forms.CharField(max_length=100, required=False,
                             widget=forms.TextInput(attrs={'class': 'form-control',
                                                           "placeholder": "Total",
                                                           }))

    class Meta():
        model = DGMS_CoalMine_Table_C_Model
        fields = "__all__"


class DGMS_CoalMine_Table_D_Form(forms.ModelForm):
    name_of_explosive = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Name of explosive",
    }))
    quantity = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Quantity used(in kgm)",
    }))
    electric = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Electric",
    }))
    ordinary = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Ordinary",
    }))
    name_and_type_of_safty_lamps = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Name and type of safety lamps",
    }))
    lead_rivet = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Lead rivet",
    }))
    magnetic = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Magnetic",
    }))
    other = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Other",
    }))
    name_and_size_of_mech_ventilator = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Name and size of Mechanical Ventilator",
    }))
    position = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Position where installed",
    }))
    avarage_total_quantity = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Average total quantity of air delivered per minute",
    }))
    water_gauge_obtaied = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Water gauge obtaind (in centimeters)",
    }))

    class Meta():
        model = DGMS_CoalMine_Table_D_Model
        fields = "__all__"


class DGMS_CoalMine_Table_E_Form(forms.ModelForm):
    coal_openstock_year = forms.IntegerField(min_value=2018, max_value=2099, required=True,
                                             widget=forms.NumberInput(attrs={
                                                 "placeholder": "2018",
                                                 'class': 'form-control',
                                                 "style": "width:115%",
                                             }))
    coal_endstock_year = forms.IntegerField(min_value=2018, max_value=2099, required=True,
                                            widget=forms.NumberInput(attrs={
                                                "placeholder": "2018",
                                                'class': 'form-control',
                                                "style": "width:112%",
                                            }))
    coke_openstock_year = forms.IntegerField(min_value=2018, max_value=2099, required=True,
                                             widget=forms.NumberInput(attrs={
                                                 "placeholder": "2018",
                                                 'class': 'form-control',
                                                 "style": "width:110%",
                                             }))
    coke_endstock_year = forms.IntegerField(min_value=2018, max_value=2099, required=True,
                                            widget=forms.NumberInput(attrs={
                                                "placeholder": "2018",
                                                'class': 'form-control',
                                                "style": "width:110%",
                                            }))
    selected_a_openstock = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col2',
        "placeholder": "",
    }))
    selected_a_coal_raised = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col3',
        "placeholder": "",
    }))
    selected_a_total_value_of_rasing = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "",
    }))
    selected_a_total_of_col_2_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control total_2_3',
        "readonly": "true",
    }))
    selected_a_coal_despatched = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col6',
        "placeholder": "",
    }))
    selected_a_collery_consumption = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col7',
        "placeholder": "",
    }))
    selected_a_coal_used_for_cooking = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col8',
        "placeholder": "",
    }))
    selected_a_shortage_due_to_cause = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col9',
        "placeholder": "",
    }))
    selected_a_closing_stocks = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col10',
        "placeholder": "",
    }))
    selected_a_total_columns = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col11',
        "readonly": "true",
    }))
    selected_b_openstock = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col2',
        "placeholder": "",
    }))
    selected_b_coal_raised = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col3',
        "placeholder": "",
    }))
    selected_b_total_value_of_rasing = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "",
    }))
    selected_b_total_of_col_2_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control total_2_3',
        "readonly": "true",
    }))
    selected_b_coal_despatched = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col6',
        "placeholder": "",
    }))
    selected_b_collery_consumption = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col7',
        "placeholder": "",
    }))
    selected_b_coal_used_for_cooking = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col8',
        "placeholder": "",
    }))
    selected_b_shortage_due_to_cause = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col9',
        "placeholder": "",
    }))
    selected_b_closing_stocks = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col10',
        "placeholder": "",
    }))
    selected_b_total_columns = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col11',
        "readonly": "true",
    }))

    grade_1_openstock = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col2',
        "placeholder": "",
    }))
    grade_1_coal_raised = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col3',
        "placeholder": "",
    }))
    grade_1_total_value_of_rasing = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "",
    }))
    grade_1_total_of_col_2_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control total_2_3',
        "readonly": "true",
    }))
    grade_1_coal_despatched = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col6',
        "placeholder": "",
    }))
    grade_1_collery_consumption = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col7',
        "placeholder": "",
    }))
    grade_1_coal_used_for_cooking = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col8',
        "placeholder": "",
    }))
    grade_1_shortage_due_to_cause = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col9',
        "placeholder": "",
    }))
    grade_1_closing_stocks = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col10',
        "placeholder": "",
    }))
    grade_1_total_columns = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col11',
        "readonly": "true",
    }))
    grade_2_openstock = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col2',
        "placeholder": "",
    }))
    grade_2_coal_raised = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col3',
        "placeholder": "",
    }))
    grade_2_total_value_of_rasing = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "",
    }))
    grade_2_total_of_col_2_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control total_2_3',
        "readonly": "true",
    }))
    grade_2_coal_despatched = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col6',
        "placeholder": "",
    }))
    grade_2_collery_consumption = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col7',
        "placeholder": "",
    }))
    grade_2_coal_used_for_cooking = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col8',
        "placeholder": "",
    }))
    grade_2_shortage_due_to_cause = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col9',
        "placeholder": "",
    }))
    grade_2_closing_stocks = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col10',
        "placeholder": "",
    }))
    grade_2_total_columns = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col11',
        "readonly": "true",
    }))
    grade_3_openstock = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col2',
        "placeholder": "",
    }))
    grade_3_coal_raised = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col3',
        "placeholder": "",
    }))
    grade_3_total_value_of_rasing = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "",
    }))
    grade_3_total_of_col_2_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control total_2_3',
        "readonly": "true",
    }))
    grade_3_coal_despatched = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col6',
        "placeholder": "",
    }))
    grade_3_collery_consumption = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col7',
        "placeholder": "",
    }))
    grade_3_coal_used_for_cooking = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col8',
        "placeholder": "",
    }))
    grade_3_shortage_due_to_cause = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col9',
        "placeholder": "",
    }))
    grade_3_closing_stocks = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col10',
        "placeholder": "",
    }))
    grade_3_total_columns = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col11',
        "readonly": "true",
    }))
    openstock_total = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col2',
        "placeholder": "",
    }))
    coal_raised_total = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col3',
        "placeholder": "",
    }))
    total_value_of_rasing_total = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "",
    }))
    total_of_col_2_3_total = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control total_2_3',
        "readonly": "true",
    }))
    coal_despatched_total = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col6',
        "placeholder": "",
    }))
    collery_consumption_total = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col7',
        "placeholder": "",
    }))
    coal_used_for_cooking_total = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col8',
        "placeholder": "",
    }))
    shortage_due_to_cause_total = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col9',
        "placeholder": "",
    }))
    closing_stocks_total = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col10',
        "placeholder": "",
    }))
    total_columns_total = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col11',
        "readonly": "true",
    }))
    coke_hard_opening_stock = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col2',
        "placeholder": "",
    }))
    coke_hard_coke_manufactured = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col3',
        "placeholder": "",
    }))
    coke_hard_total_value_of_coke = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "",
    }))
    coke_hard_total_col_2_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control total_2_3',
        "readonly": "true",
    }))
    coke_hard_coke_despatched = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col_6',
        "placeholder": "",
    }))
    coke_hard_colliery_consumption = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col_7',
        "placeholder": "",
    }))
    coke_hard_coke_shortage = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col_8',
        "placeholder": "",
    }))
    coke_hard_closing_stock = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col_9',
        "placeholder": "",
    }))
    coke_hard_total_column_total = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col_10',
        "readonly": "true",
    }))
    coke_soft_opening_stock = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col2',
        "placeholder": "",
    }))
    coke_soft_coke_manufactured = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col3',
        "placeholder": "",
    }))
    coke_soft_total_value_of_coke = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "",
    }))
    coke_soft_total_col_2_3 = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control total_2_3',
        "placeholder": "",
        "readonly": "true",
    }))
    coke_soft_coke_despatched = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col_6',
        "placeholder": "",
    }))
    coke_soft_colliery_consumption = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col_7',
        "placeholder": "",
    }))
    coke_soft_coke_shortage = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col_8',
        "placeholder": "",
    }))
    coke_soft_closing_stock = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col_9',
        "placeholder": "",
    }))
    coke_soft_total_column_total = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control col_10',
        "readonly": "true",
    }))

    class Meta():
        model = DGMS_CoalMine_Table_E_Model
        fields = "__all__"

class First_Schedule_Form_iii(forms.ModelForm):
    year = forms.IntegerField(min_value=2018, max_value=2099, required=True,
                                             widget=forms.NumberInput(attrs={
                                                 "placeholder": "Ex.2018",
                                                 "style":"width:40%"
                                             }))

    mine_address = forms.CharField(max_length=50, required=False, widget=forms.Textarea(attrs={
        'class': 'form-control',
        "placeholder": "Postal address of mine",
        'rows': 5, 'cols': 100,
    }))
    mine_dop = forms.DateField(required=False, widget=forms.TextInput(attrs={

        'class': 'form-control datepicker',
        "placeholder" : "Date of Opening"
    }))
    mine_doc = forms.DateField(required=False, widget=forms.TextInput(attrs={

        'class': 'form-control datepicker',
        "placeholder": "Date of Closing"
    }))
    mine_district = forms.CharField(max_length=100,required=False, widget=forms.TextInput(attrs={

        'class': 'form-control',
        "placeholder": "Situation of mine District"
    }))
    mine_state = forms.CharField(max_length=100,required=False, widget=forms.TextInput(attrs={

        'class': 'form-control',
        "placeholder": "State"
    }))
    owner_name = forms.CharField(max_length=100,required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Name of Owner"
    }))
    owner_address = forms.CharField(max_length=500,required=False, widget=forms.Textarea(attrs={
        'class': 'form-control',
        "placeholder": "Postel address of Owner",
        "rows": 5,
        "cols": 100
    }))
    managing_agent = forms.CharField(max_length=100,required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Name of Managing Agent"
    }))
    managing_agent_address = forms.CharField(max_length=500,required=False, widget=forms.Textarea(attrs={
        'class': 'form-control',
        "placeholder": "Postel address of Managing Agents",
        "rows":5,
        "cols":100
    }))
    agent_name = forms.CharField(max_length=100,required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Name of Agent (if any) as defined in section 2(c) of the Mines Act, 1952"
    }))
    agent_address = forms.CharField(max_length=500,required=False, widget=forms.Textarea(attrs={
        'class': 'form-control',
        "placeholder": "Postel address of Agents",
        "rows": 5,
        "cols": 100
    }))
    manager_name = forms.CharField(max_length=100,required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Name of Manager"
    }))
    manager_address = forms.CharField(max_length=500,required=False, widget=forms.Textarea(attrs={
        'class': 'form-control',
        "placeholder": "Postel address of Manager",
        "rows": 5,
        "cols": 100
    }))
    superior_supervisory_staff = forms.CharField(max_length=100,required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Other superior supervisory staff employed as at the end of the year."
    }))
    whether_machinery_is_used = forms.CharField(max_length=100,required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Whether machinery is used ?"
    }))
    nature_of_power_used = forms.CharField(max_length=100,required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Nature of power used ?"
    }))
    CHOICES = [('Yes', 'Yes'),
               ('No', 'No')]

    a_to_f_fillerd_and_attached = forms.ChoiceField(choices=CHOICES, widget=forms.RadioSelect,required=True)
    signature = forms.ImageField(required=True)
    class Meta():
        model = First_Schedule_Form_iii_Model
        fields = ['mine_name','year','mine_address','mine_dop','mine_doc','mine_district','mine_state','owner_name','owner_address','managing_agent','managing_agent_address','agent_name','agent_address','manager_name','manager_address','superior_supervisory_staff','whether_machinery_is_used','nature_of_power_used','a_to_f_fillerd_and_attached','signature']

class sendMailForm(forms.Form):
    to_address = forms.CharField(max_length=100, required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Ex. abcd@gmail.com,shyam@gmail.com"
        }))
    subject = forms.CharField(max_length=100, required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        "placeholder": "Subject"
    }))
    msg_body = forms.CharField(max_length=100, required=True, widget=forms.Textarea(attrs={
        'class': 'form-control',
        "placeholder": "Message"
    }))
    attachment = forms.FileField(required=False,widget=forms.FileInput(attrs={
        'class':"is_multiple"
    }))
