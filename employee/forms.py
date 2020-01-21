from datetime import date

from django import forms
from employee.models import Employee
from .models import Employee
from .models import SensorData, MineDetails, MiningRole, MineShift

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


class EmployeeForm(forms.ModelForm):
    def __init__(self, mine_id, *args, **kwargs):
        super(EmployeeForm, self).__init__(*args, **kwargs)
        self.fields['mining_role'] = forms.ModelChoiceField(
            queryset=MiningRole.objects.filter(mine_id=mine_id)
        ) #Defined this __init_ function for Mining Role according to the Mine id, for this Mine Id needs to be passed from the view
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
    address = forms.CharField(max_length=200, required=False, widget=forms.Textarea(attrs={
        'class': 'form-control',
        'rows': '3',
        'placeholder': 'Please Enter Permanent Address here / पता '
    }))

    state = forms.CharField(required=False, widget=forms.Select(choices=STATE, attrs={'class': 'form-control', }), )

    # mine = forms.CharField(required=False,
    #                        widget=forms.Select(choices=MineDetails.objects.all().values_list('id', 'name'),
    #                                            attrs={'class': 'form-control',
    #                                                   'disabled': 'true',
    #
    #                                                   }))
    # mining_role = forms.CharField(required=False, widget=forms.Select(choices=MiningRole.objects.all().values_list('id','name'),attrs={'class': 'form-control', }), )
    # immediate_staff=forms.CharField(required=False,widget=forms.Select(choices=Employee1.objects.all().values_list('id','name'),attrs={'class': 'form-control', }))
    city = forms.CharField(required=False, max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Please Enter Your City / शहर'
    }))
    pin = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'PIN Code / पिन '
    }))
    gender = forms.ChoiceField(choices=GENDER_CHOICES, widget=forms.RadioSelect())
    marital_status = forms.ChoiceField(choices=MARITAL_STATUS, widget=forms.RadioSelect())

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
    aadhaar_no = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
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
        fields = ['empid', 'name', 'father_name', 'dob', 'address', 'email', 'mob', 'state', 'city', 'pin', 'gender',
                  'marital_status', 'photo', 'mine', 'rfid', 'designation'
            , 'token_no', 'retirement_date', 'mining_role', 'job_type', 'is_rescue', 'date_of_joining', 'cat_type',
                  'immediate_staff', 'blood_group', 'medical_status'
            , 'aadhaar_no', 'pan_no', 'voter_id_no', 'medical_ins_no', 'bank_name', 'bank_ac_no', 'bank_ifsc',
                  'bank_pf_no',
                  'edu_course_name', 'edu_board_name', 'edu_year', 'edu_percent']
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
    state = forms.CharField(required=False, widget=forms.Select(choices=STATE, attrs={'class': 'form-control', }), )
    latitude = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Latitude (ex:23.7413105) '
    }))
    longitude = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Logitude (ex:86.4067042) '
    }))
    mine_map_unit = forms.CharField(required=False, widget=forms.TextInput(attrs={
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


class MiningRoleForm(forms.ModelForm):
    def __init__(self, mine_id, *args, **kwargs):
        super(MiningRoleForm, self).__init__(*args, **kwargs)
        self.fields['parent_role'] = forms.ModelChoiceField(
            queryset=MiningRole.objects.filter(mine_id=mine_id)
        )  #Defined this __init_ function for Mining Role according to the Mine id, for this Mine Id needs to be passed from the view
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

    parent_role = forms.CharField(required=False,
                                  widget=forms.Select(choices=MiningRole.objects.all().values_list('id', 'name'),
                                                      attrs={'class': 'form-control',


                                                             }))

    class Meta():
        model = MiningRole
        widgets = {
            'type': forms.RadioSelect(),
        }
        fields = ['parent_role', 'name', 'type', 'description']


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
