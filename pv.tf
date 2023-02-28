resource "kubernetes_persistent_volume" "sonarqube" {
  metadata {
    name = "sonarqube"
    labels {
      type = local
    }
  }
  spec {
    storageClassName = "manual"
    capacity = {
        storage = "2Gi"
    }
    access_modes = ["ReadWriteMany"]
    hostPath {
      path = "/mnt/data"
    }
  }
}