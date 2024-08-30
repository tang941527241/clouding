from django.db import models
from django.db.models import UniqueConstraint


# id,type,code,name
# Create your models here.
# 创建模型
class PlanDict(models.Model):
    type = models.CharField(verbose_name='字典类型', null=False, unique=False, max_length=50)
    code = models.CharField(verbose_name='字典编号', null=False, unique=False, max_length=50)
    name = models.CharField(verbose_name='字典名称', null=False, unique=False, max_length=50)

    # 返回默认值
    def __str__(self):
        return self.name

    # 设置元数据
    # db_table: 在数据库中的表名,如果不设置将使用app名_模型类名的格式。
    # verbose_name、verbose_name_plural: 模型的单数和复数名称,用于显示在Admin站点等。
    # ordering: 对查询结果排序的默认字段,负号表示降序。
    class Meta:
        db_table = 'plan_dict'
        verbose_name = '字典信息'
        verbose_name_plural = '字典信息'
        ordering = ['type', 'code']
        constraints = [
            UniqueConstraint(fields=['type', 'code'], name='unique_type_code')
        ]
