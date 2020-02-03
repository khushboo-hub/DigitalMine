from setting.models import setting
from django import forms



class setting_form(forms.ModelForm):
    CHOICES = (('', 'Select an option'), ('0', '0'),('1', '1'))
    name = forms.CharField(max_length=500, required=True, widget=forms.TextInput(attrs={'class': "form-control name"}))
    value =  forms.ChoiceField(choices=CHOICES,widget=forms.Select(attrs={'class': "form-control"}), required=True)
    desc = forms.CharField(max_length=500, required=True, widget=forms.Textarea(attrs={'class': "form-control"}))


    class Meta():
        model = setting
        fields = '__all__'