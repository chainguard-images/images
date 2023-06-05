variable "target_repository" {}

variable "config" {}

variable "extra_packages" {
  type        = list(string)
  default     = ["wolfi-baselayout"]
}

module "this" {
  source  = "chainguard-dev/apko/publisher"
  version = "0.0.4"

  target_repository = var.target_repository
  config            = var.config
  extra_packages    = var.extra_packages
}

output "image_ref" {
    value = module.this.image_ref
}

output "config" {
    value = module.this.config
}