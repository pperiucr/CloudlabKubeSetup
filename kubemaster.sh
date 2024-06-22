#!/bin/bash
sudo sed -i -e '$aKUBELET_EXTRA_ARGS="--cgroup-driver=cgroupfs"' /etc/default/kubelet
sudo systemctl daemon-reload && sudo systemctl restart kubelet

new_json='
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
'

# Check if the file is empty
if [ ! -s /etc/docker/daemon.json ]; then
  # If the file is empty, add the JSON block directly
  echo "$new_json" | sudo tee /etc/docker/daemon.json > /dev/null
else
  # If the file is not empty, we need to merge the new block with the existing content
  # First, remove the closing brace of the existing JSON content
  sudo sed -i '$ d' /etc/docker/daemon.json
  
  # Add a comma to the end of the existing JSON content
  echo "," | sudo tee -a /etc/docker/daemon.json > /dev/null
  
  # Append the new JSON content, excluding the opening brace
  echo "$new_json" | tail -n +2 | sudo tee -a /etc/docker/daemon.json > /dev/null
fi

sudo systemctl daemon-reload && sudo systemctl restart docker
sudo systemctl daemon-reload && sudo systemctl restart kubelet

#finally initialize cluster
sudo kubeadm init --control-plane-endpoint=master-node --upload-certs

mkdir -p $HOME/.kube &&
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config &&

kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml

kubectl taint nodes --all node-role.kubernetes.io/control-plane-
