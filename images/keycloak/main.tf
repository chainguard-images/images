terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    apko = { source = "chainguard-dev/apko" }
  }
}

data "apko_config" "get-keycloak-version" {
  config_contents = jsonencode({
    contents = {
      packages = ["keycloak"]
    }
  })
}

data "apko_config" "get-keycloak-operator-version" {
  config_contents = jsonencode({
    contents = {
      packages = ["keycloak-operator"]
    }
  })
}

locals {
  // This parses the keycloak package in the dummy config needed for keycloak version in k8s manifest                                    
  keycloak_package       = [for p in data.apko_config.get-keycloak-version.config.contents.packages : p if startswith(p, "keycloak")][0]
  keycloak_version       = split("=", local.keycloak_package)[1] // This extracts the full version                  
  keycloak_without_epoch = split("-", local.keycloak_version)[0] // This extracts the version without the epoch 

  // This parses the keycloak-operator package in the dummy config needed for keycloak-operator version in k8s manifest
  keycloak-operator_package       = [for p in data.apko_config.get-keycloak-operator-version.config.contents.packages : p if startswith(p, "keycloak-operator")][0]
  keycloak-operator_version       = split("=", local.keycloak-operator_package)[1] // This extracts the full version
  keycloak-operator_without_epoch = split("-", local.keycloak-operator_version)[0] // This extracts the version without the epoch
}


variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest-config" { source = "./config" }

module "latest" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.latest-config.config
  build-dev         = true
}

module "test-latest" {
  source                    = "./tests"
  digest                    = module.latest.image_ref
  keycloak_version          = local.keycloak_without_epoch
  keycloak-operator_version = local.keycloak-operator_without_epoch
}

resource "oci_tag" "latest" {
  depends_on = [module.test-latest]
  digest_ref = module.latest.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test-latest]
  digest_ref = module.latest.dev_ref
  tag        = "latest-dev"
}
