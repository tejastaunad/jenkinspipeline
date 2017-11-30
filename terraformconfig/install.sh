#!/bin/bash
sudo wget https://releases.hashicorp.com/terraform/0.8.8/terraform_0.8.8_linux_amd64.zip
sudo unzip terraform_0.8.8_linux_amd64.zip -d /usr/bin
echo 'export PATH=$PATH:/usr/bin/terraform' >> .profile
