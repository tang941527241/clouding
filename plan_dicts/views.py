from django.db.models import Q
from django.views.generic import ListView

from .models import PlanDict


# Create your views here.
class PlanDictListView(ListView):
    model = PlanDict
    template_name = 'plan_dicts/plan_dicts_list.html'
    context_object_name = 'plan_dicts'
    paginate_by = 10

    # 多框查询
    def get_queryset(self):
        queryset = super().get_queryset()
        # 得到前端页面传入的字典的值
        type_query = self.request.GET.get('search_type')
        name_query = self.request.GET.get('search_name')
        # 查询条件
        query = Q()
        if type_query:
            # __icontains 包含 模糊查询
            query &= Q(type__icontains=type_query)
        if name_query:
            query &= Q(name__icontains=name_query)
        queryset = queryset.filter(query)
        return queryset
