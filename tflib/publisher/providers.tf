terraform {
  required_providers {
    cosign = {
      source  = "chainguard-dev/cosign"
      version = "0.0.20"
    }
    apko = {
      source  = "chainguard-dev/apko"
      version = "0.20.3"
    }
    oci = {
      source  = "chainguard-dev/oci"
      version = "0.0.17"
    }
    chainguard = {
      source  = "chainguard-dev/chainguard"
      version = ">= 0.1.18"
    }
    imagetest = {
      source  = "chainguard-dev/imagetest"
      version = "0.0.46"
    }
  }
}
