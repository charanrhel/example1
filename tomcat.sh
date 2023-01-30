#!/bin/bash
yum update -y
amazon-linux-extras install java-openjdk11 -y
cd /tmp
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.tar.gz
tar xzvf apache-tomcat-9.0.71.tar.gz
mv apache-tomcat-9.0.71 tomcat9
cp -rf tomcat9/ /opt/
cd /opt/tomcat9/bin
chmod 755 *.sh
./startup.sh 
