from datetime import date
from .models import news_bulletin
from django import forms

class NewsBulletInForm(forms.ModelForm):
    news = forms.CharField(max_length=200, required=True, widget=forms.Textarea(attrs={
        'class': 'form-control',
        'rows': '3',
        'placeholder': 'Enter The News'
    }))
    valid_till = forms.DateField(widget=forms.TextInput(attrs={
        'id': 'valid_till',
        'class': 'form-control',
        'placeholder': 'Valid Till',
    }))
    download_link = forms.FileField(required=False)
    class Meta():
        model = news_bulletin
        fields = ['news','valid_till','download_link','download_number']
        widgets = {
            'download_number': forms.NumberInput(attrs={'min': '0', 'class': 'yourClass', 'id': 'blah'}),
        }