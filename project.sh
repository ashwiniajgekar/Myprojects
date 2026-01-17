#!/bin/bash/
git clone https://github.com/ashwiniajgekar/Myprojects.git
sudo apt update
sudo apt install apache2 -y
sudo systemctl start apache2
sudo rm -rf /var/www/html/*
sudo cp -rf /home/ubuntu/Myprojects/* /var/www/html

