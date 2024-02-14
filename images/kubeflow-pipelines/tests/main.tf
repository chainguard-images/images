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
    metadata-envoy        = string
    metadata-writer       = string
    persistenceagent      = string
    scheduledworkflow     = string
    viewer-crd-controller = string
    cache-deployer        = string
    frontend              = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "oci_exec_test" "smoke" {
  digest = var.digests["api-server"] # This doesn't actually matter here, just pass it something valid
  script = "${path.module}/smoke-test.sh"

  env {
    name  = "IMAGE_REPOSITORY_APISERVER"
    value = data.oci_string.ref["api-server"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_APISERVER_TAG"
    value = data.oci_string.ref["api-server"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_CACHESERVER"
    value = data.oci_string.ref["cache-server"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_CACHESERVER_TAG"
    value = data.oci_string.ref["cache-server"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_CACHEDEPLOYER"
    value = data.oci_string.ref["cache-deployer"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_CACHEDEPLOYER_TAG"
    value = data.oci_string.ref["cache-deployer"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_METADATAWRITER"
    value = data.oci_string.ref["metadata-writer"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_METADATAWRITER_TAG"
    value = data.oci_string.ref["metadata-writer"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_METADATA_ENVOY"
    value = data.oci_string.ref["metadata-envoy"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_METADATA_ENVOY_TAG"
    value = data.oci_string.ref["metadata-envoy"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_PERSISTENCEAGENT"
    value = data.oci_string.ref["persistenceagent"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_PERSISTENCEAGENT_TAG"
    value = data.oci_string.ref["persistenceagent"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_SCHEDULEDWORKFLOW"
    value = data.oci_string.ref["scheduledworkflow"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SCHEDULEDWORKFLOW_TAG"
    value = data.oci_string.ref["scheduledworkflow"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_VIEWERCRDCONTROLLER"
    value = data.oci_string.ref["viewer-crd-controller"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_VIEWERCRDCONTROLLER_TAG"
    value = data.oci_string.ref["viewer-crd-controller"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_FRONTEND"
    value = data.oci_string.ref["frontend"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_FRONTEND_TAG"
    value = data.oci_string.ref["frontend"].pseudo_tag
  }
}
