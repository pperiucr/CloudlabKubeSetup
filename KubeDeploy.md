## Deploying Kubernetes (Repeat the same steps for both Master and Worker node)
### Step1: Disable swap spaces and adjust fstab file
```bash
sudo swapoff -a  && sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
```
### Step2: Edit containerd.conf file
```bash
sudo nano /etc/modules-load.d/containerd.conf
```
#### - Add these two lines and save the file
```bash
overlay
br_netfilter
```
### Step3: Run modprobe commands
```bash
sudo modprobe overlay && sudo modprobe br_netfilter
```
### Step4: Edit kubernetes.conf file
```bash
sudo nano /etc/sysctl.d/kubernetes.conf
```
#### - Add these three lines and save the file
```bash
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
```
### Step5: Reload configuration
```bash
sudo sysctl --system
```
### Step6: Assign unique name for each Ubuntu server 
#### ONLY FOR MASTER
```bash
sudo hostnamectl set-hostname master-node
```
#### ONLY FOR WORKER
```bash
sudo hostnamectl set-hostname worker01
```
### Step7: Edit /etc/hosts file and add these two lines at the bottom
```bash
10.10.1.1    master-node
10.10.1.2    worker
```
### Step7: Restart the terminal application
