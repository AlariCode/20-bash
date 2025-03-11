service nginx stop
service mariadb stop
yum remove -y nginx php-fpm php-mysqlnd firewalld mariadb-server
rm -rf /etc/nginx/
rm -rf /usr/share/nginx/html
rm -rf /var/lib/mysql