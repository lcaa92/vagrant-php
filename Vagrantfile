Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu-server-14.04"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    config.vm.network :forwarded_port, guest: 80, host: 8000
	config.vm.network :forwarded_port, guest: 3306, host: 3307
    config.vm.network :private_network, ip: "192.168.33.15"
    config.vm.synced_folder "www/", "/var/www", owner: "www-data", group: "www-data", mount_options: ['dmode=777','fmode=666']
    config.vm.synced_folder "conf_extra/", "/tmp/conf_extra", owner: "vagrant", group: "vagrant", mount_options: ['dmode=777','fmode=666']
    config.vm.synced_folder "~", "/vagrant", owner: "vagrant", group: "vagrant"
    config.vm.provider "virtualbox" do |machine|
    	machine.memory = 2048
    	machine.name = "projetos"
		machine.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
    end
    config.vm.provision :shell, path: "setup.sh"
end
