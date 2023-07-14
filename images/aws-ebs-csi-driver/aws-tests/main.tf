terraform {
  required_providers {
    random  = { source = "hashicorp/random" }
    kubectl = { source = "gavinbunney/kubectl" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
  default     = "cgr.dev/chainguard/aws-ebs-csi-driver:latest"
  // default     = "public.ecr.aws/ebs-csi-driver/aws-ebs-csi-driver:v1.20.0" // Upstream image.
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {}

resource "random_pet" "suffix" {}

locals {
  cluster_name = "ebs-driver-${random_pet.suffix.id}"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "ebs-driver-vpc"

  cidr = "10.0.0.0/16"
  azs  = slice(data.aws_availability_zones.available.names, 0, 3)

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
}

module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name    = local.cluster_name
  cluster_version = "1.27"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = { ami_type = "AL2_x86_64" }

  eks_managed_node_groups = {
    one = {
      name = "node-group"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 3
      desired_size = 1
    }
  }
}

resource "aws_ebs_volume" "volume" {
  availability_zone = "${var.aws_region}a"
  size              = 10
}

// Grant the cluster access to the EBS volume.
// https://github.com/kubernetes-sigs/aws-ebs-csi-driver/blob/master/docs/install.md#set-up-driver-permissions
data "aws_iam_policy" "AmazonEBSCSIDriverPolicy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}
resource "aws_iam_role_policy_attachment" "AmazonEBSCSIDriverPolicy" {
  role       = module.eks.cluster_iam_role_name
  policy_arn = data.aws_iam_policy.AmazonEBSCSIDriverPolicy.arn
}

data "aws_eks_cluster_auth" "main" { name = local.cluster_name }

provider "kubectl" {
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  host                   = module.eks.cluster_endpoint
  token                  = data.aws_eks_cluster_auth.main.token
}

// Install the CSI driver.
data "kubectl_path_documents" "manifests" {
  pattern = "${path.module}/manifests/*.yaml"
}
resource "kubectl_manifest" "manifests" {
  count     = length(data.kubectl_path_documents.manifests.documents)
  yaml_body = element(data.kubectl_path_documents.manifests.documents, count.index)
}

// Install the CSI driver controller and daemonset, with our image.
resource "kubectl_manifest" "csi-driver-controller" {
  depends_on = [kubectl_manifest.manifests]
  yaml_body = templatefile("${path.module}/manifests/controller.yaml.tpl", {
    ebs_csi_driver_image = var.digest
  })
}
resource "kubectl_manifest" "csi-driver-node" {
  depends_on = [kubectl_manifest.manifests]
  yaml_body = templatefile("${path.module}/manifests/node.yaml.tpl", {
    ebs_csi_driver_image = var.digest
  })
}

// Define our PV.
resource "kubectl_manifest" "pv" {
  depends_on = [kubectl_manifest.csi-driver-node]
  yaml_body = templatefile("${path.module}/manifests/pv.yaml.tpl", {
    volume_id = aws_ebs_volume.volume.id
    zone      = aws_ebs_volume.volume.availability_zone
  })
}

// Define our PVC.
resource "kubectl_manifest" "pvc" {
  depends_on = [kubectl_manifest.pv]
  yaml_body = templatefile("${path.module}/manifests/pvc.yaml.tpl", {
    pv_name = kubectl_manifest.pv.name
  })
}

// Define the Pod that will use the PVC to write to the EBS volume.
resource "kubectl_manifest" "pod" {
  depends_on = [kubectl_manifest.pvc]
  yaml_body = templatefile("${path.module}/manifests/pod.yaml.tpl", {
    pod_name = "pod-${random_pet.suffix.id}"
    pvc_name = kubectl_manifest.pvc.name
  })
}

// Get the Pod's logs.
data "external" "logs" {
  depends_on = [kubectl_manifest.pod]
  program    = ["${path.module}/grep-pod-logs.sh"]
  query = {
    pod_name = kubectl_manifest.pod.name
  }
}

output "logs" {
  value = data.external.logs.result.logs
}
