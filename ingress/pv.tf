resource "kubernetes_persistent_volume" "sonarqube" {
  metadata {
    name = "sonarqube"
  }
  spec {
    capacity = {
        storage = "2Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      vsphere_volume {
        volume_path = "/mnt/data"
      }
    }
  }
}