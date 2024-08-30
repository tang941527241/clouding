from datetime import datetime

from django import forms

from .models import Plan


class PlanForm(forms.ModelForm):
    class Meta:
        model = Plan
        fields = ['plan_name', 'plan_number', 'year', 'plan_status', 'project_type', 'audit_type',
                  'organizational_units', 'audited_objects', 'implementing_units', 'project_level',
                  'implementation_start_time', 'implementation_end_time', 'batch', 'project_status', 'program_leader',
                  'audit_highlights',
                  'remark']

        widgets = {
            'plan_number': forms.TextInput(attrs={'readonly': 'readonly'}),
        }

    def __init__(self, *args, **kwargs):
        super(PlanForm, self).__init__(*args, **kwargs)
        if not self.instance.pk:
            date_str = datetime.now().strftime('%Y%m%d')
            last_plan = Plan.objects.filter(plan_number__startswith=date_str).order_by('plan_number').last()
            if last_plan:
                last_number = int(last_plan.plan_number[-4:])
                new_number = f'{last_number + 1:04d}'
            else:
                new_number = '0001'
            self.fields['plan_number'].initial = f'{date_str}{new_number}'
