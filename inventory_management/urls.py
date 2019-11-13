from django.urls import path
from inventory_management import views


app_name = 'inventory_management'

urlpatterns = [
      # ----------------------Supplier Details---------------------------------
    path('supplier_add/', views.supplier_add, name='supplier_add'),
    path('supplier_manage/', views.supplier_manage, name='supplier_manage'),
    path('supplier_edit/<int:pk>', views.supplier_edit, name='supplier_edit'),
    path('supplier_delete/<int:pk>', views.supplier_delete, name='supplier_delete'),
       # ----------------------Category Details---------------------------------
    path('category_add', views.category_add, name='category_add'),
    path('category_manage/', views.category_manage, name='category_manage'),
    path('category_edit/<int:pk>', views.category_edit, name='category_edit'),
    path('category_delete/<int:pk>', views.category_delete, name='category_delete'),

      # ----------------------Product Details---------------------------------
    path('product_add/', views.product_add, name='product_add'),
    path('product_manage/', views.product_manage, name='product_manage'),
    path('product_edit/<int:pk>', views.product_edit, name='product_edit'),
    path('product_delete/<int:pk>', views.product_delete, name='product_delete'),


      # ----------------------Ajax---------------------------------
    path('fetch_supplier_ajax/', views.fetch_supplier_ajax, name='fetch_supplier_ajax'),

          # ----------------------View All---------------------------------
    path('view_product/', views.view_product, name='view_product'),

  
  #----------------------Reports----------------------------------------------
    path('view_expiredReport/', views.view_expiredReport, name='view_expiredReport'),
    path('fetch_category_ajax/', views.fetch_category_ajax, name='fetch_category_ajax'),
    
    path('fetch_product_ajax/', views.fetch_product_ajax, name='fetch_product_ajax'),
    path('fetch_expiry_report_ajax/', views.fetch_expiry_report_ajax, name='fetch_expiry_report_ajax'),
    
    path('CategoryWiseReport/', views.CategoryWiseReport, name='CategoryWiseReport'),
    path('fetch_CategoryWiseReport_ajax/', views.fetch_CategoryWiseReport_ajax, name='fetch_CategoryWiseReport_ajax'),
    path('CategoryWiseViewAll/', views.CategoryWiseViewAll, name='CategoryWiseViewAll'),
    path('BatchWiseViewAll/', views.BatchWiseViewAll, name='BatchWiseViewAll'),

    #----------------------Reports----------------------------------------------
    path('utilizationReport/', views.utilizationReport, name='utilizationReport'),
    path('fetch_longpending/', views.fetch_longpending, name='fetch_longpending'),

     #----------------------Outof stock Reports----------------------------------------------
    path('OutOfStock/', views.OutOfStock, name='OutOfStock'),
    path('ExpiredProdView/', views.ExpiredProdView, name='ExpiredProdView'),

     

     #----------------------Deduct Inventory/ Lost Goods and Stock Adjustment----------------------------------------------
      
    path('Inventory_deduct', views.Inventory_deduct, name='Inventory_deduct'),
    path('fetch_inventory_deduct_ajax', views.fetch_inventory_deduct_ajax, name='fetch_inventory_deduct_ajax'),
    path('update_inventory_ajax', views.update_inventory_ajax, name='update_inventory_ajax'),


    #----------------------Deduct branch Inventory/ Lost Goods and Stock Adjustment----------------------------------------------
    path('inventory_branchdeduct', views.inventory_branchdeduct, name='inventory_branchdeduct'),
    path('fetch_branch_category', views.fetch_branch_category, name='fetch_branch_category'),
    path('fetch_deduct_branch_inventory', views.fetch_deduct_branch_inventory, name='fetch_deduct_branch_inventory'),
    # path('update_inventory_ajax', views.update_inventory_ajax, name='update_inventory_ajax'),
    path('update_branch_inventory_ajax', views.update_branch_inventory_ajax, name='update_branch_inventory_ajax'),
    
  

    path('search', views.search, name='search'),
    # # url(r'^ajax_calls/search/', autocompleteModel),
    path('fetch_search_ajax', views.fetch_search_ajax, name='fetch_search_ajax'),

    path('inventory_reorder', views.inventory_reorder, name='inventory_reorder'),
    path('fetch_inventory_reorder_ajax', views.fetch_inventory_reorder_ajax, name='fetch_inventory_reorder_ajax'),
    path('update_inventory_ajax_add', views.update_inventory_ajax_add, name='update_inventory_ajax_add'),
    path('fetch_batch_ajax/', views.fetch_batch_ajax, name='fetch_batch_ajax'),
    
     # ----------------------Branch Details---------------------------------

    path('distribute_prod/', views.distribute_prod, name='distribute_prod'),
    path('fetch_mine_branch', views.fetch_mine_branch, name='fetch_mine_branch'),
    path('fetch_assign_id', views.fetch_assign_id, name='fetch_assign_id'),
    path('distribution', views.distribution, name='distribution'),
    
 
     # ----------------------Branch Details---------------------------------
    path('settings', views.settings, name='settings'),
    path('manageAll', views.manageAll, name='manageAll'),
    path('branch_manage/', views.branch_manage, name='branch_manage'),
    path('branch_edit/<int:pk>', views.branch_edit, name='branch_edit'),
    path('branch_delete/<int:pk>', views.branch_delete, name='branch_delete'),
    path('outlet_viewall/', views.outlet_viewall, name='outlet_viewall'),
    path('OutletOutOfStock/', views.OutletOutOfStock, name='OutletOutOfStock'),
    path('OutletExpiredView/', views.OutletExpiredView, name='OutletExpiredView'),

     # ----------------------Delete Expired---------------------------------
    path('deleteExpired/', views.deleteExpired, name='deleteExpired'),
    
    # ----------------------About to  Expired---------------------------------
    path('abtExpired/', views.abtExpired, name='abtExpired'),
    path('fetch_abtExpire/', views.fetch_abtExpire, name='fetch_abtExpire'),
    # ----------------------About to  Out Of Stock---------------------------------

    path('abtOutOfStock/', views.abtOutOfStock, name='abtOutOfStock'),
    path('fetch_abtOutOfStock/', views.fetch_abtOutOfStock, name='fetch_abtOutOfStock'),

    #-----------------------Alternate Product-------------------------------------
    path('altProd_manage/', views.altProd_manage, name='altProd_manage'),
    path('altProd_edit/<int:pk>', views.altProd_edit, name='altProd_edit'),
    path('altProd_delete/<int:pk>', views.altProd_delete, name='altProd_delete'),

 
    

]


