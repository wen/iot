echo "creating cluster"

k3d cluster create -p 8080:80@loadbalancer -p 8888:30888@loadbalancer
echo "created cluster, waiting..."
sleep 5

echo "creating namespaces"
kubectl create namespace argocd
kubectl create namespace dev
echo "created namespaces, waiting..."
sleep 3

echo "installing argocd"
kubectl apply -n argocd -f ../confs/install.yaml
echo "installed argocd, waiting..."
sleep 3

echo "waiting the pods to be ready"
kubectl wait -n argocd --for=condition=Ready pods --all
echo "pods ready, waiting..."
sleep 3

echo "installing ingress"
kubectl apply -f ../confs/ingress.yaml -n argocd
echo "installed ingress, waiting..."
sleep 3

echo "changing default password to password"
kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData": {
    "admin.password": "$2a$12$vYyPARa7IqiQyF6fBBGxJuS.onDYSxwmgbemi.RwIuiWD2sYbgSBi",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'
echo "changed default password to password, waiting..."
sleep 3

echo "installing project to argocd"
kubectl apply -f ../confs/project.yaml -n argocd
echo "installed project to argocd"
sleep 3

echo "installing application to argocd"
kubectl apply -f ../confs/application.yaml -n argocd
echo "installed application to argocd"

echo "DONE!"
