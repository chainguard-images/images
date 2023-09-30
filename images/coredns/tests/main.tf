terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

resource "helm_release" "coredns" {
  name = "coredns"

  repository = "https://coredns.github.io/helm"
  chart      = "coredns"

  namespace        = "coredns"
  create_namespace = true
  wait             = true

  values = [
    file("${path.module}/values.yaml"),
    jsonencode({
      image = {
        repository = data.oci_string.ref.registry_repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    })
  ]
}

resource "kubernetes_job_v1" "check_coredns" {
  metadata {
    name      = "check-coredns"
    namespace = helm_release.coredns.namespace
  }

  spec {
    template {
      metadata {}
      spec {
        container {
          name  = "check-coredns"
          image = "cgr.dev/chainguard/busybox:latest"

          command = ["/bin/sh", "-c"]
          args = [
            # Check that our Corefile returns what we want, validating that corends is ~functioning
            "nslookup -q=TXT ping.chainguard.foo coredns-coredns.coredns.svc.cluster.local 2>&1 | grep -q '\\\"pong\\\"' || (echo 'Warning: TXT record for ping.chainguard.foo is not \"pong\"' && exit 1)"
          ]
        }
        restart_policy = "Never"
      }
    }
  }

  wait_for_completion = true

  depends_on = [helm_release.coredns]
}

module "helm_cleanup" {
  depends_on = [kubernetes_job_v1.check_coredns]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.coredns.id
  namespace  = helm_release.coredns.namespace
}
