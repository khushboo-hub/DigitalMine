import os

from django.core import serializers
from django.db import models

# Create your models here.
from django.db import models
from datetime import date, datetime, timedelta
from django.dispatch import receiver


class MineDetails(models.Model):
    objects = None
    name = models.CharField(max_length=200)
    area = models.CharField(max_length=200, null=True, blank=True)
    state = models.CharField(max_length=200, null=True, blank=True)
    latitude = models.FloatField(null=True, blank=True)
    longitude = models.FloatField(null=True, blank=True)
    mine_map_image = models.ImageField(upload_to='mine_map_image/', null=True, blank=True)
    mine_map_unit = models.FloatField(null=True, blank=True)

    #### Enhancement for DGMS forms Details auto fillup (By:dewangshu on 15/10/2018)

    ##---Postal Address of mine
    village_area_road = models.CharField(max_length=200, null=True, blank=True)
    tehsil_taluka_subdivision = models.CharField(max_length=200, null=True, blank=True)
    district = models.CharField(max_length=200, null=True, blank=True)
    pin = models.CharField(max_length=200, null=True, blank=True)
    date_of_opening = models.DateField(null=True, blank=True)
    lin_no = models.CharField(max_length=200, null=True, blank=True)

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.pk} ({self.name})'
        # return str(self.pk)+','+self.name

    class Meta:
        db_table = "MineDetails"


