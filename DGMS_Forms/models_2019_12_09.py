from datetime import datetime, date
from django.db import models
from employee1.models import MineDetails, MiningRole

class DGMS_CoalMine_Annual_Annexure_I(models.Model):
    signature = models.ImageField(upload_to='dgms_annual_report_signature_image/coalmine/', null=True, blank=False)
    # 1 =============================================
    mine_name =  models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=True, blank=True)
    # 2 =============================================
    aecm_year = models.IntegerField(default=None, null=True, blank=True)
    mine_vill = models.CharField(max_length=100,default=None,null=True,blank=True)
    mine_tehsil = models.CharField(max_length=100, default=None,null=True,blank=True)
    mine_dist = models.CharField(max_length=50, default=None,null=True,blank=True)
    mine_pin = models.CharField(max_length=10, default=None,null=True,blank=True)
    mine_state = models.CharField(max_length=50, default=None,null=True,blank=True)
    # 3 ==============================================
    mine_dop = models.DateField(blank=True, null=True)
    # 4 ==============================================
    labour_id_no = models.CharField(max_length=100, default=None,null=True,blank=True)
    # 5 ==============================================
    owner_name = models.CharField(max_length=100, default=None,null=True,blank=True)
    owner_telephone = models.CharField(max_length=20, default=None,null=True,blank=True)
    owner_mobile = models.CharField(max_length=20, default=None,null=True,blank=True)
    owner_email = models.EmailField(max_length=50, default=None,null=True,blank=True)
    owner_vill = models.CharField(max_length=100, default=None,null=True,blank=True)
    owner_tehsil = models.CharField(max_length=100, default=None,null=True,blank=True)
    owner_dist = models.CharField(max_length=50, default=None,null=True,blank=True)
    owner_pin = models.CharField(max_length=10, default=None,null=True,blank=True)
    owner_state = models.CharField(max_length=50, default=None,null=True,blank=True)
    # 6 ==============================================
    agent_name = models.CharField(max_length=100, default=None,null=True,blank=True)
    agent_telephone = models.CharField(max_length=20, default=None,null=True,blank=True)
    agent_mobile = models.CharField(max_length=20, default=None,null=True,blank=True)
    agent_email = models.EmailField(max_length=50, default=None,null=True,blank=True)
    agent_vill = models.CharField(max_length=100, default=None,null=True,blank=True)
    agent_tehsil = models.CharField(max_length=100, default=None,null=True,blank=True)
    agent_dist = models.CharField(max_length=50, default=None,null=True,blank=True)
    agent_pin = models.CharField(max_length=10, default=None,null=True,blank=True)
    agent_state = models.CharField(max_length=50, default=None,null=True,blank=True)
    # 7 ===============================================
    manager_name = models.CharField(max_length=100, default=None,null=True,blank=True)
    manager_telephone = models.CharField(max_length=20, default=None,null=True,blank=True)
    manager_mobile = models.CharField(max_length=20, default=None,null=True,blank=True)
    manager_email = models.EmailField(max_length=50, default=None,null=True,blank=True)
    manager_vill = models.CharField(max_length=100, default=None,null=True,blank=True)
    manager_tehsil = models.CharField(max_length=100, default=None,null=True,blank=True)
    manager_dist = models.CharField(max_length=100, default=None,null=True,blank=True)
    manager_pin = models.CharField(max_length=10, default=None,null=True,blank=True)
    manager_state = models.CharField(max_length=100, default=None,null=True,blank=True)
    # 8 ===============================================
    # 9 ===============================================
    no_of_contractors = models.CharField(max_length=100, default=None,null=True,blank=True)
    # 10 (1)==============================================
    dept_background_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_background_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_total_background_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    cont_background_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_background_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_background_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    dept_opencast_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_opencast_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_opencast_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    cont_opencast_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_opencast_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_opencast_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    dept_aboveground_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_aboveground_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_aboveground_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    cont_aboveground_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_aboveground_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_aboveground_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    # 10 (2) ================================================52
    wbg_number = models.CharField(max_length=100, default=None,null=True,blank=True)
    #wbg_day = models.CharField(max_length=100, default=None,null=True,blank=True)
    wbg_day = models.DateField(default=date.today, blank=True)
    am_number = models.CharField(max_length=100, default=None,null=True,blank=True)
    am_day = models.DateField(default=date.today, blank=True)
    # 10 (3) =================================================
    dept_tmw_background_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_tmw_background_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_tmw_background_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    dept_adnpe_background_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_adnpe_background_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_adnpe_background_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    cont_tmw_background_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_tmw_background_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_tmw_background_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    cont_adnpe_background_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_adnpe_background_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_adnpe_background_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    dept_tmw_opencast_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_tmw_opencast_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_tmw_opencast_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    dept_adnpe_opencast_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_adnpe_opencast_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_adnpe_opencast_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    cont_tmw_opencast_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_tmw_opencast_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_tmw_opencast_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    cont_adnpe_opencast_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_adnpe_opencast_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_adnpe_opencast_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    dept_tmw_aboveground_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_tmw_aboveground_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_tmw_aboveground_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    dept_adnpe_aboveground_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_adnpe_aboveground_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_adnpe_aboveground_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    cont_tmw_aboveground_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_tmw_aboveground_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_tmw_aboveground_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    cont_adnpe_aboveground_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_adnpe_aboveground_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_adnpe_aboveground_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    # 11 =====================================================================92
    no_of_contractors_engaged = models.CharField(max_length=100, default=None,null=True,blank=True)
    no_of_shift_worked = models.CharField(max_length=100, default=None,null=True,blank=True)
    # 12 (A) =================================================================

    # 12 (B) ====================================================================105
    mh_1 = models.CharField(max_length=100, default=None,null=True,blank=True)
    mh_2 = models.CharField(max_length=100, default=None,null=True,blank=True)
    mh_3 = models.CharField(max_length=100, default=None,null=True,blank=True)
    # 13 (A) ====================================================================
    electrical_background = models.CharField(max_length=100, default=None,null=True,blank=True)
    ongs_background = models.CharField(max_length=100, default=None,null=True,blank=True)
    comp_air = models.CharField(max_length=100, default=None,null=True,blank=True)

    electrical_opencast = models.CharField(max_length=100, default=None,null=True,blank=True)
    ongs_opencast = models.CharField(max_length=100, default=None,null=True,blank=True)
    comp_air_opencast = models.CharField(max_length=100, default=None,null=True,blank=True)

    electrical_aboveground = models.CharField(max_length=100, default=None,null=True,blank=True)
    ongs_aboveground = models.CharField(max_length=100, default=None,null=True,blank=True)
    comp_air_aboveground = models.CharField(max_length=100, default=None,null=True,blank=True)

    total_electrical = models.CharField(max_length=100, default=None,null=True,blank=True)
    total_ongs = models.CharField(max_length=100, default=None,null=True,blank=True)
    total_comp_air = models.CharField(max_length=100, default=None,null=True,blank=True)

    # 13 (B) ====================================================================
    lighting = models.CharField(max_length=100, default=None,null=True,blank=True)
    power = models.CharField(max_length=100, default=None,null=True,blank=True)

    # 14  =======================================================================122

    #=================== PART B ==========================================================
    ime_npe_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    ime_npe_cont = models.CharField(max_length=100, default=None, null=True, blank=True)
    ime_npru_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    ime_npru_cont = models.CharField(max_length=100, default=None, null=True, blank=True)
    ime_npau_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    ime_npau_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    ime_no_of_p_d_m_unfit = models.CharField(max_length=100, default=None, null=True, blank=True)

    pme_npe_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    pme_npe_cont = models.CharField(max_length=100, default=None, null=True, blank=True)
    pme_npru_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    pme_npru_cont = models.CharField(max_length=100, default=None, null=True, blank=True)
    pme_npau_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    pme_npau_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    pme_no_of_p_d_m_unfit = models.CharField(max_length=100, default=None, null=True, blank=True)

    no_of_workmen_req = models.CharField(max_length=100, default=None, null=True, blank=True)
    no_of_workmen_provide = models.CharField(max_length=100, default=None, null=True, blank=True)

    no_of_satfy_c_meeting_conduct = models.CharField(max_length=100, default=None, null=True, blank=True)
    #--------------------------part C------------------------------------------------
    npe_bvt_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    npe_bvt_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    npruvt_bvt_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    npruvt_bvt_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    npauvt_bvt_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    npauvt_bvt_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    npe_rt_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    npe_rt_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    npruvt_rt_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    npruvt_rt_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    npauvt_rt_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    npauvt_rt_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    class Meta:
        db_table = "dgms_coalmine_annual_annexure_i"

