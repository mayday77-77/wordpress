#!/bin/sh
# Description: simple script to 
#               monitor wp apache logs
#####################################

httpLog=/var/log/httpd/access_log
errorFile=monitor_log/wp_errors.log

tail -Fn0 $httpLog | while read line
do
  echo $line |awk '($9>=300 && $9!=304 || $7 ~ /xmlrpc.php/ ){print}' >> $errorFile
done
