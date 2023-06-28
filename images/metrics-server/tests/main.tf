terraform {
  required_providers {
    oci    = { source = "chainguard-dev/oci" }
    random = { source = "hashicorp/random" }
    helm   = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "run" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}

resource "helm_release" "metrics-server" {
  name = "metrics-server"

  repository = "https://kubernetes-sigs.github.io/metrics-server"
  chart      = "metrics-server"

  namespace        = "metrics-server"
  create_namespace = true

  # Split the digest ref into repository and digest. The helm chart expects a
  # tag, but it just appends it to the repository again, so we just specify a
  # dummy tag and the digest to test.
  set {
    name  = "image.tag"
    value = "unused@${element(split("@", data.oci_exec_test.run.tested_ref), 1)}"
  }
  set {
    name  = "image.repository"
    value = element(split("@", data.oci_exec_test.run.tested_ref), 0)
  }
  set {
    name  = "args[0]"
    value = "--kubelet-insecure-tls"
  }
}
