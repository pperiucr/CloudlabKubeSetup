## Setting up master node hosts file

### Step 1:Assign unique hostname for master node 
```bash
sudo hostnamectl set-hostname master-node
```
### Step 2:Edit hosts file and add references 
#### Example shown with one master node and two worker nodes
```bash
echo -e "10.10.1.1 master-node\n10.10.1.2 worker01\n10.10.1.3 worker02" | sudo tee -a /etc/hosts > /dev/null
```
### Step 3: Restart the terminal application

## Setting up each worker node hosts file
### Step 1:Assign unique hostname for each worker node 
```bash
sudo hostnamectl set-hostname worker01
```
### Step 2:Edit hosts file and add references 
#### Example shown with first worker node (repeat for all other worker nodes)
```bash
echo -e "10.10.1.1 master-node\n10.10.1.2 worker01\n10.10.1.3 worker02" | sudo tee -a /etc/hosts > /dev/null
```
### Step 3: Restart the terminal application
