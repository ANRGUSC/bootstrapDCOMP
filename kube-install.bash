#/bin/bash

sudo swapoff -a
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg gnupg2 software-properties-common
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
sudo update-alternatives --set ebtables /usr/sbin/ebtables-legacy

sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian buster stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo gpasswd -a $USER docker 
sudo systemctl start docker
sudo systemctl enable docker
sudo cp daemon.json /etc/docker/daemon.json
sudo systemctl restart docker

sudo apt-get update && sudo apt-get install -y apt-transport-https 
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update 
sudo apt-get install -y kubeadm kubectl kubelet
sudo systemctl enable kubelet
sudo apt-mark hold kubelet kubeadm kubectl













