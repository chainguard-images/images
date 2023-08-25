terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    jupyter-web-app = string
    volumes-web-app = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "oci_exec_test" "test" {
  for_each = { for k, v in var.digests : k => v }
  digest   = each.value
  script   = "${path.module}/full-test.sh"

  env {
    name  = "APP"
    value = each.key
  }
  env {
    name  = "IMAGE_REGISTRY_REPO"
    value = data.oci_string.ref[each.key].registry_repo
  }
  env {
    name  = "IMAGE_TAG"
    value = data.oci_string.ref[each.key].pseudo_tag
  }
}
