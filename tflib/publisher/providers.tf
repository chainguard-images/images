terraform {
  required_providers {
    cosign = {
      source  = "chainguard-dev/cosign"
      version = "0.0.31"
    }
    apko = {
      source  = "chainguard-dev/apko"
      version = "0.29.10"
    }
    oci = {
      source  = "chainguard-dev/oci"
      version = "0.0.25"
    }
    chainguard = {
      source  = "chainguard-dev/chainguard"
      version = "0.1.33"
    }
    imagetest = {
      source  = "chainguard-dev/imagetest"
      version = "0.0.93"
    }
  }
}
