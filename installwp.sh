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
   service mysqld start
   service mysqld stop
   /usr/bin/mysqld_safe &
   rm -f mysql-community-release-el7-5.noarch.rpm
   # create user
   sleep 5
   mysql -u root < conf/mysqluser.sql
}

# install wordpress
installWP()
###########
{
   DB_NAME=wordpress
   DB_USER=wp_user
   DB_PASSWORD=password
   pathWP=/var/www/html/wordpress

   #install php
   yum -y install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo 
   
   # install WP cli
   installWPCli
   
   # get latest wp files
   /usr/bin/wp core download --path=$pathWP

   # DB credentials
   /usr/bin/wp core config --path=$pathWP --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD 

   # installation
   /usr/bin/wp core install --path=$pathWP --url="$siteInput/wordpress" --title="Testing WP" \
			--admin_user=tester --admin_password=tester123 --admin_email=mayday77@gmail.com

   service httpd start 
   
}

# install wp cli
installWPCli()
##############
{
   wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
   chmod 755 wp-cli.phar
   mv wp-cli.phar /usr/bin/wp

}



# main
siteInput=$1
updatePKG
installSQL
installWebServer
installWP

