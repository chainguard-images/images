terraform {
  required_providers {
    cosign     = { source = "chainguard-dev/cosign", version = "0.4.5" }
    apko       = { source = "chainguard-dev/apko", version = "1.2.11" }
    oci        = { source = "chainguard-dev/oci", version = "0.1.6" }
    chainguard = { source = "chainguard-dev/chainguard", version = "0.2.13" }
    imagetest  = { source = "chainguard-dev/imagetest", version = "0.2.0" }
  }
}
