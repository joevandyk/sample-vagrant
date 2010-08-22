# -*- ruby -*-

Vagrant::Config.run do |config|
  config.vm.box = "lucid32"
  config.vm.network("192.168.10.41")
  config.vm.forward_port("ssh", 22, 2319, :auto => true)
  config.vm.provisioner = :chef_solo
  config.chef.cookbooks_path = ["config/cookbooks"]
  config.chef.log_level = :debug
  config.chef.json.merge!(
    {
        :users => {:butthead => { :ssh_keys => "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAzEMopbbFvXWydqJMh+GTWL9Q7F1NNtO3jr1J6abk8soAlBa6s+shWglASdfx4Lzb/dYi4fvhLD06wkot5HSRXqeGB1m7IShiEYhRu6+ouAEhBTgPwbV3YunuEAkPTzetJf0bht4FSWVKRxQWuZ1azKnniBlOiHcK1zg+VNpjkBIZF0Qo7tb4YFhB3EO1/3RzCvCK98/Qx01J9BbAU5dtSOjHZAj2z+2G7q7ydVOuM5Y9jBZjZdgKS8VvDVefsOXykgFPZssRaBTFuwsKSfQQ7kGrT5W9lqjm/O9HpnnGmUsOnVHXNGHmO3hyN9CmQs5lm4Dd/A6pSMmYruO+lhP/GQ== joe@laptop" } }
    }
  )
end
# vim: syntax=ruby
