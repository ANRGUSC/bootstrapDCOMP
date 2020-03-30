### Preparation

1. Follow the walkthrough tutorial at [DCOMP walkthrough documentation](https://www.mergetb.org/gui/walkthrough/) for the following steps:
- Initial access to the DCOMP testbed.
- Create an experiment
- Load and push a model to your experiment (Using the approriate model, for testing: prepare_cluster_wonetconstraint.py)
- Realize the model
- Accept the realization provided
- Materialize the realization
- Create XDC
2. Open a new terminal:
- Switch user
- Copy private key to the account
- Attach project experiment realization
3. On home computer:
- Install mergetb: (walkthrough material)
- mergetb login username
- Modify ``~/.ssh/config``:

```
	Host *-project
	  Hostname %h
	  User username
	  ProxyJump username@jumpc.mergetb.io:2202
	Host *
	  ServerAliveInterval 100
	  ServerAliveCountMax 2
```
- ssh xdc-exp-project

4. On XDC node:
- Download bootstrap code on XDC
- Install ansible (version 2.9.0)
- Set up static address (network folder)
```
	ansible-playbook -i hosts set_apac_address.yaml
```

### DCOMP Cluster Setup

Step 1: [xdc] ansible-playbook -i hosts kube-dependencies.yml
Step 2: [all] Change & restart kubelet - (ip a)

	sudo nano /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
    --node-ip=MY_IP_ADDRESS
	./restart_kubelet.bash

Step 3: [master] ./master.bash
Step 4: [master] restart_coredns.bash

	kubectl -nkube-system edit configmap coredns
	./restart_coredns.bash

Step 5: [master] ./sourceit.bash
Step 6: [router] enable ipv4 forwarding
	sudo -i => switch to root
	echo 1 > /proc/sys/net/ipv4/ip_forward
	sudo nano /etc/sysctl.conf
	=> uncomment net.ipv4.ip_forward = 1

Step 6: [all] add route for all nodes to each other

	[n0] ./ip_route_n0.bash
	[n1] ./ip_route_n1.bash
	...

<!-- Step 7: [master] kubectl apply -f kube-flannel.yml -->

Step 8: [master] kubeadm token create --print-join-command
	    [xdc] copy this token to workers.bash	

Step 9: [xdc] ansible-playbook -i hosts workers.yaml

Step 10: [workers] run workers.bash on all the nodes

<!-- Step 10: [workers] Change & restart kubelet

	sudo nano /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
    --node-ip=MY_IP_ADDRESS
	./restart_kubelet.bash -->


### Jupiter Setup

Step 0: Copy Jupiter to XDC -> n0
Step 1:  Fix required: libraries, configuration information
	+ kubectl, docker
	+ pip3: sudo apt install python3-pip
    + pip3 install -r k8_requirements.txt
	+ ( virtualenv: sudo pip3 install virtualenv )
	+ put in .bashrc

	sudo cp -i $HOME/.kube/config $HOME/admin.conf
	export KUBECONFIG=$HOME/admin.conf
	source <(kubectl completion bash)

	+ sudo apt-get install nano

	+ find /home/caravansary83/.local/lib/python3.7/site-packages/kubernetes/ -name "*.py" | xargs sudo sed -i 's/async=/async_=/g'
	
	sudo sed -i 's/if not async:/if not async_:/' /home/caravansary83/.local/lib/python3.7/site-packages/kubernetes/client/api_client.py

	+ Create namespaces 

Step 2: Build the images...


