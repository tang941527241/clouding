from django.urls import path

from .views import PlanDictListView

urlpatterns = [
    path('', PlanDictListView.as_view(), name='plan_dict_list')
]