class DGMS_CoalMine_Annual_Annexure_I_Subtable_1(models.Model):
    base_column_id = models.IntegerField(null=True, blank=True,default=None)
    spem_designation = models.CharField(max_length=100,default=None,null=True,blank=True)
    spem_no_requried = models.CharField(max_length=100,default=None,null=True,blank=True)
    spem_no_available = models.CharField(max_length=100,default=None,null=True,blank=True)
    spem_short_surplus = models.CharField(max_length=100,default=None,null=True,blank=True)
    class Meta:
        db_table = "dgms_coalmine_annual_annexure_i_subtable_1"

class DGMS_CoalMine_Annual_Annexure_I_Subtable_2(models.Model):
    base_column_id = models.IntegerField(null=True, blank=True, default=None)
    accident_statistics_year = models.CharField(max_length=100, default=None, null=True, blank=True)
    accident_statistics_fatal_number = models.CharField(max_length=100, default=None, null=True, blank=True)
    accident_statistics_fatal_no_of_persion_killed = models.CharField(max_length=100, default=None, null=True, blank=True)
    accident_statistics_fatal_no_of_persion_injured = models.CharField(max_length=100, default=None, null=True, blank=True)

    accident_statistics_serious = models.CharField(max_length=100, default=None, null=True,blank=True)
    accident_statistics_serious_injured = models.CharField(max_length=100, default=None, null=True,blank=True)
    accident_statistics_reportable_number = models.CharField(max_length=100, default=None, null=True,blank=True)
    accident_statistics_reportable_injured = models.CharField(max_length=100, default=None, null=True,blank=True)
    accident_statistics_minor_number = models.CharField(max_length=100, default=None, null=True,blank=True)
    accident_statistics_minor_injured = models.CharField(max_length=100, default=None, null=True,blank=True)
    class Meta:
        db_table = "dgms_coalmine_annual_annexure_i_subtable_2"

class DGMS_CoalMine_Annual_Annexure_I_Subtable_3(models.Model):
    base_column_id = models.IntegerField(null=True, blank=True, default=None)
    cre_grade = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_2 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_4 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_5 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_6 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_7 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_8 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_9 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_10 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_11 = models.CharField(max_length=100, default=None, null=True, blank=True)

    class Meta:
        db_table = "dgms_coalmine_annual_annexure_i_subtable_3"
#------------------------------------------@ Metalliferous @----------------------------------------------------------------------------------

