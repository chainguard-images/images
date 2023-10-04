terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "config" {
  description = "The resolved apko configuration. This is the structured config object, not a YAML-encoded string."
}

variable "package" {
  type        = string
  description = "The name of the package from which to extract version tags."
}

data "apko_tags" "tags" {
  config         = var.config
  target_package = var.package
}

output "tag_list" {
  value = data.apko_tags.tags.tags
}
