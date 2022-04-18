#!/bin/sh

# install curl
yum install -y curl

# install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# install k3d
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
