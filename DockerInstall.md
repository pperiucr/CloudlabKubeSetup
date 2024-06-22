# Setting up docker
### Download all the files from GIT repo
```bash
sudo chown -R $(id -u):$(id -g) /mydata
cd /mydata
export MYMOUNT=/mydata
sudo git clone https://github.com/pperiucr/CloudlabKubeSetup.git
cd /mydata/CloudlabKubeSetup/
```

### Download and install docker
```bash
sudo chmod +x ./dockersetup.sh
source ./dockersetup.sh
```
