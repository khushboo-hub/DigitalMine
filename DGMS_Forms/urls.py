
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
    #-------------------------------------------------------------------------------------------------------------------
    path('sendMail', views.sendMail, name='sendMail'),
    path('some', views.some, name='some'),
    path('mail', views.mail, name='mail')
]