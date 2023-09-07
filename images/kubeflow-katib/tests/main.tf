terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    earlystopping          = string
    suggestion-hyperband   = string
    suggestion-hyperopt    = string
    suggestion-nas-darts   = string
    suggestion-optuna-enas = string
    suggestion-pbt-enas    = string
    suggestion-skopt-enas  = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}
