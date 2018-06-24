#!/bin/sh
# Description : install wordpress and start it
###############################################

# global variables
WPfile=WP.tar.gz
mysqlFile=mysqluser.sql
saltFile=saltfile.txt

# install all required software
installAll()
###########
{
   #yum update
   installWebServer
   installSQL
   installWP
}

# install apache webserver
installWebServer()
#################
{
   yum -y install wget httpd
}

# install mqsql
installSQL()
############
{
   wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
   rpm -ivh mysql-community-release-el7-5.noarch.rpm
   yum -y install mysql-server
   /usr/bin/mysql_safe &
   rm -f mysql-community-release-el7-5.noarch.rpm
   # create user
   mysql -u root < $mysqlFile
}

# install wordpress
installWP()
###########
{
   #install php7
   yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
   yum -y install yum-utils
   yum-config-manager --enable remi-php72 
   yum -y install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo 
   
   # get latest wp files
   wget https://wordpress.org/latest.tar.gz -O $WPfile
   tar xfz $WPfile
   rm $WPfile

   # retrieve salt values
   wget https://api.wordpress.org/secret-key/1.1/salt/ -O $saltFile
   # replace salt values
   
}

# start the services
startServices()
###############
{
   service httpd start
   service mysqld start
}

# main
installAll
#startService
