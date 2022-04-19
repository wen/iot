#!/bin/bash

k3d cluster edit k3s-default --port-add 8889:30889@loadbalancer

kubectl create namespace gitlab

echo "########## BONUS ##########"
echo "installing project to argocd"
kubectl apply -f ../confs/project.yaml -n argocd
echo "installed project to argocd"
sleep 3

echo "installing application to argocd"
kubectl apply -f ../confs/application.yaml -n argocd
echo "installed application to argocd"

echo "########## BONUS ##########"

echo "DONE!"
