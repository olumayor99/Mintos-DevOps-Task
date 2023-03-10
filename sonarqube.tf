resource "helm_release" "sonarqube" {
  name  = "sonarqube"
  chart = var.sonarChart
	namespace = kubernetes_namespace.sonarqube.id
  depends_on = [
    helm_release.postgresDatabase
  ]
  timeout = var.timeOut
  
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
		name = "ingress.enabled"
		value = var.ingressEnabled
	}
  set {
		name = "ingress.hosts[0].name"
		value = var.hostName
	}
  set {
    name  = "persistence.enabled"
    value = var.persistenceEnabled
  }
  set {
    name  = "persistence.size"
    value = var.persistenceSize
  }
  set {
    name  = "postgresql.enabled"
    value = var.postgresqlEnabled
  }
  set {
    name  = "jdbcOverwrite.enable"
    value = var.jdbcOverwriteEnable
  }
  set {
    name  = "jdbcOverwrite.jdbcUrl"
    value = var.databaseHost
  }
  set {
    name  = "jdbcOverwrite.jdbcUsername"
    value = var.postgresUser
  }
  set {
    name  = "jdbcOverwrite.jdbcPassword"
    value = var.postgresPassword
  }
  set {
    name  = "readinessProbe.initialDelaySeconds"
    value = "300"
  }
  set {
    name  = "readinessProbe.failureThreshold"
    value = "20"
  }
  set {
    name  = "livenessProbe.initialDelaySeconds"
    value = "300"
  }
  set {
    name  = "startupProbe.initialDelaySeconds"
    value = "120"
  }
}