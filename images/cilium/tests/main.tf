terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The digests to run tests over."
  type = object({
    agent             = string
    hubble-relay      = string
    hubble-ui         = string
    hubble-ui-backend = string
    operator          = string
  })
}

data "oci_exec_test" "operator-version" {
  script = "docker run --rm $IMAGE_NAME --version"
  digest = var.digests.operator
}

data "oci_exec_test" "cilium-install" {
  script          = "${path.module}/cilium-install.sh"
  digest          = var.digests.agent
  timeout_seconds = 1200
  env = [{
    name  = "AGENT_IMAGE"
    value = var.digests.agent
    }, {
    name  = "HUBBLE_RELAY_IMAGE"
    value = var.digests.hubble-relay
    }, {
    name  = "HUBBLE_UI_IMAGE"
    value = var.digests.hubble-ui
    }, {
    name  = "HUBBLE_UI_BACKEND_IMAGE"
    value = var.digests.hubble-ui-backend
    }, {
    name  = "OPERATOR_IMAGE"
    value = var.digests.operator
  }]
}
