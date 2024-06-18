terraform {
  required_providers {
    cosign = {
      source  = "chainguard-dev/cosign"
      version = "0.0.20"
    }
    apko = {
      source  = "chainguard-dev/apko"
      version = "0.15.12"
    }
    oci = {
      source  = "chainguard-dev/oci"
      version = "0.0.13"
    }
    chainguard = {
      source  = "chainguard-dev/chainguard"
      version = "0.1.7"
    }
  }
}
