#!/bin/sh
# Description: simple script to 
#               monitor wp apache logs
#####################################

httpLog=/var/log/httpd/access_log
errorFile=monitor_log/wp_errors.log

tail -F $httpLog | while read line
do
  echo $line |awk '($9!=200 && $9!=304){print}' >> $errorFile
done
