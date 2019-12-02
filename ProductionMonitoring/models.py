
from django.db import models
from employee1.models import MineDetails
from employee1.models import MineShift
from datetime import date, datetime


# Create your models here.
class Production_Vehicle(models.Model):
    mine_id = models.ForeignKey(MineDetails,on_delete=models.CASCADE,null=False,blank=False)
    rfid = models.TextField(max_length=200, blank=True, null=True)
    vehicle_reg_no=models.CharField(max_length=200,null=True,blank=True)
    type_of_vehicle=models.CharField(max_length=200,null=True,blank=True)
    reg_laden_weight_of_the_vehicle=models.FloatField(null=True,blank=True)
    reg_laden_weight_of_the_vehicles=models.CharField(max_length=200,null=True,blank=True)
    o_name = models.CharField(max_length=100)
    o_address = models.CharField(max_length=100,null=True,blank=True)
    o_email = models.EmailField(null=True,blank=True)
    o_mob=models.CharField(max_length=100,default='0000000000',blank=True,null=True)
    d_name = models.CharField(max_length=100)
    d_address = models.CharField(max_length=100, null=True, blank=True)
    d_email = models.EmailField(default='example@example.com',null=True,blank=True)
    d_mob = models.CharField(max_length=100, default='0000000000', blank=True, null=True)
    d_photo=models.ImageField(upload_to = 'driver_image/',null=True,blank=True)
    t_name = models.CharField(max_length=100)
    t_address = models.CharField(max_length=100, null=True, blank=True)
    t_email = models.EmailField(default='example@example.com',null=True,blank=True)
    w_no = models.CharField(max_length=200,null=True,blank=True)
    dates = models.DateField(default=datetime.now, blank=True)
    party_details= models.CharField(max_length=200, null=True, blank=True)
    sale= models.CharField(max_length=200, null=True, blank=True)
    grade= models.CharField(max_length=200, null=True, blank=True)
    source= models.CharField(max_length=200, null=True, blank=True)
    destination= models.CharField(max_length=200, null=True, blank=True)
    validity= models.DateField(default=datetime.now, blank=True)
    start_date_of_order=models.DateField(default=datetime.now, blank=True)
    end_date_of_order=models.DateField(default=datetime.now, blank=True)
    value_of_order=models.CharField(max_length=200, null=True, blank=True)
    validity_of_tag=models.DateField(default=datetime.now, blank=True)
    trip_cycle=models.CharField(max_length=200, null=True, blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(default=datetime.now, blank=True)
 #def __str__(self):
       # return self.name
    class Meta:
        db_table="production_vehicle"


class Production_Weighbridge(models.Model):
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=False, blank=False)
    w_name= models.CharField(max_length=100, default='')
    location= models.CharField(max_length=100, default='')
    desc= models.CharField(max_length=100,null=True,blank=True)
    wb_code=models.CharField(max_length=100,null=True,blank=False)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return self.w_name

    class Meta:
        db_table = "production_weighbridge"
#####manualentry#######

