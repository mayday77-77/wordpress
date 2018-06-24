#!/bin/sh
# Description : install wordpress and start it
###############################################


updatePKG()
###########
{
   yum update
   yum -y install wget
   wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
   rpm -ivh epel-release-latest-7.noarch.rpm
   rm -f epel-release-latest-7.noarch.rpm
}


# install apache webserver
installWebServer()
#################
{
   yum -y install httpd
}

# install mqsql
installSQL()
############
{
   wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
   rpm -ivh mysql-community-release-el7-5.noarch.rpm
   yum -y install mysql-server
   /usr/bin/mysqld_safe &
   rm -f mysql-community-release-el7-5.noarch.rpm
   # create user
   mysql -u root < conf/mysqluser.sql
}

# install wordpress
installWP()
###########
{
   DB_NAME=wordpress
   DB_USER=wp_user
   DB_PASSWORD=password
   #install php
   #yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
   #yum -y install yum-utils
   #yum-config-manager --enable remi-php72 
   yum -y install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo 
   
   # get latest wp files
   wget https://wordpress.org/latest.tar.gz
   tar xfz latest.tar.gz
   dirName=`tar tf latest.tar.gz| head -1`
   
   # DB credentials in wp-config.php
   cp $dirName/wp-config-sample.php $dirName/wp-config.php 
   sed -i "s/database_name_here/$DB_NAME/" $dirName/wp-config.php
   sed -i "s/username_here/$DB_USER/" $dirName/wp-config.php
   sed -i "s/password_here/$DB_PASSWORD/" $dirName/wp-config.php
   # retrieve salt values
   #wget https://api.wordpress.org/secret-key/1.1/salt/ -O conf/saltfile.txt
   # replace salt values
   cp -rp $dirName /var/www/html
   service httpd start 
   
}


# main
updatePKG
installSQL
installWebServer
installWP

