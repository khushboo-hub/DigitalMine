from django.db import models

# Create your models here.
from django.db import models
from datetime import date, datetime


class MineDetails(models.Model):
    objects = None
    name=models.CharField(max_length=200)
    area=models.CharField(max_length=200,null=True,blank=True)
    state=models.CharField(max_length=200,null=True,blank=True)
    latitude=models.FloatField(null=True,blank=True)
    longitude = models.FloatField(null=True, blank=True)
    mine_map_image = models.ImageField(upload_to='mine_map_image/', null=True, blank=True)
    mine_map_unit=models.FloatField(null=True,blank=True)

    #### Enhancement for DGMS forms Details auto fillup (By:dewangshu on 15/10/2018)

    ##---Postal Address of mine
    village_area_road=models.CharField(max_length=200,null=True,blank=True)
    tehsil_taluka_subdivision = models.CharField(max_length=200, null=True, blank=True)
    district = models.CharField(max_length=200, null=True, blank=True)
    pin = models.CharField(max_length=200, null=True, blank=True)
    date_of_opening = models.DateField(null=True,blank=True)
    lin_no= models.CharField(max_length=200, null=True, blank=True)

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.pk} ({self.name})'
        # return str(self.pk)+','+self.name
    class Meta:
        db_table="MineDetails"

class MiningRole(models.Model):
    objects = None
    MINING_TYPE1 = (
        ('officer', 'Officer'),
        ('worker', 'Worker'),
    )

    parent_role = models.ForeignKey('self', on_delete=models.CASCADE, blank=True, null=True)
    mine=models.ForeignKey(MineDetails,on_delete=models.CASCADE,blank=True,null=True)
    name=models.CharField(max_length=200)
    type=models.CharField(max_length=100,blank=True,choices=MINING_TYPE1,default='worker')
    description = models.CharField(max_length=200,null=True,blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table="MiningRole"

class Employee(models.Model):
    #########   Personal Details   #################
    objects = None
    empid=models.CharField(max_length=100,default='0000')
    name = models.CharField(max_length=100)
    father_name = models.CharField(max_length=100,null=True,blank=True)
    dob=models.DateField(blank=True,null=True,default=date.today)
    address = models.CharField(max_length=200,null=True,blank=True)
    email = models.EmailField()
    mob=models.CharField(max_length=100,default='0000000000',blank=True,null=True)
    state=models.CharField(max_length=100,blank=True)
    city = models.TextField(default='')
    pin=models.TextField(blank=True, null=True)
    # gender=models.CharField(max_length=100,blank=True,null=True)
    GENDER_CHOICES = (
        ('M', 'Male'),
        ('F', 'Female')
    )
    gender = models.CharField(choices=GENDER_CHOICES, max_length=128,null=True,blank=True)
    # marital_status = models.CharField(max_length=100,blank=True, null=True)
    MARITAL_STATUS=(
        ('M', 'Maried'),
        ('U', 'Unmaried')
    )
    JOB_TYPE=(
        ('Regular', 'Regular'),
        ('Contractor', 'Contractor'),
    )
    marital_status = models.CharField(choices=MARITAL_STATUS, max_length=128, null=True, blank=True)
    # photo=models.TextField(max_length=255,blank=True,null=True)
    photo = models.ImageField(upload_to='employee_image/',null=True,blank=True)

    #########   Mining Details   #################
    mine=models.ForeignKey(MineDetails,on_delete=models.CASCADE,null=False,blank=False)
    rfid=models.TextField(max_length=200,blank=True,null=True)
    designation = models.TextField(max_length=200, blank=True, null=True)
    token_no = models.TextField(max_length=200, blank=True, null=True)
    date_of_joining=models.DateField(blank=True,null=True,default=date.today)
    retirement_date=models.DateField(blank=True,null=True)
    job_type = models.CharField(choices=JOB_TYPE, max_length=128, null=True, blank=True)
    mining_role=models.ForeignKey(MiningRole,on_delete=models.CASCADE,null=True,blank=True)
    cat_type = models.TextField(max_length=200, blank=True, null=True)
    immediate_staff=models.ForeignKey('self',on_delete=models.CASCADE,blank=True,null=True)
    is_rescue=models.CharField(max_length=10,blank=True)
    blood_group=models.CharField(max_length=200,blank=True,null=True)
    medical_status=models.TextField(default="")

    #########   Additional Info   #################
    aadhaar_no = models.CharField(max_length=20, blank=True, null=True)
    pan_no=models.CharField(max_length=20,blank=True,null=True)
    voter_id_no = models.CharField(max_length=20, blank=True, null=True)
    medical_ins_no = models.CharField(max_length=30, blank=True, null=True)

    #########  Bank Details   #################
    bank_name = models.CharField(max_length=50, blank=True, null=True)
    bank_ac_no = models.CharField(max_length=30, blank=True, null=True)
    bank_ifsc = models.CharField(max_length=20, blank=True, null=True)
    bank_pf_no = models.CharField(max_length=20, blank=True, null=True)

    #########  Last Qualification Details   #################
    edu_course_name = models.CharField(max_length=50, blank=True, null=True)
    edu_board_name = models.CharField(max_length=50, blank=True, null=True)
    edu_year = models.CharField(max_length=20,blank=True,null=True)
    edu_percent=models.CharField(null=True,blank=True,max_length=20)


    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.pk)+"-"+self.name

    class Meta:
        db_table = "employee"



class SensorData(models.Model):
    data1=models.CharField(max_length=200,null=True,blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)

    class Meta:
        db_table="SensorData"


class MineShift(models.Model):
    objects = None
    shift_name=models.CharField(max_length=200)
    mine_id=models.IntegerField()
    time_from=models.CharField(max_length=20)
    time_to = models.CharField(max_length=20)
    description=models.TextField(null=True,blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.pk) + "-" + self.shift_name

    class Meta:
        db_table="MineShift"


class EmployeeShiftAssign(models.Model):
    employee_id=models.IntegerField()
    mine_shift_id=models.IntegerField()
    shift_time=models.CharField(max_length=200)
    assign_date=models.DateField(default=datetime.now, blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(auto_now=True)
    def __str__(self):
        return str(self.pk)

    class Meta:
        db_table="EmployeeShiftAssign"
