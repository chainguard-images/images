terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."

  type = object({
    velero                = string
    velero-plugin-for-aws = string
  })

  default = {
    velero                = "cgr.dev/chainguard/velero:latest"
    velero-plugin-for-aws = "cgr.dev/chainguard/velero-plugin-for-aws:latest"
  }
}

variable "plugins" {
  description = "The plugins to install."
  type        = list(string)
  default = [
    "cgr.dev/chainguard/velero-plugin-for-aws:latest",

    # As of latest velero, this is baked in, do not include.
    # "cgr.dev/chainguard/velero-plugin-for-csi:latest",
  ]
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

output "cmd" {
  value = templatefile("${path.module}/install.sh", {
    VELERO_IMAGE_REGISTRY   = local.parsed["velero"].registry
    VELERO_IMAGE_REPOSITORY = local.parsed["velero"].repo
    VELERO_IMAGE_TAG        = local.parsed["velero"].pseudo_tag

    PLUGINS = join(",", var.plugins)
  })
}
