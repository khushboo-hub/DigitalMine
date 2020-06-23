from django.http import HttpResponse
from django.shortcuts import render
import datetime

# Create your views here.
# from employee.model import MineDetails
from .forms import SupplierForm, SupplierModel, ProductModel, ProductForm, ReportForm, CategoryForm, CategoryModel, \
    DeductModel, ReorderModel, BranchForm, BranchModel, DistributeForm, DistributeModel, AlternateProdModel, \
    AlternateProdForm
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, JsonResponse
from employee.models import MineDetails
from django.db.models import Avg, Count, Min, Sum, Max
from django.db.models.query import QuerySet
import math
import pandas as pd
import numpy as np
from django.views.decorators.csrf import csrf_exempt
from django.contrib import messages



@login_required
def supplier_add(request, template_name='SupplierDetails.html'):
    DatalistQS = SupplierModel.objects.values('business_name').distinct().order_by('business_name')
    # business_name = request.POST.get("business")
    # object = SupplierModel()

    if request.method == 'POST':
        form = SupplierForm(request.POST or None, request.FILES)
        if form.is_valid():
            # form.save()
            Pno = form['mobile_no'].value()
            Pin = form['pincode'].value()
            statereturned = form['state'].value()
            # answer = form.cleaned_data['value']
            minereturned = form['mine_id'].value()
            print("minereturned")
            print(minereturned)
            # print(form)

            PhoneNoLength = len(Pno)
            PinNoLenghth = len(Pin)
            if PhoneNoLength > 10 and statereturned == 'Select State':
                messages.error(request, ' "Mobile Number" must be of 10 digit only and please select "State" field')
                return render(request, template_name, {'form': form})
            elif PhoneNoLength > 10:
                messages.error(request, ' Phone number must be of 10 digit only')
                return render(request, template_name, {'form': form})
            elif PhoneNoLength < 10:
                messages.error(request, ' Phone number must be of 10 digit only')
                return render(request, template_name, {'form': form})
            elif statereturned == 'Select State':
                messages.error(request, ' Please select state')
                return render(request, template_name, {'form': form})
            elif PinNoLenghth > 6:
                messages.error(request, ' Pin Number must be less than 6 digit')
                return render(request, template_name, {'form': form})
            elif minereturned == "---------":
                messages.error(request, ' Please select Mine')
                return render(request, template_name, {'form': form})
            else:
                form.save()
                # messages.success(request, ' submission successfully')
                return redirect('inventory_management:supplier_manage')
        else:
            print("form")
            errorlist = form.errors.as_data()
            print(errorlist)
            # return render(request, template_name, {'form': form,'DatalistQS': DatalistQS, 'msg':msg })
    else:
        form = SupplierForm()
    return render(request, template_name, {'form': form, 'DatalistQS': DatalistQS})


@login_required
def supplier_manage(request, template_name='SupplierManage.html'):
    book = SupplierModel.objects.all()
    # print(book)
    data = {}
    data['object_list'] = book
    return render(request, template_name, data)


@login_required
def supplier_edit(request, pk, template_name='SupplierDetails.html'):
    book = get_object_or_404(SupplierModel, pk=pk)
    print(book)
    form = SupplierForm(request.POST or None, instance=book)
    if form.is_valid():
        form.save()
        return redirect('inventory_management:supplier_add')
    return render(request, template_name, {'form': form})


@login_required
def supplier_delete(request, pk):
    book = get_object_or_404(SupplierModel, pk=pk)
    book.delete()
    return redirect('inventory_management:supplier_manage')


@login_required
def product_add(request, template_name='ProductDetails.html'):
    form = ProductForm(request.POST)
    ProductQS = ProductModel.objects.values('prod_name').distinct().order_by('prod_name')
    if request.method == 'POST':
        if form.is_valid():
            pname = form['prod_name'].value()
            batch_returned = form['batch_number'].value()
            mname = form['mine_id'].value()
            uname = form['unit'].value()
            tname = form['tax'].value()
            bname = form['business_name'].value()
            cname = form['prod_category'].value()
            data = ProductModel.objects.filter(prod_name=pname, batch_number=batch_returned, mine_id=mname)

            QueryCount = len(data)
            print("data")
            print(data)
            if not mname:
                messages.error(request, 'Please choose mine from dropdown')
                return render(request, template_name, {'form': form, 'ProductQS': ProductQS})
            elif not bname:
                messages.error(request, 'Please choose mine and supplier name from Dropdown')
                return render(request, template_name, {'form': form, 'ProductQS': ProductQS})
            elif not cname:
                messages.error(request, 'Please choose category from Dropdown')
                return render(request, template_name, {'form': form, 'ProductQS': ProductQS})
            elif tname == "Select Tax" and uname == 'Select Unit':
                messages.error(request, 'Please validate "Unit" and "Tax" field')
                return render(request, template_name, {'form': form, 'ProductQS': ProductQS})
            elif tname == "Select Tax" or uname == 'Select Unit':
                messages.error(request, 'Please validate "Unit" or "Tax" field')
                return render(request, template_name, {'form': form, 'ProductQS': ProductQS})
            elif QueryCount > 0:
                messages.error(request,
                               'Entered Product with corresponding batch and mine is already present .Please add inventory of this product')
                return render(request, template_name, {'form': form, 'ProductQS': ProductQS})
            else:
                form.save()
                alternateList = request.POST.getlist('alternate_prod_name', None)
                product_id = form.instance.id
                print("product_id")
                print(product_id)
                batch_returned = form['batch_number'].value()
                prod_returned = form['prod_name'].value()
                mine_returned = form['mine_id'].value()
                quantity_returned = form['quantity'].value()
                # print("quantity_returned")
                # print(quantity_returned)
                datalist = []
                prod_id = alter_product = 0.0
                Obj = ProductModel()
                Obj1 = ProductModel()
                for x in range(len(alternateList)):
                    Object1 = AlternateProdModel()
                    Object1.prod_id = product_id
                    Object1.mine_id = mine_returned
                    Object1.batch_number = batch_returned
                    Object1.alter_product = alternateList[x]
                    Object1.save()
                    datalist.append(str(alternateList[x]))
                    ProductQS = ProductModel.objects.values('prod_name').distinct().order_by('prod_name')
                obj = ProductModel.objects.filter(id=product_id).update(alternate_prod=datalist)
                obj1 = ProductModel.objects.filter(id=product_id).update(initial_quantity=quantity_returned)
                # Obj.save()
                # obj1.save()
                # return redirect('inventory_management:product_manage')
                messages.error(request, 'Information saved successfully')
                return render(request, template_name, {'form': form, 'ProductQS': ProductQS})
        else:
            print("form")
            errorlist = form.errors.as_data()
            print(errorlist)
    else:
        form = ProductForm()
        print("not post method .. first time caling")

    return render(request, template_name, {'form': form, 'ProductQS': ProductQS})


def category_add(request, template_name='category_add.html'):
    DatalistQS = CategoryModel.objects.values('prod_category').distinct().order_by('prod_category')
    msg = ""
    if request.method == 'POST':
        form = CategoryForm(request.POST)
        print(request.POST)
        if form.is_valid():
            category = form['prod_category'].value()
            CategoryData = CategoryModel.objects.filter(prod_category__icontains=category)
            QueryCount = len(CategoryData)
            print(QueryCount)
            if QueryCount > 0:
                print(QueryCount)
                QueryCount = str(QueryCount)
                print("Data already present" + " " + QueryCount)
                messages.success(request,
                                 ' Entered Category already available ! Please enter "new" category name and try submitting again.')
                return render(request, template_name, {'form': form, 'DatalistQS': DatalistQS, 'msg': msg})
            else:
                form.save()
                # messages.success(request, ' submission successfully')
                return redirect('inventory_management:category_manage')
    else:
        form = CategoryForm()
    return render(request, template_name, {'form': form, 'DatalistQS': DatalistQS, 'msg': msg})


def fetch_supplier_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        supplier_details = SupplierModel.objects.values_list().filter(mine_id=mine_id)
        data = {}
        i = 0
        supplier_data = []
        for r in supplier_details:
            supplier_data.append(str(r[0]) + ',' + str(r[2]))
            i = i + 1
        data['result'] = supplier_data
    else:
        data['result'] = "Not Ajax"
    # print(data)
    return JsonResponse(data)


