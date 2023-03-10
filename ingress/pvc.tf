resource "kubernetes_persistent_volume_claim" "sonarqube" {
  metadata {
    name = "sonarqube"
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "2Gi"
      }
    }
    volume_name = "${kubernetes_persistent_volume.sonarqube.metadata.0.name}"
  }
}