class DGMS_MetelliferousMine_Annual_Annexure_II(models.Model):
    signature = models.ImageField(upload_to='dgms_annual_report_signature_image/metalmine/', null=True, blank=False)
    # 1 =============================================
    mine_name =  models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=True, blank=True)
    # 2 =============================================
    aecm_year = models.IntegerField(default=None, null=True, blank=True)
    mine_vill = models.CharField(max_length=100,default=None,null=True,blank=True)
    mine_tehsil = models.CharField(max_length=100, default=None,null=True,blank=True)
    mine_dist = models.CharField(max_length=50, default=None,null=True,blank=True)
    mine_pin = models.CharField(max_length=10, default=None,null=True,blank=True)
    mine_state = models.CharField(max_length=50, default=None,null=True,blank=True)
    # 3 ==============================================
    mine_dop = models.DateField(blank=True, null=True)
    # 4 ==============================================
    labour_id_no = models.CharField(max_length=100, default=None,null=True,blank=True)
    # 5 ==============================================
    owner_name = models.CharField(max_length=100, default=None,null=True,blank=True)
    owner_telephone = models.CharField(max_length=20, default=None,null=True,blank=True)
    owner_mobile = models.CharField(max_length=20, default=None,null=True,blank=True)
    owner_email = models.EmailField(max_length=50, default=None,null=True,blank=True)
    owner_vill = models.CharField(max_length=100, default=None,null=True,blank=True)
    owner_tehsil = models.CharField(max_length=100, default=None,null=True,blank=True)
    owner_dist = models.CharField(max_length=50, default=None,null=True,blank=True)
    owner_pin = models.CharField(max_length=10, default=None,null=True,blank=True)
    owner_state = models.CharField(max_length=50, default=None,null=True,blank=True)
    # 6 ==============================================
    agent_name = models.CharField(max_length=100, default=None,null=True,blank=True)
    agent_telephone = models.CharField(max_length=20, default=None,null=True,blank=True)
    agent_mobile = models.CharField(max_length=20, default=None,null=True,blank=True)
    agent_email = models.EmailField(max_length=50, default=None,null=True,blank=True)
    agent_vill = models.CharField(max_length=100, default=None,null=True,blank=True)
    agent_tehsil = models.CharField(max_length=100, default=None,null=True,blank=True)
    agent_dist = models.CharField(max_length=50, default=None,null=True,blank=True)
    agent_pin = models.CharField(max_length=10, default=None,null=True,blank=True)
    agent_state = models.CharField(max_length=50, default=None,null=True,blank=True)
    # 7 ===============================================
    manager_name = models.CharField(max_length=100, default=None,null=True,blank=True)
    manager_telephone = models.CharField(max_length=20, default=None,null=True,blank=True)
    manager_mobile = models.CharField(max_length=20, default=None,null=True,blank=True)
    manager_email = models.EmailField(max_length=50, default=None,null=True,blank=True)
    manager_vill = models.CharField(max_length=100, default=None,null=True,blank=True)
    manager_tehsil = models.CharField(max_length=100, default=None,null=True,blank=True)
    manager_dist = models.CharField(max_length=100, default=None,null=True,blank=True)
    manager_pin = models.CharField(max_length=10, default=None,null=True,blank=True)
    manager_state = models.CharField(max_length=100, default=None,null=True,blank=True)
    # 8 ===============================================
    # 9 ===============================================
    no_of_contractors = models.CharField(max_length=100, default=None,null=True,blank=True)
    # 10 (1)==============================================
    dept_background_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_background_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_total_background_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    cont_background_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_background_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_background_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    dept_opencast_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_opencast_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_opencast_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    cont_opencast_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_opencast_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_opencast_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    dept_aboveground_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_aboveground_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_aboveground_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    cont_aboveground_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_aboveground_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_aboveground_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    # 10 (2) ================================================52
    wbg_number = models.CharField(max_length=100, default=None,null=True,blank=True)
    wbg_day = models.DateField(default=date.today, blank=True)
    am_number = models.CharField(max_length=100, default=None,null=True,blank=True)
    am_day = models.DateField(default=date.today, blank=True)
    # 10 (3) =================================================
    dept_tmw_background_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_tmw_background_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_tmw_background_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    dept_adnpe_background_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_adnpe_background_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_adnpe_background_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    cont_tmw_background_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_tmw_background_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_tmw_background_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    cont_adnpe_background_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_adnpe_background_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_adnpe_background_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    dept_tmw_opencast_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_tmw_opencast_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_tmw_opencast_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    dept_adnpe_opencast_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_adnpe_opencast_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_adnpe_opencast_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    cont_tmw_opencast_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_tmw_opencast_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_tmw_opencast_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    cont_adnpe_opencast_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_adnpe_opencast_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_adnpe_opencast_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    dept_tmw_aboveground_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_tmw_aboveground_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_tmw_aboveground_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    dept_adnpe_aboveground_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_adnpe_aboveground_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    dept_adnpe_aboveground_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    cont_tmw_aboveground_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_tmw_aboveground_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_tmw_aboveground_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)

    cont_adnpe_aboveground_male = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_adnpe_aboveground_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    cont_adnpe_aboveground_total_male_female = models.CharField(max_length=100, default=None,null=True,blank=True)
    # 11 =====================================================================92
    no_of_contractors_engaged = models.CharField(max_length=100, default=None,null=True,blank=True)
    no_of_shift_worked = models.CharField(max_length=100, default=None,null=True,blank=True)
    # 12 (A) =================================================================
    # 12 (B) =================================================================
    mh_1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    mh_2 = models.CharField(max_length=100, default=None, null=True, blank=True)
    mh_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    # 13 ====================================================================
    explosive_used_in_the_mine = models.CharField(max_length=100, default=None, null=True, blank=True)
    # 14 (A) ====================================================================
    electrical_background = models.CharField(max_length=100, default=None, null=True, blank=True)
    ongs_background = models.CharField(max_length=100, default=None, null=True, blank=True)
    comp_air = models.CharField(max_length=100, default=None, null=True, blank=True)
    electrical_opencast = models.CharField(max_length=100, default=None, null=True, blank=True)
    ongs_opencast = models.CharField(max_length=100, default=None, null=True, blank=True)
    comp_air_opencast = models.CharField(max_length=100, default=None, null=True, blank=True)
    electrical_aboveground = models.CharField(max_length=100, default=None, null=True, blank=True)
    ongs_aboveground = models.CharField(max_length=100, default=None, null=True, blank=True)
    comp_air_aboveground = models.CharField(max_length=100, default=None, null=True, blank=True)
    total_electrical = models.CharField(max_length=100, default=None, null=True, blank=True)
    total_ongs = models.CharField(max_length=100, default=None, null=True, blank=True)
    total_comp_air = models.CharField(max_length=100, default=None, null=True, blank=True)
    # 14 (B) ====================================================================
    lighting = models.CharField(max_length=100, default=None,null=True,blank=True)
    power = models.CharField(max_length=100, default=None,null=True,blank=True)


    # PART B ==========================================================
    ime_npe_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    ime_npe_cont = models.CharField(max_length=100, default=None, null=True, blank=True)
    ime_npru_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    ime_npru_cont = models.CharField(max_length=100, default=None, null=True, blank=True)
    ime_npau_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    ime_npau_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    ime_no_of_p_d_m_unfit = models.CharField(max_length=100, default=None, null=True, blank=True)

    pme_npe_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    pme_npe_cont = models.CharField(max_length=100, default=None, null=True, blank=True)
    pme_npru_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    pme_npru_cont = models.CharField(max_length=100, default=None, null=True, blank=True)
    pme_npau_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    pme_npau_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    pme_no_of_p_d_m_unfit = models.CharField(max_length=100, default=None, null=True, blank=True)

    no_of_workmen_req = models.CharField(max_length=100, default=None, null=True, blank=True)
    no_of_workmen_provide = models.CharField(max_length=100, default=None, null=True, blank=True)

    no_of_satfy_c_meeting_conduct = models.CharField(max_length=100, default=None, null=True, blank=True)
    #-----------------part C------------------------------------------------
    npe_bvt_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    npe_bvt_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    npruvt_bvt_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    npruvt_bvt_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    npauvt_bvt_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    npauvt_bvt_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    npe_rt_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    npe_rt_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    npruvt_rt_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    npruvt_rt_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    npauvt_rt_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    npauvt_rt_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    class Meta:
        db_table = "dgms_metelliferousmine_annual_annexure_ii"

class DGMS_MetalliferousMine_Annual_Annexure_II_Subtable_1(models.Model):
    base_column_id = models.IntegerField(null=True, blank=True,default=None)
    spem_designation = models.CharField(max_length=100,default=None,null=True,blank=True)
    spem_no_requried = models.CharField(max_length=100,default=None,null=True,blank=True)
    spem_no_available = models.CharField(max_length=100,default=None,null=True,blank=True)
    spem_short_surplus = models.CharField(max_length=100,default=None,null=True,blank=True)
    class Meta:
        db_table = "dgms_metelliferousmine_annual_annexure_ii_subtable_1"


