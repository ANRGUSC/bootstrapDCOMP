#/bin/bash
sudo cp -i $HOME/.kube/config $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
source <(kubectl completion bash)
sudo chown $(id -u):$(id -g) $HOME/admin.conf