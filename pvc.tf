resource "kubernetes_persistent_volume_claim" "sonarqube" {
  metadata {
    name = "sonarqube"
  }
  spec {
    storageClassName = "manual"
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "10Gi"
      }
    }
    volume_name = "${kubernetes_persistent_volume.sonarqube.metadata.0.name}"
  }
}