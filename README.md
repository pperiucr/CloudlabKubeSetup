# Kubernetes Setup on Cloudlab

The following steps to be followed in order to setup two node cluster  of Kubernetes (based on kubeadm) on Cloudlab with Ubuntu 22.04.

- 1. Allocate nodes in Cloudlab with bare metal Ubuntu 22.04 and access Node0 and Node1 through ssh: https://github.com/pperiucr/CloudlabKubeSetup/blob/main/1.%20Setup-Two-Node-Cloudlab.md
- 2. Docker install & setup on both Master and Worker node: https://github.com/pperiucr/CloudlabKubeSetup/blob/main/DockerInstall.md
- 3.  Kubernetes download, install and deploy in  Master and all Worker Nodes: https://github.com/pperiucr/CloudlabKubeSetup/blob/main/KubeInstall.md
- 4.  Hosts file setup and restart CLI session: https://github.com/pperiucr/CloudlabKubeSetup/blob/main/KubeDeploy.md
  5. Setting up Kubernetes Master Node : https://github.com/pperiucr/CloudlabKubeSetup/blob/main/SetupKubeMaster.md
- 5.  Setting up all worker Nodes and Join with master: https://github.com/pperiucr/CloudlabKubeSetup/blob/main/JoingWorkerNode.md
- 6. Final check at master node - run 'kubectl get nodes' it should out put two nodes one master and one worker
