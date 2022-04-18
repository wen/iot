#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

echo "start - install gitlab - "$IP

echo "[1]: install gitlab"

sudo locale-gen "en_US.UTF-8"
sudo sh -c 'echo "LANG=en_US.utf-8\nLC_ALL=en_US.utf-8\nLC_CTYPE=en_US.UTF-8" > /etc/default/locale'

echo "export LANGUAGE=en_US.UTF-8\nexport LANG=en_US.UTF-8\nexport LC_ALL=en_US.UTF-8">>~/.bash_profile

sudo apt-get update -qq >/dev/null
sudo apt-get install -qq -y vim git wget curl git >/dev/null
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt-get update -qq >/dev/null
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_us.UTF-8
sudo apt install -y gitlab-ce

########################
# change access address here
# add portnumber 9999
###################

sudo gitlab-ctl reconfigure
echo "END - install gitlab"

#sudo dpkg-reconfugre locales