@login_required
def product_manage(request, template_name='ProductManage.html'):
    book = ProductModel.objects.all()
    book1 = ProductModel.objects.values_list()
    datalist = []
    i = 0
    print("book1")
    print(book1)
    for r in book1:
        print(r[2])
        supplier_table = SupplierModel.objects.get(id=r[2])
        mine_table = MineDetails.objects.get(id=str(r[1]))
        Category_table = CategoryModel.objects.get(id=str(r[3]))
        print("supplier_table")
        print(supplier_table.business_name)

        datalist.append([])
        datalist[i].append(mine_table.name)
        # datalist[i].append(str(r[2]))
        datalist[i].append(supplier_table.business_name)
        datalist[i].append(Category_table.prod_category)
        # datalist[i].append(str(r[2]))
        # datalist[i].append(str(r[3]))
        datalist[i].append(str(r[4]))
        datalist[i].append(str(r[11]))
        datalist[i].append(str(r[17]))
        datalist[i].append(str(r[5]))
        datalist[i].append(str(r[6]))
        datalist[i].append(str(r[9]))
        datalist[i].append(str(r[8]))
        datalist[i].append(str(r[10]))
        datalist[i].append(str(r[13]))
        datalist[i].append(str(r[14]))
        datalist[i].append(str(r[15]))
        datalist[i].append(str(r[16]))
        datalist[i].append(str(r[15]))
        datalist[i].append(r[0])
        # datalist[i].append(str(r[18]))
        i = i + 1

    print("datalist")
    print(datalist)
    data = {}
    # data['object_list'] = book
    data['object_list'] = datalist
    print("printed data")
    print(data)
    return render(request, template_name, data)


@login_required
def product_edit(request, pk, template_name='ProductDetails.html'):
    book = get_object_or_404(ProductModel, pk=pk)
    form = ProductForm(request.POST or None, instance=book)
    # print("form")
    # print(form)
    print("book")
    print(book)
    if form.is_valid():
        form.save()
        return redirect('inventory_management:product_add')
    return render(request, template_name, {'form': form})


@login_required
def product_delete(request, pk):
    book = get_object_or_404(ProductModel, pk=pk)
    obj = ProductModel.objects.values_list().filter(pk=pk)
    for r in obj:
        AlternateProdModel.objects.filter(alter_product=str(r[4])).delete()
    book.delete()
    return redirect('inventory_management:product_manage')


@login_required
def view_product(request, template_name='ViewInventory.html'):
    book = ProductModel.objects.values_list()
    today = datetime.date.today()
    datalist = []
    data = {}
    i = 0
    for r in book:
        batch = str(r[11])
        # Unit=str(r[9])+ " "+str(r[5])
        price = str("Rs.") + " " + str(r[10])
        mine_table = MineDetails.objects.get(id=str(r[1]))
        Category_table = CategoryModel.objects.get(id=str(r[3]))
        ddd = r[8] - today
        print(ddd)
        daysleft = ddd.days
        print(ddd)
        quantity_str = str(r[9])
        int_quantity = int(quantity_str)

        if daysleft <= 0:
            status = "Expired"
        elif daysleft > 0 and daysleft <= 61:
            status = "Expiring Soon"
        else:
            if int_quantity <= 0:
                status = "Out of Stock"
            else:
                # month=daysleft/30
                # string = str(month)
                # # abc=print(string[0:1])
                status = "OK"

        quantity_str = str(r[9])
        int_quantity = int(quantity_str)
        if int_quantity <= 0:
            Unit = "Out Of Stock"
        else:
            Unit = str(r[9]) + " " + str(r[6])

        datalist.append([])
        datalist[i].append(str(r[7]))
        # datalist[i].append(str(r[1]))
        datalist[i].append(mine_table.name)

        datalist[i].append(str(r[2]))
        datalist[i].append(Category_table.prod_category)
        datalist[i].append(str(r[4]))
        datalist[i].append(str(Unit))
        datalist[i].append(str(Unit))
        datalist[i].append(str(r[7]))
        datalist[i].append(str(r[8]))
        datalist[i].append(str(r[9]))
        datalist[i].append(str(price))
        datalist[i].append(str(status))
        datalist[i].append(str(r[11]))
        datalist[i].append(str(daysleft))
        datalist[i].append(str(batch))
        i = i + 1

    print(datalist)
    data['object_list'] = datalist
    return render(request, template_name, data)


@login_required
def view_expiredReport(request, template_name='expired_product.html'):
    form = ReportForm()
    return render(request, template_name, {'form': form})


def fetch_category_ajax(request):
    data = {}
    if request.is_ajax():
        mine_id = request.GET.get('id', None)
        print("Mine id")
        print(mine_id)
        product_details = ProductModel.objects.values_list().filter(mine_id=mine_id)

        data = {}
        i = 0
        product_data = []
        for r in product_details:
            # q = ProductOrder.objects.values('Category').distinct()
            Category_nm = CategoryModel.objects.get(id=str(r[3]))
            product_data.append(str(r[3]) + ',' + str(Category_nm))
            i = i + 1
        product_data1 = list(set(product_data))
        data['result'] = product_data1
    else:
        data['result'] = "Not Ajax"
    print("Mine dependent Category Data")
    print(data)
    return JsonResponse(data)


def fetch_product_ajax(request):
    data = {}
    if request.is_ajax():
        id_Category = request.GET.get('id', None)
        product_details = ProductModel.objects.values_list().filter(prod_category=id_Category)
        data = {}
        i = 0
        product_data = []
        for r in product_details:
            product_data.append(str(r[0]) + ',' + str(r[4]))
            i = i + 1
        data['result'] = product_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_batch_ajax(request):
    data = {}
    if request.is_ajax():
        table_id = request.GET.get('id', None)
        # product = request.GET.get('id_product', None)
        # batch = request.GET.get('id_batch', None)
        product_details = ProductModel.objects.values_list().filter(id=table_id)
        data = {}
        i = 0
        product_data = []
        for r in product_details:
            product_data.append(str(r[0]) + ',' + str(r[11]))
            i = i + 1
        data['result'] = product_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_branch_category(request):
    data = {}
    if request.is_ajax():
        table_id = request.GET.get('id', None)
        product_details = ProductModel.objects.values_list().filter(id=table_id)
        data = {}
        i = 0
        product_data = []
        for r in product_details:
            product_data.append(str(r[0]) + ',' + str(r[11]))
            i = i + 1
        data['result'] = product_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_expiry_report_ajax(request):
    data = {}
    if request.is_ajax():
        id_category = request.GET.get('id', None)
        id_product = request.GET.get('id_prod', None)
        print("selected Category")
        print(id_category)
        print("selected Product")
        print(id_product)
        date_from = request.GET.get('date_from', None)
        date_to = request.GET.get('date_to', None)
        today = datetime.date.today()
        # product_dt = ProductModel.objects.values_list().filter(id=id_product)
        product_dt = ProductModel.objects.values_list().filter(prod_category=id_category, id=id_product)
        # print(today)
        print("Query Result from Category")
        print(product_dt)
        i = 0
        product = 0
        for r in product_dt:
            Mine_nm = MineDetails.objects.get(id=str(r[1]))
            Category_nm = CategoryModel.objects.get(id=str(r[3]))
            # product_nm = CategoryModel.objects.get(id_product=str(r[4]))
            product_nm = str(r[4])
            i = i + 1

        try:
            print("Print Selected Product")
            print(product_nm)
            # Report = ProductModel.objects.all().values_list().filter(prod_expiry__range=(date_from,date_to),prod_category=id_category).filter(id=id_product)
            # .filter(entry__pub_date__year=2008)
            # print(Report)
            Report = ProductModel.objects.all().values_list().filter(prod_expiry__range=(date_from, date_to),
                                                                     id=id_product)

            datalist = []
            i = 0
            for r in reversed(Report):
                datalist.append(
                    str(r[0]) + ',' + str(r[8]) + ',' + str(r[3]) + ',' + str(r[4]) + ',' + str(r[9]) + ',' + str(
                        r[18]) + ',' + str(r[7]) + ',' + str(Mine_nm) + ',' + str(today))
                i = i + 1

            data['result'] = datalist
            print("Data Print")
            print(data)
        except Exception as e:
            return HttpResponse(
                "<body bgcolor='#E59887'><h2><center>Data not found.</br></h2></center><small>" + str(
                    e) + "</small></body>")
    else:
        data['result'] = "Not Ajax"

    return JsonResponse(data)


def category_manage(request, template_name='CategoryManage.html'):
    book = CategoryModel.objects.all()
    # print(book)
    data = {}
    data['object_list'] = book
    return render(request, template_name, data)


def category_edit(request, pk, template_name='category_add.html'):
    book = get_object_or_404(CategoryModel, pk=pk)
    ### select * from SupplierModel table where id=6
    # print(book)
    form = CategoryForm(request.POST or None, instance=book)
    if form.is_valid():
        form.save()
        messages.success(request, ' Information updated successfully')
        # return  HttpResponse("ok saved")
        # return redirect('inventory_management:category_add')
        return render(request, template_name, {'form': form})
    return render(request, template_name, {'form': form})


def category_delete(request, pk):
    book = get_object_or_404(CategoryModel, pk=pk)
    book.delete()
    return redirect('inventory_management:category_manage')


@login_required
def Inventory_deduct(request, template_name='InventoryDeduct.html'):
    form = ReportForm()
    return render(request, template_name, {'form': form})


