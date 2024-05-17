terraform {
  required_version = ">= 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.49"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.30.0"
    }
  }

  # For S3 backend storage
  /*
  backend "s3" {
    bucket = ""
    key    = ""
    region = "us-east-2" 
 
    dynamodb_table = ""    
    */
}

provider "aws" {
  region = var.aws_region
}
