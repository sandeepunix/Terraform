#!/bin/bash
yum update -y
yum install httpd -y
MYIP=`ifconfig | grep 'inet 10' |awk '{ print $2 }'|cut -d ':' -f2`
echo 'this is: '$MYIP > /var/www/html/index.html
systemctl start httpd
systemctl enable https


