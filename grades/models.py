from django.db import models


# Create your models here.
class Grade(models.Model):
    grade_name = models.CharField(max_length=50, unique=True, verbose_name='班级名称')
    grade_number = models.CharField(max_length=10, unique=True, verbose_name='班级编号')

    def __str__(self) -> str:
        return self.grade_name

    class Meta:
        db_table = 'grade'
        verbose_name = '班级'
        verbose_name_plural = '班级名称'
