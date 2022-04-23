#!/bin/bash

HOST_IP=$(hostname -I | cut -d " " -f1)

k3d cluster edit k3s-default --port-add 8889:30889@loadbalancer

kubectl create namespace gitlab

echo "########## BONUS ##########"
echo "installing project to argocd"

if grep -q HOST_IP ../confs/project.yaml; then 
	sed -i 's/HOST_IP/'"$HOST_IP"'/g' ../confs/project.yaml
fi

kubectl apply -f ../confs/project.yaml -n argocd
echo "installed project to argocd"
sleep 3

echo "installing application to argocd"

if grep -q HOST_IP ../confs/application.yaml; then 
	sed -i 's/HOST_IP/'"$HOST_IP"'/g' ../confs/application.yaml
fi

kubectl apply -f ../confs/application.yaml -n argocd
echo "installed application to argocd"

echo "########## BONUS ##########"

echo "DONE!"
