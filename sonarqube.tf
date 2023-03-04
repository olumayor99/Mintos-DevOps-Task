resource "helm_release" "sonarqube" {
  name  = "sonarqube"
  chart = var.sonarChart
  timeout = "1200"
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
    name  = "database.type"
    value = var.databaseType
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
    value = "650"
  }
  set {
    name  = "livenessProbe.initialDelaySeconds"
    value = "650"
  }
  set {
    name  = "startupProbe.initialDelaySeconds"
    value = "600"
  }
}