resource "helm_release" "nginx-ingress" {
  name  = "nginx-ingress"
  chart = var.nginxChart

  set {
    name  = "controller.service.type"
    value = var.serviceType
  }
  set {
    name  = "controller.service.httpPort.nodePort"
    value = var.httpNodePort
  }
  set {
    name  = "controller.service.httpsPort.nodePort"
    value = var.httpsNodePort
  }
}