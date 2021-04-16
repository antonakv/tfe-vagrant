Vagrant.configure("2") do |config|
  config.vm.box = "aakulov/bionic64"
  config.vm.hostname = "ptfe"
  config.vm.network "private_network", ip: "192.168.56.33"
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024 * 8
    v.cpus = 2
  end
  config.vm.provision "file", source: "license.rli", destination: "$HOME/license.rli"
  config.vm.provision "file", source: "configs/replicated.conf", destination: "$HOME/replicated.conf"
  config.vm.provision "file", source: "configs/settings.json", destination: "$HOME/settings.json"
  config.vm.provision "file", source: "192.168.56.33.xip.io.crt", destination: "$HOME/server.crt"
  config.vm.provision "file", source: "192.168.56.33.xip.io.key", destination: "$HOME/server.key"
  config.vm.provision "shell", path: "scripts/setup-tfe.sh"
end
