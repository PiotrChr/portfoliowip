# -*- mode: ruby -*-
# vi: set ft=ruby :

#
# Requirements
#

# Vagrant version
Vagrant.require_version ">= 1.8.0"

# Plugins
abort "Error: Vagrant plugin 'vagrant-berkshelf' not installed!" unless Vagrant.has_plugin?("vagrant-berkshelf")
abort "Error: Vagrant plugin 'vagrant-omnibus' not installed!" unless Vagrant.has_plugin?("vagrant-omnibus")


#
# Main config
#
Vagrant.configure("2") do |config|
    ##
    # Vagrant plugin 'vagrant-cachier' for caching downloaded data.
    ##
    if Vagrant.has_plugin?("vagrant-cachier")
        config.cache.auto_detect = true
        config.cache.scope = :box
    end

    ##
    # Vagrant plugin 'vagrant-hostsupdater'.
    ##
    if Vagrant.has_plugin?("vagrant-hostsupdater")
        # Alias hostnames for /etc/hosts
        # config.hostsupdater.aliases = [
        # ]
        config.hostsupdater.remove_on_suspend = true
    end

    # Hostname.
    config.vm.hostname = "dev.portfolio"

    # Network
    # Update setup/hosts.sh if IP is about to change
    config.vm.network "private_network", ip: "10.1.1.34"

    # Enabling NFS for better performance with Symfony.
    config.vm.synced_folder "./", "/srv/www/", id: "vagrant-root", type: "nfs"

    # SSH configuration
    config.ssh.forward_agent = true

    # VirtualBox settings.
    config.vm.provider "virtualbox" do |virtualbox, config_override|
        # Name of the base box.
        config.vm.box = "ubuntu/trusty64"

        virtualbox.memory = 2048
        virtualbox.cpus = 2
    end

    # Parallels settings.
    config.vm.provider "parallels" do |parallels, config_override|
        config_override.vm.box = "parallels/ubuntu-14.04"

        parallels.memory = 2048
        parallels.cpus = 2
    end

    #
    # Shell provisioning
    #
    config.vm.provision "shell", inline: <<EOD
        mkdir -p /home/vagrant/.ssh
        touch /home/vagrant/.ssh/known_hosts

        if ! $(ssh-keygen -H -f /home/vagrant/.ssh/known_hosts -F github.com > /dev/null)
        then
            echo "Add github.com to known_hosts"
            ssh-keyscan -H github.com >> /home/vagrant/.ssh/known_hosts
        fi

        chown -R vagrant:vagrant /home/vagrant/.ssh
        chmod -R 600 /home/vagrant/.ssh/*
EOD

    config.vm.provision "shell", path: "setup/setup_base.sh", privileged: false
    config.vm.provision "shell", path: "setup/setup_db.sh", privileged: false
    
    # if File.exist?('./Vagrantfile.local')
    #     external = File.read './Vagrantfile.local'
    #     eval external
    # end
end
