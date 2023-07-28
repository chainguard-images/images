terraform {
  required_providers {
    aws        = { source = "hashicorp/aws" }
    helm       = { source = "hashicorp/helm" }
    kubernetes = { source = "hashicorp/kubernetes" }
    oci        = { source = "chainguard-dev/oci" }
  }
}

variable "name" {
  description = "Used for deduping."
}
variable "cluster_name" {}
variable "cluster_oidc_provider_arn" {}
variable "image_ref" {}
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }

variable "kubernetes_namespace" {
  default = "kube-system"
}

variable "kubernetes_service_account" {
  default = "aws-load-balancer-controller"
}

# data "oci_ref" "image" {
#   name = var.image_ref
# }

module "load_balancer_controller_irsa_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

  role_name                              = "load-balancer-controller"
  attach_load_balancer_controller_policy = true

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
      "eks.amazonaws.com/role-arn" = module.load_balancer_controller_irsa_role.iam_role_arn
    }
  }
  automount_service_account_token = true
}

resource "helm_release" "alb" {
  name       = "aws-load-balancer-controller"
  namespace  = var.kubernetes_namespace
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  version    = "1.4.6"

  # Anything longer than this means something is borked
  timeout = 60

  values = [
    jsonencode({
      clusterName = var.cluster_name
      serviceAccount = {
        create = false
        name   = var.kubernetes_service_account
      }
    }),

    # # Chainguardification
    # jsonencode({
    #   image = {
    #     repository = data.oci_ref.image.repository
    #     tag        = data.oci_ref.pseudo_tag
    #   }
    # })
  ]

  depends_on = [
    module.load_balancer_controller_irsa_role,
    kubernetes_service_account_v1.irsa,
  ]
}

resource "helm_release" "podinfo" {
  name             = "${var.name}-podinfo"
  namespace        = "${var.name}-podinfo"
  repository       = "https://stefanprodan.github.io/podinfo"
  chart            = "podinfo"
  create_namespace = true

  depends_on = [helm_release.alb]
}

# Create manually so we can wait on it
resource "kubernetes_ingress_v1" "alb_podinfo" {
  metadata {
    # Force dependencies
    name      = helm_release.podinfo.name
    namespace = helm_release.podinfo.namespace
    annotations = {
      "alb.ingress.kubernetes.io/scheme" : "internet-facing"
      "alb.ingress.kubernetes.io/target-type" : "ip"
      "alb.ingress.kubernetes.io/subnets" : join(",", var.public_subnets)
    }
  }

  spec {
    ingress_class_name = "alb"
    rule {
      host = "podinfo.local"
      http {
        path {
          path      = "/"
          path_type = "ImplementationSpecific"
          backend {
            service {
              name = "podinfo"
              port {
                number = 9898
              }
            }
          }
        }
      }
    }
  }

  timeouts {
    create = "2m"
    delete = "2m"
  }

  # This is mighty convenient (:
  wait_for_load_balancer = true
}

resource "kubernetes_service_v1" "nlb_podinfo" {
  metadata {
    # Force dependencies
    name      = "${helm_release.podinfo.name}-nlb"
    namespace = helm_release.podinfo.namespace
    annotations = {
      "alb.ingress.kubernetes.io/subnets" : join(",", var.private_subnets)
    }
  }

  spec {
    selector = {
      app = "podinfo"
    }

    port {
      port        = 80
      target_port = 9898
      protocol    = "TCP"
    }
    type                = "LoadBalancer"
    load_balancer_class = "service.k8s.aws/nlb"
  }

  timeouts {
    create = "2m"
  }

  # This is mighty convenient (:
  wait_for_load_balancer = true
}

output "alb_hostname" {
  value = kubernetes_ingress_v1.alb_podinfo.status[0].load_balancer[0].ingress[0].hostname
}

output "nlb_hostname" {
  value = kubernetes_service_v1.nlb_podinfo.status[0].load_balancer[0].ingress[0].hostname
}
