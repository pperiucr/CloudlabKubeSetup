# Setting Kubernetes Master Node
## One can run the script that sets up Master node using kubemaster.sh
### Give execute credentials to kubemaster.sh script
#### Run this only on master node 
```bash
cd /mydata/CloudlabKubeSetup
chmod +x ./kubemaster.sh
source ./kubemaster.sh
```
## One can run the the following steps manually as alternate approach to complete execution of steps step by step
### Step 1: Edit kubelet file and add following line
```bash
sudo nano /etc/default/kubelet
```
#### - Append the value and save the file
```bash
KUBELET_EXTRA_ARGS="--cgroup-driver=cgroupfs"
```
### Step 2: Reload Kubelet
```bash
sudo systemctl daemon-reload && sudo systemctl restart kubelet
```
### Step 3: Edit docker daemon file and add following json data
```bash
sudo nano /etc/docker/daemon.json
```
#### - Add json block and save the file
```bash
{
      "exec-opts": ["native.cgroupdriver=systemd"],
      "log-driver": "json-file",
      "log-opts": {
      "max-size": "100m"
      },

       "storage-driver": "overlay2"
}
```
### Step 4: Reload and restart Docker
```bash
sudo systemctl daemon-reload && sudo systemctl restart docker
```
### Step 5: Reload and restart kubelet one last time
```bash
sudo systemctl daemon-reload && sudo systemctl restart kubelet
```
### Step 6: Initialize the Kubernetes cluster (Make sure master-node name you given as hostname
```bash
sudo kubeadm init --control-plane-endpoint=master-node --upload-certs
```

### Step 7: The above command ouputs kubeadm join text which you have to run in worker node 

### Step 8: Create cluster directory, configuration file and its ownership
```bash
mkdir -p $HOME/.kube &&
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config &&
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
### Step 9: Deploy pod NW to cluster by using Flannel manager
```bash
kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml &&
kubectl taint nodes --all node-role.kubernetes.io/control-plane- &&
```
