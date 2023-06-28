terraform {
  required_providers {
    oci    = { source = "chainguard-dev/oci" }
    random = { source = "hashicorp/random" }
    helm   = { source = "hashicorp/helm" }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $${IMAGE_NAME} --version"
}

resource "helm_release" "proxysql" {
  name             = "proxysql"
  namespace        = "proxysql"
  repository       = "https://dysnix.github.io/charts/"
  chart            = "dysnix"
  create_namespace = true

  set {
    name  = "image.registry"
    value = ""
  }

  set {
    name  = "image.repository"
    value = "unused@${element(split("@", var.digest), 1)}"
  }

  set {
    name  = "image.tag"
    value = element(split("@", var.digest), 0)
  }
}
