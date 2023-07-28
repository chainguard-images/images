terraform {
  required_providers {
    aws        = { source = "hashicorp/aws" }
    helm       = { source = "hashicorp/helm" }
    kubernetes = { source = "hashicorp/kubernetes" }
    oci        = { source = "chainguard-dev/oci" }
  }
}

variable "image_ref" {}
variable "cluster_oidc_provider_arn" {}

variable "name" {
  description = "Used for deduping."
}

variable "kubernetes_namespace" {
  default = "kube-system"
}

variable "kubernetes_service_account" {
  default = "ebs-csi-controller-sa"
}

# data "oci_ref" "image" {
#   name = var.image_ref
# }

module "ebs_csi_driver_irsa_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

  role_name             = "ebs-csi-driver"
  attach_ebs_csi_policy = true

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
      "eks.amazonaws.com/role-arn" = module.ebs_csi_driver_irsa_role.iam_role_arn
    }
  }
  automount_service_account_token = true
}

resource "helm_release" "ebs" {
  name       = "aws-ebs-csi-driver"
  namespace  = var.kubernetes_namespace
  repository = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
  chart      = "aws-ebs-csi-driver"
  # version    = "1.4.6"

  # Anything longer than this means something is borked
  timeout = 60

  values = [
    jsonencode({
      controller = {
        serviceAccount = {
          create = false
        }
      }
    }),

    # # Chainguardification
    # jsonencode({
    #   image = {
    #     repository = data.oci_ref.image.repository
    #     tag        = data.oci_ref.image.pseudo_tag
    #   }
    # })
  ]

  depends_on = [
    module.ebs_csi_driver_irsa_role,
    kubernetes_service_account_v1.irsa,
  ]
}

resource "kubernetes_storage_class_v1" "ebs" {
  metadata {
    name = "${var.name}-ebs-sc"
  }
  storage_provisioner = "ebs.csi.aws.com"
  reclaim_policy      = "Delete"
  volume_binding_mode = "Immediate"

  depends_on = [helm_release.ebs]
}

resource "kubernetes_persistent_volume_claim_v1" "ebs" {
  metadata {
    name = "${var.name}-ebs-claim"
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    storage_class_name = kubernetes_storage_class_v1.ebs.metadata[0].name
  }

  wait_until_bound = true

  timeouts {
    create = "1m"
  }
}

resource "kubernetes_pod_v1" "ebs" {
  metadata {
    name = "${var.name}-ebs-claimer"
  }
  spec {
    container {
      name  = "wait"
      image = "busybox"
      command = [
        "/bin/sh",
        "-c",
        "while true; do echo $(date -u) >> /data/out.txt; sleep 5; done;"
      ]
      volume_mount {
        name       = "ebs"
        mount_path = "/data"
      }
    }
    volume {
      name = "ebs"
      persistent_volume_claim {
        claim_name = kubernetes_persistent_volume_claim_v1.ebs.metadata[0].name
      }
    }
  }

  timeouts {
    create = "1m"
    delete = "1m"
  }
}
