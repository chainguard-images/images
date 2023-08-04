terraform {
  required_providers {
    oci        = { source = "chainguard-dev/oci" }
    helm       = { source = "hashicorp/helm" }
    kubernetes = { source = "hashicorp/kubernetes" }
  }
}

variable "iam_role_arn" {}

variable "kubernetes_namespace" {
  default = "kube-system"
}

variable "kubernetes_service_account" {
  default = "ebs-csi-controller-sa"
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

resource "helm_release" "ebs" {
  name      = "aws-ebs-csi-driver"
  namespace = var.kubernetes_namespace

  repository = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
  chart      = "aws-ebs-csi-driver"

  # TODO:
  # version    = var.ebs_csi_driver_version

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

    # Chainguardification
    jsonencode({
      image = {
        repository = "ttl.sh/jrw/aws-ebs-csi-driver"
        tag        = "unused@sha256:b3b49e6e8b03c7dfae1934cb490a69a93ae95f50ab6329bc640035bf46669ee1"
      }

      sidecars = {
        provisioner = {
          image = {
            repository = "ttl.sh/jrw/ep/eks-distro-kubernetes-csi-external-provisioner"
            tag        = "unused@sha256:27e5698036fe828b6e847e553999fa58832002b53a051ab52cecbdcbb2309d14"
          }
        }
        attacher = {
          image = {
            repository = "ttl.sh/jrw/ep/eks-distro-kubernetes-csi-external-attacher"
            tag        = "unused@sha256:0e05dff40239ed6756b747521aecd5420b82b80421a1918cfcbd71c4f139d015"
          }
        }
        resizer = {
          image = {
            repository = "ttl.sh/jrw/ep/eks-distro-kubernetes-csi-external-resizer"
            tag        = "unused@sha256:6087e5bbdf59402cd0573285fb49e3a05cce3c511ba18442fb1ba1fbe87b8f61"
          }
        }
        livenessProbe = {
          image = {
            repository = "ttl.sh/jrw/ep/eks-distro-kubernetes-csi-livenessprobe"
            tag        = "unused@sha256:8739c3cdc5ac8869e148b6c8cdc0a90d73adc065dc3fb3613280378684a910ee"
          }
        }
        nodeDriverRegistrar = {
          image = {
            repository = "ttl.sh/jrw/ep/eks-distro-kubernetes-csi-node-driver-registrar"
            tag        = "unused@sha256:5add5a480812dcfd0faac1cab7cff6cf39901d208217c8e8c1e28ef9f30dc4e7"
          }
        }
        # TODO: We don't provide this yet?
        # volumemodifier = {
        #   image = {
        #     repository = ""
        #     tag        = ""
        #   }
        # }
      }
    })
  ]
}

resource "random_pet" "suffix" {
  length = 2
}

resource "kubernetes_storage_class_v1" "ebs" {
  metadata {
    name = "ebs-sc-${random_pet.suffix.id}"
  }
  storage_provisioner = "ebs.csi.aws.com"
  reclaim_policy      = "Delete"
  volume_binding_mode = "WaitForFirstConsumer"

  parameters = {
    type = "gp2"
  }
  allow_volume_expansion = true

  depends_on = [helm_release.ebs]
}

resource "kubernetes_persistent_volume_claim_v1" "ebs" {
  metadata {
    name = "ebs-claim-${random_pet.suffix.id}"
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

  depends_on = [helm_release.ebs]
}

resource "kubernetes_deployment_v1" "ebs" {
  metadata {
    name = "ebs-claimer-${random_pet.suffix.id}"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "ebs-claimer-${random_pet.suffix.id}"
      }
    }
    template {
      metadata {
        labels = {
          app = "ebs-claimer-${random_pet.suffix.id}"
        }
      }
      spec {
        termination_grace_period_seconds = 0
        container {
          name  = "wait"
          image = "cgr.dev/chainguard/busybox:latest"
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
            # Don't use a variable to prevent depending on the PVC which introduces
            # a cycle on delete
            claim_name = "ebs-claim-${random_pet.suffix.id}"
          }
        }
      }
    }
  }

  timeouts {
    // EBS can be slow to provision sometimes
    create = "2m"
    delete = "2m"
  }

  depends_on = [helm_release.ebs]
}

output "statefulset_name" {
  value = kubernetes_deployment_v1.ebs.metadata[0].name
}

output "mount_path" {
  value = kubernetes_deployment_v1.ebs.spec[0].template[0].spec[0].container[0].volume_mount[0].mount_path
}
