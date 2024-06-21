# Kubernetes Setup on Cloudlab

The following steps to be followed in order to setup two node cluster  of Kubernetes (based on kubeadm) on Cloudlab with Ubuntu 22.04.

- 1. Allocate nodes in Cloudlab with bare metal Ubuntu 22.04 and access Node0 and Node1 through ssh: https://github.com/pperiucr/CloudlabKubeSetup/blob/main/1.%20Setup-Two-Node-Cloudlab.md
- 2. Docker install & setup on both Master and Worker node: https://github.com/pperiucr/CloudlabKubeSetup/blob/main/DockerInstall.md
- 3.  Kubernetes download and install in both Master and Worker Node
- 4.  Edit configuration required for both Master and Worker node in (containerd.conf and kubernetes.conf
- 5.  Setting up modprobe and hostname in both Master and worker
- 6. Setup Master node
- 7. Setup and bind worker node
- 8. Final check
