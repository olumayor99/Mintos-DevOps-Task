#!/usr/bin/env bash

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

