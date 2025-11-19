terraform {
  required_providers {
    cosign     = { source = "chainguard-dev/cosign" }
    apko       = { source = "chainguard-dev/apko" }
    oci        = { source = "chainguard-dev/oci" }
    chainguard = { source = "chainguard-dev/chainguard" }
    imagetest  = { source = "chainguard-dev/imagetest" }
  }
}
