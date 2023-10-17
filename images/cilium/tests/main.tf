terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

provider "helm" {
  kubernetes {
    config_context = "k3d-cilium-test"
    config_path    = "~/.kube/config"
  }
}

variable "digests" {
  description = "The digests to run tests over."
  type = object({
    operator = string
  })
}

data "oci_exec_test" "operator-version" {
  script = "docker run --rm $IMAGE_NAME --version"
  digest = var.digests.operator
}

data "oci_exec_test" "cilium-install" {
  script = "${path.module}/cilium-install.sh"
  digest = var.digests.operator
}

