# Generated by Django 5.0.4 on 2024-08-29 13:40

import django.utils.timezone
import plans.models
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="Plan",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "plan_name",
                    models.CharField(
                        max_length=50, unique=True, verbose_name="计划名称"
                    ),
                ),
                (
                    "plan_number",
                    models.CharField(
                        max_length=20, unique=True, verbose_name="计划编号"
                    ),
                ),
                ("year", models.DateField(verbose_name="年度")),
                (
                    "plan_status",
                    models.CharField(
                        choices=plans.models.get_plan_status_choices,
                        max_length=10,
                        verbose_name="计划状态",
                    ),
                ),
                (
                    "project_type",
                    models.CharField(
                        choices=plans.models.get_project_type_choices,
                        max_length=10,
                        verbose_name="项目类型",
                    ),
                ),
                (
                    "audit_type",
                    models.CharField(
                        choices=plans.models.get_audit_type_choices,
                        max_length=10,
                        verbose_name="审计类型",
                    ),
                ),
                (
                    "organizational_units",
                    models.CharField(
                        choices=plans.models.get_audit_type_choices,
                        max_length=10,
                        verbose_name="组织单位",
                    ),
                ),
                (
                    "audited_objects",
                    models.CharField(
                        choices=plans.models.get_audited_objects_choices,
                        max_length=10,
                        verbose_name="审计对象",
                    ),
                ),
                (
                    "implementing_units",
                    models.CharField(
                        choices=plans.models.get_implementing_units_choices,
                        max_length=10,
                        verbose_name="实施单位",
                    ),
                ),
                (
                    "project_level",
                    models.CharField(
                        choices=plans.models.get_project_level_choices,
                        max_length=10,
                        verbose_name="项目层级",
                    ),
                ),
                (
                    "creation_time",
                    models.DateTimeField(
                        default=django.utils.timezone.now,
                        editable=False,
                        verbose_name="创建时间",
                    ),
                ),
                (
                    "implementation_start_time",
                    models.DateTimeField(verbose_name="实施开始时间"),
                ),
                (
                    "implementation_end_time",
                    models.DateTimeField(verbose_name="实施结束时间"),
                ),
                (
                    "batch",
                    models.CharField(
                        choices=plans.models.get_batch_choices,
                        max_length=10,
                        verbose_name="批次",
                    ),
                ),
                (
                    "program_leader",
                    models.CharField(
                        choices=plans.models.get_program_leader_choices,
                        max_length=10,
                        verbose_name="计划负责人",
                    ),
                ),
                (
                    "project_status",
                    models.CharField(
                        choices=plans.models.get_program_leader_choices,
                        max_length=10,
                        verbose_name="项目状态",
                    ),
                ),
                (
                    "audit_highlights",
                    models.CharField(
                        max_length=1000, null=True, verbose_name="审计要点"
                    ),
                ),
                (
                    "remark",
                    models.CharField(max_length=1000, null=True, verbose_name="备注"),
                ),
            ],
            options={
                "verbose_name": "计划信息",
                "verbose_name_plural": "计划信息",
                "db_table": "plan",
            },
        ),
    ]
