//! Should be separated to another terraform script and used for deployment

// deployment namespace 
resource "kubernetes_namespace" "deployment-namespace" {
  metadata {
    name = var.deployment_namespace
  }
}

// deployment chart
resource "helm_release" "helm-deployment" {
  name      = "${var.deployment_namespace}-ping-pong"
  chart     = "../chart"
  namespace = var.deployment_namespace
}

