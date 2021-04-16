#!/usr/bin/env bash
echo "# Fixing a repository certificate issue"
apt-get -y install dirmngr gpg-agent
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DA418C88A3219F7B
echo "# Downloading installation script"
curl -# -o $HOME/install.sh https://install.terraform.io/ptfe/stable
cp /home/vagrant/replicated.conf /etc/replicated.conf
cp /home/vagrant/replicated.conf /root/replicated.conf
echo "# Running installation script"
bash $HOME/install.sh no-proxy private-address=192.168.56.33 public-address=192.168.56.33
