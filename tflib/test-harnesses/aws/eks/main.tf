terraform {
  required_providers {
    aws = { source = "hashicorp/aws" }
  }
}

variable "name" {
  default = ""
}

variable "cluster_version" {
  default = "1.27"
}

locals {
  labels = {
    "chainguard.dev/images/env" = "testing"
  }
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = "10.0.0.0/16"
  azs  = slice(data.aws_availability_zones.available.names, 0, 2)

  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.11.0/24", "10.0.12.0/24"]

  enable_dns_hostnames = true
  enable_nat_gateway   = true
  single_nat_gateway   = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.name}" = "shared"
    "kubernetes.io/role/elb"            = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.name}" = "shared"
    "kubernetes.io/role/internal-elb"   = 1
  }
}

// Creating an EKS cluster without the upstream module is a recipe for
// disaster, but we can at least wrap it with our own "standards"
module "cluster" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = var.name
  cluster_version = var.cluster_version

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  cluster_addons = {}

  enable_irsa = true

  eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64"
    instance_types = ["t3.small"]
  }

  eks_managed_node_groups = {
    "default" = {
      name          = "default"
      ami_type      = "AL2_x86_64"
      instance_type = "t3.small"
      # Use at least 2 to handle topology spread taints
      desired_size = 2
      min_size     = 2
      max_size     = 2
    }
  }

  tags = local.labels
}
