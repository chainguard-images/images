terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    chains            = string
    cli               = string
    controller        = string
    entrypoint        = string
    events            = string
    nop               = string
    resolvers         = string
    sidecarlogresults = string
    webhook           = string
    workingdirinit    = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "oci_exec_test" "test" {
  digest = var.digests["chains"]
  script = "${path.module}/test.sh"

  env {
    name  = "CHAINS_IMAGE"
    value = var.digests["chains"]
  }
  env {
    name  = "CLI_IMAGE"
    value = var.digests["cli"]
  }
  env {
    name  = "CONTROLLER_IMAGE"
    value = var.digests["controller"]
  }
  env {
    name  = "ENTRYPOINT_IMAGE"
    value = var.digests["entrypoint"]
  }
  env {
    name  = "EVENTS_IMAGE"
    value = var.digests["events"]
  }
  env {
    name  = "NOP_IMAGE"
    value = var.digests["nop"]
  }
  env {
    name  = "RESOLVERS_IMAGE"
    value = var.digests["resolvers"]
  }
  env {
    name  = "SIDECARLOGRESULTS_IMAGE"
    value = var.digests["sidecarlogresults"]
  }
  env {
    name  = "WEBHOOK_IMAGE"
    value = var.digests["webhook"]
  }
  env {
    name  = "WORKINGDIRINIT_IMAGE"
    value = var.digests["workingdirinit"]
  }
}