def fetch_inventory_deduct_ajax(request):
    data = {}
    if request.is_ajax():
        id_category = request.GET.get('id', None)
        id_product = request.GET.get('id_prod', None)
        today = datetime.date.today()
        product_dt = ProductModel.objects.values_list().filter(prod_category=id_category, id=id_product,
                                                               quantity__gte=0)
        product = 0
        for r in product_dt:
            Mine_nm = MineDetails.objects.get(id=str(r[1]))
            Category_nm = CategoryModel.objects.get(id=str(r[3]))
            product_nm = str(r[4])
        try:
            Report = ProductModel.objects.all().values_list().filter(id=id_product, quantity__gte=0)
            print(" Report data")
            print(Report)
            datalist = []

            for r in reversed(Report):
                datalist.append(
                    str(r[0]) + ',' + str(today) + ',' + str(Mine_nm) + ',' + str(Category_nm) + ',' + str(
                        r[4]) + ',' + str(r[11]) + ',' + str(r[12]) + ',' + str(
                        r[9]) + ',' + str(r[18]))

            data['result'] = datalist
            print(" datalist")
            print(data)
        except Exception as e:
            return HttpResponse(
                "<body bgcolor='#E59887'><h2><center>Data not found.</br></h2></center><small>" + str(
                    e) + "</small></body>")
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_deduct_branch_inventory(request):
    data = {}
    if request.is_ajax():
        id_mine = request.GET.get('id_m', None)
        id_branch = request.GET.get('id_br', None)
        id_category = request.GET.get('id_c', None)
        id_product = request.GET.get('id_p', None)
        # id_batch = request.GET.get('id_bt', None)
        assignedQ = 0
        print(id_mine)
        print(id_branch)
        print(id_category)
        print(id_product)
        print(id_product)
        # branch_name=id_branch

        today = datetime.date.today()
        # distribution_dt = DistributeModel.objects.values_list().filter(mine_id=id_mine,prod_category=id_category,id=id_product,batch_number=id_batch,assign_quantity__gte=0)
        product_dt = ProductModel.objects.values_list().filter(id=id_product, quantity__gte=0)
        branch_dt = BranchModel.objects.values_list().filter(id=id_branch)
        # branch_dt = DistributeModel.objects.values_list().filter(id=id_branch)
        dist_dt = DistributeModel.objects.values('prod_unique_id').annotate(qtn=Sum('assign_quantity')).values(
            'qtn').filter(prod_unique_id=id_product)
        print(dist_dt)
        for b in branch_dt:
            print(b[2])
        # print(b[2])
        # print(b[2])
        for value in dist_dt:
            assignedQ = value['qtn']
        print("assignedQ")
        print(assignedQ)

        try:
            for r in product_dt:
                Mine_nm = MineDetails.objects.get(id=str(r[1]))
                Category_nm = CategoryModel.objects.get(id=str(r[3]))
                Report = ProductModel.objects.all().values_list().filter(id=id_product, quantity__gte=0)
                print(" Report data")
                print(Report)
                datalist = []

                for r in reversed(Report):
                    datalist.append(
                        str(today) + ',' + str(Mine_nm) + ',' + str(b[2]) + ',' + str(Category_nm) + ',' + str(
                            r[4]) + ',' + str(r[11]) + ',' + str(r[12]) + ',' + str(
                            assignedQ) + ',' + str(r[18]) + ',' + str(r[0]))

                data['result'] = datalist
                print(" datalist")
                print(data)
        except Exception as e:
            return HttpResponse(
                "<body bgcolor='#E59887'><h2><center>Data not found.</br></h2></center><small>" + str(
                    e) + "</small></body>")
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


@csrf_exempt
def update_inventory_ajax(request):
    data = {}
    if request.is_ajax():
        date = request.GET.get('id_date', None)
        mine = request.GET.get('id_mine', None)
        category = request.GET.get('id_category', None)
        product = request.GET.get('id_product', None)
        batch = request.GET.get('id_batch', None)
        barcode = request.GET.get('id_barcode', None)
        stock = request.GET.get('id_stock', None)
        lostgoods = request.GET.get('id_lostgoods', None)
        totaldeduct = request.GET.get('id_totaldeduct', None)
        create = request.GET.get('id_createdd', None)
        abc = request.GET.get('product_details_idss', None)

        prod_mine_id = request.GET.get('idd_mine', None)
        prod_category_id = request.GET.get('idd_category', None)
        # prod_product_name = request.GET.get('idd_product', None)
        print("entry")
        # print(date+mine+category+product+batch+barcode+stock+lostgoods+totaldeduct+create+abc)
        print("create")
        print(create)
        print("Product_id")
        print("abc")
        abc = int(abc)
        print(type(abc))
        # deduct_date = mine_id = prod_category = prod_name = barcode = batch_number = quantity = outstock = updated_quantity = create = abc=0.0
        deductinst = DeductModel()
        deductinst.deduct_date = date
        deductinst.mine_id = mine
        deductinst.prod_category = category
        deductinst.prod_name = product
        deductinst.barcode = barcode
        deductinst.batch_number = batch
        deductinst.quantity = stock
        deductinst.outstock = lostgoods
        deductinst.updated_quantity = totaldeduct
        deductinst.created_on = create
        deductinst.productDetails_id = abc

        deductinst.save()
        try:
            obj = ProductModel.objects.filter(mine_id=prod_mine_id, prod_category=prod_category_id, prod_name=product,
                                              batch_number=batch).update(quantity=totaldeduct)
            # list = ModelClass.objects.filter(mine_id=mine,prod_category=category,prod_name=product,batch_number=batch)
            print("abc")
            # print(obj)
            # obj = Product.objects.get(pk=pk)
            # obj.name = "some_new_value"
            # obj.save()
            data['result'] = "Data saved"
        except Exception as e:
            return HttpResponse(
                "<body bgcolor='#E59887'><h2><center>Incorrect data</br></h2></center><small>" + str(
                    e) + "</small></body>")
    else:
        data['result'] = "Not Ajax"

    return JsonResponse(data)


@csrf_exempt
def update_branch_inventory_ajax(request):
    data = {}
    if request.is_ajax():
        # 'id_branch': branch,
        date = request.GET.get('id_date', None)
        branch = request.GET.get('id_branch', None)
        mine = request.GET.get('id_mine', None)
        category = request.GET.get('id_category', None)
        product = request.GET.get('id_product', None)
        batch = request.GET.get('id_batch', None)
        barcode = request.GET.get('id_barcode', None)
        stock = request.GET.get('id_stock', None)
        lostgoods = request.GET.get('id_lostgoods', None)
        totaldeduct = request.GET.get('id_totaldeduct', None)
        create = request.GET.get('id_createdd', None)
        abc = request.GET.get('product_details_idss', None)

        prod_mine_id = request.GET.get('idd_mine', None)
        prod_category_id = request.GET.get('idd_category', None)
        # prod_product_name = request.GET.get('idd_product', None)
        print("entry")
        # print(date+mine+category+product+batch+barcode+stock+lostgoods+totaldeduct+create+abc)
        print("create")
        print(create)
        print("Product_id")
        print(abc)
        # deduct_date = mine_id = prod_category = prod_name = barcode = batch_number = quantity = outstock = updated_quantity = create = abc=0.0
        deductinst = DeductModel()
        deductinst.deduct_date = date
        deductinst.mine_id = mine
        deductinst.branch_id = branch
        deductinst.prod_category = category
        deductinst.prod_name = product
        deductinst.barcode = barcode
        deductinst.batch_number = batch
        deductinst.quantity = stock
        deductinst.outstock = lostgoods
        deductinst.updated_quantity = totaldeduct
        deductinst.created_on = create
        deductinst.productDetails_id = abc

        deductinst.save()
        try:
            obj = DistributeModel.objects.filter(prod_unique_id=abc).update(assign_quantity=totaldeduct)

            # list = ModelClass.objects.filter(mine_id=mine,prod_category=category,prod_name=product,batch_number=batch)
            print("abc")
            # print(obj)
            # obj = Product.objects.get(pk=pk)
            # obj.name = "some_new_value"
            # obj.save()
            data['result'] = "Data saved"
        except Exception as e:
            return HttpResponse(
                "<body bgcolor='#E59887'><h2><center>Incorrect data</br></h2></center><small>" + str(
                    e) + "</small></body>")
    else:
        data['result'] = "Not Ajax"

    return JsonResponse(data)


@login_required
def inventory_branchdeduct(request, template_name='InventoryBranchDeduct.html'):
    form = ReportForm()
    return render(request, template_name, {'form': form})


# CategoryWiseReport
@login_required
def CategoryWiseReport(request, template_name='CategoryWiseReport.html'):
    form = ReportForm()
    return render(request, template_name, {'form': form})


