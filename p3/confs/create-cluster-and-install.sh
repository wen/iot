echo "creating cluster"
sudo k3d cluster create -p 8080:80@loadbalancer -p 8888:30888@loadbalancer
echo "created cluster, waiting..."
sleep 5

echo "creating namespaces"
sudo kubectl create namespace argocd
sudo kubectl create namespace dev
echo "created namespaces, waiting..."
sleep 3

echo "installing argocd"
sudo kubectl apply -n argocd -f install.yaml
echo "installed argocd, waiting..."
sleep 3

echo "waiting the pods to be ready"
sudo kubectl wait -n argocd --for=condition=Ready pods --all
echo "pods created waiting..."
sleep 3

echo "installing ingress"
sudo kubectl apply -f ingress.yaml -n argocd
echo "installed ingress, waiting..."
sleep 3

echo "changing default password to argocd"
sudo kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData": {
    "admin.password": "$2a$12$px3TAQ7CeurPy.dBLjyjD.W6hE9O3wNdpI.OKaoxxDDs1IVMPKd5O",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'
echo "changed default password to argocd, waiting..."
sleep 3

echo "installing project to argocd"
sudo kubectl apply -f project.yaml -n argocd
echo "installed project to argocd"
sleep 3

echo "installing application to argocd"
sudo kubectl apply -f application.yaml -n argocd
echo "installed application to argocd"

echo "DONE!"
