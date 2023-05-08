# Local Kubernetes Cluster
## Create virtual machines
```
terraform apply -auto-approve
```
## Pre install k3s
```
cp -R inventory/sample inventory/my-cluster
```
## Install k3s on virtual machines
```
ansible-playbook k3s-ansible/site.yml -i k3s-ansible/inventory/my-cluster/hosts.ini
```
### Store the kubeconfig on your .kube directory
```
ssh <master_ip> "cat ~/.kube/config"