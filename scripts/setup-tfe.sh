#!/usr/bin/env bash
echo "# Downloading installation script"
curl -# -o $HOME/install.sh https://install.terraform.io/ptfe/stable
cp /home/vagrant/replicated.conf /etc/replicated.conf
cp /home/vagrant/replicated.conf /root/replicated.conf
echo "# Installing docker"
apt-get -y install docker.io
echo "# Running installation script"
bash $HOME/install.sh airgap no-proxy private-address=192.168.56.33 public-address=192.168.56.33
