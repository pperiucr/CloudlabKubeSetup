# Setting Kubernetes Master Node
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
### Step 6: Initialize the Kubernetes cluster
```bash
sudo kubeadm init --control-plane-endpoint=master-node --upload-certs
```

### Step 7: The above command ouputs kubeadm join text which you have to run in worker node 

