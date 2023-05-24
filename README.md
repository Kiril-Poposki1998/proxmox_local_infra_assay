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
> :warning: <b> This replaces your kube configuration in your home folder</b>
### Store the kubeconfig on your .kube directory
```
ssh <master_ip> "cat ~/.kube/config"
```
### Add automatic assignment of IP addresses from LAN network
```
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/metallb.yaml
```
After the deployments are stabilized deploy the example nginx deployment with service and get the ip address
```
kubectl apply -f manifests/
kubectl get svc -n default
```