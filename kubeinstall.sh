#Signing key and Software repo
sudo mkdir -p -m 755 /etc/apt/keyrings && 
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg &&
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list &&
sudo apt update
#Install & setup kubernetes
#Install Cube tools and mark the packages on hold
sudo apt install kubeadm kubelet kubectl &&
sudo apt-mark hold kubeadm kubelet kubectl &&
kubeadm version

