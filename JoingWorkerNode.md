# Join Each Worker Node to the cluster
### Step 1: Stop and disable AppArmor
```bash
sudo systemctl stop apparmor && sudo systemctl disable apparmor
```
### Step 2: Restart containerd service
```bash
ssudo systemctl restart containerd.service
```
### Step 3: Use out put of master node to get token and hash to join the cluster
```bash
sudo kubeadm join [master-node-ip]:6443 --token [token] --discovery-token-ca-cert-hash sha256:[hash]
```
