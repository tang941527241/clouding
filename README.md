# clouding

解压压缩包

python 版本3.11

创建虚拟python环境

安装 requirements.txt 内依赖包

修改 config 中 DATABASES 部分

创建相对应数据库

在对应虚拟环境执行下面命令
python manage.py makemigrations
python manage.py migrate

在对应数据库执行 student_management.sql 内文件

执行下面命令开启django服务
python manage.py runserver

admin 密码 12345678