class DGMS_MetalliferousMines_Annual_Annexure_II_Subtable_2(models.Model):
    base_column_id = models.IntegerField(null=True, blank=True, default=None)
    accident_statistics_year = models.CharField(max_length=100, default=None, null=True, blank=True)
    accident_statistics_fatal_number = models.CharField(max_length=100, default=None, null=True, blank=True)
    accident_statistics_fatal_no_of_persion_killed = models.CharField(max_length=100, default=None, null=True, blank=True)
    accident_statistics_fatal_no_of_persion_injured = models.CharField(max_length=100, default=None, null=True, blank=True)

    accident_statistics_serious = models.CharField(max_length=100, default=None, null=True,blank=True)
    accident_statistics_serious_injured = models.CharField(max_length=100, default=None, null=True,blank=True)
    accident_statistics_reportable_number = models.CharField(max_length=100, default=None, null=True,blank=True)
    accident_statistics_reportable_injured = models.CharField(max_length=100, default=None, null=True,blank=True)
    accident_statistics_minor_number = models.CharField(max_length=100, default=None, null=True,blank=True)
    accident_statistics_minor_injured = models.CharField(max_length=100, default=None, null=True,blank=True)

    class Meta:
        db_table = "dgms_metelliferousmine_annual_annexure_ii_subtable_2"

class DGMS_MetalliferousMines_ANNUAL_Annexure_II_Subtable_3(models.Model):
    base_column_id = models.IntegerField(null=True, blank=True, default=None)
    cre_1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_2 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_4 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_5 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_6 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_7 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_8 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_9 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_10 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_11 = models.CharField(max_length=100, default=None, null=True, blank=True)
    cre_12 = models.CharField(max_length=100, default=None, null=True, blank=True)

    class Meta:
        db_table = "dgms_metelliferousmine_annual_annexure_ii_subtable_3"


