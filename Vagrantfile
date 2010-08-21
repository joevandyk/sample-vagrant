# -*- ruby -*-

Vagrant::Config.run do |config|
  config.vm.box = "lucid32"
  config.vm.network("192.168.10.41")
  config.vm.forward_port("ssh", 22, 2319, :auto => true)
  config.vm.provisioner = :chef_solo
  config.chef.cookbooks_path = ["config/cookbooks"]
  config.chef.log_level = :debug
end
# vim: syntax=ruby
