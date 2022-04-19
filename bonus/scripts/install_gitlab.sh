#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

echo "start - install gitlab - "$IP

echo "[1]: install gitlab"

# https://serverfault.com/questions/362903/how-do-you-set-a-locale-non-interactively-on-debian-ubuntu

echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections


sudo locale-gen --purge en_US.UTF-8
sudo sh -c 'echo "LANG=en_US.UTF-8\nLANGUAGE=en_US.UTF-8\nLC_ALL=en_US.UTF-8\nLC_CTYPE=en_US.UTF-8" > /etc/default/locale'

echo "export LANGUAGE=en_US.UTF-8\nexport LANG=en_US.UTF-8\nexport LC_ALL=en_US.UTF-8\nexport LC_CTYPE=en_US.UTF-8">>~/.bash_profile

sudo apt-get update -qq >/dev/null
sudo apt-get install -qq -y vim git wget curl git >/dev/null
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt-get update -qq >/dev/null
sudo apt install -y gitlab-ce

# add portnumber 9999
sudo sed -i 's|external_url \x27http://gitlab.example.com\x27|external_url \x27http://gitlab.example.com:9999\x27|g' /etc/gitlab/gitlab.rb 

sudo gitlab-ctl reconfigure
echo "---------END - install gitlab---------\n"
sudo cat /etc/gitlab/initial_root_password
echo "---------END - install gitlab---------\n"