#=======================================================================================================================
#======================================== Oil Mines ====================================================================
#=======================================================================================================================
class DGMS_OilMines_Annual_Annexure_III(models.Model):
    signature = models.ImageField(upload_to='dgms_annual_report_signature_image/oilmine/', null=True, blank=False)
    # 1 =============================================
    mine_name =  models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=True, blank=True)
    # 2 =============================================
    aecm_year = models.IntegerField(default=None, null=True, blank=True)
    mine_vill = models.CharField(max_length=100,default=None,null=True,blank=True)
    mine_tehsil = models.CharField(max_length=100, default=None,null=True,blank=True)
    mine_dist = models.CharField(max_length=50, default=None,null=True,blank=True)
    mine_pin = models.CharField(max_length=10, default=None,null=True,blank=True)
    mine_state = models.CharField(max_length=50, default=None,null=True,blank=True)
    # 3 ==============================================
    mine_dop = models.DateField(blank=True, null=True)
    # 4 ==============================================
    labour_id_no = models.CharField(max_length=100, default=None,null=True,blank=True)
    # 5 ==============================================
    owner_name = models.CharField(max_length=100, default=None,null=True,blank=True)
    owner_telephone = models.CharField(max_length=20, default=None,null=True,blank=True)
    owner_mobile = models.CharField(max_length=20, default=None,null=True,blank=True)
    owner_email = models.EmailField(max_length=50, default=None,null=True,blank=True)
    owner_vill = models.CharField(max_length=100, default=None,null=True,blank=True)
    owner_tehsil = models.CharField(max_length=100, default=None,null=True,blank=True)
    owner_dist = models.CharField(max_length=50, default=None,null=True,blank=True)
    owner_pin = models.CharField(max_length=10, default=None,null=True,blank=True)
    owner_state = models.CharField(max_length=50, default=None,null=True,blank=True)
    # 6 ==============================================
    agent_name = models.CharField(max_length=100, default=None,null=True,blank=True)
    agent_telephone = models.CharField(max_length=20, default=None,null=True,blank=True)
    agent_mobile = models.CharField(max_length=20, default=None,null=True,blank=True)
    agent_email = models.EmailField(max_length=50, default=None,null=True,blank=True)
    agent_vill = models.CharField(max_length=100, default=None,null=True,blank=True)
    agent_tehsil = models.CharField(max_length=100, default=None,null=True,blank=True)
    agent_dist = models.CharField(max_length=50, default=None,null=True,blank=True)
    agent_pin = models.CharField(max_length=10, default=None,null=True,blank=True)
    agent_state = models.CharField(max_length=50, default=None,null=True,blank=True)
    # 7 ===============================================
    manager_name = models.CharField(max_length=100, default=None,null=True,blank=True)
    manager_telephone = models.CharField(max_length=20, default=None,null=True,blank=True)
    manager_mobile = models.CharField(max_length=20, default=None,null=True,blank=True)
    manager_email = models.EmailField(max_length=50, default=None,null=True,blank=True)
    manager_vill = models.CharField(max_length=100, default=None,null=True,blank=True)
    manager_tehsil = models.CharField(max_length=100, default=None,null=True,blank=True)
    manager_dist = models.CharField(max_length=100, default=None,null=True,blank=True)
    manager_pin = models.CharField(max_length=10, default=None,null=True,blank=True)
    manager_state = models.CharField(max_length=100, default=None,null=True,blank=True)
    # 8 ===============================================
    # 9 ===============================================
    no_of_contractors = models.CharField(max_length=100, default=None,null=True,blank=True)
    # 10 (1) ==============================================
    classification = models.CharField(max_length=100, default=None, null=True, blank=True)
    dept_male = models.CharField(max_length=100, default=None, null=True, blank=True)
    dept_female = models.CharField(max_length=100, default=None, null=True, blank=True)
    dept_total_male_female = models.CharField(max_length=100, default=None, null=True, blank=True)
    cont_male = models.CharField(max_length=100, default=None, null=True, blank=True)
    cont_female = models.CharField(max_length=100, default=None, null=True, blank=True)
    cont_total_male_female = models.CharField(max_length=100, default=None, null=True, blank=True)
    # 10 (2) ==============================================
    wbg_number = models.CharField(max_length=100, default=None, null=True, blank=True)
    wbg_day = models.DateField(default=date.today, blank=True)
    # 10 (3) ==============================================
    dmw_classification = models.CharField(max_length=100, default=None, null=True, blank=True)
    dept_tmw_male = models.CharField(max_length=100, default=None, null=True, blank=True)
    dept_tmw_female = models.CharField(max_length=100, default=None, null=True, blank=True)
    dept_tmw_total_male_female = models.CharField(max_length=100, default=None, null=True, blank=True)
    dept_adnpe_male = models.CharField(max_length=100, default=None, null=True, blank=True)
    dept_adnpe_female = models.CharField(max_length=100, default=None, null=True, blank=True)
    dept_adnpe_total_male_female = models.CharField(max_length=100, default=None, null=True, blank=True)
    cont_tmw_male = models.CharField(max_length=100, default=None, null=True, blank=True)
    cont_tmw_female = models.CharField(max_length=100, default=None, null=True, blank=True)
    cont_tmw_total_male_female = models.CharField(max_length=100, default=None, null=True, blank=True)
    cont_adnpe_male = models.CharField(max_length=100, default=None, null=True, blank=True)
    cont_adnpe_female = models.CharField(max_length=100, default=None, null=True, blank=True)
    cont_adnpe_total_male_female = models.CharField(max_length=100, default=None, null=True, blank=True)
    # 11 ==============================================
    no_of_days_worked = models.CharField(max_length=100, default=None, null=True, blank=True)
    no_of_shift_worked = models.CharField(max_length=100, default=None, null=True, blank=True)
    # 12 ==============================================
    place_name1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    place_name1_electrical = models.CharField(max_length=100, default=None, null=True, blank=True)
    place_name1_ongs = models.CharField(max_length=100, default=None, null=True, blank=True)
    place_name1_comp_air = models.CharField(max_length=100, default=None, null=True, blank=True)
    place_name2 = models.CharField(max_length=100, default=None, null=True, blank=True)
    place_name2_electrical = models.CharField(max_length=100, default=None, null=True, blank=True)
    place_name2_ongs = models.CharField(max_length=100, default=None, null=True, blank=True)
    place_name2_comp_air = models.CharField(max_length=100, default=None, null=True, blank=True)

    total_electrical = models.CharField(max_length=100, default=None, null=True, blank=True)
    total_ongs = models.CharField(max_length=100, default=None, null=True, blank=True)
    total_comp_air = models.CharField(max_length=100, default=None, null=True, blank=True)

    lighting = models.CharField(max_length=100, default=None, null=True, blank=True)
    power = models.CharField(max_length=100, default=None, null=True, blank=True)
    # 13 =====================================================================
    drillig_type_of_rig = models.CharField(max_length=100, default=None, null=True, blank=True)
    drillig_total_no_of_units_in_use = models.CharField(max_length=100, default=None, null=True, blank=True)
    workover_type_of_rig = models.CharField(max_length=100, default=None, null=True, blank=True)
    workover_total_no_of_units_in_use = models.CharField(max_length=100, default=None, null=True, blank=True)
    other_rigs_type_of_rig = models.CharField(max_length=100, default=None, null=True, blank=True)
    other_rigs_total_no_of_units_in_use = models.CharField(max_length=100, default=None, null=True, blank=True)
    wells_drilled_type_of_rig = models.CharField(max_length=100, default=None, null=True, blank=True)
    wells_drilled_total_no_of_units_in_use = models.CharField(max_length=100, default=None, null=True, blank=True)
    wells_abandoned_type_of_rig = models.CharField(max_length=100, default=None, null=True, blank=True)
    wells_abandoned_total_no_of_units_in_use = models.CharField(max_length=100, default=None, null=True, blank=True)
    gas_wells_completed_type_of_rig = models.CharField(max_length=100, default=None, null=True, blank=True)
    gas_wells_completed_total_no_of_units_in_use = models.CharField(max_length=100, default=None, null=True, blank=True)
    oil_wells_completed_type_of_rig = models.CharField(max_length=100, default=None, null=True, blank=True)
    oil_wells_completed_total_no_of_units_in_use = models.CharField(max_length=100, default=None, null=True, blank=True)
    gas_wells_production_type_of_rig = models.CharField(max_length=100, default=None, null=True, blank=True)
    gas_wells_production_total_no_of_units_in_use = models.CharField(max_length=100, default=None, null=True, blank=True)
    oil_wells_production_type_of_rig = models.CharField(max_length=100, default=None, null=True, blank=True)
    oil_wells_production_total_no_of_units_in_use = models.CharField(max_length=100, default=None, null=True, blank=True)
    oil_wells_production_discontinued_type_of_rig = models.CharField(max_length=100, default=None, null=True, blank=True)
    oil_wells_production_discontinued_total_no_of_units_in_use = models.CharField(max_length=100, default=None, null=True, blank=True)
    f_l_l_well_gathering_station_type_of_rig = models.CharField(max_length=100, default=None, null=True, blank=True)
    f_l_l_well_gathering_station_total_no_of_units_in_use = models.CharField(max_length=100, default=None, null=True, blank=True)
    p_l_well_gathering_station_central_type_of_rig = models.CharField(max_length=100, default=None, null=True, blank=True)
    p_l_well_gathering_station_central_total_no_of_units_in_use = models.CharField(max_length=100, default=None, null=True, blank=True)
    other_type_of_rig = models.CharField(max_length=100, default=None, null=True, blank=True)
    other_total_no_of_units_in_use = models.CharField(max_length=100, default=None, null=True, blank=True)
    # 14 =====================================================================
    dp_oil_mt_opening = models.CharField(max_length=100, default=None, null=True, blank=True)
    dp_oil_mt_prod = models.CharField(max_length=100, default=None, null=True, blank=True)
    dp_oil_mt_value = models.CharField(max_length=100, default=None, null=True, blank=True)
    dp_oil_mt_to_refinery = models.CharField(max_length=100, default=None, null=True, blank=True)
    dp_oil_mt_to_marketing = models.CharField(max_length=100, default=None, null=True, blank=True)
    dp_oil_mt_for_house_consumption = models.CharField(max_length=100, default=None, null=True, blank=True)
    dp_oil_mt_closing = models.CharField(max_length=100, default=None, null=True, blank=True)

    dp_gas_opening = models.CharField(max_length=100, default=None, null=True, blank=True)
    dp_gas_prod = models.CharField(max_length=100, default=None, null=True, blank=True)
    dp_gas_value = models.CharField(max_length=100, default=None, null=True, blank=True)
    dp_gas_to_refinery = models.CharField(max_length=100, default=None, null=True, blank=True)
    dp_gas_to_marketing = models.CharField(max_length=100, default=None, null=True, blank=True)
    dp_gas_for_house_consumption = models.CharField(max_length=100, default=None, null=True, blank=True)
    dp_gas_closing = models.CharField(max_length=100, default=None, null=True, blank=True)

    #================================= PART B ==========================================================
    ime_npe_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    ime_npe_cont = models.CharField(max_length=100, default=None, null=True, blank=True)
    ime_npru_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    ime_npru_cont = models.CharField(max_length=100, default=None, null=True, blank=True)
    ime_npau_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    ime_npau_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    ime_no_of_p_d_m_unfit = models.CharField(max_length=100, default=None, null=True, blank=True)

    pme_npe_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    pme_npe_cont = models.CharField(max_length=100, default=None, null=True, blank=True)
    pme_npru_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    pme_npru_cont = models.CharField(max_length=100, default=None, null=True, blank=True)
    pme_npau_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    pme_npau_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    pme_no_of_p_d_m_unfit = models.CharField(max_length=100, default=None, null=True, blank=True)

    no_of_workmen_req = models.CharField(max_length=100, default=None, null=True, blank=True)
    no_of_workmen_provide = models.CharField(max_length=100, default=None, null=True, blank=True)

    no_of_satfy_c_meeting_conduct = models.CharField(max_length=100, default=None, null=True, blank=True)
    #=============================== PART C ==============================================================
    npe_bvt_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    npe_bvt_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    npruvt_bvt_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    npruvt_bvt_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    npauvt_bvt_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    npauvt_bvt_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    npe_rt_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    npe_rt_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    npruvt_rt_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    npruvt_rt_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    npauvt_rt_dept = models.CharField(max_length=100, default=None, null=True, blank=True)
    npauvt_rt_cont = models.CharField(max_length=100, default=None, null=True, blank=True)

    class Meta:
        db_table = "dgms_oilmines_annual_annexure_iii"