def fetch_CategoryWiseReport_ajax(request):
    data = {}
    if request.is_ajax():
        id_category = request.GET.get('id', None)
        today = datetime.date.today()

        product_dt = ProductModel.objects.values_list().filter(prod_category=id_category)
        # print(today)
        print("Query Result from Category")
        print(product_dt)
        i = 0
        for r in product_dt:
            Mine_nm = MineDetails.objects.get(id=str(r[1]))
            Category_nm = CategoryModel.objects.get(id=str(r[3]))
            i = i + 1
        # print(Mine_nm)
        try:

            Report = ProductModel.objects.values('prod_category').filter(prod_category=id_category).annotate(
                SumOfQuantity=Sum('quantity')).annotate(NoofRows=Count('prod_name')).values('prod_category',
                                                                                            'SumOfQuantity', 'NoofRows',
                                                                                            'mine_id')
            print("Group by prod_category")
            print(Report)
            datalist = []
            print("Print count of product in the selected category")
            # print(NOfProd)
            i = 0
            for r in Report:
                # int_quantity = str(r[0])
                print("Mine_name")
                datalist.append(str(r[0]) + ',' + str(Mine_nm) + ',' + str(Category_nm) + ',' + str(r[1]) + ',' + str(
                    r[2]) + ',' + str(
                    r[3]) + ',' + str(r[4]) + ',' + ',' + str(r[5]))
                i = i + 1
            data['result'] = datalist
            print("Data to send in ajax")
            print(data)
        except Exception as e:
            return HttpResponse(
                "<body bgcolor='#E59887'><h2><center>Data not found.</br></h2></center><small>" + str(
                    e) + "</small></body>")
    else:
        data['result'] = "Not Ajax"

    return JsonResponse(data)


@login_required
def CategoryWiseViewAll(request, template_name='CategoryViewAll.html'):
    today = datetime.date.today()
    end_date = today + datetime.timedelta(days=61)

    book1 = pd.DataFrame(ProductModel.objects.values('prod_category').annotate(SumOfQuantity=Sum('quantity')).annotate(
        NoofProduct=Count('prod_name')).values('mine_id', 'prod_category', 'NoofProduct', 'SumOfQuantity'))
    book2 = pd.DataFrame(
        ProductModel.objects.values('prod_category').filter(prod_expiry__range=(today, end_date)).annotate(
            SumOfQuantity=Sum('quantity')).annotate(nearbyExpiry=Count('prod_name')).values('prod_category',
                                                                                            'nearbyExpiry'))

    bookqs1 = ProductModel.objects.values_list('prod_category').annotate(SumOfQuantity=Sum('quantity')).annotate(
        NoofProduct=Count('prod_name')).values('prod_category', 'SumOfQuantity', 'NoofProduct', 'mine_id')
    datalist = []
    datalist1 = []
    datalist2 = []
    datalist3 = []
    data1 = {}
    data2 = {}
    i = 0
    print("length of book 2")
    print(len(book2))
    print("length of book 1")
    print(len(book1))

    if len(book2) == 0:
        datalist1 = bookqs1
        for r in datalist1:
            print(r)
            # print(str(r['mine_id']))
            Mine_nm = MineDetails.objects.get(id=str(r['mine_id']))
            print(Mine_nm)
            Category_nm = CategoryModel.objects.get(id=str(r['prod_category']))
            print(Category_nm)

            # # datalist.append(str(Mine_nm) + ',' + str(Category_nm) + ',' + str(r['SumOfQuantity']) + ',' + str(r['NoofProduct']))
            datalist.append([])
            datalist[i].append(str(Mine_nm))
            datalist[i].append(str(Category_nm))
            datalist[i].append(str(r['SumOfQuantity']))
            datalist[i].append(str(r['NoofProduct']))

            i = i + 1

            print(datalist)
    else:
        print("test")
        datalist2 = pd.merge(book1, book2, how="left")
        dt = datalist2.fillna("0")
        dt2 = dt.as_matrix()
        datalist2 = np.matrix(dt2)
        datalist2 = datalist2.tolist()
        # datalist=tuple(datalist2)
        print("datalist2 Testing")
        print(datalist2)
        for r in datalist2:
            Mine_nm = MineDetails.objects.get(id=r[0])
            Category_nm = CategoryModel.objects.get(id=r[3])

            datalist3.append([])
            datalist3[i].append(str(Mine_nm))
            datalist3[i].append(str(Category_nm))
            datalist3[i].append(str(r[1]))
            datalist3[i].append(str(r[3]))
            datalist3[i].append(str(r[4]))
            i = i + 1

    dddd = []
    for zz in datalist3:
        dddd.append(zz)
    # print(dddd)
    # aaaa=[]
    # for zz in datalist:
    #     aaaa.append(zz)
    # print(aaaa)
    data1['object_list'] = datalist
    # data2['object_list2']=datalist2
    data1['object_list2'] = dddd
    # print(datalist)
    # print(dddd)
    return render(request, template_name, data1)
    # return render(request, template_name, data)


@login_required
def BatchWiseViewAll(request, template_name='BatchWiseReport.html'):
    today = datetime.date.today()
    end_date = today + datetime.timedelta(days=61)

    book1 = pd.DataFrame(ProductModel.objects.values('batch_number').annotate(SumOfQuantity=Sum('quantity')).annotate(
        NoofProduct=Count('prod_name')).values('mine_id', 'prod_category', 'batch_number', 'prod_name', 'NoofProduct',
                                               'SumOfQuantity'))
    book2 = pd.DataFrame(
        ProductModel.objects.values('batch_number').filter(prod_expiry__range=(today, end_date)).annotate(
            SumOfQuantity=Sum('quantity')).annotate(nearbyExpiry=Count('prod_name')).values('batch_number',
                                                                                            'nearbyExpiry'))
    # print (book1)
    # print(book2)
    bookqs1 = ProductModel.objects.values_list('batch_number').annotate(SumOfQuantity=Sum('quantity')).annotate(
        NoofProduct=Count('prod_name')).values('mine_id', 'prod_category', 'batch_number', 'prod_name', 'NoofProduct',
                                               'SumOfQuantity')
    datalist = []
    datalist1 = []
    datalist2 = []
    datalist3 = []
    data1 = {}
    data2 = {}
    i = 0
    if len(book2) == 0:
        datalist1 = bookqs1
        for r in datalist1:
            # print(r)

            Mine_nm = MineDetails.objects.get(id=str(r['mine_id']))

            Category_nm = CategoryModel.objects.get(id=str(r['prod_category']))
            print("Product Name")
            print(str(r['prod_name']))

            # datalist.append(str(Mine_nm) + ',' + str(Category_nm) + ',' + str(r['SumOfQuantity']) + ',' + str(r['NoofProduct']))
            datalist.append([])
            datalist[i].append(str(r['batch_number']))
            datalist[i].append(str(r['prod_name']))
            datalist[i].append(str(Mine_nm))
            datalist[i].append(str(Category_nm))
            # datalist[i].append(str(r['prod_name']))
            # datalist[i].append(str(r['batch_number']))
            datalist[i].append(str(r['SumOfQuantity']))
            datalist[i].append(str(r['NoofProduct']))

            i = i + 1

            print(datalist)
    else:

        datalist2 = pd.merge(book1, book2, how="left")
        print(datalist2)
        dt = datalist2.fillna("0")
        dt2 = dt.as_matrix()

        datalist2 = np.matrix(dt2)
        datalist2 = datalist2.tolist()
        # datalist=tuple(datalist2)
        print(len(datalist2))
        for r in datalist2:
            Mine_nm = MineDetails.objects.get(id=r[0])
            Category_nm = CategoryModel.objects.get(id=r[1])

            datalist3.append([])
            datalist3[i].append(str(r[2]))
            datalist3[i].append(str(r[5]))
            datalist3[i].append(str(Mine_nm))
            datalist3[i].append(str(Category_nm))
            datalist3[i].append(str(r[4]))
            datalist3[i].append(str(r[1]))
            datalist3[i].append(str(r[6]))

            i = i + 1

    dddd = []
    for zz in datalist3:
        dddd.append(zz)
    print(dddd)
    data1['object_list'] = datalist
    data1['object_list2'] = dddd
    print(datalist)
    print(dddd)
    return render(request, template_name, data1)
    # return render(request, template_name, data)


def search(request, template_name='Search.html'):
    form = ProductForm(request.POST)
    if request.method == 'POST':

        # print("form is calling by post ... ")
        if form.is_valid():
            form.save()
            # return  HttpResponse("ok saved")
            return redirect('inventory_management:product_add')
        else:
            print("form is not valid plz fill ")
    else:
        form = ProductForm()
        print("not post method .. first time caling")

    # category = CategoryModel.objects.distinct('prod_cate')
    # category = CategoryModel.objects.values('prod_category').distinct().order_by('prod_category')
    return render(request, template_name, {'form': form})


@login_required
def inventory_reorder(request, template_name='InventoryReorder.html'):
    form = ReportForm()
    return render(request, template_name, {'form': form})


