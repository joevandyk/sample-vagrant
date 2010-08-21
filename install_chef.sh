#!/bin/sh

FILE=ruby-enterprise_1.8.7-2010.02.deb
sudo apt-get install -y wget build-essential
wget http://fixieconsulting.com/$FILE
sudo dpkg -i $FILE
sudo gem install -y chef -v 0.9.8 --no-ri --no-rdoc
