#!/bin/bash
#
# Automate Estate Application Deployment
# Author: Rotoro Cloud


#######################################
#  Description:
# 	Print a message in a given color.
#  Globals: 
# 	None
#  Arguments:
# 	output text
# 	color name
#  Outputs:
# 	colored text string
#  Returns:
#  	none
#######################################
echo_color_text(){
  NOCOLOR='\033[0m' # No Color

  case $2 in
    "green") COLOR='\033[0;32m'
	;;
    "red") COLOR='\033[0;31m'
	;;
    "*") COLOR='\033[0m'
	;;
  esac

  echo -e "${COLOR} $1 ${NOCOLOR}"
}

#######################################
#  Description:
# 	Check the running status of a service.
#   If not exit script.
#  Globals: 
# 	None
#  Arguments:
# 	service name
#  Outputs:
# 	Running message
#  Returns:
#  	none
#######################################
service_running_check(){
  service_is_active=$(sudo systemctl is-active $1)

  if [ $service_is_active = "active" ]
  then
    echo_color_text "$1 is running" "green"
  else
    echo_color_text "$1 is not running" "red"
    exit 1
  fi
}


#######################################
#  Description:
# 	Check the firewall rule exists.
#  Globals: 
# 	None
#  Arguments:
# 	port number
#  Outputs:
# 	Port message
#  Returns:
#  	1 if not configured
#######################################
firewall_port_check(){

  firewalld_ports=$(sudo firewall-cmd --list-all --zone=public | grep ports)

  if [[ $firewalld_ports == *$1* ]]
  then
    echo_color_text "Firewall port $1 added" "green"
  else
    echo_color_text "Firewall port $1 not added" "red"
    exit 1
  fi
}

#######################################
#  Description:
#   Check the worn in given text
#  Globals: 
# 	None
#  Arguments:
# 	output text
#   word to find
#  Outputs:
# 	is in text message
#  Returns:
#  	none
#######################################
find_element_in_text(){
  if [[ $1 = *$2* ]]
  then
    echo_color_text "'$2' is in the text" "green"
  else
    echo_color_text "'$2' is not in the text" "red"
  fi
}



echo "--------------- MariaDB Installation ---------------"

# Install extra utilities
echo_color_text "Installing net-tools.." "green"
sudo yum install -y wget net-tools

# Install and enable MariaDB
sudo yum install -y mariadb-server
sudo systemctl enable --now mariadb

# Check MariaDB service is running
service_running_check mariadb

# Configuring database
echo_color_text "Setting up database.." "green"
sudo mysql -sfu root <<EOS
-- set root password
ALTER USER 'root'@'localhost' IDENTIFIED BY 'my_strong_password';
-- delete anonymous users
DELETE FROM mysql.user WHERE User='';
-- delete remote root capabilities
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
-- drop database 'test'
DROP DATABASE IF EXISTS test;
-- create database 'laravel'
CREATE DATABASE laravel;
-- also make sure there are lingering permissions to it
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
-- make changes immediately
FLUSH PRIVILEGES;
EOS



echo "--------------- Nginx Installation ---------------"

# Install Nginx
echo_color_text "Installing nginx.." "green"
sudo yum -y install nginx openssl

# Configuring webserver
echo_color_text "Setting up webserver.." "green"
sudo bash -c 'cat << EOF > /etc/nginx/conf.d/default.conf
server {
    listen       80;
    server_name  *.dusha.name;

    root   /usr/share/nginx/html/public/public;
    index index.php index.html index.htm;

    location / {
        try_files \$uri \$uri/ /index.php\$is_args\$args;
    }
    error_page 404 /404.html;
    error_page 500 502 503 504 /50x.html;

    location = /50x.html {
        root /usr/share/nginx/html;
    }

    location ~ \.php$ {
        try_files \$uri =404;
        fastcgi_pass unix:/var/run/php-fpm/www.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
    }
}
EOF'

# Enable Nginx
sudo systemctl enable --now nginx

# Check Nginx service is running
service_running_check nginx



echo "--------------- PHP-FPM 8 Installation ---------------"

# Install PHP
echo_color_text "Installing PHP.." "green"
sudo yum install -y php-cli php-fpm php-common php-curl php-gd php-intl php-mbstring php-xml php-zip php-bz2 php-bcmath php-json php-opcache php-devel php-mysqlnd php-pear gcc ImageMagick ImageMagick-devel

# Configuring PHP
echo_color_text "Setting up PHP.." "green"
sudo sed -i "s\^user = apache\user = nginx\g" /etc/php-fpm.d/www.conf
sudo sed -i "s\^group = apache\group = nginx\g" /etc/php-fpm.d/www.conf
sudo sed -i "s\^;listen.owner = nobody\listen.owner = nginx\g" /etc/php-fpm.d/www.conf
sudo sed -i "s\^;listen.group = nobody\listen.group = nginx\g" /etc/php-fpm.d/www.conf
sudo sed -i "s\^;listen.mode = 0660\listen.mode = 0660\g" /etc/php-fpm.d/www.conf

# Install PHP extentions
echo_color_text "Setting up PHP extentions.." "green"
yes '' | sudo pecl install imagick
sudo bash -c 'echo "extension=imagick.so" > /etc/php.d/imagick.ini'

# Enable PHP
sudo systemctl enable --now php-fpm

# Check PHP service is running
service_running_check php-fpm



echo "--------------- App Deployment ---------------"

# Install Git
echo_color_text "Installing Git.." "green"
sudo yum -y install git

# Download code
echo_color_text "Clone repo.." "green"
sudo git clone https://github.com/rotoro-cloud/Laravel-Real-Estate-Venue-Portal.git /usr/share/nginx/html/public
cd /usr/share/nginx/html/public

# Configuring App
echo_color_text "Setting up app.." "green"
sudo cp .env.example .env
sudo sed -i "s/^DB_PASSWORD=/DB_PASSWORD=my_strong_password/g" .env

# Install Composer 2
echo_color_text "Install composer.." "green"
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo php -r "unlink('composer-setup.php');"

# Install project dependencies
echo_color_text "Install project dependencies.." "green"
sudo /usr/local/bin/composer update

# Populate DB
echo_color_text "DB data seed.." "green"
sudo php artisan key:generate;
sudo php artisan migrate --seed;

# Create symlinks, access
echo_color_text "Project symlinks creating.." "green"
sudo rm -rf public/storage; 
sudo php artisan storage:link;
sudo chown -R nginx.nginx /usr/share/nginx/html/;
sudo mkdir -p /usr/share/nginx/html/storage/logs
sudo mkdir -p /usr/share/nginx/html/bootstrap/cache;
sudo chmod -R ug+rwx /usr/share/nginx/html/storage /usr/share/nginx/html/bootstrap/cache;
sudo chmod -R o+rwx /usr/share/nginx/html/storage/logs;



echo "--------------- Frewalld Installation ---------------"

# Install Frewalld
echo_color_text "Installing Frewalld.." "green"
sudo yum -y install firewalld

# Enable Frewalld
sudo systemctl enable --now firewalld


echo "--------------- Page Testing ---------------"

# Test Script
app_page=$(curl http://localhost)

for element in Venue London Liverpool
do
  find_element_in_text "$app_page" $element
done
