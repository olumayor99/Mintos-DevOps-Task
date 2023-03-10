resource "helm_release" "sonarqube" {
  name  = "sonarqube"
  chart = var.sonarChart
	namespace = kubernetes_namespace.sonarqube.id
  depends_on = [
    helm_release.postgresDatabase
  ]
  timeout = "480"
  
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
		value = "true"
	}
  set {
		name = "ingress.hosts[0].name"
		value = "mint.os"
	}
  set {
    name  = "persistence.enabled"
    value = var.persistenceEnabled
  }
  set {
    name  = "persistence.size"
    value = "1Gi"
  }
  set {
    name  = "postgresql.enabled"
    value = var.postgresqlEnabled
  }
  set {
    name  = "jdbcOverwrite.enable"
    value = "true"
  }
  set {
    name  = "jdbcOverwrite.jdbcUrl"
    value = "jdbc:postgresql://sonarqube-database-postgresql:5432/sonarDB"
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