
# Create your models here.
from django.db import models
from django.utils import timezone
# Create your models here.
# Create your models here.
from django.db import models
# Create your models here.
from employee1.models import MineDetails
from datetime import date, datetime
# from django.db import models
# from phone_field import PhoneField
# from phonenumber_field.modelfields import PhoneNumberField


class SupplierModel(models.Model):
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=True, blank=True)
    # business_name = models.CharField(max_length=100, null=True, blank=True)
    business_name = models.CharField(max_length=100,null=True,blank=True)
    business_website = models.CharField(max_length=100, null=True, blank=True)
    name = models.CharField(max_length=200, null=True, blank=True)
    # mobile_no=models.CharField(max_length=100,default='0000000000',blank=True,null=True)
    mobile_no = models.BigIntegerField(blank=True,null=True)
    # mobile_no=PhoneNumberField(null=False, blank=False, unique=True)
    email= models.EmailField(null=True,blank=True,default='abc@gmail.com')
    pincode= models.IntegerField(blank=True, null=True)
    address= models.CharField(max_length=400, null=True, blank=True)
    landmark= models.CharField(max_length=400, null=True, blank=True)
    area= models.CharField(max_length=200, null=True, blank=True)
    city= models.TextField(default='')
    state= models.CharField(max_length=100,blank=True)
    map_loc= models.CharField(max_length=400, null=True, blank=True)
    pan= models.CharField(max_length=200, null=True, blank=True)
    gstin= models.CharField(max_length=200, null=True, blank=True)
    notes= models.CharField(max_length=200, null=True, blank=True)

    def __str__(self):
     return self.business_name
    class Meta:
        db_table = "Supplier_Details"

class CategoryModel(models.Model):
    prod_category = models.CharField(max_length=100,null=True)
    
    def __str__(self):
        return self.prod_category
    class Meta:
        db_table = "category_details"


class AlternateProdModel(models.Model):
    prod_id = models.CharField(max_length=100,null=True)
    mine_id = models.IntegerField(null=True, blank=True)
    batch_number= models.CharField(max_length=100,null=True)
    alter_product = models.CharField(max_length=100,null=True)
    
    def __str__(self):
        return self.prod_id
    class Meta:
        db_table = "AlternateProdModel"
        

class BranchModel(models.Model):
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=True, blank=True)
    branch_nm = models.CharField(max_length=100,null=True)  
    def __str__(self):
        return self.branch_nm
    class Meta:
        db_table = "branch_details"
        
class ProductModel(models.Model):
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=True, blank=True)
    business_name = models.IntegerField(null=True, blank=True)
    #########   Product Details  #################
    prod_category = models.ForeignKey(CategoryModel, on_delete=models.CASCADE, null=True, blank=True)
    prod_name = models.CharField(max_length=100,null=True)
    # #########   Purchase As  #################
    alternate_prod = models.CharField(max_length=100,null=True)
    unit = models.CharField(max_length=100,null=True)

        # #########   PRICING AND INVENTORY  #################
    invoice_no = models.CharField(max_length=100, null=True, blank=True)
    prod_expiry=models.DateField(blank=True,null=True,default=date.today)
    quantity= models.IntegerField(null=True)
    price= models.FloatField(null=True, blank=True)
    batch_number = models.CharField(max_length=100,null=True)
    barcode = models.CharField(max_length=100,null=True)
    tax= models.CharField(max_length=100,null=True, blank=True)
    rate=models.FloatField(null=True,blank=True,default='18.0')
    total_tax= models.FloatField(null=True)
    net_amount= models.FloatField(null=True)

        # #########   Additional  Details   #################
    info_any=models.CharField(max_length=200,null=True)
    entry_date=models.DateField(blank=True,null=True,default=date.today)
    initial_quantity=models.IntegerField(blank=True,null=True)
    
    def __str__(self):
        return self.prod_name
    def __str__(self):
        return self.batch_number
 
    class Meta:
        db_table = "product_details"

class DistributeModel(models.Model):
    # token=models.CharField(max_length=100,null=True)
    distribution_date=models.DateField(blank=True,null=True,default=date.today)
    # distribution_date = models.DateTimeField(default=datetime.now, blank=True)
    mine_id=models.IntegerField(null=True)
    mine_name = models.CharField(max_length=100,null=True)
    branch_name = models.CharField(max_length=100,null=True)
    prod_category = models.CharField(max_length=100,null=True)
    prod_name = models.CharField(max_length=100,null=True)
    batch_number = models.CharField(max_length=100,null=True)
    # unit = models.CharField(max_length=100,null=True)
    # net_weight = models.CharField(max_length=100,null=True)
    assign_quantity=models.IntegerField(null=True)
    quantity= models.CharField(max_length=100,null=True) 
    prod_unique_id=models.IntegerField(null=True)

    class Meta:
        db_table = "Distribution_details"

class DeductModel(models.Model):
    # deduct_date= models.DateTimeField(default=timezone.now)
    deduct_date=models.DateField(blank=True,null=True,default=date.today)
    created_on=models.DateTimeField(null=True)
    productDetails_id = models.IntegerField(null=True)
    mine_id = models.CharField(max_length=100,null=True)
    branch_id = models.CharField(max_length=100,null=True)
    prod_category = models.CharField(max_length=100,null=True)
    prod_name = models.CharField(max_length=100,null=True)
    barcode = models.CharField(max_length=100,null=True)
    batch_number = models.CharField(max_length=100,null=True) 
    quantity= models.IntegerField(null=True)
    outstock= models.IntegerField(null=True)
    updated_quantity= models.IntegerField(null=True)

    class Meta:
        db_table = "deduct_details"

class ReorderModel(models.Model):
    Reorder_date= models.DateTimeField(default=timezone.now)
    creationdate=models.DateTimeField(default=timezone.now)
    mine_id = models.CharField(max_length=100,null=True)
    prod_category = models.CharField(max_length=100,null=True)
    product_id = models.IntegerField(null=True)
    prod_name = models.CharField(max_length=100,null=True)
    barcode = models.CharField(max_length=100,null=True)
    batch_number = models.CharField(max_length=100,null=True) 
    quantity= models.IntegerField(null=True)
    addedstock= models.IntegerField(null=True)
    updated_quantity= models.IntegerField(null=True)

    class Meta:
        db_table = "reorder_details"