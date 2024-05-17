# Define Local Values in Terraform
locals {
  common_tags = {
    environment = var.environment
  }
  cluster_name = "${var.environment}-${var.cluster_name}"
}
