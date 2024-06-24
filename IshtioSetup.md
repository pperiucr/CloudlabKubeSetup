##Step 1 - Install helm
```bash
cd /mydata
sudo curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
sudo chmod 700 get_helm.sh
./get_helm.sh
```
##Step 2 - Install snapd
```bash
sudo apt-get install snapd
sudo snap install notes
```
##Step 3 - Install jq
```bash
snap install jq
```
##Step 3 - Install ishtio
```bash
sudo wget https://gcsweb.istio.io/gcs/istio-release/releases/1.20.7/istio-1.20.7-linux-amd64.tar.gz
sudo tar -zxvf  ./istio-1.20.7-linux-amd64.tar.gz
cd istio-1.20.7
 export PATH=$PWD/bin:$PATH
istioctl profile list
```
