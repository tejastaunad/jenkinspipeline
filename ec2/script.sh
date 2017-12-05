#!/bin/bash
#to install tomcat
sudo wget http://redrockdigimark.com/apachemirror/tomcat/tomcat-7/v7.0.82/bin/apache-tomcat-7.0.82.tar.gz
sudo tar -xvzf apache-tomcat-7.0.82.tar.gz
#to git clone webpage code and launch it
sudo cd apache-tomcat-7.0.82/webapps/
sudo git clone https://github.com/tejastaunad/webjsp_for_jenkins.git
sudo ./apache-tomcat-7.0.82/bin/startup.sh
