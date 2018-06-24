#!/bin/sh
# Description : install wordpress and start it
###############################################

# global variables
WPfile=WP.tar.gz
mysqlFile=mysqluser.sql

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
   rm -f mysql-community-release-el7-5.noarch.rpm
   # create user
}

# install wordpress
installWP()
###########
{
   wget https://wordpress.org/latest.tar.gz -O $WPfile
   tar xfz $WPfile
   rm $WPfile
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
