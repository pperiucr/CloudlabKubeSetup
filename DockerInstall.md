# Setting up docker
### Download all the files from GIT repo
```bash
sudo chown -R $(id -u):$(id -g) /mydata
cd /mydata
export MYMOUNT=/mydata
sudo git clone https://github.com/pperiucr/CloudlabKubeSetup.git
```

### Download and install docker
```bash
chmod +x ./dockersetup.sh
source ./dockersetup.sh
```
