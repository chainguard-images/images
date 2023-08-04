terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "iam_role_arn" {}
variable "cluster_name" {}
variable "public_subnets" {
  type = list(string)
}

variable "kubernetes_namespace" {
  default = "kube-system"
}

variable "kubernetes_service_account" {
  default = "aws-load-balancer-controller"
}

resource "kubernetes_service_account_v1" "irsa" {
  metadata {
    name      = var.kubernetes_service_account
    namespace = var.kubernetes_namespace
    annotations = {
      "eks.amazonaws.com/role-arn" = var.iam_role_arn
    }
  }
  automount_service_account_token = true
}

resource "helm_release" "alb" {
  name      = "aws-load-balancer-controller"
  namespace = var.kubernetes_namespace

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"

  # TODO:
  # version    = var.aws_load_balancer_controller_version

  timeout = 60

  values = [
    jsonencode({
      clusterName = var.cluster_name
      serviceAccount = {
        create = false
        name   = kubernetes_service_account_v1.irsa.metadata[0].name
      }
    }),

    # Chainguardification
    jsonencode({})
  ]
}

resource "random_pet" "suffix" {
  length = 2
}

# Deploy a sample app
resource "helm_release" "podinfo" {
  name             = "podinfo-${random_pet.suffix.id}"
  namespace        = "podinfo-${random_pet.suffix.id}"
  repository       = "https://stefanprodan.github.io/podinfo"
  chart            = "podinfo"
  create_namespace = true

  depends_on = [helm_release.alb]
}

resource "kubernetes_ingress_v1" "alb_podinfo" {
  metadata {
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
      # ALB's are L7 and require a host header
      host = "podinfo.inky.dev"
      http {
        path {
          path      = "/"
          path_type = "ImplementationSpecific"
          backend {
            service {
              name = helm_release.podinfo.name
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

  wait_for_load_balancer = true
}

output "podinfo_hostname" {
  value = kubernetes_ingress_v1.alb_podinfo.spec[0].rule[0].host
}

output "alb_hostname" {
  value = kubernetes_ingress_v1.alb_podinfo.status[0].load_balancer[0].ingress[0].hostname
}
