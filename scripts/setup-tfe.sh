#!/usr/bin/env bash
echo "# Fixing a repository certificate issue"
apt-get -y install dirmngr gpg-agent openssl
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DA418C88A3219F7B
echo "# Self signed certificate generation"
now=$(date +"%H%M-%m_%d_%Y")
openssl genrsa -passout pass:foobar -aes256 -out tfe-vagrant-rootCA-$now.key 4096
openssl req -passin pass:foobar -x509 -new -nodes -key tfe-vagrant-rootCA-$now.key -sha256 -days 3650 -out tfe-vagrant-rootCA-$now.crt -subj "/C=NL/L=AMS/O=HC/CN=192.168.56.33.xip.io"
openssl req -new -nodes -keyout 192.168.56.33.xip.io.key -out 192.168.56.33.xip.io.csr -days 3650 -subj "/C=NL/L=AMS/O=HC/CN=192.168.56.33.xip.io"
openssl x509 -req -passin pass:foobar -days 3650 -sha256 -in 192.168.56.33.xip.io.csr -CA tfe-vagrant-rootCA-$now.crt -CAkey tfe-vagrant-rootCA-$now.key -CAcreateserial \
-out 192.168.56.33.xip.io.crt -extensions v3_ca -extfile <(
cat <<-EOF
[ v3_ca ]
subjectAltName = DNS:192.168.56.33.xip.io
EOF
)
echo "# Downloading installation script"
curl -# -o $HOME/install.sh https://install.terraform.io/ptfe/stable
cp /home/vagrant/replicated.conf /etc/replicated.conf
cp /home/vagrant/replicated.conf /root/replicated.conf
echo "# Running installation script"
bash $HOME/install.sh no-proxy private-address=192.168.56.33 public-address=192.168.56.33
