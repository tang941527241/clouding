from django.urls import path

from .views import PlanListView, PlanCreateView, PlanUpdateView, PlanDeleteView,PlanBulkDeleteView

urlpatterns = [
    path('', PlanListView.as_view(), name='plan_list'),
    path('create/', PlanCreateView.as_view(), name='plan_create'),
    path('<int:pk>/update/', PlanUpdateView.as_view(), name='plan_update'),
    path('<int:pk>/delete/', PlanDeleteView.as_view(), name='plan_delete'),
    path('bulk_delete/', PlanBulkDeleteView.as_view(), name='plan_bulk_delete'),
]
