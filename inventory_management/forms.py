from django import forms

from datetime import date
from .models import SupplierModel,MineDetails,ProductModel,CategoryModel,DeductModel,ReorderModel,BranchModel,DistributeModel,AlternateProdModel
from django.http import HttpResponse, JsonResponse
from datetime import datetime; datetime.now()
# from django import PhoneField

STATE=(
    ('Select State', 'Select State'),('Andra Pradesh','Andra Pradesh'),('Arunachal Pradesh','Arunachal Pradesh'),('Assam','Assam'),('Bihar','Bihar'),('Chhattisgarh','Chhattisgarh'),
    ('Chandigarh','Chandigarh'),('Delhi','Delhi'),('Gujarat','Gujarat'),('Haryana','Haryana'),('Jammu and Kashmir','Jammu and Kashmir'),
    ('Jharkhand','Jharkhand'),('Karnataka','Karnataka'),('Kerala','Kerala'),('Madhya Pradesh','Madhya Pradesh'),('Maharashtra','Maharashtra'),
    ('Manipur','Manipur'),('Meghalaya','Meghalaya'),('Mizoram','Mizoram'),('Orissa','Orissa'),('Pondicherry','Pondicherry'),
    ('Punjab','Punjab'),('Rajasthan','Rajasthan'),('Tamil Nadu','Tamil Nadu'),('Tripura','Tripura'),('Uttar Pradesh','Uttar Pradesh'),
    ('Uttaranchal','Uttaranchal'),('West Bengal','West Bengal'),

)


UNIT=(
        ('Select Unit', 'Select Unit'),('Piece(pc)','Piece(pc)'),('Packet(pkt)','Packet(pkt)'),('Pair(pr)','Pair(pr)'),('Box(es)-box','Box(es)-box'),('Bar(s)-bar','Bar(s)-bar'),('Bottle(s)-btl','Bottle(s)-btl'),('Bag(s)-bag','Bag(s)-bag'),
		('Can(s)-can','Can(s)-can'),('Cylinder(CYL)','Cylinder(CYL)'),('Card(s)-crd','Card(s)-crd'),('Cartridge(s)','Cartridge(s)'),('Coil(s)','Coil(s)'),('Pack(s)','Pack(s)'),('Roll(s)','Roll(s)'),('Sachet(s)','Sachet(s)'),
		('Slice(s)','Slice(s)'),('Strip(s)','Strip(s)'),('Set(s)','Set(s)'),('Sheet(s)','Sheet(s)'),('Tube(s)','Tube(s)'),('Vial(s)','Vial(s)'),('Barrels(s)','Barrels(s)'),('Container(s)','Container(s)'),('Plate(s)','Plate(s)'),
		('Kilogram(kg)','Kilogram(kg)'),('Gram(gm)','Gram(gm)'),('Pound(lb)','Pound(lb)'),('Tonnes(tonne)','Tonnes(tonne)'),('Millilitre(ml)','Millilitre(ml)'),('Litre(ltr)','Litre(ltr)'),('Fluid ounce','Fluid ounce'),
		('Metre(mtr)','Metre(mtr)'),('Centimeter(cm)','Centimeter(cm)'),('Foot(ft)','Foot(ft)'),('Inch(in)','Inch(in)'),('Sqaure Meter(sq.mtr)','Sqaure Meter(sq.mtr)'),('Square Centimeter(sq.cm)','Square Centimeter(sq.cm)'),
		('Sqaure Foot(sq.ft)','Sqaure Foot(sq.ft)'),('Sqaure Inch(sq.in)','Sqaure Inch(sq.in)'),
	)

TAX=(
        ('Select Tax','Select  Tax'),('SGST','SGST'),('CGST','CGST'),('IGST','IGST'),('CESS','CESS')
)


class SupplierForm(forms.ModelForm):
    business_name = forms.CharField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Name of Business'
    }))
    business_website = forms.CharField(max_length=100, required=False,widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Business website if existing '
    }))

    name = forms.CharField(label='Name', max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Full Name '
    }))

    mobile_no = forms.IntegerField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Contact number (10 Digits Only)'
    }))
    # mobile_no = PhoneNumberField(required=True,widget=forms.TextInput(attrs={
    #     'class': 'form-control',
    #     'placeholder': 'Contact phone number (10 Digits Only)'
    # }))

    email = forms.EmailField(max_length=200, initial="default@gmail.com",widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Please Enter Your Email',
        'default':'abc@gmail.com'
    }))
    pincode = forms.IntegerField(required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'PIN Code (6 Digit Only)'
    }))
    address = forms.CharField(max_length=200, required=False, widget=forms.Textarea(attrs={
        'class': 'form-control',
        'rows': '3',
        'placeholder': 'Please Enter Permanent Address here'
    }))
    landmark = forms.CharField(max_length=200, required=False, widget=forms.Textarea(attrs={
        'class': 'form-control',
        'rows': '3',
        'placeholder': 'Please Enter Landmark Address here'
    }))
    area = forms.CharField( max_length=200, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Area Name'
    }))
    city = forms.CharField(required=False, max_length=100, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Please Enter Your City'
    }))
    state=forms.CharField(required=True,widget=forms.Select(choices=STATE, attrs={'class': 'form-control', }), )
    map_loc = forms.CharField(max_length=200, required=False, widget=forms.Textarea(attrs={
        'class': 'form-control',
        'rows': '3',
        'placeholder': 'Please choose  your location'
    }))

    pan = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Please enter pan number here'
    }))
    gstin = forms.CharField(max_length=20, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'GSTIN NO'
    }))
    notes = forms.CharField(required=False,widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Description if any'
    }))

    class Meta():
        model = SupplierModel
        fields = ['mine_id', 'business_name', 'business_website', 'name', 'mobile_no', 'email', 'pincode', 'address', 'landmark', 'area', 'city', 'state', 'map_loc', 'pan','gstin', 'notes']


