from django import forms
from employee.models import MineDetails
from safety.models import Safety,SafetyTable
class SafetyForm(forms.ModelForm):
    mine=forms.ModelChoiceField(label='Name of the Mine',queryset=MineDetails.objects.all(),widget=forms.Select(attrs={'class':'form-control'}))
    owner=forms.CharField(label='Name of the Owner',max_length=200)
    agent=forms.CharField(label='Name of the Agent',max_length=200)
    manager=forms.CharField(label='Name of the Manager',max_length=200)
    status_report=forms.DateField()
    class Meta:
        model=Safety
        fields = '__all__'

class SafetyTableForm(forms.ModelForm):
    print_hazard=forms.CharField(label='hazard',max_length=500)
    mit_date=forms.DateField()
    auditable_work=forms.CharField(max_length=1000)
    comp_date=forms.DateField()
    remarks=forms.CharField(max_length=200)
    class Meta:
        model=SafetyTable
        fields = '__all__'

   