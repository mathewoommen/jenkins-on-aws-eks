# Create AWS EKS Node Group - Public
resource "aws_eks_node_group" "ng_public" {
  cluster_name = aws_eks_cluster.eks_cluster.name

  node_group_name = "${local.cluster_name}-ng-public"
  node_role_arn   = aws_iam_role.cluster_nodegroup_role.arn
  subnet_ids      = module.vpc.public_subnets


  ami_type       = "AL2_x86_64"
  capacity_type  = "ON_DEMAND"
  disk_size      = 20
  instance_types = ["t3.medium"]


  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 1
  }

  # Desired max percentage of unavailable worker nodes during node group update.
  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.cluster-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.cluster-AmazonEC2ContainerRegistryReadOnly,
  ]

  tags = {
    Name = "Public-Node-Group"
  }
}