def fetch_inventory_reorder_ajax(request):
    data = {}
    if request.is_ajax():
        id_category = request.GET.get('id', None)
        id_product = request.GET.get('id_prod', None)
        id_batch = request.GET.get('id_bat', None)

        # print("id_category")
        # print(id_category)

        # print("id_product")
        # print(id_product)

        # print("id_batch")
        # print(id_batch)
        # date_joined = datetime.now()
        today = datetime.date.today()
        # today  = datetime.now()
        # today = formats.date_format(date_joined, "SHORT_DATETIME_FORMAT")
        # print(today)

        product_dt = ProductModel.objects.values_list().filter(prod_category=id_category, id=id_product)

        i = 0
        product = 0
        for r in product_dt:
            Mine_nm = MineDetails.objects.get(id=str(r[1]))
            Category_nm = CategoryModel.objects.get(id=str(r[3]))
            product_nm = str(r[4])
            i = i + 1

        try:
            Report = ProductModel.objects.all().values_list().filter(id=id_product)
            # Report = ProductModel.objects.all().values_list().filter(id=id_product,batch_number=id_batch)
            print(" Report data")
            print(Report)
            datalist = []
            i = 0
            for r in reversed(Report):
                datalist.append(
                    str(r[0]) + ',' + str(today) + ',' + str(Mine_nm) + ',' + str(Category_nm) + ',' + str(
                        r[4]) + ',' + str(r[11]) + ',' + str(r[12]) + ',' + str(
                        r[9]) + ',' + str(r[18]))
                i = i + 1

            data['result'] = datalist
            print(" datalist")
            print(data)
        except Exception as e:
            return HttpResponse(
                "<body bgcolor='#E59887'><h2><center>Data not found.</br></h2></center><small>" + str(
                    e) + "</small></body>")
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


@csrf_exempt
def update_inventory_ajax_add(request):
    data = {}
    if request.is_ajax():
        date = request.GET.get('id_date', None)
        mine = request.GET.get('id_mine', None)
        category = request.GET.get('id_category', None)
        product = request.GET.get('id_product', None)
        batch = request.GET.get('id_batch', None)
        barcode = request.GET.get('id_barcode', None)
        stock = request.GET.get('id_stock', None)
        addedgoods = request.GET.get('id_addedgoods', None)
        totaladd = request.GET.get('id_totaladd', None)
        creationdate = request.GET.get('id_createddate', None)
        Product_idd = request.GET.get('id_product_details', None)
        print("Product_idd")
        print(Product_idd)

        prod_mine_id = request.GET.get('idd_mine', None)
        prod_category_id = request.GET.get('idd_category', None)
        # prod_product_name = request.GET.get('idd_product', None)

        print("entry")
        print(
            date + mine + category + product + batch + barcode + stock + addedgoods + totaladd + creationdate + Product_idd)
        print("Mine_id")
        print(prod_mine_id)
        print("idd_category")
        print(prod_category_id)

        deduct_date = mine_id = prod_category = prod_name = barcode = batch_number = quantity = addedstock = updated_quantity = 0.0
        addinst = ReorderModel()
        addinst.Reorder_date = date
        addinst.creationdate = creationdate
        addinst.mine_id = mine
        addinst.prod_category = category
        addinst.product_id = Product_idd
        addinst.prod_name = product
        addinst.barcode = barcode
        addinst.batch_number = batch
        addinst.quantity = stock
        addinst.addedstock = addedgoods
        addinst.updated_quantity = totaladd

        addinst.save()

        try:
            obj = ProductModel.objects.filter(mine_id=prod_mine_id, prod_category=prod_category_id, prod_name=product,
                                              batch_number=batch).update(quantity=totaladd)
            # list = ModelClass.objects.filter(mine_id=mine,prod_category=category,prod_name=product,batch_number=batch)
            print("abc")
            # print(obj)
            # obj = Product.objects.get(pk=pk)
            # obj.name = "some_new_value"
            # obj.save()
            data['result'] = "Data saved"
        except Exception as e:
            return HttpResponse(
                "<body bgcolor='#E59887'><h2><center>Incorrect data</br></h2></center><small>" + str(
                    e) + "</small></body>")
    else:
        data['result'] = "Not Ajax"

    return JsonResponse(data)


def fetch_search_ajax(request):
    if request.is_ajax():
        q = request.GET.get('term', None).capitalize()
        search_qs = ProductModel.objects.values_list().filter(prod_category=q)
        data = {}
        i = 0
        product_data = []
        for r in search_qs:
            product_data.append(str(r[0]) + ',' + str(r[4]))
            i = i + 1
        data['result'] = product_data
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def settings(request, template_name='Settings.html'):
    if request.method == 'POST':
        form = BranchForm(request.POST)
        # print("abc")
        if form.is_valid():
            form.save()
            # return  HttpResponse("ok saved")
            # return  HttpResponse("ok saved")
            return redirect('inventory_management:distribute_prod')
    else:
        form = BranchForm()
        # print(form)
    return render(request, template_name, {'form': form})


def manageAll(request, template_name='manage_all.html'):
    if request.method == 'POST':
        form = BranchForm(request.POST)
        # print("abc")
        if form.is_valid():
            form.save()
            # return  HttpResponse("ok saved")
            # return  HttpResponse("ok saved")
            return redirect('inventory_management:distribute_prod')
    else:
        form = BranchForm()
        # print(form)
    return render(request, template_name, {'form': form})


def branch_manage(request, template_name='BranchManage.html'):
    book = BranchModel.objects.all()
    # print(book)
    data = {}
    data['object_list'] = book
    return render(request, template_name, data)


def branch_edit(request, pk, template_name='BranchManage.html'):
    book = get_object_or_404(BranchModel, pk=pk)
    ### select * from SupplierModel table where id=6
    # print(book)
    form = BranchForm(request.POST or None, instance=book)
    if form.is_valid():
        form.save()
        # return  HttpResponse("ok saved")
        return redirect('inventory_management:settings')
    return render(request, template_name, {'form': form})


def branch_delete(request, pk):
    book = get_object_or_404(BranchModel, pk=pk)
    book.delete()
    return redirect('inventory_management:settings')


def distribute_prod(request, template_name='Distribute_prod.html'):
    form = BranchForm()
    return render(request, template_name, {'form': form})


def fetch_mine_branch(request):
    data = {}
    if request.is_ajax():
        ids = request.GET.get('id', None)
        print("id requested")
        print(ids)
        branch_details = BranchModel.objects.values_list().filter(mine_id=ids)
        product_details = ProductModel.objects.values_list().filter(mine_id=ids).order_by('prod_category')
        # category = CategoryModel.objects.values('prod_category').distinct().order_by('prod_category')
        print("branch_details")
        print(branch_details)
        data = {}
        branch_data = []
        product_data = []
        for r in branch_details:
            branch_data.append(str(r[0]) + ',' + str(r[2]))
        data['result'] = branch_data

        for r in product_details:
            Category_nm = CategoryModel.objects.get(id=str(r[3]))
            product_data.append(str(r[3]) + ',' + str(Category_nm))
            product_data = list(set(product_data))
        data['result1'] = product_data

        print("data")
        print(data)
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def fetch_assign_id(request):
    data = {}
    if request.is_ajax():
        ids = request.GET.get('id', None)
        # print("id requested")
        # print(ids)
        category_data = []
        category_list_name = []
        today = datetime.date.today()
        product_details = ProductModel.objects.values_list().filter(mine_id=ids)
        branch_details = BranchModel.objects.values_list().filter(mine_id=ids)

        data1 = {}
        branch_data = []

        try:
            Report = ProductModel.objects.all().values_list().filter(mine_id=ids)
            # Report = ProductModel.objects.all().values_list().filter(id=id_product,batch_number=id_batch)
            # print(" Report data")
            # print(Report)
            datalist = []

            for r in Report:
                Mine_nm = MineDetails.objects.get(id=str(r[1]))
                # exp_date = MineDetails.objects.get(id=r[7])
                # print("exp_date")
                # print(r[7])
                # category_id_list.append(r[3])
                Category_nm = CategoryModel.objects.get(id=str(r[3]))
                datalist.append(
                    str(today) + ',' + str(Mine_nm) + ',' + str(Category_nm) + ',' + str(r[4]) + ',' + str(
                        r[11]) + ',' + str(r[9]) + ',' + str(r[6]) + ',' + str(r[1]) + ',' + str(r[3]) + ',' + str(
                        r[1]) + ',' + str(r[0]))

            for r1 in branch_details:
                branch_data.append(str(r1[0]) + ',' + str(r1[2]))

            # print("category_id_list")
            # print(category_id_list)
            print(datalist)
            data['result'] = datalist
            data['result1'] = branch_data
            data['mineid'] = ids
            # print(" final data")
            # print(data)
            print(" Search data")
            print(data)
        except Exception as e:
            return HttpResponse(
                "<body bgcolor='#E59887'><h2><center>Data not found.</br></h2></center><small>" + str(
                    e) + "</small></body>")
    else:
        data['result'] = "Not Ajax"
    return JsonResponse(data)


