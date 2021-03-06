# Install Ruby Enterprise Edition.
require_recipe "ruby_enterprise"
package "git-core"

user "butthead" do
  comment "Some user used for the services"
end


# Set up the application directory
%w( /apps /apps/sample-sinatra ).each do |dir|
  directory dir do
    owner "butthead"
    group "butthead"
  end
end

# Check out the source code to the application directory
git "/apps/sample-sinatra/current" do
  repository "git://github.com/joevandyk/sample-sinatra.git"
  reference  "master"
  user  "butthead"
  group "butthead"
  action [:checkout, :sync]
end


# Install bundler (http://gembundler.com/v1.0/index.html)
# We're using a pre-release version here.
ree_gem "bundler" do
  options "--pre"
  version "1.0.0.rc.5"
end


# Create an Upstart Service file, so we can automatically 
file "fixienews" do
  path "/etc/init/sample-sinatra.conf"
  content <<-EOF
  start on startup
  respawn
  chdir /apps/sample-sinatra/current
  exec su butthead -c "./bin/unicorn"
  EOF
end

service "sample-sinatra" do
  service_name 'sample-sinatra'
  action :start
  provider Chef::Provider::Service::Upstart
end
