locals {
  components = {
    "api-server"            = "kubeflow-pipelines-apiserver",
    "cache-server"          = "kubeflow-pipelines-cache_server",
    "metadata-envoy"        = "kubeflow-pipelines-metadata-envoy-config",
    "metadata-writer"       = "kubeflow-pipelines-metadata-writer",
    "persistenceagent"      = "kubeflow-pipelines-persistence_agent",
    "scheduledworkflow"     = "kubeflow-pipelines-scheduledworkflow",
    "viewer-crd-controller" = "kubeflow-pipelines-viewer-crd-controller",
    "cache-deployer"        = "kubeflow-pipelines-cache-deployer",
    "frontend"              = "kubeflow-pipelines-frontend",
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  for_each = local.components
  source   = "./configs"

  name           = each.key
  extra_packages = [each.value]
}

module "latest" {
  for_each = local.components
  source   = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = "${var.target_repository}-${each.key}"
  config            = module.config[each.key].config
  build-dev         = true
  main_package      = each.value
}

module "version-tags" {
  for_each = local.components
  source   = "../../tflib/version-tags"

  package = each.value
  config  = module.latest[each.key].config
}

module "test-latest" {
  source  = "./tests"

  digests = { for k, v in module.latest : k => v.image_ref }
}

resource "oci_tag" "latest" {
  for_each   = local.components
  depends_on = [module.test-latest]
  digest_ref = module.latest[each.key].image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  for_each   = local.components
  depends_on = [module.test-latest]
  digest_ref = module.latest[each.key].dev_ref
  tag        = "latest-dev"
}