class DGMS_OilMines_Annual_Annexure_III_Subtable_1(models.Model):
    base_column_id = models.IntegerField(null=True, blank=True,default=None)
    spem_designation = models.CharField(max_length=100,default=None,null=True,blank=True)
    spem_no_requried = models.CharField(max_length=100,default=None,null=True,blank=True)
    spem_no_available = models.CharField(max_length=100,default=None,null=True,blank=True)
    spem_short_surplus = models.CharField(max_length=100,default=None,null=True,blank=True)
    class Meta:
        db_table = "dgms_oilmines_annual_annexure_iii_subtable_1"

class DGMS_OilMines_Annual_Annexure_III_Subtable_2(models.Model):
    base_column_id = models.IntegerField(null=True, blank=True, default=None)
    accident_statistics_year = models.CharField(max_length=100, default=None, null=True, blank=True)
    accident_statistics_fatal_number = models.CharField(max_length=100, default=None, null=True, blank=True)
    accident_statistics_fatal_no_of_persion_killed = models.CharField(max_length=100, default=None, null=True, blank=True)
    accident_statistics_fatal_no_of_persion_injured = models.CharField(max_length=100, default=None, null=True, blank=True)

    accident_statistics_serious = models.CharField(max_length=100, default=None, null=True,blank=True)
    accident_statistics_serious_injured = models.CharField(max_length=100, default=None, null=True,blank=True)
    accident_statistics_reportable_number = models.CharField(max_length=100, default=None, null=True,blank=True)
    accident_statistics_reportable_injured = models.CharField(max_length=100, default=None, null=True,blank=True)
    accident_statistics_minor_number = models.CharField(max_length=100, default=None, null=True,blank=True)
    accident_statistics_minor_injured = models.CharField(max_length=100, default=None, null=True,blank=True)

    class Meta:
        db_table = "dgms_oilmines_annual_annexure_iii_subtable_2"
#=======================================================================================================================
class DGMS_CoalMine_Table_A_Model(models.Model):
    year = models.CharField(max_length=100, default=None, null=True, blank=True)
    working_below_ground = models.CharField(max_length=100, default=None, null=True, blank=True)
    working_below_ground_a = models.CharField(max_length=100, default=None, null=True, blank=True)
    all_mine_on = models.CharField(max_length=100, default=None, null=True, blank=True)
    all_mine_on_a = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_overman_sirdars_2a = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_overman_sirdars_2b = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_overman_sirdars_2c = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_overman_sirdars_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_overman_sirdars_4a = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_overman_sirdars_4b = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_overman_sirdars_4c = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_overman_sirdars_4d = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_overman_sirdars_5 = models.CharField(max_length=100, default=None, null=True, blank=True)

    below_ground_miners_loader_2a = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_miners_loader_2b = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_miners_loader_2c = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_miners_loader_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_miners_loader_4a = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_miners_loader_4b = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_miners_loader_4c = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_miners_loader_4d = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_miners_loader_5 = models.CharField(max_length=100, default=None, null=True, blank=True)

    below_ground_others_2a = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_others_2b = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_others_2c = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_others_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_others_4a = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_others_4b = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_others_4c = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_others_4d = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_others_5 = models.CharField(max_length=100, default=None, null=True, blank=True)

    opencast_overman_sirdars_2a = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_overman_sirdars_2b = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_overman_sirdars_2c = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_overman_sirdars_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_overman_sirdars_4a = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_overman_sirdars_4b = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_overman_sirdars_4c = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_overman_sirdars_4d = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_overman_sirdars_5 = models.CharField(max_length=100, default=None, null=True, blank=True)

    opencast_miners_loader_2a = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_miners_loader_2b = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_miners_loader_2c = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_miners_loader_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_miners_loader_4a = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_miners_loader_4b = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_miners_loader_4c = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_miners_loader_4d = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_miners_loader_5 = models.CharField(max_length=100, default=None, null=True, blank=True)

    opencast_others_2a = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_others_2b = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_others_2c = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_others_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_others_4a = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_others_4b = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_others_4c = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_others_4d = models.CharField(max_length=100, default=None, null=True, blank=True)
    opencast_others_5 = models.CharField(max_length=100, default=None, null=True, blank=True)

    aboveground_clerical_supervisory_staff_2a = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_clerical_supervisory_staff_2b = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_clerical_supervisory_staff_2c = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_clerical_supervisory_staff_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_clerical_supervisory_staff_4a = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_clerical_supervisory_staff_4b = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_clerical_supervisory_staff_4c = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_clerical_supervisory_staff_4d = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_clerical_supervisory_staff_5 = models.CharField(max_length=100, default=None, null=True, blank=True)

    aboveground_workers_2a = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_workers_2b = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_workers_2c = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_workers_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_workers_4a = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_workers_4b = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_workers_4c = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_workers_4d = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_workers_5 = models.CharField(max_length=100, default=None, null=True, blank=True)

    aboveground_others_2a = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_others_2b = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_others_2c = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_others_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_others_4a = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_others_4b = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_others_4c = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_others_4d = models.CharField(max_length=100, default=None, null=True, blank=True)
    aboveground_others_5 = models.CharField(max_length=100, default=None, null=True, blank=True)
    total_value = models.CharField(max_length=100, default=None, null=True, blank=True)

    class Meta:
        db_table = "dgms_coalmine_table_a"


