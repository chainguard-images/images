terraform {
  required_providers {
    aws = { source = "hashicorp/aws" }
  }
}

variable "name" {
  // NOTE: You might be thinking this would be great to default to randomize... don't be like me :(
}

variable "eks_version" {
  default = "1.27"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

locals {
  kubeconfig_path = "${path.module}/kubeconfig"
  labels = {
    "chainguard.dev/images/env" = "testing"
    "terraform"                 = "true"
  }

  azs = slice(data.aws_availability_zones.available.names, 0, 2)
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = var.vpc_cidr

  azs             = local.azs
  public_subnets  = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 4, k)]
  private_subnets = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 48)]
  # In case we ever do airgap testing
  intra_subnets = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 56)]

  enable_dns_hostnames = true
  enable_dns_support   = true
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
  cluster_version = var.eks_version

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true
  enable_irsa                    = true

  cluster_addons = {}

  eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64"
    instance_types = ["t3.small"]
  }

  eks_managed_node_groups = {
    "default" = {
      name          = "default"
      ami_type      = "AL2_x86_64"
      instance_type = "t3.medium"
      # Use at least 2 to handle topology spread taints
      desired_size = 2
      min_size     = 2
      max_size     = 2
    }
  }

  tags = local.labels

  # Do not depend on the VPC module
  # Ref: https://github.com/hashicorp/terraform/issues/30340
  # depends_on = [module.vpc]
}

# Write the EKS kubeconfig to a file for ease of use by tests via KUBE_CONFIG_PATH
resource "null_resource" "kubeconfig" {
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name ${module.cluster.cluster_name} --kubeconfig ${local.kubeconfig_path}"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "rm -f ${path.module}/kubeconfig"
  }
}
