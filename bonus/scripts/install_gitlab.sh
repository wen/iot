#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

echo "start - install gitlab - "$IP

echo "[1]: install gitlab"
apt-get update -qq >/dev/null
apt-get install -qq -y vim git wget curl git >/dev/null
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
apt-get update -qq >/dev/null
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_us.UTF-8
apt install -y gitlab-ce
gitlab-ctl reconfigure
echo "END - install gitlab"

#sudo dpkg-reconfugre locales