#=======================================================================================================================
class DGMS_CoalMine_Table_B_Model(models.Model):
    for_own_use_generated = models.CharField(max_length=100, default=None, null=True, blank=True)
    for_own_use_purchased = models.CharField(max_length=100, default=None, null=True, blank=True)
    for_sale_generated = models.CharField(max_length=100, default=None, null=True, blank=True)
    for_sale_purchased = models.CharField(max_length=100, default=None, null=True, blank=True)
    system_of_supply_voltage = models.CharField(max_length=100, default=None, null=True, blank=True)
    system_of_supply_periodicity = models.CharField(max_length=100, default=None, null=True, blank=True)
    system_of_supply_source = models.CharField(max_length=100, default=None, null=True, blank=True)
    above_ground_lighting = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_lighting = models.CharField(max_length=100, default=None, null=True, blank=True)
    above_ground_power = models.CharField(max_length=100, default=None, null=True, blank=True)
    below_ground_power = models.CharField(max_length=100, default=None, null=True, blank=True)
    high_pressure = models.CharField(max_length=100, default=None, null=True, blank=True)
    medium_pressure = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_Winding = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_Winding = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_Winding = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_Winding = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_Ventilation = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_Ventilation = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_Ventilation = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_Ventilation = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_Haulage = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_Haulage = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_Haulage = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_Haulage = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_Pumping = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_Pumping = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_Pumping = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_Pumping = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_coal_washing = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_coal_washing = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_coal_washing = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_coal_washing = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_unit_workshop = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_workshop = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_workshop = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_workshop = models.CharField(max_length=100, default=None, null=True, blank=True)
    specify1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    specify1_in_use_no_of_unit = models.CharField(max_length=100, default=None, null=True, blank=True)
    specify1_in_use_total_hp = models.CharField(max_length=100, default=None, null=True, blank=True)
    specify1_in_reverse_number_of_unit = models.CharField(max_length=100, default=None, null=True, blank=True)
    specify1_in_reverse_total_hp = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_Winding1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_Winding1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_Winding1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_Winding1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_Haulage1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_Haulage1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_Haulage1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_Haulage1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_Ventilation1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_Ventilation1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_Ventilation1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_Ventilation1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_Pumping1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_Pumping1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_Pumping1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_Pumping1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_Other_portable_machines = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_Other_portable_machines = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_Other_portable_machines = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_Other_portable_machines = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_Conveyors = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_Conveyors = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_Conveyors = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_Conveyors = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_Electric_traction = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_Electric_traction = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_Electric_traction = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_Electric_traction = models.CharField(max_length=100, default=None, null=True, blank=True)
    specify2 = models.CharField(max_length=100, default=None, null=True, blank=True)

    specify2_in_use_no_of_unit = models.CharField(max_length=100, default=None, null=True, blank=True)
    specify2_in_use_total_hp = models.CharField(max_length=100, default=None, null=True, blank=True)
    specify2_in_reverse_number_of_unit = models.CharField(max_length=100, default=None, null=True, blank=True)
    specify2_in_reverse_total_hp = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_b_haulage = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_b_haulage = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reverse_number_of_units_b_haulage = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reverse_total_hp_b_haulage = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_b_ventilation = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_b_ventilation = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reverse_number_of_units_b_ventilation = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reverse_total_hp_b_ventilation = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_b_pumping = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_b_pumping = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reverse_number_of_units_b_pumping = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reverse_total_hp_b_pumping = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_b_coal_cutting_machine = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_b_coal_cutting_machine = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reverse_number_of_units_b_coal_cutting_machine = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reverse_total_hp_b_coal_cutting_machine = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_b_portable_machine = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_b_portable_machine = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reverse_number_of_units_b_portable_machine = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reverse_total_hp_b_portable_machine = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_b_conveyors = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_b_conveyors = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reverse_number_of_units_b_conveyors = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reverse_total_hp_b_conveyors = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_b_electric_traction = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_b_electric_traction = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reverse_number_of_units_b_electric_traction = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reverse_total_hp_b_electric_traction = models.CharField(max_length=100, default=None, null=True, blank=True)
    specify3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    specify3_in_use_no_of_unit = models.CharField(max_length=100, default=None, null=True, blank=True)
    specify3_in_use_total_hp = models.CharField(max_length=100, default=None, null=True, blank=True)
    specify3_in_reverse_number_of_unit = models.CharField(max_length=100, default=None, null=True, blank=True)
    specify3_in_reverse_total_hp = models.CharField(max_length=100, default=None, null=True, blank=True)
    total_1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    total_2 = models.CharField(max_length=100, default=None, null=True, blank=True)
    total_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = "dgms_coalmine_table_b"

class DGMS_CoalMine_Table_C_Model(models.Model):
    in_use_number_of_units_boilers = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_boilers = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_boilers = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_boilers = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_steam_turbines = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_steam_turbines = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_steam_turbines = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_steam_turbines = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_diesel_engines = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_diesel_engines = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_diesel_engines = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_diesel_engines = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_gasoline = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_gasoline = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_gasoline = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_gasoline = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_hydraulic_turbines = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_hydraulic_turbines = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_hydraulic_turbines = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_hydraulic_turbines = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_air_compressors = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_air_compressors = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_air_compressors = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_air_compressors = models.CharField(max_length=100, default=None, null=True, blank=True)
    total1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_winding = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_winding = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_winding = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_winding = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_ventilation = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_ventilation = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_ventilation = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_ventilation = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_haulage = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_haulage = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_haulage = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_haulage = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_pumping = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_pumping = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_pumping = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_pumping = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_mineral_dressing_plants = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_mineral_dressing_plants = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_mineral_dressing_plants = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_mineral_dressing_plants = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_workshops = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_workshops = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_workshops = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_workshops = models.CharField(max_length=100, default=None, null=True, blank=True)
    specify1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_specify1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_specify1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_specify1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_specify1 = models.CharField(max_length=100, default=None, null=True, blank=True)
    total2 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_iii_haulage = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_iii_haulage = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_iii_haulage = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_iii_haulage = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_iii_ventilation = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_iii_ventilation = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_iii_ventilation = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_iii_ventilation = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_iii_pumping = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_iii_pumping = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_iii_pumping = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_iii_pumping = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_iii_locomotives = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_iii_locomotives = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_iii_locomotives = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_iii_locomotives = models.CharField(max_length=100, default=None, null=True, blank=True)
    specify2 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_number_of_units_specify2 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_use_total_hp_specify2 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_number_of_units_specify2 = models.CharField(max_length=100, default=None, null=True, blank=True)
    in_reserve_total_hp_specify2 = models.CharField(max_length=100, default=None, null=True, blank=True)
    total3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    class Meta:
        db_table = "dgms_coalmine_table_c"


