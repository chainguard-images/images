terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    api-server            = string
    cache-server          = string
    metadata-writer       = string
    persistenceagent      = string
    scheduledworkflow     = string
    viewer-crd-controller = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "oci_exec_test" "smoke" {
  digest = var.digests["controller"] # This doesn't actually matter here, just pass it something valid
  script = "${path.module}/smoke-test.sh"

  env {
    name  = "IMAGE_REPOSITORY_APISERVER"
    value = var.digests["api-server"]
  }
  env {
    name  = "IMAGE_REPOSITORY_CACHESERVER"
    value = var.digests["cache-server"]
  }
  env {
    name  = "IMAGE_REPOSITORY_METADATAWRITER"
    value = var.digests["metadata-writer"]
  }
  env {
    name  = "IMAGE_REPOSITORY_PERSISTENCEAGENT"
    value = var.digests["persistenceagent"]
  }
  env {
    name  = "IMAGE_REPOSITORY_SCHEDULEDWORKFLOW"
    value = var.digests["scheduledworkflow"]
  }
  env {
    name  = "IMAGE_REPOSITORY_VIEWERCRDCONTROLLER"
    value = var.digests["viewer-crd-controller"]
  }
  env {
    name  = "IMAGE_TAG"
    value = "latest"
  }
}
