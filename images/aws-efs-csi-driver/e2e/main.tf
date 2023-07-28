terraform {
  required_providers {
    aws        = { source = "hashicorp/aws" }
    helm       = { source = "hashicorp/helm" }
    kubernetes = { source = "hashicorp/kubernetes" }
  }
}

variable "vpc_id" {}
variable "cluster_oidc_provider_arn" {}
variable "private_subnets" { type = list(string) }

resource "random_pet" "suffix" {
  length = 2
}

variable "kubernetes_namespace" {
  default = "kube-system"
}

variable "kubernetes_service_account" {
  default = "efs-csi-controller-sa"
}

module "efs_csi_driver_irsa_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

  role_name             = "efs-csi-driver"
  attach_efs_csi_policy = true

  oidc_providers = {
    ex = {
      provider_arn               = var.cluster_oidc_provider_arn
      namespace_service_accounts = ["${var.kubernetes_namespace}:${var.kubernetes_service_account}"]
    }
  }
}

resource "kubernetes_service_account_v1" "irsa" {
  metadata {
    name      = var.kubernetes_service_account
    namespace = var.kubernetes_namespace
    annotations = {
      "eks.amazonaws.com/role-arn" = module.efs_csi_driver_irsa_role.iam_role_arn
    }
  }
  automount_service_account_token = true
}

data "aws_vpc" "this" {
  id = var.vpc_id
}

# Create the EFS and mount target
resource "aws_security_group" "efs" {
  name        = "efs-${random_pet.suffix.id}"
  description = "Allow traffic to EFS from the EKS cluster"
  vpc_id      = var.vpc_id

  ingress {
    description = "nfs"
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.this.cidr_block]
  }

  egress {
    description = "all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_efs_file_system" "this" {
  creation_token = "eks-efs-${random_pet.suffix.id}"
  encrypted      = true
}

resource "aws_efs_mount_target" "mount" {
  for_each = toset(var.private_subnets)

  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = each.key
  security_groups = [aws_security_group.efs.id]
}

resource "helm_release" "efs" {
  name       = "aws-efs-csi-driver"
  namespace  = var.kubernetes_namespace
  repository = "https://kubernetes-sigs.github.io/aws-efs-csi-driver"
  chart      = "aws-efs-csi-driver"
  # version    = "1.4.6"

  # Anything longer than this means something is borked
  timeout = 60

  values = [
    jsonencode({
      controller = {
        serviceAccount = {
          create = false
          name   = kubernetes_service_account_v1.irsa.metadata[0].name
        }
      }
    }),

    # // Chainguardification
    # jsonencode({
    #   image = {
    #     repository = "ttl.sh/jrw/ep/aws-load-balancer-controller"
    #     tag        = "2.4"
    #   }
    # })
  ]

  depends_on = [
    module.efs_csi_driver_irsa_role,
    kubernetes_service_account_v1.irsa,
  ]
}

resource "kubernetes_storage_class_v1" "efs" {
  metadata {
    name = "efs-sc-${random_pet.suffix.id}"
  }
  storage_provisioner = "efs.csi.aws.com"
  reclaim_policy      = "Delete"
  volume_binding_mode = "Immediate"
  parameters = {
    provisioningMode = "efs-ap"
    "fileSystemId"   = aws_efs_file_system.this.id
    directoryPerms   = "777"
  }

  depends_on = [helm_release.efs]
}

resource "kubernetes_persistent_volume" "efs" {
  metadata {
    name = "efs-pv-${random_pet.suffix.id}"
  }
  spec {
    capacity = {
      storage = "1Gi"
    }
    persistent_volume_source {
      csi {
        driver        = "efs.csi.aws.com"
        volume_handle = aws_efs_file_system.this.id
      }
    }
    volume_mode                      = "Filesystem"
    access_modes                     = ["ReadWriteMany"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = kubernetes_storage_class_v1.efs.metadata[0].name
  }

  timeouts {
    create = "1m"
  }
}

resource "kubernetes_persistent_volume_claim_v1" "efs" {
  metadata {
    name = "efs-claim-${random_pet.suffix.id}"
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "100Mi"
      }
    }
    storage_class_name = kubernetes_storage_class_v1.efs.metadata[0].name
  }

  wait_until_bound = true

  timeouts {
    create = "1m"
  }

  depends_on = [kubernetes_persistent_volume.efs]
}

# I guess this could be a deployment as well :shrug:
resource "kubernetes_pod_v1" "efs" {
  count = 3

  metadata {
    name = "efs-claimer-${count.index}"
  }
  spec {
    container {
      name  = "wait"
      image = "busybox"
      command = [
        "/bin/sh",
        "-c",
        "while true; do echo $(date -u) : $(hostname) >> /data/out.txt; sleep 5; done;"
      ]
      volume_mount {
        name       = "efs"
        mount_path = "/data"
      }
    }
    volume {
      name = "efs"
      persistent_volume_claim {
        claim_name = "efs-claim-${random_pet.suffix.id}"
      }
    }
  }

  timeouts {
    create = "3m"
    delete = "3m"
  }

  # Don't depend on the PVC since we'll end up in a cycle
  depends_on = [kubernetes_storage_class_v1.efs]
}
