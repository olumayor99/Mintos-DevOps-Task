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
  default = "community"
}

variable "replicaCount" {
  type    = string
  default = "1"
}

variable "serviceType" {
  type    = string
  default = "NodePort"
}

variable "persistenceEnabled" {
  type    = string
  default = "true"
}

variable "postgresqlEnabled" {
  type    = string
  default = "false"
}

variable "postgresServer" {
  type    = string
  default = "sonarqube-database"
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

variable "postgresChart" {
  type    = string
  default = "my-repo/postgresql"
}

variable "timeOut" {
  type    = string
  default = "600"
}

variable "sonarChart" {
  type    = string
  default = "sonarqube/sonarqube"
}

variable "ingressEnabled" {
  type    = string
  default = "true"
}

variable "hostName" {
  type    = string
  default = "mint.os"
}

variable "persistenceSize" {
  type    = string
  default = "1Gi"
}
variable "jdbcOverwriteEnable" {
  type    = string
  default = "true"
}
variable "databaseHost" {
  type    = string
  default = "jdbc:postgresql://sonarqube-database-postgresql:5432/sonarDB"
}



