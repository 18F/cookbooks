Vagrant::Config.run do |config|
   config.vm.box = "notgary/ubuntu-14-04-base"
   config.vm.provision "shell",
	path: "chef-install.sh" 
   config.vm.provision :chef_solo do |chef|
     chef.cookbooks_path = "cookbooks"
     chef.add_recipe "codetalker"
     chef.log_level = :debug
     chef.verbose_logging = true
  end 
end
