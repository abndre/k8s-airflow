Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"
  config.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "8192"
    end
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 5432, host: 5432
  #config.vm.network "forwarded_port", guest: 8585, host: 8585
   
  config.vm.provision "shell", inline: <<-SHELL
     apt-get update
     sudo apt install bash-completion
  SHELL
  config.vm.provision "shell", privileged: false, path: "./scripts/docker.sh"
  #config.vm.provision "file", source: "#{ ssh_key_path + 'id_rsa' }", destination: "/home/vagrant/.ssh/id_rsa"
  #config.vm.provision "file", source: "#{ ssh_key_path + 'id_rsa.pub' }", destination: "/home/vagrant/.ssh/id_rsa.pub"
end