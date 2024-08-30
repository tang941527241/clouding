from django import forms

from .models import PlanDict


class PlanDictForm(forms.ModelForm):
    class Meta:
        model = PlanDict
        fields = ['type', 'code', 'name']
