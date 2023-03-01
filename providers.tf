provider "helm" {
  kubernetes {
    config_context_cluster = "minikube"
    config_path = pathexpand(var.kube_config)
  }
}

provider "kubernetes" {
  config_context_cluster = "minikube"
  config_path = pathexpand(var.kube_config)
}