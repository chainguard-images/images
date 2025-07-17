terraform {
  required_providers {
    cosign = {
      source  = "chainguard-dev/cosign"
      version = "0.0.31"
    }
    apko = {
      source  = "chainguard-dev/apko"
      version = "0.28.0"
    }
    oci = {
      source  = "chainguard-dev/oci"
      version = "0.0.23"
    }
    chainguard = {
      source  = "chainguard-dev/chainguard"
      version = "0.1.32"
    }
    imagetest = {
      source  = "chainguard-dev/imagetest"
      version = "0.0.92"
    }
  }
}
