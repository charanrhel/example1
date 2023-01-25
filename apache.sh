#! /bin/bash
yum update -y
echo "Apache" > /etc/hostname
hostnamectl set-hostname Apache
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html