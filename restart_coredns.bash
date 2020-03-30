#/bin/bash

# kubectl -nkube-system edit configmap coredns => comment all 'loop'
kubectl -nkube-system delete pod -l k8s-app=kube-dns