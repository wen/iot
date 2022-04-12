# password 42 hash
kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData": {
    "admin.password": "$2a$12$px3TAQ7CeurPy.dBLjyjD.W6hE9O3wNdpI.OKaoxxDDs1IVMPKd5O",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'
