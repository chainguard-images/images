terraform {
  required_providers {
    cosign = {
      source  = "chainguard-dev/cosign"
      version = "0.0.20"
    }
    apko = {
      source  = "chainguard-dev/apko"
      version = "0.21.1"
    }
    oci = {
      source  = "chainguard-dev/oci"
      version = "0.0.17"
    }
    chainguard = {
      source  = "chainguard-dev/chainguard"
      version = ">= 0.1.24"
    }
    imagetest = {
      source  = "chainguard-dev/imagetest"
      version = "0.0.46"
    }
  }
}
