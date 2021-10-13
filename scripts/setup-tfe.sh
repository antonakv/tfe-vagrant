#!/usr/bin/env bash

echo "# Fixing a repository certificate issue"

apt-get -y install dirmngr gpg-agent
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DA418C88A3219F7B

echo "# Downloading installation script"
mkdir -p /vagrant/tfe
curl -# -o /vagrant/tfe/install.sh https://install.terraform.io/ptfe/stable

cp /vagrant/configs/replicated.conf /etc/replicated.conf
cp /vagrant/configs/replicated.conf /root/replicated.conf
mkdir -p /home/ubuntu/install
cp /vagrant/cert/192.168.56.33.nip.io.crt /home/ubuntu/install
cp /vagrant/cert/192.168.56.33.nip.io.key /home/ubuntu/install
cp /vagrant/license.rli /home/ubuntu/install
cp /vagrant/settings.json /home/ubuntu/install
chown -R ubuntu: /home/ubuntu/install

if [ -f /vagrant/license.rli ]  ; then
  echo "# Running installation script"
  bash /vagrant/tfe/install.sh no-proxy private-address=192.168.56.33 public-address=192.168.56.33
else
  echo "# Error, missing /vagrant/license.rli"
  exit 1
fi
