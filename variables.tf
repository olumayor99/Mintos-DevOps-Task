variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}

variable "namespace" {
  type    = string
  default = "sonarqube"
}

variable "edition" {
  type    = string
  default = "enterprise"
}

variable "replicaCount" {
  type    = string
  default = "3"
}

variable "serviceType" {
  type    = string
  default = "NodePort"
}

variable "persistenceEnabled" {
  type    = string
  default = "true"
}

variable "databaseType" {
  type    = string
  default = "postgres"
}

variable "postgresqlEnabled" {
  type    = string
  default = "false"
}

variable "postgresServer" {
  type    = string
  default = "sonarqube-postgres-database"
}

variable "postgresUser" {
  type    = string
  default = "sonarUser"
}

variable "postgresPassword" {
  type    = string
  default = "sonarPass"
}

variable "postgresDatabase" {
  type    = string
  default = "sonarDB"
}

variable "postgresqlPort" {
  type    = string
  default = "5432"
}

variable "sonarImageTag" {
  type    = string
  default = "7.8-community"
}

variable "postgresChart" {
  type    = string
  default = "my-repo/postgresql"
}

variable "nginxChart" {
  type    = string
  default = "nginx-stable/nginx-ingress"
}

variable "sonarChart" {
  type    = string
  default = "sonarqube/sonarqube"
}

variable "httpNodePort" {
  type    = string
  default = "32080"
}

variable "httpsNodePort" {
  type    = string
  default = "32443"
}

