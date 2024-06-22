## Deploying Kubernetes (Repeat the same steps for both Master and Worker node)

### Step 6: Assign unique name for each Ubuntu server 
#### ONLY FOR MASTER
```bash
sudo hostnamectl set-hostname master-node
```
#### ONLY FOR WORKER
```bash
sudo hostnamectl set-hostname worker01
```
### Step 7: Edit /etc/hosts file and add these two lines at the bottom
```bash
10.10.1.1    master-node
10.10.1.2    worker
```
### Step 8: Restart the terminal application
