#!/bin/sh

# create a cluster
sudo k3d cluster create -p 8080:80@loadbalancer -p 8888:30888@loadbalancer

# create two namespaces
sudo kubectl create namespace argocd
sudo kubectl create namespace dev

# install argocd with tweaked installation file
# file with option --insecure
#curl -OL https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sudo kubectl apply -n argocd -f ../confs/install.yaml

sudo kubectl wait -n argocd --for=condition=Ready pods --all

# apply ingress.yaml to access web interface
sudo kubectl apply -n argocd -f ../confs/ingress.yaml

# change password to "42"
sudo kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData": {
    "admin.password": "$2a$12$px3TAQ7CeurPy.dBLjyjD.W6hE9O3wNdpI.OKaoxxDDs1IVMPKd5O",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'

# point argocd to github relay
sudo kubectl apply -n argocd -f ../confs/project.yaml
sudo kubectl apply -n argocd -f ../confs/application.yaml
