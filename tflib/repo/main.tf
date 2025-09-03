// This module just wraps the chainguard_image_repo resource but declares all
// of the fields as required to guarantee we're not accidentally miss setting
// fields between repo updates that might cause us to lose them.

terraform {
  required_providers {
    chainguard = { source = "chainguard-dev/chainguard" }
  }
}

variable "parent_id" {
  description = "The parent ID for the image repository"
  type        = string
}

variable "name" {
  description = "The name of the image repository"
  type        = string
}

variable "readme" {
  description = "The README content for the image repository"
  type        = string
}

variable "bundles" {
  description = "The list of bundles for the image repository"
  type        = list(string)
}

variable "tier" {
  description = "The tier for the image repository"
  type        = string
}

variable "aliases" {
  description = "The list of aliases for the image repository"
  type        = list(string)
}

variable "active_tags" {
  description = "The list of active tags for the image repository"
  type        = list(string)
}

resource "chainguard_image_repo" "repo" {
  parent_id   = var.parent_id
  readme      = var.readme
  name        = var.name
  bundles     = var.bundles
  tier        = var.tier
  aliases     = var.aliases
  active_tags = var.active_tags
}
