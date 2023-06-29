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

resource "random_pet" "suffix" {}

data "oci_exec_test" "run" {
  digest = var.digest
  script = "docker run --rm $${IMAGE_NAME} --version"
}

resource "helm_release" "thanos-operator" {
  name             = "thanos-operator-${random_pet.suffix.id}"
  repository       = "https://kubernetes-charts.banzaicloud.com"
  chart            = "banzaicloud-stable"
  namespace        = "thanos-operator-${random_pet.suffix.id}"
  create_namespace = true

  set {
    name  = "image.repository"
    value = element(split("@", data.oci_exec_test.run.tested_ref), 0)
  }
  set {
    name  = "image.tag"
    value = "unused@${element(split("@", data.oci_exec_test.run.tested_ref), 1)}"
  }
}
