from datetime import datetime

from django.db import models
from django.utils import timezone

from plan_dicts.models import PlanDict


# 计划状态
def get_plan_status_choices():
    return [(str(item.code), item.name) for item in PlanDict.objects.filter(type='plan_status')]


# 项目类型
def get_project_type_choices():
    return [(str(item.code), item.name) for item in PlanDict.objects.filter(type='project_type')]


# 审计类型
def get_audit_type_choices():
    return [(str(item.code), item.name) for item in PlanDict.objects.filter(type='audit_type')]


# 组织单位
def get_organizational_units_choices():
    return [(str(item.code), item.name) for item in PlanDict.objects.filter(type='organizational_units')]


# 审计对象
def get_audited_objects_choices():
    return [(str(item.code), item.name) for item in PlanDict.objects.filter(type='audited_objects')]


# 实施单位
def get_implementing_units_choices():
    return [(str(item.code), item.name) for item in PlanDict.objects.filter(type='implementing_units')]


# 项目层级
def get_project_level_choices():
    return [(str(item.code), item.name) for item in PlanDict.objects.filter(type='project_level')]


# 批次
def get_batch_choices():
    return [(str(item.code), item.name) for item in PlanDict.objects.filter(type='batch')]


# 计划负责人
def get_program_leader_choices():
    return [(str(item.code), item.name) for item in PlanDict.objects.filter(type='program_leader')]


# 计划负责人
def get_project_status_choices():
    return [(str(item.code), item.name) for item in PlanDict.objects.filter(type='project_status')]


# Create your models here.
# 创建模型
class Plan(models.Model):
    plan_name = models.CharField(verbose_name='计划名称', null=False, unique=True, max_length=50)
    plan_number = models.CharField(verbose_name='计划编号', null=False, unique=True, max_length=20)
    year = models.DateField(verbose_name='年度', unique=False)
    plan_status = models.CharField(verbose_name='计划状态', choices=get_plan_status_choices, max_length=10)
    project_type = models.CharField(verbose_name='项目类型', choices=get_project_type_choices, max_length=10)
    audit_type = models.CharField(verbose_name='审计类型', choices=get_audit_type_choices, max_length=10)
    organizational_units = models.CharField(verbose_name='组织单位', choices=get_audit_type_choices, max_length=10)
    audited_objects = models.CharField(verbose_name='审计对象', choices=get_audited_objects_choices, max_length=10)
    implementing_units = models.CharField(verbose_name='实施单位', choices=get_implementing_units_choices,
                                          max_length=10)
    project_level = models.CharField(verbose_name='项目层级', choices=get_project_level_choices, max_length=10)
    creation_time = models.DateTimeField(verbose_name='创建时间', null=False, default=timezone.now, editable=False)
    implementation_start_time = models.DateTimeField(verbose_name='实施开始时间', null=False)
    implementation_end_time = models.DateTimeField(verbose_name='实施结束时间', null=False)
    batch = models.CharField(verbose_name='批次', choices=get_batch_choices, max_length=10)
    program_leader = models.CharField(verbose_name='计划负责人', choices=get_program_leader_choices, max_length=10)
    project_status = models.CharField(verbose_name='项目状态', choices=get_project_status_choices, max_length=10)
    audit_highlights = models.CharField(verbose_name='审计要点', null=True, max_length=1000)
    remark = models.CharField(verbose_name='备注', null=True, max_length=1000)

    # 返回默认值
    def __str__(self):
        return self.plan_name

    def get_plan_status_name(self):
        return PlanDict.objects.get(type='plan_status', code=self.plan_status).name

    def get_project_type_name(self):
        return PlanDict.objects.get(type='project_type', code=self.project_type).name

    def get_audit_type_name(self):
        return PlanDict.objects.get(type='audit_type', code=self.audit_type).name

    def get_organizational_units_name(self):
        return PlanDict.objects.get(type='organizational_units', code=self.organizational_units).name

    def get_audited_objects_name(self):
        return PlanDict.objects.get(type='audited_objects', code=self.audited_objects).name

    def get_implementing_units_name(self):
        return PlanDict.objects.get(type='implementing_units', code=self.implementing_units).name

    def get_project_level_name(self):
        return PlanDict.objects.get(type='project_level', code=self.project_level).name

    def get_batch_name(self):
        return PlanDict.objects.get(type='batch', code=self.batch).name

    def get_program_leader_name(self):
        return PlanDict.objects.get(type='program_leader', code=self.program_leader).name

    def get_project_status_name(self):
        return PlanDict.objects.get(type='project_status', code=self.project_status).name

    def save(self, *args, **kwargs):
        if isinstance(self.year, int):
            self.year = datetime.strptime(str(self.year), '%Y').date()
        super(Plan, self).save(*args, **kwargs)

    # 设置元数据
    # db_table: 在数据库中的表名,如果不设置将使用app名_模型类名的格式。
    # verbose_name、verbose_name_plural: 模型的单数和复数名称,用于显示在Admin站点等。
    # ordering: 对查询结果排序的默认字段,负号表示降序。
    class Meta:
        db_table = 'plan'
        verbose_name = '计划信息'
        verbose_name_plural = '计划信息'
