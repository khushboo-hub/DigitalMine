from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect

# Create your views here.
from setting.forms import setting_form
from setting.models import setting
from django.shortcuts import get_list_or_404, get_object_or_404


@login_required
def add_constant(request):
        if request.method == "POST":
            form = setting_form(request.POST)
            if form.is_valid():
                form.save()
                return redirect('setting:manage_constant')
            else:
                print("Form Invalid")
        else:
            form = setting_form()
        return render(request, "add_constant.html", {'form': form})

@login_required
def manage_constant(request):
    return_data = setting.objects.all().order_by('-id')
    return render(request, "manage_constant.html",{'return_data': return_data})

def edit_constant(request, id):
    base_data = get_object_or_404(setting, id=id)
    form = setting_form(request.POST or None, request.FILES or None, instance=base_data)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('setting:manage_constant')
    return render(request, "edit_constant.html", {'form': form})

def delete_constant(request, id):
    base_column = setting.objects.get(id=id)
    base_column.delete()
    return redirect('setting:manage_constant')