def distribution(request, template_name='Distribute_prod.html'):
    print('Update data')
    mine_name = request.POST.get('mine_nm', None)
    print("mine_name")
    print(mine_name)
    print(type(mine_name))
    datalist1 = []

    mine_id_selected = MineDetails.objects.filter(name=mine_name).values("id")

    print("Choosed Id")
    print(mine_id_selected)
    diff = []
    colList0 = request.POST.getlist('date_nm', None)
    colList1 = request.POST.getlist('mine_nm', None)
    colList2 = request.POST.getlist('dropdown', None)
    colList3 = request.POST.getlist('category_nm', None)
    colList4 = request.POST.getlist('product_id_nm', None)
    colList5 = request.POST.getlist('batch_id_nm', None)
    colList6 = request.POST.getlist('asign_txtbox_nm', None)
    colList7 = request.POST.getlist('quantity_id_nm', None)
    colList8 = request.POST.getlist('checkbox_nm', None)
    colList9 = request.POST.getlist('cat_id', None)
    colList10 = request.POST.getlist('m_id', None)
    colList11 = request.POST.getlist('q_id', None)
    colList12 = request.POST.getlist('prod_unique_id', None)

    print("colList12")
    print(colList12)

    for i in range(len(colList6)):
        colList6[i] = int(colList6[i])

    for i in range(len(colList9)):
        colList9[i] = int(colList9[i])

    for i in range(len(colList10)):
        colList10[i] = int(colList10[i])

    for i in range(len(colList11)):
        colList11[i] = int(colList11[i])

    print("colList11")
    print(colList11)
    # print(type(colList7[0])

    # # for i in range(len(colList7)):
    # #     colList7[i] = int(colList7[i])

    # print(type(colList7)  )
    entry_date = mine_name = branch_name = prod_category = prod_name = batch_number = assign_quantity = quantity = prod_unique_id = 0.0
    # Object1 = DistributeModel()
    for x in range(len(colList1)):
        # for x in range(len(colList1)):
        if colList6[x] > 0:
            Object1 = DistributeModel()
            # print(x)

            Object1.distribution_date = colList0[x]
            Object1.mine_id = colList10[x]
            Object1.mine_name = colList1[x]

            Object1.branch_name = colList2[x]
            Object1.prod_category = colList3[x]
            Object1.prod_name = colList4[x]
            Object1.batch_number = colList5[x]
            Object1.assign_quantity = colList6[x]
            Object1.quantity = colList7[x]
            Object1.prod_unique_id = colList12[x]
            Object1.save()
            sub = colList11[x] - colList6[x]
            print(sub)
            obj2 = ProductModel.objects.filter(mine_id=colList10[x], prod_category=colList9[x], prod_name=colList4[x],
                                               batch_number=colList5[x]).update(quantity=sub)
    return redirect('inventory_management:outlet_viewall')
    # return  HttpResponse("ok saved")


# def autocompleteModel(request):
#    if request.is_ajax():
#        q = request.GET.get('term', '').capitalize()
#        search_qs = ProductModel.objects.filter(prod_name__startswith=q)
#        results = []
#        print q
#        for r in search_qs:
#            results.append(r.FIELD)
#        data = json.dumps(results)
#    else:
#        data = 'fail'
#    mimetype = 'application/json'
#    return HttpResponse(data, mimetype)

@login_required
def utilizationReport(request, template_name='UtilizationReport.html'):
    return render(request, template_name)


def fetch_longpending(request):
    data = {}
    # datalist=[]
    if request.is_ajax():
        duration_ajax = request.GET.get('date_to', None)
        input_data = request.GET.get('min', None)
        input_data = int(input_data)
        today = datetime.datetime.strptime(duration_ajax, '%Y-%m-%d').date()
        product_initialQuantity = ProductModel.objects.values_list()
        datalist = []
        try:
            for r in product_initialQuantity:
                dif = r[19] - input_data
                product_dt = ProductModel.objects.values_list().filter(quantity=r[19], id=r[0],
                                                                       entry_date__range=(r[18], today)).exclude(
                    quantity=0)
                # q2 = ProductModel.objects.values_list().filter(quantity__gte=dif,id=r[0],entry_date__range=(r[18],today)).exclude(quantity=0)
                # product_dt=q1.union(q2)
                Mine_nm = MineDetails.objects.get(id=str(r[1]))
                # datalist=[]
                for r in product_dt:
                    ddd = today - r[18]
                    dayspending = ddd.days
                    datalist.append(str(Mine_nm) + ',' + str(r[4]) + ',' + str(r[18]) + ',' + str(r[19]) + ',' + str(
                        dayspending) + ',' + str(r[6]) + ',' + str(r[9]))
                    # print(datalist)
                print("final")
                data['result'] = datalist
                # print(data)
        except Exception as e:
            return HttpResponse(
                "<body bgcolor='#E59887'><h2><center>Data not found.</br></h2></center><small>" + str(
                    e) + "</small></body>")
    else:
        data['result'] = "Not Ajax"
        # print("catch block")
    print(data)
    return JsonResponse(data)


@login_required
def deleteExpired(request, template_name='ExpiredProductReport.html'):
    today = datetime.date.today()
    ProductModel.objects.filter(prod_expiry__lt=today).delete()
    ProductModel.objects.filter(prod_expiry=today).delete()
    return HttpResponse("Deleted successfully")


@login_required
def abtExpired(request, template_name='abtExpired.html'):
    return render(request, template_name)


def fetch_abtExpire(request):
    data = {}
    today = datetime.date.today()
    if request.is_ajax():
        year = request.GET.get('yearValue', None)
        month = request.GET.get('monthValue', None)
        day = request.GET.get('dayValue', None)
        print(type(day))
        print(day)

        if year == "" and month == "0" and day == "0":
            print("Not selected any ")
            status = "Not selected any "
            end_date = today
        else:
            if year != "" and month == "0" and day == "0":
                print("Selected Year")
                year = int(year)
                end_date = today + relativedelta(years=+year)
            # status=""
            elif year == "" and month != "" and day == "0":
                print("Selected Month")
                month = int(month)
                # end_date = today + datetime.timedelta(months=month)
                end_date = today + relativedelta(months=+month)

            elif year == "" and month == "0" and day != "0":
                print("Selected Day")
                day = int(day)
                end_date = today + datetime.timedelta(days=day)
            elif year != "" and month != "0" and day != "0":
                print("Selected Year,Month and day")
                year = int(year)
                month = int(month)
                day = int(day)
                end_date = today + relativedelta(years=+year)
                end_date = end_date + relativedelta(months=+month)
                end_date = end_date + relativedelta(days=+day)

            elif year != "" and month != "0" and day == "0":
                print("Selected Year and month")
                year = int(year)
                month = int(month)
                end_date = today + relativedelta(years=+year)
                end_date = end_date + relativedelta(months=+month)
                end_date = end_date + relativedelta(days=+day)
            elif year != "" and month != "0" and day == "0":
                print("Selected Year and day")
                year = int(year)
                month = int(month)
                end_date = today + relativedelta(years=+year)
                end_date = end_date + relativedelta(months=+month)
            elif year != "" and month == "0" and day != "0":
                print("Selected Year and Day")
                year = int(year)
                day = int(day)
                end_date = today + relativedelta(months=+year)
                end_date = end_date + relativedelta(days=+day)
            elif year == "" and month != "0" and day != "0":
                print("Selected month and Day")
                month = int(month)
                day = int(day)
                end_date = end_date + relativedelta(months=+month)
                end_date = end_date + relativedelta(days=+day)
        print(end_date)
        product_dt = ProductModel.objects.all().values_list().filter(prod_expiry__range=(today, end_date)).order_by(
            'prod_expiry')
        distribution_entry = DistributeModel.objects.all().values('prod_unique_id').annotate(id=Max('id')).values('id')
        print("distribution_entry")
        print(distribution_entry)
        book = DistributeModel.objects.all().values_list().filter(id__in=distribution_entry)
        print("book")
        print(book)
        datalist = []
        for r1 in book:
            print(str(r1[10]))
            print(str(r1[9]))
            ProductDistibuteExpiryQ = ProductModel.objects.all().values_list().filter(id=str(r1[10]),
                                                                                      prod_expiry__range=(
                                                                                      today, end_date)).order_by(
                'prod_expiry')
            for r3 in ProductDistibuteExpiryQ:
                updatedQ = DistributeModel.objects.all().values_list().filter(prod_unique_id=r3[0])
                for r4 in updatedQ:
                    print("Assigned Quantity")
                    print(str(r4[8]))

                    datalist.append(str(r3[7]) + ',' + str(r4[3]) + ',' + str(r4[4]) + ',' + str(r4[5]) + ',' + str(
                        r4[7]) + ',' + str(r4[6]) + ',' + str(r4[8]) + ',' + str(r3[10]) + ',' + str(r3[8]) + ',' + str(
                        r3[6]))

                print("updatedQ")
                print(updatedQ)

            print("ProductDistibuteExpiryQ")
            print(ProductDistibuteExpiryQ)

        print("Datalist")
        print(datalist)
        try:
            for r in product_dt:
                Mine_nm = MineDetails.objects.get(id=str(r[1]))
                Category_nm = CategoryModel.objects.get(id=str(r[3]))

                # product_dt = DistributeModel.objects.all().values_list().filter(prod_expiry__range=(today,end_date)).order_by('prod_expiry')
                datalist.append(
                    str(r[7]) + ',' + str(Mine_nm) + ',' + str("No Branch") + ',' + str(Category_nm) + ',' + str(
                        r[11]) + ',' + str(r[4]) + ',' + str(r[9]) + ',' + str(r[10]) + ',' + str(r[8]) + ',' + str(
                        r[6]))

                data['result'] = datalist

            # data['result'] = datalist

            # print(data)
        except Exception as e:
            return HttpResponse(
                "<body bgcolor='#E59887'><h2><center>Data not found.</br></h2></center><small>" + str(
                    e) + "</small></body>")
    else:
        data['result'] = "Not Ajax"
    print("Final Result")
    print(data)

    return JsonResponse(data)