class ReportForm(forms.ModelForm):
    class Meta():
        model = ProductModel
        fields = ['mine_id','business_name','prod_category','prod_name']

class CategoryForm(forms.ModelForm):
    prod_category = forms.CharField(required=True,widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Please enter product Category'
    }))
    class Meta():
        model = CategoryModel
        fields = ['prod_category']

class AlternateProdForm(forms.ModelForm):
    class Meta:
        model = AlternateProdModel
        fields = ['prod_id','mine_id','batch_number','alter_product']

class BranchForm(forms.ModelForm):
    branch_nm = forms.CharField(required=True,widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Enter branch Name'
    }))
    class Meta():
        model = BranchModel
        fields = ['mine_id','branch_nm']

class ProductForm(forms.ModelForm):
    # prod_category = forms.CharField(required=True,widget=forms.TextInput(attrs={
    #     'class': 'form-control',
    #     'placeholder': 'Select Product Category'
    # }))
    prod_name = forms.CharField(required=True,widget=forms.TextInput(attrs={
        'class': 'form-control',
         'placeholder': 'Enter Product Name'

    }))
    unit = forms.CharField(required=False, widget=forms.Select(choices=UNIT, attrs={'class': 'form-control', }), )

    alternate_prod = forms.CharField(required=False,widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))

    invoice_no = forms.CharField(label='Invoice',required=False,widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'eg #1001'
    }))

    prod_expiry = forms.DateField( widget=forms.TextInput(attrs={
    'class':'form-control datepicker',
    'value':date.today()
    }))

    quantity = forms.IntegerField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Enter number only'
    }))
    price = forms.FloatField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Enter number only'
    }))
    batch_number = forms.CharField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Enter batch of Product'
    }))
    barcode = forms.CharField(required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Enter barcode of Product'
    }))

    tax= forms.CharField(required=False, widget=forms.Select(choices=TAX, attrs={'class': 'form-control', }), )
    
    rate = forms.FloatField(initial=18.5,widget=forms.TextInput(attrs={
        'class': 'form-control', 
        'placeholder': 'Enter rate of Product'
    }))

    total_tax = forms.FloatField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Calculated',
        'readonly':'readonly'
    }))

    net_amount = forms.FloatField(required=True,widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Calculated',
        'readonly':'readonly'
    }))
    

    info_any = forms.CharField(max_length=200, required=False, widget=forms.Textarea(attrs={
    'class': 'form-control',
    'rows': '3',
    'placeholder': 'Please enter any additional  information here'
    }))

    entry_date = forms.DateField( widget=forms.TextInput(attrs={
    'class':'form-control datepicker',
    'value':date.today()
    }))

    class Meta():
        model = ProductModel
        fields = ['mine_id','business_name','prod_category','prod_name','unit','alternate_prod','invoice_no','prod_expiry','quantity','price','batch_number','tax','rate','total_tax','net_amount','info_any','entry_date','initial_quantity']      
        

class DeductForm(forms.ModelForm):
    deduct_date = forms.DateField( widget=forms.TextInput(attrs={
    'class':'form-control datepicker',
    'value':date.today()
    }))
 
    outstock = forms.IntegerField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
   
    updated_quantity = forms.IntegerField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    productDetails_id = forms.IntegerField(widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    created_on = forms.DateTimeField(widget=forms.TextInput(attrs={
    'class':'form-control',
    # 'value':datetime.now()
    }))

    class Meta():
        model = DeductModel
        fields = ['deduct_date','mine_id','branch_id','prod_category','prod_name','batch_number','barcode' ,'quantity','outstock','updated_quantity','created_on','productDetails_id']      


class ReorderForm(forms.ModelForm):
    Reorder_date = forms.DateTimeField(widget=forms.TextInput(attrs={
    'class':'form-control',
    'value':datetime.now()
    }))

    # date_time = forms.DateTimeField(initial=datetime.now(), required=False)

    # Reorder_date= models.DateTimeField(default=timezone.no
    
    product_id = forms.IntegerField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
 
    outstock = forms.IntegerField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
   
    updated_quantity = forms.IntegerField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    creationdate = forms.DateTimeField(widget=forms.TextInput(attrs={
    'class':'form-control',
    'value':datetime.now()
    }))
     
    class Meta():
        model = ReorderModel
        fields = ['Reorder_date','creationdate','mine_id','prod_category','product_id','prod_name','barcode','batch_number','quantity','addedstock','updated_quantity',]      


class DistributeForm(forms.ModelForm):
    # token= forms.CharField(required=False, widget=forms.TextInput(attrs={
    #     'class': 'form-control'
    # }))

    distribution_date = forms.DateTimeField( widget=forms.TextInput(attrs={
    'class':'form-control datepicker',
    # 'value':date.today() 
    # 'value':date.datetime.now() 
    }))
    mine_id = forms.IntegerField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))
    assign_quantity = forms.IntegerField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))

    prod_unique_id = forms.IntegerField(required=True, widget=forms.TextInput(attrs={
        'class': 'form-control'
    }))

    class Meta():
        model = DistributeModel
        fields = ['distribution_date','mine_id','mine_name','branch_name','prod_category','prod_name','batch_number','quantity','assign_quantity','prod_unique_id']





