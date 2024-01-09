variable "images" {
  description = <<EOT
  A map from image variant names to their image publisher module, in the format of the tflib/publisher.
  For example:

  module "latest" {
    source = "../../tflib/publisher"
    ...
  }

  module "latest-dev" {
    source = "../../tflib/publisher"
    ...
  }

  module "output" {
    images = {
      latest = module.latest
      latest-dev = module.latest-dev
    }
  }
  EOT
  type        = map(any)
}

variable "tagger" {
  description = <<EOT
  The images tagger module, in the format of the tflib tagger.
  For example:


  module "tagger" {
    source = "../../tflib/tagger"
    ...
  }

  module "output" {
    tagger = module.tagger
  }
  EOT
  type        = map(any)
}

output "images" {
  description = <<EOT
  A map of image variant names to their output attributes.
  For example:

  - single component, single variant image

  {
    apko = {
      "latest" = {
        "oci_ref" = ...
        "oci_tags" = ...
        "apko_config" = ...
      }
    }
  }

  - single component, multi variant image

  {
    jdk = {
      "eleven" = {
        "oci_ref" = ...
      }
      "eleven-dev" = {
        "oci_ref" = ...
      }
      "seventeen" = {
        "oci_ref" = ...
      }
      "seventeen-dev" = {
        "oci_ref" = ...
      }
      ...
    }
  }

  - multi component, multi variant image

  {
    "flux" = {
      "flux" = {
        "latest" = {
          "oci_ref" = ...
        }
        "latest-dev" = {
          "oci_ref" = ...
        }
      }
      "flux-helm-controller" = {
        "latest" = {
          "oci_ref" = ...
        }
        "latest-dev" = {
          "oci_ref" = ...
        }
      }
      "flux-source-controller" = {
        "latest" = {
          "oci_ref" = ...
        }
        "latest-dev" = {
          "oci_ref" = ...
        }
      }
      ...
    }
  }

EOT

  value = { for k, v in var.images :
    k => {
      "oci_ref" = v.image_ref
      # Only include tags that match the given digest
      "oci_tags"    = flatten([for digest, tags in var.tagger.oci_tags : tags if digest == v.image_ref])
      "apko_config" = v.config
    }
  }
}
