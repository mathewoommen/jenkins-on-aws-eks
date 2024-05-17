resource "kubernetes_service_v1" "jenkins_lb_service" {
  metadata {
    name      = "jenkins-nlb-service"
    namespace = "devops-tools"
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb"
    }
  }
  spec {
    selector = {
      app = "jenkins-server"
    }
    port {
      port        = 80
      target_port = 8080
    }
    type = "LoadBalancer"
  }
}

output "network_nlb_service" {
  value = kubernetes_service_v1.jenkins_lb_service.status.0.load_balancer.0.ingress.0.hostname
}
