#!/usr/bin/env bash

echo "# Self signed certificate generation"

now=$(date +"%H%M-%m_%d_%Y")

[ -f ~/.rnd ] || {
  cd ~/ 
  openssl rand -writerand .rnd
}

mkdir -p /vagrant/cert
cd /vagrant/cert
rm -Rf /vagrant/cert/*

openssl genrsa -passout pass:foobar -aes256 -out tfe-vagrant-rootCA-$now.key 4096
openssl req -passin pass:foobar -x509 -new -nodes -key tfe-vagrant-rootCA-$now.key -sha256 -days 365 -out tfe-vagrant-rootCA-$now.crt -subj "/C=NL/L=AMS/O=HC/CN=192.168.56.33.nip.io"
openssl req -new -nodes -keyout 192.168.56.33.nip.io.key -out 192.168.56.33.nip.io.csr -days 365 -subj "/C=NL/L=AMS/O=HC/CN=192.168.56.33.nip.io"
openssl x509 -req -passin pass:foobar -days 365 -sha256 -in 192.168.56.33.nip.io.csr -CA tfe-vagrant-rootCA-$now.crt -CAkey tfe-vagrant-rootCA-$now.key -CAcreateserial \
-out 192.168.56.33.nip.io.crt -extensions v3_ca -extfile <(
cat <<-EOF
[ v3_ca ]
subjectAltName = DNS:192.168.56.33.nip.io
EOF
)

rm 192.168.56.33.nip.io.csr
rm tfe-vagrant-rootCA-$now.key
