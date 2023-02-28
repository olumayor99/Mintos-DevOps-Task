resource "helm_release" "sonarqube" {
  name  = "sonarqube"
  chart = var.sonarChart
	namespace = kubernetes_namespace.sonarqube.id
  depends_on = [
    helm_release.postgresDatabase
  ]
  
  set {
		name = "edition"
		value = var.edition
	}
  set {
    name  = "replicaCount"
    value = var.replicaCount
  }
  set {
		name = "service.type"
		value = var.serviceType
	}
  set {
    name  = "persistence.enabled"
    value = var.persistenceEnabled
  }
  set {
    name  = "database.type"
    value = var.databaseType
  }
  set {
    name  = "postgresql.enabled"
    value = var.postgresqlEnabled
  }
  set {
    name  = "postgresql.postgresServer"
    value = var.postgresServer
  }
  set {
    name  = "postgresql.postgresUser"
    value = var.postgresUser
  }
  set {
    name  = "postgresql.postgresPassword"
    value = var.postgresPassword
  }
  set {
    name  = "postgresql.postgresDatabase"
    value = var.postgresDatabase
  }
  set {
    name  = "postgresql.service.port"
    value = var.postgresqlPort
  }
  set {
    name  = "readinessProbe.sonarWebContext"
    value = "/"
  }
  set {
    name  = "livenessProbe.sonarWebContext"
    value = "/"
  }
  set {
    name  = "image.tag"
    value = var.sonarImageTag
  }
}