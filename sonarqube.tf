resource "helm_release" "sonarqube" {
  name  = "sonarqube"
  chart = var.sonarChart
  timeouts {
     create = "10m"
  }
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
    name  = "readinessProbe.sonarWebContext"
    value = "/"
  }
  set {
    name  = "readinessProbe.initialDelaySeconds"
    value = "500"
  }
  set {
    name  = "readinessProbe.periodSeconds"
    value = "200"
  }
  set {
    name  = "readinessProbe.failureThreshold"
    value = "20"
  }
  set {
    name  = "livenessProbe.sonarWebContext"
    value = "/"
  }
  set {
    name  = "livenessProbe.initialDelaySeconds"
    value = "500"
  }
  set {
    name  = "livenessProbe.periodSeconds"
    value = "200"
  }
  set {
    name  = "livenessProbe.failureThreshold"
    value = "20"
  }
  set {
    name  = "startupProbe.sonarWebContext"
    value = "/"
  }
  set {
    name  = "startupProbe.initialDelaySeconds"
    value = "240"
  }
  set {
    name  = "startupProbe.periodSeconds"
    value = "60"
  }
  set {
    name  = "startupProbe.failureThreshold"
    value = "240"
  }
}