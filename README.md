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

### DCOMP Cluster Setup

- Step 1: [xdc] ansible-playbook -i hosts kube-dependencies.yml
- Step 2: [master] ./master.bash
- Step 3: [master] restart_coredns.bash

```
	kubectl -nkube-system edit configmap coredns #comment loop
	./restart_coredns.bash
```
- Step 4: [master] ./sourceit.bash
- Step 5: [master] kubeadm token create --print-join-command
	     [xdc] copy this token to workers.bash	
- Step 6: [xdc] ansible-playbook -i hosts workers.yaml
- Step 7: [workers] run workers.bash on all the nodes




