from datetime import date

from django import forms
from employee.models import Employee
from .models import Employee
from .models import SensorData, MineDetails, MineShift, MiningRole, RateOfMinimumWages

STATE = (
    ('Andhra Pradesh', 'Andhra Pradesh'), ('Arunachal Pradesh', 'Arunachal Pradesh'), ('Assam', 'Assam'),
    ('Bihar', 'Bihar'), ('Chhattisgarh', 'Chhattisgarh'), ('Goa', 'Goa'),
    ('Chandigarh', 'Chandigarh'), ('Delhi', 'Delhi'), ('Gujarat', 'Gujarat'), ('Haryana', 'Haryana'),
    ('Jammu and Kashmir', 'Jammu and Kashmir'),
    ('Jharkhand', 'Jharkhand'), ('Karnataka', 'Karnataka'), ('Kerala', 'Kerala'), ('Madhya Pradesh', 'Madhya Pradesh'),
    ('Maharashtra', 'Maharashtra'),
    ('Manipur', 'Manipur'), ('Meghalaya', 'Meghalaya'), ('Mizoram', 'Mizoram'), ('Orissa', 'Orissa'),
    ('Pondicherry', 'Pondicherry'),
    ('Punjab', 'Punjab'), ('Rajasthan', 'Rajasthan'), ('Tamil Nadu', 'Tamil Nadu'), ('Tripura', 'Tripura'),
    ('Uttar Pradesh', 'Uttar Pradesh'),
    ('Uttaranchal', 'Uttaranchal'), ('West Bengal', 'West Bengal'),

)


class MiningRoleForm(forms.ModelForm):
    def __init__(self, mine_id, parent=None, *args, **kwargs):
        super(MiningRoleForm, self).__init__(*args, **kwargs)
        if not parent:
            self.fields['parent_role'] = forms.ModelChoiceField(
                queryset=MiningRole.objects.filter(mine_id=mine_id)
            )  #

    name = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Mining Role Name (ex: GM,Manager,Foreman,Level Incharge)'
    }))
    description = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Description if any'
    }))
    MINING_TYPE1 = (
        ('officer', 'Officer'),
        ('worker', 'Worker'),
    )
    type = forms.ChoiceField(required=False, choices=MINING_TYPE1, widget=forms.RadioSelect())

    # parent_role = forms.CharField(required=False,
    #                               widget=forms.Select(choices=MiningRole.objects.all().values_list('id', 'name'),
    #                                                   attrs={'class': 'form-control',
    #                                                          }))
    class Meta():
        model = MiningRole
        widgets = {
            'type': forms.RadioSelect(),
        }
        fields = ['mine', 'parent_role', 'name', 'type', 'description']


from django.utils.crypto import get_random_string

u'rRXVe68NO7m3mHoBS488KdHaqQPD6Ofv'


