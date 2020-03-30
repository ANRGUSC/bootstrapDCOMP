#/bin/bash


# Change the command below to use a valid token and IP address for your existing cluster

sudo kubeadm join 172.30.0.12:6443 --token g3xwlj.qix63j3milz5zvxf     --discovery-token-ca-cert-hash sha256:79d5a772b0b2be4b4951dd129aa265aca8d892afe2cb2de0ccf7d67809df1235 --ignore-preflight-errors=all
