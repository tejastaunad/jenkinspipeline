#!/bin/bash
# installing git
sudo yum update
sudo yum install git -y
#to install tomcat
cd /home/ec2-user/
wget http://redrockdigimark.com/apachemirror/tomcat/tomcat-7/v7.0.82/bin/apache-tomcat-7.0.82.tar.gz
sudo tar -xvzf apache-tomcat-7.0.82.tar.gz
#to git clone webpage code and launch it
cd /home/ec2-user/apache-tomcat-7.0.82/webapps
sudo git clone https://github.com/tejastaunad/Jenkinswebpage.git
cd ../..
sudo ./apache-tomcat-7.0.82/bin/startup.sh
