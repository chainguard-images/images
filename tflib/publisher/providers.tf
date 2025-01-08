terraform {
  required_providers {
    cosign = {
      source  = "chainguard-dev/cosign"
      version = "0.0.22"
    }
    apko = {
      source  = "chainguard-dev/apko"
      version = "0.21.2"
    }
    oci = {
      source  = "chainguard-dev/oci"
      version = "0.0.18"
    }
    chainguard = {
      source  = "chainguard-dev/chainguard"
      version = ">= 0.1.25"
    }
    imagetest = {
      source  = "chainguard-dev/imagetest"
      version = "0.0.48"
    }
  }
}
