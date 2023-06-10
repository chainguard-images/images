/*
Copyright 2023 Chainguard, Inc.
SPDX-License-Identifier: Apache-2.0
*/

terraform {
  required_providers {
    cosign = {
      source = "chainguard-dev/cosign"
    }
  }
}

variable "image_refs" {
  type        = list(string)
  description = "The image references to verify against our policies."
}

data "cosign_verify" "is-signed" {
  for_each = toset(var.image_refs)
  image    = each.key
  policy   = file("${path.module}/01-is-signed.yaml")
}

data "cosign_verify" "has-sbom-att" {
  for_each = toset(var.image_refs)
  image    = each.key
  policy   = file("${path.module}/03-has-sbom-attestation.yaml")
}

data "cosign_verify" "has-slsa-att" {
  for_each = toset(var.image_refs)
  image    = each.key
  policy   = file("${path.module}/04-has-slsa-attestation.yaml")
}
