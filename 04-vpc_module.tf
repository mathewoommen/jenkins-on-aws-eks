# Create VPC
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name            = local.cluster_name
  cidr            = var.vpc_cidr_block
  azs             = var.vpc_availability_zones
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  enable_dns_hostnames = true
  enable_dns_support   = true


  tags     = local.common_tags
  vpc_tags = local.common_tags

  # Additional Tags to Subnets
  public_subnet_tags = {
    Type                     = "Public Subnets"
    "kubernetes.io/role/elb" = 1
    //"kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }
  private_subnet_tags = {
    Type                              = "private-subnets"
    "kubernetes.io/role/internal-elb" = 1
    //"kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }

  # Assign public IP to instances in public subnets
  map_public_ip_on_launch = true
}
