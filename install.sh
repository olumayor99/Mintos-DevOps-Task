#!/bin/bash
sudo apt update && sudo apt -y upgrade

# Install VirtualBox
curl https://www.virtualbox.org/download/oracle_vbox_2016.asc | gpg --dearmor > oracle_vbox_2016.gpg
curl https://www.virtualbox.org/download/oracle_vbox.asc | gpg --dearmor > oracle_vbox.gpg
sudo install -o root -g root -m 644 oracle_vbox_2016.gpg /etc/apt/trusted.gpg.d/
sudo install -o root -g root -m 644 oracle_vbox.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo apt update
sudo apt-get install linux-headers-`uname -r` dkms build-essential
sudo apt install -y virtualbox-7.0
cd ~/
VER=$(curl -s https://download.virtualbox.org/virtualbox/LATEST.TXT)
wget https://download.virtualbox.org/virtualbox/$VER/Oracle_VM_VirtualBox_Extension_Pack-$VER.vbox-extpack
sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-*.vbox-extpack

#Install Terraform
sudo apt-get install -y gnupg software-properties-common
curl https://apt.releases.hashicorp.com/gpg | gpg --dearmor > hashicorp.gpg
sudo install -o root -g root -m 644 hashicorp.gpg /etc/apt/trusted.gpg.d/
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt install terraform

# Install Minikube
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube

# Install Kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Add Helm repos for Sonarqube, Nginx, and Postgresql
helm repo add sonarqube https://sonarsource.github.io/helm-chart-sonarqube
helm repo add my-repo https://charts.bitnami.com/bitnami
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update

# Configure Minikube
sudo sysctl -w vm.max_map_count=262144
minikube config set memory 8192
minikube config set cpus 4
minikube config set vm-driver virtualbox

# Start Minikube
minikube start

# Enable Minikube Ingress Add-on
minikube addons enable ingress

# Deploy Charts
terraform init
terraform apply -auto-approve
kubectl apply -f nginx-ingress.yaml
IP=$(minikube ip)
echo "Access Sonarqube via https://$IP/"