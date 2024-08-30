from django.db.models import Q
from django.http import JsonResponse
from django.urls import reverse_lazy
from django.views.generic import ListView, CreateView, UpdateView, DeleteView

from utils.permissions import RoleRequiredMixin
from .forms import PlanForm
from .models import Plan, get_project_type_choices, get_plan_status_choices, get_organizational_units_choices, \
    get_audit_type_choices, get_project_status_choices


# Create your views here.
class PlanListView(RoleRequiredMixin, ListView):
    model = Plan
    template_name = 'plans/plans_list.html'
    context_object_name = 'plans'
    paginate_by = 10

    # 多框查询
    def get_queryset(self):
        queryset = super().get_queryset()
        # 得到前端页面传入的字典的值
        plan_name_query = self.request.GET.get('search_plan_name')
        year_query = self.request.GET.get('search_year')
        project_type_query = self.request.GET.get('search_project_type')
        plan_status_query = self.request.GET.get('search_plan_status')
        organizational_units_query = self.request.GET.get('search_organizational_units')
        audit_type_query = self.request.GET.get('search_audit_type')
        project_status_query = self.request.GET.get('search_project_status')
        # 查询条件
        query = Q()
        if plan_name_query:
            # __icontains 包含 模糊查询
            query &= Q(plan_name__icontains=plan_name_query)
        if year_query:
            query &= Q(year__year=year_query)
        if project_type_query:
            query &= Q(project_type=project_type_query)
        if plan_status_query:
            query &= Q(plan_status=plan_status_query)
        if organizational_units_query:
            query &= Q(organizational_units=organizational_units_query)
        if audit_type_query:
            query &= Q(audit_type=audit_type_query)
        if project_status_query:
            query &= Q(project_status=project_status_query)
        queryset = queryset.filter(query)
        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['project_type_choices'] = get_project_type_choices()
        context['plan_status_choices'] = get_plan_status_choices()
        context['organizational_units_choices'] = get_organizational_units_choices()
        context['audit_type_choices'] = get_audit_type_choices()
        context['project_status_choices'] = get_project_status_choices()
        return context


class PlanCreateView(RoleRequiredMixin, CreateView):
    model = Plan
    template_name = 'plans/plan_form.html'
    form_class = PlanForm

    # 重写表单返回方式 表单在页面上以 json 形式返回，成功返回 json 响应
    def form_valid(self, form):
        form.save()
        # 返回json响应
        return JsonResponse(data={
            'status': 'success',
            'messages': '操作成功'
        }, status=200)

    # 重写表单返回方式 ，失败返回错误信息
    def form_invalid(self, form):
        errors = form.errors.as_json()
        return JsonResponse(data={
            'status': 'error',
            'messages': errors
        }, status=400)


class PlanUpdateView(RoleRequiredMixin, UpdateView):
    model = Plan
    template_name = 'plans/plan_form.html'
    form_class = PlanForm

    def form_valid(self, form):
        form.save()
        # 返回json响应
        return JsonResponse({
            'status': 'success',
            'messages': '操作成功'
        }, status=200)

    def form_invalid(self, form):
        errors = form.errors.as_json()
        return JsonResponse({
            'status': 'error',
            'messages': errors
        }, status=400)


class PlanDeleteView(RoleRequiredMixin, DeleteView):
    model = Plan
    success_url = reverse_lazy('plan_list')

    def delete(self, request, *args, **kwargs):
        self.object = self.get_object()
        try:
            self.object.delete()
            return JsonResponse({
                'status': 'success',
                'messages': '删除成功'
            }, status=200)
        except Exception as e:
            return JsonResponse({
                'status': 'error',
                'messages': '删除失败:' + str(e)
            }, stauts=500)


class PlanBulkDeleteView(RoleRequiredMixin, DeleteView):
    model = Plan
    success_url = reverse_lazy('plan_list')

    def post(self, request, *args, **kwargs):
        selected_ids = request.POST.getlist('plan_ids')
        if not selected_ids:
            return JsonResponse({
                'status': 'error',
                'messages': '请选择要删除的字典'
            }, status=400)

        self.object_list = self.get_queryset().filter(id__in=selected_ids)
        try:
            self.object_list.delete()
            return JsonResponse({
                'status': 'success',
                'messages': '删除成功'
            })
        except Exception:
            return JsonResponse({
                'status': 'error',
                'messages': '删除失败'
            }, status=400)
