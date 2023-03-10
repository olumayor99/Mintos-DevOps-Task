# Mintos-DevOps-Task

## Description
This repository contains scripts that were written to deploy Sonarqube with a Postgresql database, and persistence on a Minikube cluster using Terraform and Helm3.
Please note that the scripts are written to work on Ubuntu 22.04, and they'll definitely work on other debian distributions. The PC on which I tested this code is a Lenovo G50-70 Intel Core i3 4030U 1.9GHz processor with 16GB DDR3l memory and 1TB SSD.

This repository deploys Sonarqube with the following features:
 1. Sonarqube has persistence enabled, so it has Persistent Storage.
 2. Sonarqube was configured to use an external Postgresql database.
 3. Ingress into Sonarqube is via Minikube's Nginx ingress add-on, so I didn't need to create an Nginx deployment/pods.

## Installation
There are two ways to go about deploying this script.
### First way
Install the following tools on your PC before proceeding:

* Terraform (installation instructions [here](https://developer.hashicorp.com/terraform/downloads))
* Kubectl (installation instructions [here](https://kubernetes.io/docs/tasks/tools/))
* Helm (installation instructions [here](https://helm.sh/docs/intro/install/))
* Virtualbox (installation instructions [here](https://www.virtualbox.org/wiki/Downloads))
* Minikube (installation instructions [here](https://minikube.sigs.k8s.io/docs/start/))

Make sure your internet connection is strong while doing all these because many packages will be downloaded while the processes are on-going.

Then run the **minikube_setup.sh** script to configure the Minikube cluster.
```bash
chmod +x minikube_setup.sh
./minikube_setup.sh
```
Once that is done, clone this repository and run
```bash
terraform init
terraform apply
```
Instead of using just "terraform apply" and responding to the prompts, you can use 
```bash
terraform apply -auto-approve
```
Wait for Terraform to finish deploying the applications. Once that's done, and it gives a successful response like
```bash
Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
```
then run 
```bash
minikube service sonarqube-sonarqube -n sonarqube --url
```
This will display the URL to connect to Sonarqube

### Second way
Make sure you meet the following criteria
1. Your PC is running Ubuntu 22.04, or 20.04, or 18.04, or a Debian based operating system.
2. You have a strong internet connection because multiple packages will be downloaded, and the process might fail if the connection has issues.

Once the above criteria have been met, clone this repository and run the following commands
```bash
cd Mintos-Devops-Task
chmod +x install.sh
```

This will install all the required tools, configure the cluster, deploy the applications, and also display the URL to access Sonarqube.

You'll have to respond to a few prompts while it's running.

## Future improvements
1. Automatically detecting the Operating System and running related code.
2. Finding a way to completely eliminate the terminal prompts during installation.