class EmployeeForm(forms.ModelForm):
    def __init__(self, mine_id, *args, **kwargs):
        super(EmployeeForm, self).__init__(*args, **kwargs)
        self.fields['mining_role'] = forms.ModelChoiceField(
            queryset=MiningRole.objects.filter(mine_id=mine_id)
        )
        self.fields['token_no'].initial = "T00001"
        # Defined this __init_ function for Mining Role according to the Mine id, for this Mine Id needs to be passed from the view

    # =================for Personal Details======================
    GENDER_CHOICES = (
        ('M', 'Male'),
        ('F', 'Female')
    )
    MARITAL_STATUS = (
        ('M', 'Maried'),
        ('U', 'Unmaried')
    )
    MINING_TYPE = (
        ('underground', 'UNDERGROUND'),
        ('surface', 'SURFACE'),
        ('opencast', 'OPENCAST')
    )
    BLOOD_GROUP = (
        ('A+', 'A+'),
        ('A-', 'A-'),
        ('B+', 'B+'),
        ('B-', 'B-'),
        ('O+', '0+'),
        ('O-', '0-'),
        ('AB+', 'AB+'),
        ('AB-', 'AB-'),
    )
    NATIONALITY = (
        ('INDIAN', 'INDIAN'),
        ('OTHERS', 'OTHERS')
    )
    CATEGORY = (
        ('HS', 'Highly Skilled'),
        ('S', 'Skilled'),
        ('SS', 'Semi Skilled'),
        ('US', 'Under Skilled'),
    )

    empid = forms.CharField(max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Emp-ID (Ex: E001)/आए डी '
    }))
    name = forms.CharField(label='Name', max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Full Name /पूरा नाम '
    }))
    father_name = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Father Name / पिता का नाम'
    }))
    dob = forms.DateField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control datepicker',
        'value': date.today()
    }))
    email = forms.EmailField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Please Enter Your Email / ईमेल ',
        'type': 'email'
    }))
    mob = forms.CharField(required=False, max_length=14, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Mobile No (10 Digits Only) / मोबाइल',
        # 'pattern':'pattern="[6789][0-9]{9}"',
        'oninvalid': "setCustomValidity('Enter a Valid Mobile Number')",
        'onchange': "try{setCustomValidity('')}catch(e){}"

    }))
    present_address = forms.CharField(max_length=200, required=False, widget=forms.Textarea(attrs={
        'class': 'form-control',
        'rows': '3',
        'placeholder': 'Please Enter Present Address here / वर्तमान पता '
    }))
    permanent_address = forms.CharField(max_length=200, required=False, widget=forms.Textarea(attrs={
        'class': 'form-control',
        'rows': '3',
        'placeholder': 'Please Enter Permanent Address here / स्थायी पता '
    }))

    state = forms.CharField(label='Name', widget=forms.TextInput(attrs={
        'name': 'myState',
        'id': 'mystate',
        'placeholder': 'State /राज्य'
    }))

    # state = forms.CharField(required=False, widget=forms.Select(choices=STATE, attrs={'class': 'form-control', }), )

    # mine = forms.CharField(required=False,
    #                        widget=forms.Select(choices=MineDetails.objects.all().values_list('id', 'name'),
    #                                            attrs={'class': 'form-control',
    #                                                   'disabled': 'true',
    #
    #                                                   }))
    # mining_role = forms.CharField(required=False, widget=forms.Select(choices=MiningRole.objects.all().values_list('id','name'),attrs={'class': 'form-control', }), )
    # immediate_staff=forms.CharField(required=False,widget=forms.Select(choices=Employee.objects.all().values_list('id','name'),attrs={'class': 'form-control', }))
    city = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'name': 'myCity',
        'id': 'mycity',
        'placeholder': 'Please Enter Your City / शहर'
    }))
    pin = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'PIN Code / पिन '
    }))
    gender = forms.ChoiceField(choices=GENDER_CHOICES, widget=forms.RadioSelect())
    marital_status = forms.ChoiceField(choices=MARITAL_STATUS, widget=forms.RadioSelect())
    spouse_name = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Spouse Name'
    }))
    nationality = forms.CharField(widget=forms.Select(choices=NATIONALITY, attrs={'class': 'form-control', }), )
    identification_mark = forms.CharField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Identification mark '
    }))
    signature = forms.ImageField()

    category_address = forms.CharField(widget=forms.Select(choices=CATEGORY, attrs={'class': 'form-control', }), )

    esic_ip = forms.CharField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'ESIC IP '
    }))
    lwf = forms.CharField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'LWF '
    }))
    uan = forms.CharField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'UAN '
    }))
    date_of_exit = forms.DateField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control datepicker',
        'value': date.today()
    }))
    reason_of_exit = forms.CharField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Reason of Exit '
    }))
    service_book_no = forms.CharField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Service Book Number '
    }))
    remarks = forms.CharField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Remarks '
    }))
    # =================for Mining Info======================
    # mine
    rfid = forms.CharField(max_length=100, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'RFID /  आर.एफ.आइ.डी '
    }))
    designation = forms.CharField(max_length=200, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Designation /  पद '
    }))
    token_no = forms.CharField(max_length=200, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'TOKEN NO /  टोकन No. '
    }))
    date_of_joining = forms.DateField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control datepicker',
        'value': date.today()
    }))
    retirement_date = forms.DateField(widget=forms.TextInput(attrs=
    {
        'class': 'form-control datepicker',
        'value': date.today()
    }))
    JOB_TYPE = (
        ('Regular', 'Regular'),
        ('Contractor', 'Contractor'),
    )
    IS_RESCUE = (
        ('No', 'No'),
        ('Yes', 'Yes'),
    )
    job_type = forms.CharField(widget=forms.Select(choices=JOB_TYPE, attrs={'class': 'form-control', }), )
    is_rescue = forms.CharField(widget=forms.Select(choices=IS_RESCUE, attrs={'class': 'form-control', }), )
    cat_type = forms.CharField(widget=forms.Select(choices=MINING_TYPE, attrs={'class': 'form-control', }), )
    blood_group = forms.CharField(widget=forms.Select(choices=BLOOD_GROUP, attrs={'class': 'form-control', }), )
    medical_status = forms.CharField(max_length=200, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Medical Health status or any Description'
    }))

    #############   Additional Info  ###################
    aadhaar_no = forms.CharField(max_length=19, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Aadhaar No / आधार नं '
    }))
    pan_no = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'PAN No / पेन संख्या '
    }))
    voter_id_no = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Votar ID No '
    }))
    medical_ins_no = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Medical Ins. No '
    }))

    #############   Bank Details  ###################
    bank_name = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Bank Name'
    }))
    bank_ac_no = forms.CharField(max_length=30, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'A/C No'
    }))
    bank_ifsc = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'IFSC Code'
    }))
    bank_pf_no = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'PF No'
    }))

    #############   Last Qualification Details  ###################
    edu_course_name = forms.CharField(max_length=50, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Course/Exam/Degree Name'
    }))
    edu_board_name = forms.CharField(max_length=30, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Board/University Name'
    }))
    edu_year = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Passing Year (Ex: 2015)'
    }))
    edu_percent = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Percentage %'
    }))
    photo = forms.ImageField()

    class Meta:
        model = Employee
        fields = ['empid', 'name', 'father_name', 'dob', 'present_address', 'permanent_address', 'email', 'mob',
                  'state', 'city', 'pin', 'gender',
                  'marital_status', 'photo', 'mine', 'rfid', 'designation'
            , 'token_no', 'retirement_date', 'mining_role', 'job_type', 'is_rescue', 'date_of_joining', 'cat_type',
                  'immediate_staff', 'blood_group', 'medical_status'
            , 'aadhaar_no', 'pan_no', 'voter_id_no', 'medical_ins_no', 'bank_name', 'bank_ac_no', 'bank_ifsc',
                  'bank_pf_no',
                  'edu_course_name', 'edu_board_name', 'edu_year', 'edu_percent', 'spouse_name', 'nationality',
                  'identification_mark', 'signature', 'category_address', 'esic_ip', 'lwf', 'date_of_exit',
                  'reason_of_exit', 'service_book_no', 'remarks']
        widgets = {
            'date_of_joining': forms.DateInput(attrs={'class': 'datepicker'}),
        }


