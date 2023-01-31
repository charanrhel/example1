#! /bin/bash
yum update -y
echo "Jenkins" > /etc/hostname
hostnamectl set-hostname Jenkins
wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum upgrade -y
amazon-linux-extras install java-openjdk11 -y
yum install jenkins -y
systemctl enable jenkins
systemctl start jenkins

# wget https://dlcdn.apache.org/maven/maven-3/3.8.7/binaries/apache-maven-3.8.7-bin.tar.gz
# tar xzvf apache-maven-3.8.7-bin.tar.gz 
# mv apache-maven-3.8.7 maven3
# mv maven3/ /opt/