class Production_Manualentry(models.Model):
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=False, blank=False)
    weighbridge_id= models.CharField(max_length=100, null=False,blank=False)
    vehicle_id= models.CharField(max_length=100, null=False,blank=False)
    datetime_in=models.DateTimeField(default=datetime.now, blank=True)
    datetime_out=models.DateTimeField(default=datetime.now, blank=True)
    trip_time=models.CharField(max_length=200, null=True, blank=True)
    tm_name=models.CharField(max_length=200, null=True, blank=True)
    wb_code=models.CharField(max_length=100,null=True,blank=False)
    first_wt= models.IntegerField()
    second_wt= models.IntegerField()
    net_wt= models.IntegerField()
    weight_unit = models.CharField(max_length=200, null=True, blank=True)
    type=models.CharField(max_length=100,null=True,blank=True)
    production_type=models.CharField(max_length=100,null=True,blank=True)
    entry_date = models.DateField(default=datetime.now, blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(default=datetime.now, blank=True)

    class Meta:
        db_table = "production_manualentry"

#####container_details#######


class Container_Details(models.Model):
    name_of_the_tub =models.CharField(max_length=100, default='')
    initial_weight = models.IntegerField(null=True,blank=True)
    laden_weight = models.IntegerField(null=True,blank=True)
    weight_unit = models.CharField(max_length=200,null=True,blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(default=datetime.now, blank=True)
    def __str__(self):
        return self.name_of_the_tub

    class Meta:
        db_table = "container_details"

######production_despatch#######


class Production_Tub(models.Model):
    mine_id = models.ForeignKey(MineDetails,on_delete=models.CASCADE,null=True,blank=True)
    # vehicle_id = models.CharField(max_length=100, default='')
    name_of_the_tub = models.ForeignKey(Container_Details,on_delete=models.CASCADE,null=True,blank=True)
    laden_weight =models.CharField(max_length=100, default='')
    no_of_trip = models.IntegerField(null=True,blank=True)
    total_weight = models.IntegerField(null=True,blank=True)
    destination = models.CharField(max_length=200, default='')
    datetime_in = models.DateTimeField(default=datetime.now, blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(default=datetime.now, blank=True)

    class Meta:
        db_table = "production_tub"



class Production_Material_Waste(models.Model):
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=False, blank=False)
    vehicle_id = models.CharField(max_length=100, default='')
    weighbridge_id = models.CharField(max_length=100, default='')
    net_weight = models.IntegerField(null=True, blank=True)
    unit = models.CharField(max_length=100, default='m(cube)/t')
    production_type = models.CharField(max_length=100, null=True, blank=True)
    datetime_in = models.DateTimeField(default=datetime.now, blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(default=datetime.now, blank=True)

    class Meta:
        db_table = "production_material_waste"



#######Daily enty of coal/ore###########

class Production_DailyEntry(models.Model):
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=False, blank=False)
    shift_name = models.CharField(max_length=100, null=True, blank=True)
    production_type = models.CharField(max_length=100, null=True, blank=True)
    total_weight = models.IntegerField(null=True, blank=True)
    # datetime_in = models.DateTimeField(default=datetime.now, blank=True)
    dates = models.DateField(default=datetime.now, blank=True)
    weight_unit = models.CharField(max_length=200, null=True, blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(default=datetime.now, blank=True)

    class Meta:
        db_table = "production_dailyentry"


####monthly entry of coal/ore########
class Production_Monthly(models.Model):
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=False, blank=False)
    production_type = models.CharField(max_length=100, null=True,blank=True)
    total_weight = models.IntegerField(null=True, blank=True)
    month = models.IntegerField(max_length=2, null=False, blank=False)
    years = models.IntegerField(max_length=4, null=False, blank=False)
    weight_unit = models.CharField(max_length=200, null=True, blank=True)
    class Meta:
        db_table = "production_monthly"


####daily dispatch######
class Production_DailyDispatch(models.Model):
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=False, blank=False)
    shift_name = models.CharField(max_length=100, null=True, blank=True)
    production_type = models.CharField(max_length=100, null=True, blank=True)
    total_weight = models.IntegerField(null=True, blank=True)
    # datetime_in = models.DateTimeField(default=datetime.now, blank=True)
    dates = models.DateField(default=datetime.now, blank=True)
    weight_unit = models.CharField(max_length=200, null=True, blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(default=datetime.now, blank=True)

    class Meta:
        db_table = "production_dailydispatch"



#####monthly dispatch######

class Production_MonthlyDispatch(models.Model):
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=False, blank=False)

    production_type = models.CharField(max_length=100, null=True, blank=True)
    total_weight = models.IntegerField(null=True, blank=True)
    month = models.IntegerField(max_length=2, null=False, blank=False)
    years = models.IntegerField(max_length=4, null=False, blank=False)
    weight_unit = models.CharField(max_length=200, null=True, blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(default=datetime.now, blank=True)

    class Meta:
        db_table = "production_monthlydispatch"

####Yearly dispatch#######
class Production_YearlyDispatch(models.Model):
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=False, blank=False)

    production_type = models.CharField(max_length=100, null=True, blank=True)
    total_weight = models.IntegerField(null=True, blank=True)
    years = models.IntegerField(max_length=4, null=False, blank=False)
    weight_unit = models.CharField(max_length=200, null=True, blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(default=datetime.now, blank=True)

    class Meta:
        db_table = "production_yearlydispatch"


class Production_YearlyEntry(models.Model):
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=False, blank=False)

    production_type = models.CharField(max_length=100, null=True, blank=True)
    total_weight = models.IntegerField(null=True, blank=True)
    years = models.IntegerField(max_length=4, null=False, blank=False)
    weight_unit = models.CharField(max_length=200, null=True, blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(default=datetime.now, blank=True)

    class Meta:
        db_table = "production_yearlyentry"

