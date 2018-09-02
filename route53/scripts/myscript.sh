#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "hi this lala from terraform lab!!" > /var/www/html/index.html