class DGMS_CoalMine_Table_D_Model(models.Model):
    name_of_explosive = models.CharField(max_length=100, default=None, null=True, blank=True)
    quantity = models.CharField(max_length=100, default=None, null=True, blank=True)
    electric = models.CharField(max_length=100, default=None, null=True, blank=True)
    ordinary = models.CharField(max_length=100, default=None, null=True, blank=True)
    name_and_type_of_safty_lamps = models.CharField(max_length=100, default=None, null=True, blank=True)
    lead_rivet = models.CharField(max_length=100, default=None, null=True, blank=True)
    magnetic = models.CharField(max_length=100, default=None, null=True, blank=True)
    other = models.CharField(max_length=100, default=None, null=True, blank=True)
    name_and_size_of_mech_ventilator = models.CharField(max_length=100, default=None, null=True, blank=True)
    position = models.CharField(max_length=100, default=None, null=True, blank=True)
    avarage_total_quantity = models.CharField(max_length=100, default=None, null=True, blank=True)
    water_gauge_obtaied = models.CharField(max_length=100, default=None, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = "dgms_coalmine_table_d"

class DGMS_CoalMine_Table_E_Model(models.Model):
    coal_openstock_year = models.IntegerField(default=None, null=True, blank=True)
    coal_endstock_year = models.IntegerField(default=None, null=True, blank=True)
    coke_openstock_year =models.IntegerField(default=None, null=True, blank=True)
    coke_endstock_year = models.IntegerField(default=None, null=True, blank=True)
    selected_a_openstock = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_a_coal_raised = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_a_total_value_of_rasing = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_a_total_of_col_2_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_a_coal_despatched = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_a_collery_consumption = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_a_coal_used_for_cooking = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_a_shortage_due_to_cause = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_a_closing_stocks = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_a_total_columns = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_b_openstock = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_b_coal_raised = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_b_total_value_of_rasing = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_b_total_of_col_2_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_b_coal_despatched = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_b_collery_consumption = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_b_coal_used_for_cooking = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_b_shortage_due_to_cause = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_b_closing_stocks = models.CharField(max_length=100, default=None, null=True, blank=True)
    selected_b_total_columns = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_1_openstock = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_1_coal_raised = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_1_total_value_of_rasing = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_1_total_of_col_2_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_1_coal_despatched = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_1_collery_consumption = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_1_coal_used_for_cooking = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_1_shortage_due_to_cause = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_1_closing_stocks = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_1_total_columns = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_2_openstock = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_2_coal_raised = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_2_total_value_of_rasing = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_2_total_of_col_2_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_2_coal_despatched = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_2_collery_consumption = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_2_coal_used_for_cooking = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_2_shortage_due_to_cause = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_2_closing_stocks = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_2_total_columns = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_3_openstock = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_3_coal_raised = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_3_total_value_of_rasing = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_3_total_of_col_2_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_3_coal_despatched = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_3_collery_consumption = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_3_coal_used_for_cooking = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_3_shortage_due_to_cause = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_3_closing_stocks = models.CharField(max_length=100, default=None, null=True, blank=True)
    grade_3_total_columns = models.CharField(max_length=100, default=None, null=True, blank=True)
    openstock_total = models.CharField(max_length=100, default=None, null=True, blank=True)
    coal_raised_total = models.CharField(max_length=100, default=None, null=True, blank=True)
    total_value_of_rasing_total = models.CharField(max_length=100, default=None, null=True, blank=True)
    total_of_col_2_3_total = models.CharField(max_length=100, default=None, null=True, blank=True)
    coal_despatched_total = models.CharField(max_length=100, default=None, null=True, blank=True)
    collery_consumption_total = models.CharField(max_length=100, default=None, null=True, blank=True)
    coal_used_for_cooking_total = models.CharField(max_length=100, default=None, null=True, blank=True)
    shortage_due_to_cause_total = models.CharField(max_length=100, default=None, null=True, blank=True)
    closing_stocks_total = models.CharField(max_length=100, default=None, null=True, blank=True)
    total_columns_total = models.CharField(max_length=100, default=None, null=True, blank=True)
    coke_hard_opening_stock = models.CharField(max_length=100, default=None, null=True, blank=True)
    coke_hard_coke_manufactured = models.CharField(max_length=100, default=None, null=True, blank=True)
    coke_hard_total_value_of_coke = models.CharField(max_length=100, default=None, null=True, blank=True)
    coke_hard_total_col_2_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    coke_hard_coke_despatched = models.CharField(max_length=100, default=None, null=True, blank=True)
    coke_hard_colliery_consumption = models.CharField(max_length=100, default=None, null=True, blank=True)
    coke_hard_coke_shortage = models.CharField(max_length=100, default=None, null=True, blank=True)
    coke_hard_closing_stock = models.CharField(max_length=100, default=None, null=True, blank=True)
    coke_hard_total_column_total = models.CharField(max_length=100, default=None, null=True, blank=True)
    coke_soft_opening_stock = models.CharField(max_length=100, default=None, null=True, blank=True)
    coke_soft_coke_manufactured = models.CharField(max_length=100, default=None, null=True, blank=True)
    coke_soft_total_value_of_coke = models.CharField(max_length=100, default=None, null=True, blank=True)
    coke_soft_total_col_2_3 = models.CharField(max_length=100, default=None, null=True, blank=True)
    coke_soft_coke_despatched = models.CharField(max_length=100, default=None, null=True, blank=True)
    coke_soft_colliery_consumption = models.CharField(max_length=100, default=None, null=True, blank=True)
    coke_soft_coke_shortage = models.CharField(max_length=100, default=None, null=True, blank=True)
    coke_soft_closing_stock = models.CharField(max_length=100, default=None, null=True, blank=True)
    coke_soft_total_column_total = models.CharField(max_length=100, default=None, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = "dgms_coalmine_table_e"

class First_Schedule_Form_iii_Model(models.Model):
    signature = models.ImageField(upload_to='dgms_annual_report_signature_image/First_Schedule_Form_iii/', null=True, blank=False)
    # 1 =============================================
    mine_name =  models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=True, blank=True)
    # 2 =============================================
    year = models.IntegerField(default=None, null=True, blank=True)
    mine_address = models.CharField(max_length=500,default=None,null=True,blank=True)
    mine_dop = models.DateField(blank=True, null=True)
    mine_doc = models.DateField(blank=True, null=True)
    mine_district = models.CharField(max_length=100, default=None, null=True, blank=True)
    mine_state = models.CharField(max_length=100, default=None, null=True, blank=True)
    owner_name = models.CharField(max_length=100, default=None, null=True, blank=True)
    owner_address = models.CharField(max_length=500, default=None, null=True, blank=True)
    managing_agent = models.CharField(max_length=100, default=None, null=True, blank=True)
    managing_agent_address = models.CharField(max_length=500, default=None, null=True, blank=True)
    agent_name = models.CharField(max_length=100, default=None, null=True, blank=True)
    agent_address = models.CharField(max_length=500, default=None, null=True, blank=True)
    manager_name = models.CharField(max_length=100, default=None, null=True, blank=True)
    manager_address = models.CharField(max_length=500, default=None, null=True, blank=True)
    superior_supervisory_staff = models.CharField(max_length=100, default=None, null=True, blank=True)
    whether_machinery_is_used = models.CharField(max_length=100, default=None, null=True, blank=True)
    nature_of_power_used = models.CharField(max_length=100, default=None, null=True, blank=True)
    a_to_f_fillerd_and_attached = models.CharField(max_length=100, default=None, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    class Meta:
        db_table = "dgms_first_schedule_form_iii"