@login_required
def abtOutOfStock(request, template_name='abtOutOfStock.html'):
    return render(request, template_name)


def fetch_abtOutOfStock(request):
    data = {}
    quantity = " "
    abc = " "
    today = datetime.date.today()
    if request.is_ajax():
        no = request.GET.get('numberValue', None)
        # print(no)

        product_dt = ProductModel.objects.all().values_list().filter(quantity__lte=no).exclude(quantity=0).order_by(
            'quantity')
        product_id_Query = DistributeModel.objects.values('prod_unique_id').annotate(qtn=Sum('assign_quantity')).values(
            'prod_unique_id').filter(qtn__lte=no)
        print("product_id_Query")
        print(product_id_Query)
        datalist = []
        for value in product_id_Query:
            dd = value['prod_unique_id']
            dict1 = DistributeModel.objects.values('prod_unique_id').annotate(qtn1=Sum('assign_quantity')).filter(
                prod_unique_id=dd).values('qtn1')
            for value in dict1:
                dd1 = str(value['qtn1'])
            book = DistributeModel.objects.values_list().filter(prod_unique_id=dd)
            for r1 in book:
                ProductDistibute = ProductModel.objects.all().values_list().filter(id=str(r1[10]))
                # quantity=str(r1[8])
                totalQtn = dd1
                for r3 in ProductDistibute:
                    print("unit")
                    print(r3[6])
                    quantity = str(r1[8]) + " " + str(r3[6])
                    totalQtn = str(dd1) + " " + r3[6]
                    # totalQtn=str(dd1)+" " + "abc"
                    abc = str(r3[6])
            datalist.append(
                str(totalQtn) + ',' + str(r1[3]) + ',' + str(r1[4]) + ',' + str(r1[5]) + ',' + str(r1[7]) + ',' + str(
                    r1[6]) + ',' + str(abc) + ',' + str(abc) + ',' + str(r1[10]))
        # print("datalist")
        # print(datalist)

        try:
            for r in product_dt:
                Mine_nm = MineDetails.objects.get(id=str(r[1]))
                Category_nm = CategoryModel.objects.get(id=str(r[3]))
                q = str(r[9]) + " " + r[6]
                datalist.append(
                    str(q) + ',' + str(Mine_nm) + ',' + str("    ----------    ") + ',' + str(Category_nm) + ',' + str(
                        r[11]) + ',' + str(r[4]) + ',' + str(q) + ',' + str("-----") + ',' + str(r[0]))

            data['result'] = datalist

        except Exception as e:
            return HttpResponse(
                "<body bgcolor='#E59887'><h2><center>Data not found.</br></h2></center><small>" + str(
                    e) + "</small></body>")
    else:
        data['result'] = "Not Ajax"
    # print("Final Result")
    # print(data)

    return JsonResponse(data)


@login_required
def outlet_viewall(request, template_name='OutletViewAll.html'):
    data = {}
    i = 0
    datalist = []
    today = datetime.date.today()
    productIdSumQuery = DistributeModel.objects.values('prod_unique_id').annotate(qtn=Sum('assign_quantity')).values(
        'prod_unique_id', 'qtn').order_by('prod_unique_id')
    datalist1 = []
    for value in productIdSumQuery:
        Id = value['prod_unique_id']
        sumStock = value['qtn']
        distributEntry = DistributeModel.objects.values_list().filter(prod_unique_id=Id)
        for r1 in distributEntry:
            productDetails = ProductModel.objects.values_list().filter(id=r1[10])

            for r3 in productDetails:
                print("R3")
                print(r3)
                print(r3[7])
                unit = str(sumStock) + " " + (r3[6])
                datalist.append([])
                datalist[i].append(str(Id))
                datalist[i].append(str(r3[7]))
                datalist[i].append(str(r1[3]))
                datalist[i].append(str(r1[4]))
                datalist[i].append(str(r1[5]))
                datalist[i].append(str(r1[7]))
                datalist[i].append(str(r1[6]))
                datalist[i].append(str(unit))
                datalist[i].append(str("Rs.") + " " + str(r3[10]))
                datalist[i].append(str(r3[8]))

                ddd = r3[8] - today
                daysleft = ddd.days
                datalist[i].append(str(daysleft) + " " + "Days")
                if daysleft <= 0:
                    status = "Expired"
                elif daysleft > 0 and daysleft <= 61:
                    status = "Expiring Soon"
                else:

                    if sumStock <= 0:
                        status = "Out of Stock"
                    else:
                        status = "OK"
                datalist[i].append(status)

                i = i + 1

    df = pd.DataFrame(datalist)
    # print(df)
    # print("-----------------------------------------------------------------------------------")
    df2 = df.drop_duplicates([1])
    # print("After Remove")
    # print(df2)
    datalist = np.matrix(df2)
    datalist = datalist.tolist()
    print(datalist)
    # ----Branch Data-------------------------------------------------------
    j = 0
    datalist1 = []
    book = ProductModel.objects.values_list()
    for r in book:
        datalist1.append([])
        mine_table = MineDetails.objects.get(id=str(r[1]))
        Category_table = CategoryModel.objects.get(id=str(r[3]))
        # print("Invoice")
        # print(str(r[7]))
        datalist1[j].append(str(r[0]))
        datalist1[j].append(str(r[7]))
        datalist1[j].append(mine_table.name)
        datalist1[j].append("--------")
        datalist1[j].append(Category_table.prod_category)
        datalist1[j].append(str(r[11]))
        datalist1[j].append(str(r[4]))
        quantity_str = str(r[9])
        int_quantity = int(quantity_str)
        if int_quantity <= 0:
            Unit = "Out Of Stock"
        else:
            Unit = str(r[9]) + " " + str(r[6])
        datalist1[j].append(Unit)
        datalist1[j].append(str("Rs.") + " " + str(r[10]))
        datalist1[j].append(str(r[8]))
        ddd = r[8] - today
        daysleft = ddd.days
        quantity_str = str(r[9])
        int_quantity = int(quantity_str)
        datalist1[j].append(str(daysleft) + " " + str("Days"))
        if daysleft <= 0:
            status = "Expired"
        elif daysleft > 0 and daysleft <= 61:
            status = "Expiring Soon"
        else:
            if int_quantity <= 0:
                status = "Out of Stock"
            else:
                status = "OK"
        datalist1[j].append(status)
        # datalist1[j].append(str(r[0]))

        j = j + 1

    for d in datalist1:
        datalist.append(d)
    # print(type(datalist))

    data['object_list'] = datalist
    return render(request, template_name, data)


@login_required
def ExpiredProdView(request, template_name='ExpiredProductReport.html'):
    today = datetime.date.today()
    print("today")
    print(today)
    q1 = ProductModel.objects.values_list().filter(prod_expiry__lt=today)
    q2 = ProductModel.objects.values_list().filter(prod_expiry=today)
    book = q1.union(q2)
    print("book")
    print(book)
    datalist = []
    data = {}
    i = 0
    for r in book:
        batch = str(r[11])
        Unit = str(r[9]) + " " + str(r[6])
        price = str("Rs.") + " " + str(r[10])

        mine_table = MineDetails.objects.get(id=str(r[1]))
        Category_table = CategoryModel.objects.get(id=str(r[3]))
        datalist.append([])
        datalist[i].append(str(r[7]))
        # datalist[i].append(str(r[1]))
        datalist[i].append(mine_table.name)

        datalist[i].append(str(r[2]))
        datalist[i].append(Category_table.prod_category)
        datalist[i].append(str(r[4]))
        datalist[i].append(str(Unit))
        datalist[i].append(str(Unit))
        datalist[i].append(str(r[7]))
        datalist[i].append(str(r[8]))
        datalist[i].append(str(r[9]))
        datalist[i].append(str(price))

        datalist[i].append(str(r[11]))
        datalist[i].append(str(batch))
        i = i + 1

    print(datalist)
    data['object_list'] = datalist
    return render(request, template_name, data)