class MiningRole(models.Model):
    objects = None
    MINING_TYPE1 = (
        ('officer', 'Officer'),
        ('worker', 'Worker'),
    )

    parent_role = models.ForeignKey('self', on_delete=models.CASCADE, blank=True, null=True, default=None)
    mine = models.ForeignKey(MineDetails, on_delete=models.CASCADE, blank=True, null=True)
    name = models.CharField(max_length=200)
    type = models.CharField(max_length=100, blank=True, choices=MINING_TYPE1, default='worker')
    description = models.CharField(max_length=200, null=True, blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = "MiningRole"
        unique_together = ('mine', 'name')


class MineShift(models.Model):
    objects = None
    shift_name = models.CharField(max_length=200)
    mine_id = models.IntegerField()
    time_from = models.CharField(max_length=20)
    time_to = models.CharField(max_length=20)
    description = models.TextField(null=True, blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.pk) + "-" + self.shift_name

    @property
    def shift(self):
        return self.shift_name + "(" + self.time_from + "-" + self.time_to + ")"

    class Meta:
        db_table = "MineShift"


class Employee(models.Model):
    #########   Personal Details   #################
    objects = None
    empid = models.CharField(max_length=100, default='0000')
    name = models.CharField(max_length=100)
    father_name = models.CharField(max_length=100, null=True, blank=True)
    dob = models.DateField(blank=True, null=True, default=date.today)
    present_address = models.CharField(max_length=200, null=True, blank=True)
    permanent_address = models.CharField(max_length=200, null=True, blank=True)
    email = models.EmailField()
    NATIONALITY = (
        ('INDIAN', 'INDIAN'),
        ('OTHERS', 'OTHERS')
    )
    nationality = models.CharField(max_length=50, choices=NATIONALITY, null=True, blank=True)  # new
    identification_mark = models.CharField(max_length=50, null=True, blank=True)  # new
    signature = models.ImageField(upload_to='employee_image/', null=True, blank=True)  # new

    mob = models.CharField(max_length=100, default='0000000000', blank=True, null=True)
    state = models.CharField(max_length=100, blank=True)
    city = models.TextField(default='')
    pin = models.TextField(blank=True, null=True)
    # gender=models.CharField(max_length=100,blank=True,null=True)
    GENDER_CHOICES = (
        ('M', 'Male'),
        ('F', 'Female')
    )
    gender = models.CharField(choices=GENDER_CHOICES, max_length=128, null=True, blank=True)
    # marital_status = models.CharField(max_length=100,blank=True, null=True)
    MARITAL_STATUS = (
        ('M', 'Maried'),
        ('U', 'Unmaried')
    )
    JOB_TYPE = (
        ('Regular', 'Regular'),
        ('Contractor', 'Contractor'),
    )
    marital_status = models.CharField(choices=MARITAL_STATUS, max_length=128, null=True, blank=True)
    spouse_name = models.CharField(max_length=50, null=True, blank=True)  # new

    # photo=models.TextField(max_length=255,blank=True,null=True)
    photo = models.ImageField(upload_to='employee_image/', null=True, blank=True)

    #########   Mining Details   #################
    mine = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=False, blank=False)
    rfid = models.TextField(max_length=200, blank=True, null=True)
    designation = models.TextField(max_length=200, blank=True, null=True)
    token_no = models.TextField(max_length=200, blank=True, null=True)
    date_of_joining = models.DateField(blank=True, null=True, default=date.today)
    retirement_date = models.DateField(blank=True, null=True)
    job_type = models.CharField(choices=JOB_TYPE, max_length=128, null=True, blank=True)
    CATEGORY = (
        ('HS', 'Highly Skilled'),
        ('S', 'Skilled'),
        ('SS', 'Semi Skilled'),
        ('US', 'Under Skilled'),
    )
    category_address = models.CharField(choices=CATEGORY, max_length=50, null=True, blank=True)  # new
    mining_role = models.ForeignKey(MiningRole, on_delete=models.CASCADE, null=True, blank=True)
    cat_type = models.TextField(max_length=200, blank=True, null=True)
    immediate_staff = models.ForeignKey('self', on_delete=models.CASCADE, blank=True, null=True)
    is_rescue = models.CharField(max_length=10, blank=True)
    blood_group = models.CharField(max_length=200, blank=True, null=True)
    medical_status = models.TextField(default="")

    #########   Additional Info   #################
    esic_ip = models.CharField(max_length=50, blank=True, null=True)  # new
    lwf = models.CharField(max_length=50, blank=True, null=True)  # new
    aadhaar_no = models.CharField(max_length=20, blank=True, null=True)
    pan_no = models.CharField(max_length=20, blank=True, null=True)
    voter_id_no = models.CharField(max_length=20, blank=True, null=True)
    medical_ins_no = models.CharField(max_length=30, blank=True, null=True)
    date_of_exit = models.DateField(blank=True, null=True)  # new
    reason_of_exit = models.CharField(max_length=50, null=True, blank=True)  # new
    uan = models.CharField(max_length=50, null=True, blank=True)  # new

    #########  Bank Details   #################
    bank_name = models.CharField(max_length=50, blank=True, null=True)
    bank_ac_no = models.CharField(max_length=30, blank=True, null=True)
    bank_ifsc = models.CharField(max_length=20, blank=True, null=True)
    bank_pf_no = models.CharField(max_length=20, blank=True, null=True)
    service_book_no = models.CharField(max_length=50, null=True, blank=True)  # new
    remarks = models.CharField(max_length=50, null=True, blank=True)  # new

    #########  Last Qualification Details   #################

    edu_course_name = models.CharField(max_length=50, blank=True, null=True)
    edu_board_name = models.CharField(max_length=50, blank=True, null=True)
    edu_year = models.CharField(max_length=20, blank=True, null=True)
    edu_percent = models.CharField(null=True, blank=True, max_length=20)

    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(auto_now=True)
    shift_id = models.ForeignKey(MineShift, on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self):
        return self.name

    def mine_name(self):
        return "Hello"

    def name_with_email(self):
        return self.name + '(' + self.email + ')'

    def get_shift(self):
        return self.shift_id

    class Meta:
        db_table = "employee"


class EmployeeShiftAssign(models.Model):
    employee_id = models.ForeignKey(Employee, on_delete=models.CASCADE, null=True, blank=True)
    shift_id = models.ForeignKey(MineShift, on_delete=models.CASCADE, null=True, blank=True)
    assign_date = models.DateField(default=datetime.now, blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)
    modified_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.pk)

    class Meta:
        db_table = "EmployeeShiftAssign"


