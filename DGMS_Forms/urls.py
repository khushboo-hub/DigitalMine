
from django.urls import path

from DGMS_Forms import views

app_name='DGMS_Forms'

urlpatterns = [
    path('Add_DGMS_CoalMine_Annual_Annexure_I', views.Add_DGMS_CoalMine_Annual_Annexure_I,
         name='Add_DGMS_CoalMine_Annual_Annexure_I'),
    path('Manage_DGMS_CoalMine_Annual_Annexure_I', views.Manage_DGMS_CoalMine_Annual_Annexure_I,
         name='Manage_DGMS_CoalMine_Annual_Annexure_I'),
    path('Edit_DGMS_CoalMine_Annual_Annexure_I/<int:id>', views.Edit_DGMS_CoalMine_Annual_Annexure_I,
         name='Edit_DGMS_CoalMine_Annual_Annexure_I'),
    path('View_DGMS_CoalMine_Annual_Annexure_I/<int:id>', views.View_DGMS_CoalMine_Annual_Annexure_I,
         name='View_DGMS_CoalMine_Annual_Annexure_I'),
    path('Delete_DGMS_CoalMine_Annual_Annexure_I/<int:id>', views.Delete_DGMS_CoalMine_Annual_Annexure_I,
         name='Delete_DGMS_CoalMine_Annual_Annexure_I'),
    #=============================================================================================
    path('fetch_mine', views.fetch_mine, name='fetch_mine'),
    path('fetch_mine_manager', views.fetch_mine_manager, name='fetch_mine_manager'),
    #=============================================================================================
    path('Add_DGMS_MetalliferousMines_Annual_Annexure_II', views.Add_DGMS_MetalliferousMines_Annual_Annexure_II,
         name='Add_DGMS_MetalliferousMines_Annual_Annexure_II'),
    path('Manage_DGMS_MetalliferousMines_Annual_Annexure_II', views.Manage_DGMS_MetalliferousMines_Annual_Annexure_II,
         name='Manage_DGMS_MetalliferousMines_Annual_Annexure_II'),
    path('View_DGMS_MetalliferousMines_Annual_Annexure_II/<int:id>',
         views.View_DGMS_MetalliferousMines_Annual_Annexure_II,
         name='View_DGMS_MetalliferousMines_Annual_Annexure_II'),
    path('Edit_DGMS_MetalliferousMines_Annual_Annexure_II/<int:id>',
         views.Edit_DGMS_MetalliferousMines_Annual_Annexure_II,
         name='Edit_DGMS_MetalliferousMines_Annual_Annexure_II'),
    path('Delete_DGMS_MetalliferousMines_Annual_Annexure_II/<int:id>',
         views.Delete_DGMS_MetalliferousMines_Annual_Annexure_II,
         name='Delete_DGMS_MetalliferousMines_Annual_Annexure_II'),
    #=============================================================================================
    path('Add_DGMS_OilMines_Annual_Annexure_III', views.Add_DGMS_OilMines_Annual_Annexure_III,
         name='Add_DGMS_OilMines_Annual_Annexure_III'),
    path('Manage_DGMS_OilMines_Annual_Annexure_III', views.Manage_DGMS_OilMines_Annual_Annexure_III,
         name='Manage_DGMS_OilMines_Annual_Annexure_III'),
    path('Edit_DGMS_OilMines_Annual_Annexure_III/<int:id>', views.Edit_DGMS_OilMines_Annual_Annexure_III,
         name='Edit_DGMS_OilMines_Annual_Annexure_III'),
    path('View_DGMS_OilMines_Annual_Annexure_III/<int:id>', views.View_DGMS_OilMines_Annual_Annexure_III,
         name='View_DGMS_OilMines_Annual_Annexure_III'),
    path('Delete_DGMS_OilMines_Annual_Annexure_III/<int:id>', views.Delete_DGMS_OilMines_Annual_Annexure_III,
         name='Delete_DGMS_OilMines_Annual_Annexure_III'),
    #==========================================================================================================
    path('Manage_DGMS_CoalMine_table_A', views.Manage_DGMS_CoalMine_table_A,name='Manage_DGMS_CoalMine_table_A'),
    path('Add_DGMS_CoalMine_table_A', views.Add_DGMS_CoalMine_table_A, name='Add_DGMS_CoalMine_table_A'),
    path('View_DGMS_CoalMine_table_A/<int:id>', views.View_DGMS_CoalMine_table_A,name='View_DGMS_CoalMine_table_A'),
    path('Edit_DGMS_CoalMine_table_A/<int:id>', views.Edit_DGMS_CoalMine_table_A,name='Edit_DGMS_CoalMine_table_A'),
    path('Delete_DGMS_CoalMine_table_A/<int:id>', views.Delete_DGMS_CoalMine_table_A,name='Delete_DGMS_CoalMine_table_A'),
    #-------------------------------------------------------------------------------------------------------------------
    path('Add_DGMS_CoalMine_table_B', views.Add_DGMS_CoalMine_table_B,name='Add_DGMS_CoalMine_table_B'),
    path('Manage_DGMS_CoalMine_table_B', views.Manage_DGMS_CoalMine_table_B,name='Manage_DGMS_CoalMine_table_B'),
    path('Edit_DGMS_CoalMine_table_B/<int:id>', views.Edit_DGMS_CoalMine_table_B,name='Edit_DGMS_CoalMine_table_B'),
    path('View_DGMS_CoalMine_table_B/<int:id>', views.View_DGMS_CoalMine_table_B,name='View_DGMS_CoalMine_table_B'),
    path('Delete_DGMS_CoalMine_table_B/<int:id>', views.Delete_DGMS_CoalMine_table_B,name='Delete_DGMS_CoalMine_table_B'),
    #-------------------------------------------------------------------------------------------------------------------
    path('Add_DGMS_CoalMine_table_C', views.Add_DGMS_CoalMine_table_C,name='Add_DGMS_CoalMine_table_C'),
    path('Manage_DGMS_CoalMine_table_C', views.Manage_DGMS_CoalMine_table_C,name='Manage_DGMS_CoalMine_table_C'),
    path('Edit_DGMS_CoalMine_table_C/<int:id>', views.Edit_DGMS_CoalMine_table_C, name='Edit_DGMS_CoalMine_table_C'),
    path('View_DGMS_CoalMine_table_C/<int:id>', views.View_DGMS_CoalMine_table_C, name='View_DGMS_CoalMine_table_C'),
    path('Delete_DGMS_CoalMine_table_C/<int:id>', views.Delete_DGMS_CoalMine_table_C,name='Delete_DGMS_CoalMine_table_C'),
    #-------------------------------------------------------------------------------------------------------------------
    path('Add_DGMS_CoalMine_table_D', views.Add_DGMS_CoalMine_table_D,name='Add_DGMS_CoalMine_table_D'),
    path('Manage_DGMS_CoalMine_table_D', views.Manage_DGMS_CoalMine_table_D,name='Manage_DGMS_CoalMine_table_D'),
    path('Edit_DGMS_CoalMine_table_D/<int:id>', views.Edit_DGMS_CoalMine_table_D, name='Edit_DGMS_CoalMine_table_D'),
    path('View_DGMS_CoalMine_table_D/<int:id>', views.View_DGMS_CoalMine_table_D, name='View_DGMS_CoalMine_table_D'),
    path('Delete_DGMS_CoalMine_table_D/<int:id>', views.Delete_DGMS_CoalMine_table_D,name='Delete_DGMS_CoalMine_table_D'),
    #-------------------------------------------------------------------------------------------------------------------
    path('Add_DGMS_CoalMine_table_E', views.Add_DGMS_CoalMine_table_E,name='Add_DGMS_CoalMine_table_E'),
    path('Manage_DGMS_CoalMine_table_E', views.Manage_DGMS_CoalMine_table_E,name='Manage_DGMS_CoalMine_table_E'),
    path('Edit_DGMS_CoalMine_table_E/<int:id>', views.Edit_DGMS_CoalMine_table_E, name='Edit_DGMS_CoalMine_table_E'),
    path('View_DGMS_CoalMine_table_E/<int:id>', views.View_DGMS_CoalMine_table_E, name='View_DGMS_CoalMine_table_E'),
    path('Delete_DGMS_CoalMine_table_E/<int:id>', views.Delete_DGMS_CoalMine_table_E,name='Delete_DGMS_CoalMine_table_E'),
    #-------------------------------------------------------------------------------------------------------------------
    path('Add_First_Schedule_Form_iii', views.Add_First_Schedule_Form_iii,name='Add_First_Schedule_Form_iii'),
    path('Manage_First_Schedule_Form_iii', views.Manage_First_Schedule_Form_iii,name='Manage_First_Schedule_Form_iii'),
    path('Edit_First_Schedule_Form_iii/<int:id>', views.Edit_First_Schedule_Form_iii, name='Edit_First_Schedule_Form_iii'),
    path('View_First_Schedule_Form_iii/<int:id>', views.View_First_Schedule_Form_iii, name='View_First_Schedule_Form_iii'),
    path('Delete_First_Schedule_Form_iii/<int:id>', views.Delete_First_Schedule_Form_iii,name='Delete_First_Schedule_Form_iii'),
    #--------------------------------------------------------------------------------------------------------------------------
    path('sendMail', views.sendMail, name='sendMail'),
    path('some', views.some, name='some'),
    path('mail', views.mail, name='mail'),
    #-------------------------------------------------------------------------------------------------------------------
    path('AddVentilation', views.AddVentilation, name='AddVentilation'),
    path('ManageVentilation', views.ManageVentilation, name='ManageVentilation'),
    path('EditVentilation/<int:id>', views.EditVentilation, name='EditVentilation'),
    path('ViewVentilation/<int:id>', views.ViewVentilation, name='ViewVentilation'),
    path('DeleteVentilation/<int:id>', views.DeleteVentilation,name='DeleteVentilation'),
#-------------------------------------------------------------------------------------------------------------------
    path('Add_First_Schedule_Form_V', views.Add_First_Schedule_Form_V, name='Add_First_Schedule_Form_V'),
    path('Manage_First_Schedule_Form_V', views.Manage_First_Schedule_Form_V, name='Manage_First_Schedule_Form_V'),
    path('Edit_First_Schedule_Form_V/<int:id>', views.Edit_First_Schedule_Form_V, name='Edit_First_Schedule_Form_V'),
    path('View_First_Schedule_Form_V/<int:id>', views.View_First_Schedule_Form_V, name='View_First_Schedule_Form_V'),
    path('Delete_First_Schedule_Form_V/<int:id>', views.Delete_First_Schedule_Form_V,name='Delete_First_Schedule_Form_V'),
#-------------------------------------------------------------------------------------------------------------------
    path('add_development_permission', views.add_development_permission, name='add_development_permission'),
    path('manage_development_permission', views.manage_development_permission, name='manage_development_permission'),
    path('edit_development_permission/<int:id>', views.edit_development_permission, name='edit_development_permission'),
    path('view_development_permission/<int:id>', views.view_development_permission, name='view_development_permission'),
    path('delete_development_permission/<int:id>', views.delete_development_permission,name='delete_development_permission'),

#----------------------------------------------------------------------------------------------------------------------
    path('add_identification_report_of_the_problem', views.add_identification_report_of_the_problem, name='add_identification_report_of_the_problem'),
    path('manage_identification_report_of_the_problem', views.manage_identification_report_of_the_problem, name='manage_identification_report_of_the_problem'),
    path('edit_identification_report_of_the_problem/<int:id>', views.edit_identification_report_of_the_problem, name='edit_identification_report_of_the_problem'),
    path('view_identification_report_of_the_problem/<int:id>', views.view_identification_report_of_the_problem, name='view_identification_report_of_the_problem'),
    path('delete_identification_report_of_the_problem/<int:id>', views.delete_identification_report_of_the_problem,name='delete_identification_report_of_the_problem'),

#-----------------------------------------------------------------------------------------------------------------------

    path('add_extract_or_reduce_pillars', views.add_extract_or_reduce_pillars,name='add_extract_or_reduce_pillars'),
    path('manage_extract_or_reduce_pillars', views.manage_extract_or_reduce_pillars,name='manage_extract_or_reduce_pillars'),
    path('edit_extract_or_reduce_pillars/<int:id>', views.edit_extract_or_reduce_pillars,name='edit_extract_or_reduce_pillars'),
    path('view_extract_or_reduce_pillars/<int:id>', views.view_extract_or_reduce_pillars,name='view_extract_or_reduce_pillars'),
    path('delete_extract_or_reduce_pillars/<int:id>', views.delete_extract_or_reduce_pillars,name='delete_extract_or_reduce_pillars'),

#-----------------------------------------------------------------------------------------------------------------------
    path('add_metal_mine_extract_permission', views.add_metal_mine_extract_permission,name='add_metal_mine_extract_permission'),
    path('manage_metal_mine_extract_permission', views.manage_metal_mine_extract_permission,name='manage_metal_mine_extract_permission'),
    path('edit_metal_mine_extract_permission/<int:id>', views.edit_metal_mine_extract_permission,name='edit_metal_mine_extract_permission'),
    path('view_metal_mine_extract_permission/<int:id>', views.view_metal_mine_extract_permission, name='view_metal_mine_extract_permission'),
    path('delete_metal_mine_extract_permission/<int:id>', views.delete_metal_mine_extract_permission,name='delete_metal_mine_extract_permission'),

]