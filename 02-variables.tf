variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "test"
}


# VPC CIDR Block
variable "vpc_cidr_block" {
  description = "VPC CIDR range"
  type        = string
  default     = "10.0.0.0/16"
}

# VPC Availability Zones
variable "vpc_availability_zones" {
  description = "VPC AZs"
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b"]
}


# VPC Public Subnets
variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

# VPC Private Subnets
variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

# VPC Enable NAT Gateway (True or False) 
variable "vpc_enable_nat_gateway" {
  description = "For outbound connectivity from private subnets"
  type        = bool
  default     = true
}

# VPC Single NAT Gateway (True or False)
variable "vpc_single_nat_gateway" {
  description = "To create only one NAT gateway"
  type        = bool
  default     = true
}

# EKS Cluster Input Variables
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "inadev"
}

variable "cluster_service_ipv4_cidr" {
  description = "service cidr"
  type        = string
  default     = "172.20.0.0/16"
}

variable "cluster_version" {
  description = "EKS cluster version"
  type        = string
  default     = "1.29"
}
variable "cluster_endpoint_private_access" {
  description = "Create the endpoint in private subnets"
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access" {
  description = "Create the endpoint in public subnets"
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "Source IPs which are allowed to access the cluster public endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
