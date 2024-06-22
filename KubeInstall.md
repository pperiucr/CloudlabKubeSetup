# Installing Kubernetes
## You can run the script that installs Kubernetes or follow each step in next section
### Give execute credentials to kubeinstall.sh script
#### Run this on master node as well as in all worker nodes
#### This downloads latest Kubenetes, installs and configures on each node
```bash
chmod +x ./kubeinstall.sh
source ./kubeinstall.sh
```
## Step by step commands if you dont want to run the script or script is causing the problem
### 1. Setting up key and store it
```bash
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
```
### 2. Add default Ubuntu repositories not included in the default
```bash
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
```
### 3. Ensure all packages are up to date
```bash
sudo apt update
```
### 4. Install Kubernetes tools
```bash
sudo apt install kubeadm kubelet kubectl
```
### 6. Mark packages so that auto install won't happen
```bash
sudo apt-mark hold kubeadm kubelet kubectl
```
### 7. Finally Verify the version
```bash
kubeadm version
```
### Step 8: Disable swap spaces and adjust fstab file
```bash
sudo swapoff -a  && sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
```
### Step 9: Edit containerd.conf file
```bash
sudo nano /etc/modules-load.d/containerd.conf
```
#### - Add these two lines and save the file
```bash
overlay
br_netfilter
```
### Step 10: Run modprobe commands
```bash
sudo modprobe overlay && sudo modprobe br_netfilter
```
### Step 11: Edit kubernetes.conf file
```bash
sudo nano /etc/sysctl.d/kubernetes.conf
```
#### - Add these three lines and save the file
```bash
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
```
### Step 12: Reload configuration
```bash
sudo sysctl --system
```
