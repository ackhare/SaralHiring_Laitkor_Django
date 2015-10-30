from django import forms
from django.forms import Textarea
from .models import Companies
from django.contrib.admin import widgets
from functools import partial


class Company_Form(forms.ModelForm):
    class Meta:
        model = Companies
        fields=('company_name','company_short_name')