@login_required
def OutletExpiredView(request, template_name='OutletExpiredProduct.html'):
    today = datetime.date.today()
    print("today")
    print(today)
    q1 = ProductModel.objects.values_list().filter(prod_expiry__lt=today)
    q2 = ProductModel.objects.values_list().filter(prod_expiry=today)
    book = q1.union(q2)
    print("book")
    print(book)
    datalist = []
    datalist1 = []
    data = {}
    i = 0
    for r in book:
        mine_table = MineDetails.objects.get(id=str(r[1]))
        Category_table = CategoryModel.objects.get(id=str(r[3]))
        datalist.append([])
        datalist[i].append(str(r[7]))
        datalist[i].append(mine_table.name)
        datalist[i].append(str("---------"))
        datalist[i].append(Category_table.prod_category)
        datalist[i].append(str(r[4]))
        datalist[i].append(str(r[11]))
        datalist[i].append(str(r[9]) + " " + str(r[6]))
        datalist[i].append(str(r[8]))
        i = i + 1

    j = 0
    for r2 in book:
        book = DistributeModel.objects.values_list()
        for r3 in book:
            if r3[2] == r2[1] and r3[6] == r2[4] and r3[7] == r2[11] and r3[8] > 0:
                print("matched")
                datalist1.append([])
                datalist1[j].append(str(r3[7]))
                datalist1[j].append(str(r3[3]))
                datalist1[j].append(str(r3[4]))
                datalist1[j].append(str(r3[5]))
                datalist1[j].append(str(r3[6]))
                datalist1[j].append(str(r3[7]))
                datalist1[j].append(str(r3[9]))
                datalist1[j].append(str(r2[8]))
                j = j + 1

    for d in datalist1:
        datalist.append(d)
    print(type(datalist))

    print("product details 2")
    print("datalist1")
    print(datalist1)
    data['object_list'] = datalist
    return render(request, template_name, data)


@login_required
def OutOfStock(request, template_name='OutOfStockReport.html'):
    today = datetime.date.today()
    book = ProductModel.objects.values_list().filter(quantity__lte=0, prod_expiry__gt=today)
    datalist3 = []

    data = {}
    j = 0
    for r in book:
        batch = str(r[11])
        Unit = str(r[9]) + " " + str(r[5])
        price = str("Rs.") + " " + str(r[10])

        mine_table = MineDetails.objects.get(id=str(r[1]))
        Category_table = CategoryModel.objects.get(id=str(r[3]))

        datalist3.append([])
        datalist3[j].append(str(r[7]))
        datalist3[j].append(mine_table.name)
        datalist3[j].append(str(r[2]))
        datalist3[j].append(Category_table.prod_category)
        datalist3[j].append(str(r[4]))
        datalist3[j].append(str(Unit))
        datalist3[j].append(str(Unit))
        datalist3[j].append(str(r[7]))
        datalist3[j].append(str(r[8]))
        datalist3[j].append(str(r[9]))
        datalist3[j].append(str(price))
        datalist3[j].append(str(r[11]))
        datalist3[j].append(str(batch))
        listOfAlternateProductQ = AlternateProdModel.objects.values_list().filter(prod_id=r[0])
        print(listOfAlternateProductQ)
        datalist4 = []
        for r1 in listOfAlternateProductQ:
            AlternateStockQ = ProductModel.objects.values_list().filter(mine_id=r1[2], prod_name=r1[4], quantity__gt=0,
                                                                        prod_expiry__gt=today)
            for r3 in AlternateStockQ:
                print(r3[10])
                print(str(r3[6]))
                abc = str(r3[9])
                abc = abc.split("(")
                a = str(abc[1])
                demo = a.split(")")
                Validproduct = str(r3[4]) + " " + "[" + str(r3[10]) + " " + str(r3[6]) + "]"
                datalist4.append(Validproduct)

                datalist3[j].append(datalist4)
        j = j + 1
    data['object_list'] = datalist3
    print(datalist3)
    return render(request, template_name, data)


@login_required
def OutletOutOfStock(request, template_name='OutletOutOfStock.html'):
    productIdSumQuery = DistributeModel.objects.values('prod_unique_id').annotate(qtn=Sum('assign_quantity')).values(
        'prod_unique_id', 'qtn').filter(qtn__lte=0)
    datalist = []
    data = {}
    i = 0
    print("productIdSumQuery")
    print(productIdSumQuery)
    for value in productIdSumQuery:
        Id = value['prod_unique_id']
        sumStock = value['qtn']
        distributEntry = DistributeModel.objects.values_list().filter(prod_unique_id=Id)
        for r in distributEntry:
            datalist.append([])
            datalist[i].append(str(r[3]))
            datalist[i].append(str(r[4]))
            datalist[i].append(str(r[5]))
            datalist[i].append(str(r[6]))
            # datalist[i].append(str(r[7]))
            # datalist[i].append(str(sumStock))
            # datalist[i].append(Id)
            listOfAlternateProductQuery = AlternateProdModel.objects.values_list().filter(prod_id=Id)
            # print("listOfAlternateProductQuery")
            # print(listOfAlternateProductQuery)
            datalist2 = []
            for r1 in listOfAlternateProductQuery:
                AlternateStockQueryset = DistributeModel.objects.values_list().filter(mine_id=r1[2], prod_name=r1[4],
                                                                                      assign_quantity__gt=0)
                # print("AlternateStockQueryset")
                # print(AlternateStockQueryset)
                for r3 in AlternateStockQueryset:
                    print(r3[10])
                    abc = str(r3[9])
                    abc = abc.split("(")
                    a = str(abc[1])
                    demo = a.split(")")

                    # abc=abc.split("")

                    # abc=abc.split("(")
                    Validproduct = str(r3[6]) + " " + "[" + str(r3[8]) + " " + str(demo[0]) + "]" + "," + " " + str(
                        r3[4])
                    datalist2.append(Validproduct)

                    datalist[i].append(datalist2)
            datalist[i].append(Id)
            i = i + 1
    print("didtribution details")
    print(datalist)

    # df = pd.DataFrame(datalist)
    # print(df)
    # print("-----------------------------------------------------------------------------------")
    # df2=df.drop_duplicates([5])
    # print("After Remove")
    # print(df2)
    # datalist=np.matrix(df2)
    # datalist = datalist.tolist()
    # print(datalist)

    today = datetime.date.today()
    book = ProductModel.objects.values_list().filter(quantity__lte=0, prod_expiry__gt=today)
    datalist3 = []

    j = 0
    for r in book:
        mine_table = MineDetails.objects.get(id=str(r[1]))
        Category_table = CategoryModel.objects.get(id=str(r[3]))
        datalist3.append([])
        datalist3[j].append(mine_table.name)
        datalist3[j].append(str("---------"))
        datalist3[j].append(Category_table.prod_category)
        datalist3[j].append(str(r[4]))
        listOfAlternateProductQ = AlternateProdModel.objects.values_list().filter(prod_id=r[0])
        print(listOfAlternateProductQ)
        datalist4 = []
        for r1 in listOfAlternateProductQ:
            AlternateStockQ = ProductModel.objects.values_list().filter(mine_id=r1[2], prod_name=r1[4], quantity__gt=0,
                                                                        prod_expiry__gt=today)
            for row in AlternateStockQ:
                abc = str(row[6])
                abc = abc.split("(")
                a = str(abc[1])
                demo = a.split(")")
                Validproduct1 = str(row[4]) + " " + "[" + str(row[10]) + " " + str(demo[0]) + "]"
                datalist4.append(Validproduct1)
                datalist3[j].append(datalist4)
        j = j + 1

    for d in datalist3:
        datalist.append(d)
    print("datalist3")
    print(datalist3)
    print("datalist")
    print(datalist)

    data['object_list'] = datalist
    return render(request, template_name, data)


@login_required
def altProd_manage(request, template_name='altProdManage.html'):
    book = AlternateProdModel.objects.values_list().order_by('prod_id')
    datalist = []
    print("book")
    print(book)
    i = 0
    for q in book:
        datalist.append([])
        datalist[i].append(str(q[0]))
        # datalist[i].append(str(q[2]))
        print(str(q[1]))
        ProductModel_value = ProductModel.objects.values_list().filter(id=str(q[1]))
        for r in ProductModel_value:
            datalist[i].append(str(r[4]))

        # ProductModel_value = ProductModel.objects.get(id=str(q[0]))
        # datalist[i].append(ProductModel_value)
        datalist[i].append(str(q[4]))
        # print(ProductModel_value)
        i = i + 1

    print("altProd_manage datalist====")
    print(datalist)
    data = {}
    data['object_list'] = datalist
    return render(request, template_name, data)


@login_required
def altProd_edit(request, pk, template_name='altProdManage.html'):
    book = get_object_or_404(AlternateProdModel, pk=pk)
    print("Book")
    print(book)
    form = AlternateProdForm(request.POST or None, instance=book)
    print("form")
    print(form)
    if form.is_valid():
        form.save()
    return render(request, template_name, {'form': form})


@login_required
def altProd_delete(request, pk):
    book = get_object_or_404(AlternateProdModel, pk=pk)
    book.delete()
    return redirect('inventory_management:supplier_manage')    