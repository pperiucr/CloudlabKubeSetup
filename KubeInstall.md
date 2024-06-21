# Installing Kubernetes
## You can run the script that installs Kubernetes or follow each step in next section
### Download and install docker
```bash
chmod +x ./kubeinstall.sh
source ./kubeinstall.sh
```
## Step by step commands if you dont want to run the script or script is causing the problem
### 1. Setting up key and store it
'''
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
'''
### 2. Add default Ubuntu repositories not included in the default
'''
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
'''
### 3. Ensure all packages are up to date
'''
sudo apt update
'''
### 4. Install Kubernetes tools
'''
sudo apt install kubeadm kubelet kubectl
'''
### 6. Mark packages so that auto install won't happen
'''
sudo apt-mark hold kubeadm kubelet kubectl
'''
### 7. Finally Verify the version
'''
kubeadm version
'''
