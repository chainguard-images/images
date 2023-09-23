terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "has-iptables" {
  digest = var.digest
  script = "docker run --rm --entrypoint iptables $IMAGE_NAME --version"
}

data "oci_exec_test" "has-ip6tables" {
  digest = var.digest
  script = "docker run --rm --entrypoint ip6tables $IMAGE_NAME --version"
}

data "oci_exec_test" "help" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --help"
}

data "oci_exec_test" "check-iptables" {
  digest      = var.digest
  script      = "./check-iptables.sh"
  working_dir = path.module
}

resource "random_pet" "namespace" {}

data "oci_exec_test" "deploy-daemonset" {
  digest      = var.digest
  script      = "./deploy-daemonset.sh"
  working_dir = path.module
  env = [{
    name  = "NAMESPACE"
    value = random_pet.namespace.id
  }]
}
