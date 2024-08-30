# clouding

python 版本3.11以上均可

创建虚拟python环境

安装 requirements.txt 内依赖包

修改 config 中 DATABASES 部分

创建相对应数据库

在 config 
setting.py 文件中，把 INSTALLED_APPS 中 'plans',给注释掉，
urls.py 文件中，把     path('plans/', include('plans.urls')),给注释掉，
这是应为先生成对应字典表，生成字典表数据之后，plan 表才能导入字典表模型
在对应虚拟环境执行下面命令
python manage.py makemigrations
python manage.py migrate

之后将上面两行注释给解除注释
在对应虚拟环境执行下面命令
python manage.py makemigrations
python manage.py migrate

在对应数据库执行 plan_management.sql 内文件

执行下面命令开启django服务
python manage.py runserver

admin 密码 123456
