#!/bin/bash
#to install tomcat
wget http://redrockdigimark.com/apachemirror/tomcat/tomcat-7/v7.0.82/bin/apache-tomcat-7.0.82.tar.gz
tar -xvzf apache-tomcat-7.0.82.tar.gz
#to git clone webpage code and launch it
cd apache-tomcat-7.0.82/webapps/
git clone https://github.com/tejastaunad/webjsp_for_jenkins.git
./apache-tomcat-7.0.82/bin/startup.sh
