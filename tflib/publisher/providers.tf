terraform {
  required_providers {
    cosign = {
      source  = "chainguard-dev/cosign"
      version = "0.0.24"
    }
    apko = {
      source  = "chainguard-dev/apko"
      version = "0.22.1"
    }
    oci = {
      source  = "chainguard-dev/oci"
      version = "0.0.20"
    }
    chainguard = {
      source  = "chainguard-dev/chainguard"
      version = ">= 0.1.25"
    }
    imagetest = {
      source  = "chainguard-dev/imagetest"
      version = "0.0.62"
    }
  }
}
