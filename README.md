# Description
--------------
1) Install wordpress
2) Access wordpress website
3) Monitoring

# Assumptions
--------------
1) OS on RHEL/Centos
2) yum update/install is working
3) Installing/running as root user

# Instructions for installation
--------------------------------
Note: The script will download and install apache webserver, mqsql, php and Wordpress  

1) clone from https://github.com/mayday77-77/wordpress.git
2) change directory to wordpress
3) run the script:  
   ./installwp.sh <IP/domain name where the site will be hosted>  
   e.g:  
   ./installwp.sh 192.168.31.129  
   (sample install log: )  
   
4) Once completed, access the URL : http://<IP/domain>/wordpress  
    e.g http://192.168.31.129/wordpress/
5) You should be able to see the first page.  
    (image: https://github.com/mayday77-77/wordpress/blob/master/results/wp.JPG)
 
 # Instructions for running monitoring
 --------------------------------------
 1) Simple script to monitor http error codes from httpd access_log
 2) To run in background:  
    ./monitorwp.sh &
 3) Errors written to monitor_log/wp_errors.log  
    (example: https://github.com/mayday77-77/wordpress/blob/master/monitor_log/wp_errors.log)
 
 # Miscellaneous
 ----------------
 1) Wordpress site admin URL: http://<IP/domain>/wordpress/wp-login.php  
    e.g http://192.168.31.129/wordpress/wp-login.php  
    (image: https://github.com/mayday77-77/wordpress/blob/master/results/tester.JPG)
    
 2) User: tester
 3) Password : tester123
