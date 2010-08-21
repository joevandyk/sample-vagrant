#!/bin/sh

mkdir scratch
cd scratch

FILE=ruby-enterprise_1.8.7-2010.02.deb
apt-get install -y wget build-essential
wget http://fixieconsulting.com/$FILE
dpkg -i $FILE
gem install -y chef -v 0.9.8 --no-ri --no-rdoc
mkdir /etc/chef
echo 'file_cache_path "/tmp/chef-solo"' > /etc/chef/solo.rb
echo 'cookbook_path "/tmp/chef-solo/cookbooks"' > /etc/chef/solo.rb
echo '{ "run_list": ["vagrant_main"] }' > chef.json

chef-solo -j chef.json -r http://github.com/joevandyk/sample-vagrant/raw/master/config/cookbooks.tar.gz
