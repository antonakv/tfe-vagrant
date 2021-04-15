# TFE silent online installation using Vagrant

## Intro

This manual is dedicated to install Terraform Enterprise with online installation type using Vagrant.

Tested on Mac OS X.

## Requirements

- Oracle Virtualbox recent version installed
[VirtualBox installation manual](https://www.virtualbox.org/manual/ch01.html#intro-installing)

- Hashicorp vagrant recent version installed
[Vagrant installation manual](https://learn.hashicorp.com/tutorials/vagrant/getting-started-install)

- git installed
[Git installation manual](https://git-scm.com/download/mac)

## Preparation 

- Clone git repository. 

```bash
git clone https://github.com/antonakv/tfe-vagrant
```

Expected command output looks like this:

```bash
Cloning into 'tfe-vagrant'...
remote: Enumerating objects: 12, done.
remote: Counting objects: 100% (12/12), done.
remote: Compressing objects: 100% (12/12), done.
remote: Total 12 (delta 1), reused 3 (delta 0), pack-reused 0
Receiving objects: 100% (12/12), done.
Resolving deltas: 100% (1/1), done.
```

- Change folder to tfe-vagrant

```bash
cd tfe-vagrant
```

- Copy your existing Terraform enterprise license file with extension .rli to 
folder tfe-vagrant created on the previous step and rename it to license.rli

## Provisioning

- In the same folder you were before run 

```bash
vagrant up
```

Sample result

```bash
$ vagrant up     
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'aakulov/bionic64'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'aakulov/bionic64' version '21.03.02' is up to date...
==> default: Setting the name of the VM: tfe-vagrant_default_1618485896013_82371
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
    default: Adapter 2: hostonly
==> default: Forwarding ports...
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Running 'pre-boot' VM customizations...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
    default: 
    default: Vagrant insecure key detected. Vagrant will automatically replace
    default: this with a newly generated keypair for better security.
    default: 
    default: Inserting generated public key within guest...
    default: Removing insecure key from the guest if it's present...
    default: Key inserted! Disconnecting and reconnecting using new SSH key...
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
==> default: Setting hostname...
==> default: Configuring and enabling network interfaces...
==> default: Mounting shared folders...
    default: /vagrant => /Users/aakulov/Documents/Development/Hashicorp/tfe-vagrant
==> default: Running provisioner: file...
    default: license.rli => $HOME/license.rli
==> default: Running provisioner: file...
    default: configs/replicated.conf => $HOME/replicated.conf
==> default: Running provisioner: file...
    default: configs/settings.json => $HOME/settings.json
==> default: Running provisioner: shell...
    default: Running: /var/folders/_d/p7jhkm3n29d8q5mr_7k18yb00000gp/T/vagrant-shell20210415-49031-qwsad8.sh
    default: # Downloading installation script
    default: #=#=#                                                                         
    default: ##O#- #                                                                       
    default: ##O=#  #                                                                      
    default: #=#=-#  #                                                                     
    default: -#O#- #   #                                                                   
    default: -=#=#   #   #                                                                 
    default: -=O#- #  #    #                                                               
    default: -=O=#  #   #   #                                                              
    default: -=O=-#  #    #   #                                                            
    default: -=O=- #   #   #     #                                                         
    default: -=O=-   #   #   #     #                                                       
    default: -=O=-    #    #    #    #                                                     
    default: -=O=-      #   #     #    #                                                   

[ Removed some lines]


    default: e7beef248bf1: Download complete
    default: 169cb9d9b4f7: Pull complete
    default: e7beef248bf1: Pull complete
    default: 83a9b20140be: Pull complete
    default: 6476d919ef52: Pull complete
    default: Digest: sha256:a06474b46bea501e6415c2b094ab7712ad333b50107dfe3a5fdf15894ddae76f
    default: Status: Downloaded newer image for replicated/replicated-operator:stable-2.51.3
    default: docker.io/replicated/replicated-operator:stable-2.51.3
    default: Tagging replicated-operator image
    default: Stopping replicated-operator service
    default: Installing replicated-operator service
    default: Starting replicated-operator service
    default: Created symlink /etc/systemd/system/docker.service.wants/replicated-operator.service → /etc/systemd/system/replicated-operator.service.
    default: 
    default: Operator installation successful
    default: 
    default: To continue the installation, visit the following URL in your browser:
    default: 
    default:   http://192.168.56.33:8800

```

## Usage

Tested in Google Chrome

- In your browser open URL https://192.168.56.33.xip.io:8800/

- Click ```Advanced```

- Click ```Proceed to 192.168.56.33.xip.io (unsafe)```
  
 ![Proceed to 192.168.56.33.xip.io]
 (https://github.com/antonakv/tfe-vagrant/raw/main/images/tfe-vagrant-4.jpg)

- Enter password ```Password1#``` and click ```Unlock```

 ![Unlock]
 (https://github.com/antonakv/tfe-vagrant/raw/main/images/tfe-vagrant-2.jpg)

- On page with title ```HTTPS for admin console``` enter to field called ```Hostname``` following value ```192.168.56.33.xip.io```

 ![HTTPS for admin console]
 (https://github.com/antonakv/tfe-vagrant/raw/main/images/tfe-vagrant-3.jpg)

- Click ```Use Self-Signed Cert```

  ![Proceed to 192.168.56.33.xip.io]
  (https://github.com/antonakv/tfe-vagrant/raw/main/images/tfe-vagrant-4.jpg)

- Click ```Advanced```

- Click ```Proceed to 192.168.56.33.xip.io (unsafe)```

- Open URL https://192.168.56.33.xip.io:8800/dashboard

  ![Dashboard]
  (https://github.com/antonakv/tfe-vagrant/raw/main/images/tfe-vagrant-7.jpg)

