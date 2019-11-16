from datetime import date
from .models import TrackingRouter
from accounts.models import profile_extension
from django import forms
from django.shortcuts import render, get_object_or_404
from employee1.models import MineDetails


class TrackingRouterForm(forms.ModelForm):
    mine_id = forms.CharField(label='Select Mine',
                              widget=forms.Select(
                                  choices=MineDetails.objects.all().values_list('id', 'name'),
                                  attrs={
                                      'class': 'form-control',
                                      
                                  }
                              ))

    router_id = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Router ID:  (EX: R001) '
    }))
    address = forms.CharField(max_length=200, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Router Address: (ex:1,2, or A,B,C)'
    }))
    IS_BLOCK = (('No', 'No'), ('Yes', 'Yes'))
    location = forms.CharField(max_length=200, required=False, widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Router Location: (ex:Up Strairs, Left Corridor etc)'
    }))
    is_block = forms.CharField(max_length=200,
                               widget=forms.Select(choices=IS_BLOCK, attrs={'class': 'form-control', }), )
    x_axis = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'X-Axis (ex:23) '
    }))
    y_axis = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'Y-Axis (ex:39) '
    }))
    ip_add = forms.CharField(widget=forms.TextInput(attrs={
        'class': 'form-control',
        'placeholder': 'IP Address',
        'required': '',

    }))

    class Meta():
        model = TrackingRouter
        fields = ['mine_id', 'router_id', 'address', 'location', 'is_block', 'x_axis', 'y_axis', 'ip_add']
