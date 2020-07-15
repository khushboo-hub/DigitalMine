from django.contrib import messages
from django.shortcuts import render, redirect
from safety.forms import SafetyForm, SafetyTableForm
from safety.models import Safety, SafetyTable
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse


def safe(request):
    form1 = SafetyForm()
    form2 = []
    form2.append(SafetyTableForm())
    if request.method == "POST":
        print_hazard = request.POST.getlist('print_hazard')
        mit_date = request.POST.getlist('mit_date')
        auditable_work = request.POST.getlist('auditable_work')
        comp_date = request.POST.getlist('comp_date')
        remarks = request.POST.getlist('remarks')
        form = SafetyForm(request.POST or None)
        if form.is_valid():
            safety_id = form.save()
            safety_table = []
            for i in range(0, len(print_hazard)):
                safety_table.append(SafetyTable(safety_id=safety_id,
                                                print_hazard=print_hazard[i],
                                                mit_date=mit_date[i],
                                                auditable_work=auditable_work[i],
                                                comp_date=comp_date[i],
                                                remarks=remarks[i]))

            SafetyTable.objects.bulk_create(safety_table)

            return redirect('safety:show',str(safety_id.id))

    return render(request, 'safety/index.html', {'form1': form1, 'form2': form2})


def show(request,pk,template_name='safety/show.html'):
    safetytable=[]
    safety = Safety.objects.get(pk=pk)
    safetytable.append(SafetyTable.objects.filter(safety_id=safety))

    return render(request, template_name,{'safetytable': safetytable,'safety':safety})


def manage(request):
    safety = Safety.objects.all()
    return render(request, 'safety/manage.html', {'safety': safety})


def edit(request, pk, template_name='safety/index.html'):
    safety_instance = Safety.objects.get(pk=pk)
    form1 = SafetyForm(request.POST or None, instance=safety_instance)
    form2=[]
    safety_table=SafetyTable.objects.filter(safety_id=safety_instance.pk)
    present_ids=[]
    current_ids=[]
    for safety in safety_table:
        present_ids.append(safety.pk)
        form2.append(SafetyTableForm(instance=safety))

    if request.method=="POST":
        print('present_ids',present_ids)
        try:
            form2=[]
            print_hazard = request.POST.getlist('print_hazard')
            mit_date = request.POST.getlist('mit_date')
            auditable_work = request.POST.getlist('auditable_work')
            comp_date = request.POST.getlist('comp_date')
            remarks = request.POST.getlist('remarks')
            safety_ids=request.POST.getlist('safetytable_id')
            print('safety_ids',safety_ids)
            if form1.is_valid():
                form1.save()
            i=0
            for id in safety_ids: # 1 2 3 1 2
                current_ids.append(int(id))

                instance = SafetyTable.objects.get(pk=id)
                instance.print_hazard=print_hazard[i]
                instance.mit_date=mit_date[i]
                instance.auditable_work=auditable_work[i]
                instance.comp_date=comp_date[i]
                instance.remarks=remarks[i]
                instance.save()
                print('instance',instance.remarks)
                form2.append(SafetyTableForm(instance=instance))
                i+=1
            cc=list(set(present_ids).difference(current_ids))

            for c in cc:
                instance = SafetyTable.objects.get(pk=c)
                instance.delete()

            for j in range(i, len(print_hazard)):
                safety_table=SafetyTable(safety_id=safety_instance,
                                                print_hazard=print_hazard[j],
                                                mit_date=mit_date[j],
                                                auditable_work=auditable_work[j],
                                                comp_date=comp_date[j],
                                                remarks=remarks[j])
                safety_table.save()
                form2.append(SafetyTableForm(instance=safety_table))
            messages.success(request,"Successfully Updated")
            return redirect('safety:manage')
        except Exception as e:

            messages.error(request,"Something Went Wrong "+str(e))
            pass
    return render(request, template_name, {'form1': form1,'form2':form2})


def delete(request, pk):
    try:
        safety=Safety.objects.get(pk=pk)
        safety.delete()
        messages.success(request,"Deleted Successfully")
    except :
        messages.error(request,"Something went wrong")
    return redirect('safety:manage')


def fetch_dropdownlist(request):
    data = {}
    owner = []
    agent = []
    manager = []

    if request.is_ajax():
        id = request.GET.get('id', None)
        safety = Safety.objects.filter(mine_id=id)
        ow = safety.values('owner').distinct()
        ag = safety.values('agent').distinct()
        man = safety.values('manager').distinct()
        for o in ow:
            owner.append({'name': o['owner']})
        for a in ag:
            agent.append({'name': a['agent']})
        for m in man:
            manager.append({'name': m['manager']})

        # for s in safety:
        #     owner.append({'name':s.owner.distinct()})
        #     agent.append({'name': s.agent})
        #     manager.append({'name': s.manager})
        data['result'] = {
            'owner': owner,
            'agent': agent,
            'manager': manager
        }
    else:
        data['error'] = "Not Ajax"

    return JsonResponse(data)
