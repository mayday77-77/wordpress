# Description
--------------
1) Install wordpress
2) Access wordpress website
3) Monitoring

# Assumptions
--------------
1) OS on Linux/Centos
2) yum update/install is working
3) installing/running as root user

# Instructions for installation
--------------------------------
1) clone from https://github.com/mayday77-77/wordpress.git
2) run the script:  
   ./installwp.sh <IP/domain name where the site will be hosted>
   
   example:
   ./installwp.sh 192.168.31.129
   
 3) Once completed, access the URL : http://<IP/domain>/wordpress
    e.g http://192.168.31.129/wordpress/
 4) You should be able to see the first page.
 
 # Instructions for running monitoring
 --------------------------------------
 1)
 
 # Miscellaneous
 ----------------
 1) Wordpress site admin URL: http://<IP/domain>/wordpress/wp-login.php
    e.g http://192.168.31.129/wordpress/wp-login.php
 
 2) User: tester
 3) Password : tester123
