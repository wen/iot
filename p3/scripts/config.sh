#!/bin/sh

CLUSTER_NAME="iot-cluster"

# create a cluster
sudo k3d cluster create $CLUSTER_NAME --api-port 6443 -p 8080:80@loadbalancer --agents 2

# create two namespaces
sudo kubectl create namespace argocd
sudo kubectl create namespace dev

# install argocd with tweaked installation file
# file with option --insecure
#curl -OL https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sudo kubectl apply -f ../confs/install.yaml -n argocd

# apply ingress.yaml to access web interface
sudo kubectl apply -f ../confs/ingress.yaml -n argocd

# change password to "42"
sudo kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData": {
    "admin.password": "$2a$12$px3TAQ7CeurPy.dBLjyjD.W6hE9O3wNdpI.OKaoxxDDs1IVMPKd5O",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'

# point argocd to github relay
sudo kubectl apply -f ../confs/project.yaml -n argocd
sudo kubectl apply -f ../confs/application.yaml -n argocd
