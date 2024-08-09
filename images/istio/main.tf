variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "test-things" {
  source = "./tests"

  target_repository = var.target_repository

  digests = {
    install-cni = module.install-cni-versioned["istio-cni"].image_ref
    proxy       = module.proxy-versioned["istio-envoy"].image_ref
    pilot       = module.pilot-versioned["istio-pilot-discovery"].image_ref
    operator    = module.operator-versioned["istio-operator"].image_ref
  }

  # Use latest versions for these charts
  # chart_versions = { ... }
}
