resource "helm_release" "postgresDatabase" {
  name  = var.postgresServer
  chart = var.postgresChart
  namespace = kubernetes_namespace.sonarqube.id

  set {
    name  = "auth.username"
    value = var.postgresUser
  }
  set {
    name  = "auth.password"
    value = var.postgresPassword
  }
  set {
    name  = "auth.database"
    value = var.postgresDatabase
  }
}