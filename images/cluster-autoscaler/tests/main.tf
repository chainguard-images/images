terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "oci_exec_test" "run" {
  digest = var.digest
  script = <<EOF
    # We expect the command to fail, but want its output anyway.
    ( docker run --rm $IMAGE_NAME --help 2>&1 || true ) | grep autoscaler
  EOF
}

resource "helm_release" "cluster-autoscaler" {
  name = "cluster-autoscaler"

  repository = "https://kubernetes.github.io/autoscaler"
  chart      = "cluster-autoscaler"

  namespace        = "cluster-autoscaler"
  create_namespace = true

  values = [jsonencode({
    global = {
      image = {
        tag        = data.oci_string.ref.pseudo_tag
        repository = data.oci_string.ref.registry_repo
      }
    }
    autoDiscovery = {
      clusterName = "foo"
    }
  })]
}
