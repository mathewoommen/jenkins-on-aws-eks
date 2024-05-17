
resource "kubernetes_namespace" "namespace" {
  metadata {
    name = "devops-tools"
  }
  depends_on = [
    aws_eks_cluster.eks_cluster,
    aws_eks_node_group.ng_public,
  ]
}


