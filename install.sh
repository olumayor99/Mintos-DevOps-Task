#!/usr/bin/env bash

echo "Some initialization and housekeeping..."
sudo apt update && sudo apt -y upgrade

echo "Installing VirtualBox"...
sudo apt-get update
sudo apt-get install -y linux-headers-`uname -r` dkms build-essential
sudo apt-get install -y virtualbox
sudo apt-get install -y virtualbox-ext-pack

echo "Installing Terraform..."
sudo apt-get install -y gnupg software-properties-common
curl https://apt.releases.hashicorp.com/gpg | gpg --dearmor > hashicorp.gpg
sudo install -o root -g root -m 644 hashicorp.gpg /etc/apt/trusted.gpg.d/
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt install -y terraform

echo "Installing Minikube..."
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube

echo "Installing Kubectl..."
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo "Installing Helm..."
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

echo "Adding Helm repos for Sonarqube and Postgresql..."
helm repo add sonarqube https://sonarsource.github.io/helm-chart-sonarqube
helm repo add my-repo https://charts.bitnami.com/bitnami
helm repo update

echo "Configuring Minikube..."
sudo sysctl -w vm.max_map_count=262144
minikube config set memory 8192
minikube config set cpus 4
minikube config set vm-driver virtualbox

echo "Starting Minikube..."
minikube delete
minikube start

echo "Enabling Minikube Ingress Add-on..."
minikube addons enable ingress

echo "Deploying Apps..."
terraform init
terraform apply -auto-approve

echo "Exposing Sonarqube..."
SONAR_URL=$(minikube service sonarqube-sonarqube -n sonarqube --url)
echo "Access Sonarqube via $SONAR_URL"