class SensorData(models.Model):
    data1 = models.CharField(max_length=200, null=True, blank=True)
    created_date = models.DateTimeField(default=datetime.now, blank=True)

    class Meta:
        db_table = "SensorData"


class RateOfMinimumWages(models.Model):
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=False, blank=False)
    CATEGORY = (
        ('HS', 'Highly Skilled'),
        ('S', 'Skilled'),
        ('SS', 'Semi Skilled'),
        ('US', 'Under Skilled'),
    )
    category = models.CharField(choices=CATEGORY, max_length=50, null=True, blank=True)
    minimum_basic = models.FloatField(null=True, blank=True)
    dearness_allowance = models.FloatField(null=True, blank=True)
    overtime = models.FloatField(null=True, blank=True)

    class Meta:
        db_table = "rate_of_minimum_wage"
        unique_together = ('mine_id', 'category')


class MedicalReport(models.Model):
    mine_id = models.ForeignKey(MineDetails, on_delete=models.CASCADE, null=False, blank=False)
    employee_id = models.ForeignKey(Employee, on_delete=models.CASCADE, null=False, blank=False)
    date = models.DateField(default=datetime.now, null=False, blank=False)
    report = models.CharField(max_length=200, null=True)
    file = models.FileField(upload_to='medical')

    def age(self, id):
        dob = self.dob(self, str(id))
        dob_year = str(dob[:4])
        now = datetime.now()
        curr_date = now.strftime("%Y-%m-%d")
        curr_date_year = str(curr_date[:4])
        age = (int(curr_date_year) - int(dob_year))
        return age

    def dob(self, id):
        emp_table = Employee.objects.get(id=id)
        dob = str(emp_table.dob)
        return dob

    def nextdate(self, id):
        age = self.age(self, id)
        try:
            medical = MedicalReport.objects.filter(employee_id=id).order_by('-id')[0]
            now = medical.date
        except:
            now = -1

        if age >= 45:
            return "" if (now == -1) else (now.replace(year=now.year + 1)).strftime("%Y-%m-%d")
        else:
            return "" if (now == -1) else now.replace(year=now.year + 5).strftime("%Y-%m-%d")

    def lastdate(self, id):
        try:
            medical = MedicalReport.objects.filter(employee_id=id).order_by('-id')[0]
            now = medical.date
            now = now.strftime("%Y-%m-%d")
        except:
            now = ""

        return now

    class Meta:
        db_table = "medical_report"


################# Reciever for Node #################
@receiver(models.signals.post_delete, sender=MedicalReport)
def auto_delete_file_on_delete(sender, instance, **kwargs):
    """
    Deletes file from filesystem
    when corresponding `MediaFile` object is deleted.
    """
    if instance:
        if os.path.isfile(instance.file):
            os.remove(instance.file.path)


@receiver(models.signals.pre_save, sender=MedicalReport)
def auto_delete_file_on_change(sender, instance, **kwargs):
    """
    Deletes old file from filesystem
    when corresponding `MediaFile` object is updated
    with new file.
    """
    if not instance.pk:
        return False

    try:
        report = MedicalReport.objects.get(pk=instance.pk)
        old_file = report.file
    except MedicalReport.DoesNotExist:
        return False

    new_file = instance.file
    if not old_file == new_file:
        if os.path.isfile(old_file.path):
            os.remove(old_file.path)


################# Reciever for Sensor Node END #################

from accounts.models import profile_extension


#################Reciever for Shift Change####################
@receiver(models.signals.post_save, sender=EmployeeShiftAssign, dispatch_uid="employee_shift_assign")
def auto_update_employee_shift_on_insert(sender, instance, **kwargs):
    if not instance.pk:
        return False

    try:
        employee = Employee.objects.get(id=instance.employee_id)
        employee.shift_id_id = instance.mine_shift_id
        employee.save()
    except Employee.DoesNotExist:
        return False