class MineDetailsForm(forms.ModelForm):
    name = forms.CharField(label='Name', max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Mines Name /खदान का नाम '
    }))
    area = forms.CharField(max_length=200, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Area Name /क्षेत्र का नाम '
    }))
    # state = forms.CharField(max_length=200, required=False, widget=forms.TextInput(attrs={
    #     'class': 'form-control',
    #     'placeholder': 'State /राज्य का नाम '
    # }))
    # state = forms.CharField(required=False, widget=forms.Select(choices=STATE, attrs={'class': 'form-control', }), )

    state = forms.CharField(label='Name', widget=forms.TextInput(attrs={
        'name': 'myState',
        'id': 'mystate',
        'placeholder': 'State /राज्य'
    }))
    latitude = forms.FloatField(required=False, min_value=0, widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'placeholder': 'Latitude (ex:23.7413105) '
    }))

    longitude = forms.FloatField(required=False, widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'placeholder': 'Logitude (ex:86.4067042) '
    }))

    mine_map_unit = forms.FloatField(required=False, widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'placeholder': 'Map Scalling Unit (ex: 1 CM= 8M)'
    }))

    #### ENHANCEMENT
    village_area_road = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Village /Area / Road'
    }))
    tehsil_taluka_subdivision = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Tehsil /Taluka / Sub Division'
    }))
    district = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'id': 'mycity',
        'class': 'form-control',
        'placeholder': 'District'
    }))
    pin = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'PIN'
    }))
    date_of_opening = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Date of Opening'

    }))
    lin_no = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Labour Identification No.(LIN)'
    }))

    class Meta():
        model = MineDetails
        fields = ['name', 'area', 'state', 'latitude', 'longitude', 'mine_map_image', 'mine_map_unit',
                  'village_area_road', 'tehsil_taluka_subdivision', 'district',
                  'pin', 'date_of_opening', 'lin_no']


class MyDataForm(forms.ModelForm):
    class Meta():
        model = SensorData
        fields = ['data1']


class MiningShiftForm(forms.ModelForm):
    shift_name = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Shift Name'
    }))
    time_from = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Time From'
    }))
    time_to = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Time To'
    }))
    description = forms.CharField(widget=forms.Textarea(attrs={
        'class': 'form-control',
        'placeholder': 'Add Description'
    }))

    class Meta():
        model = MineShift
        fields = ['shift_name', 'time_from', 'time_to', 'description']


class RateOfMinimumWageForm(forms.ModelForm):
    CATEGORY = (
        ('HS', 'Highly Skilled'),
        ('S', 'Skilled'),
        ('SS', 'Semi Skilled'),
        ('US', 'Under Skilled'),
    )
    category = forms.CharField(required=True, widget=forms.Select(choices=CATEGORY, attrs={'class': 'form-control', }))
    minimum_basic = forms.FloatField(required=True, min_value=0, widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'placeholder': 'Basic Pay in ₹'
    }))
    dearness_allowance = forms.FloatField(required=True, min_value=0, widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'placeholder': 'Rate of DA in %'
    }))
    overtime = forms.FloatField(required=True, min_value=0, widget=forms.NumberInput(attrs={
        'class': 'form-control',
        'placeholder': 'Overtime/hour in ₹'
    }))

    class Meta():
        model = RateOfMinimumWages
        fields = ['mine_id', 'category', 'minimum_basic', 'dearness_allowance', 'overtime']