# Setup and join Each Worker Node to the cluster
# Setting up each worker node
## Setting Kubernetes Master Node
### Give execute credentials to kubemaster.sh script
#### Run this only on master node 
```bash
chmod +x ./kubeworker.sh
source ./kubeworker.sh
```
## One can run the the following steps manually as alternate approach to complete execution of steps step by step in each worker node
### Step 1: Run the following commands 
```bash
sudo systemctl stop apparmor && sudo systemctl disable apparmor
sudo systemctl restart containerd.service
```
# Join with master node
### Make sure you copied token and sha256 key from setting up master and execute the following command
```bash
sudo kubeadm join master-node:6443 --token [token] --discovery-token-ca-cert-hash sha256:[hash]
```
