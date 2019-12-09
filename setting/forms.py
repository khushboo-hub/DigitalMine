from setting.models import setting
from django import forms



class setting_form(forms.ModelForm):
    name = forms.CharField(max_length=500, required=True, widget=forms.TextInput(attrs={'class': "form-control"}))
    value = forms.CharField(max_length=500, required=True, widget=forms.TextInput(attrs={'class': "form-control"}))
    desc = forms.CharField(max_length=500, required=True, widget=forms.TextInput(attrs={'class': "form-control"}))


    class Meta():
        model = setting
        fields = '__all__'