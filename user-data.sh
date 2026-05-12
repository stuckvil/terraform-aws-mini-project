#!/bin/bash

yum update -y
amazon-linux-extras install nginx1 -y

systemctl start nginx
systemctl enable nginx

echo "<h1>Terraform DevOps project</h1>" > /var/www/html/index.html
