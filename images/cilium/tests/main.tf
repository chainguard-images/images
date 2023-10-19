terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The digests to run tests over."
  type = object({
    agent    = string
    operator = string
  })
}

data "oci_exec_test" "operator-version" {
  script = "docker run --rm $IMAGE_NAME --version"
  digest = var.digests.operator
}

data "oci_exec_test" "agent-version" {
  script = "docker run --rm $IMAGE_NAME --version"
  digest = var.digests.agent
}

data "oci_exec_test" "cilium-install" {
  script = "${path.module}/cilium-install.sh"
  digest = var.digests.agent

  env {
    name  = "AGENT_IMAGE"
    value = var.digests.agent
  }

  env {
    name  = "OPERATOR_IMAGE"
    value = var.digests.operator
  }
}
