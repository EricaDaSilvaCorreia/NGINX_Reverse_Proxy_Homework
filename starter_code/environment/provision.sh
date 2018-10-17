#!/bin/bash


# Prep machine
sudo apt-get update -y
sudo apt-get upgrade -y

# Install ruby
sudo apt-get install ruby -y
sudo apt-get install gem -y

# Install things that nodejs needs
sudo apt-get install python-software-properties -y

# Make sure that apt has the info it needs to install the custom version of nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# Install nodejs
sudo apt-get install -y nodejs

# Install pm2 node package manager
sudo npm install -g pm2
cd /home/vagrant/app/app
pm2 start app.js

# Install nginx
sudo apt-get install nginx -y

# Conf default of nginx
sudo rm /etc/nginx/sites-available/default
sudo ln -s /home/vagrant/app/app/default /etc/nginx/sites-available/default
sudo service nginx restart
