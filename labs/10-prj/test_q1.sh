#!/bin/bash

sudo /tmp/destroy.sh
bash /home/moon/deploy-estate-application.sh

yum list --installed mariadb-server | grep -w mariadb-server

if [ $? -ne 0 ]; then
    clear && echo 'mariadb-server не установлен' && exit 1
fi

ls /etc/my.cnf

if [ $? -ne 0 ]; then
    clear && echo '/etc/my.cnf не создан' && exit 1
fi

sudo systemctl is-active mariadb

if [ $? -ne 0 ]; then
    clear && echo 'mariadb-server не активен' && exit 1
fi

sudo systemctl is-enabled mariadb

if [ $? -ne 0 ]; then
    clear && echo 'mariadb-server не включен' && exit 1
fi

sudo systemctl is-active nginx

if [ $? -ne 0 ]; then
    clear && echo 'nginx не активен' && exit 1
fi

sudo systemctl is-enabled nginx

if [ $? -ne 0 ]; then
    clear && echo 'nginx не включен' && exit 1
fi

yum list --installed php-mysqlnd | grep -w php-mysqlnd

if [ $? -ne 0 ]; then
    clear && echo 'php-mysqlnd не установлен' && exit 1
fi

sudo systemctl is-active php-fpm

if [ $? -ne 0 ]; then
    clear && echo 'php-fpm не активен' && exit 1
fi

sudo systemctl is-enabled php-fpm

if [ $? -ne 0 ]; then
    clear && echo 'php-fpm не включен' && exit 1
fi

yum list --installed git | grep -w git

if [ $? -ne 0 ]; then
    clear && echo 'git не установлен' && exit 1
fi

ls /usr/share/nginx/html/public/ | grep config

if [ $? -ne 0 ]; then
    clear && echo 'нет каталога git /usr/share/nginx/html/public/ с файлами приложения' && exit 1
fi

ls /usr/share/nginx/html/public/public/index.php

if [ $? -ne 0 ]; then
    clear && echo 'нет файла index.php' && exit 1
fi


curl http://localhost | grep Venue

if [ $? -ne 0 ]; then
    clear && echo 'приложение не отвечает на 80 порту' && exit 1
fi


curl http://localhost | grep london

if [ $? -ne 0 ]; then
    clear && echo 'приложение не отвечает на 80 порту' && exit 1
fi

#REMOVE SSL
sed -i '/forceScheme/d' /usr/share/nginx/html/public/app/Providers/AppServiceProvider.php

clear && echo "Проект успешно развёрнут"