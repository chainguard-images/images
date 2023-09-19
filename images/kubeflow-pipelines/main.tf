locals {
  components = toset([
    "api-server",
    "cache-server",
    "metadata-writer",
    "persistenceagent",
    "scheduledworkflow",
    "viewer-crd-controller",
    "cache-deployer"
  ])

  packages = merge(
    { for k in local.components : k => k },
    {
      "api-server"            = "kubeflow-pipelines-apiserver"
      "cache-server"          = "kubeflow-pipelines-cache_server"
      "metadata-writer"       = "kubeflow-pipelines-metadata-writer"
      "persistenceagent"      = "kubeflow-pipelines-persistence_agent"
      "scheduledworkflow"     = "kubeflow-pipelines-scheduledworkflow"
      "viewer-crd-controller" = "kubeflow-pipelines-viewer-crd-controller"
      "cache-deployer"        = "kubeflow-pipelines-cache-deployer"
    },
  )

  repositories = merge(
    { for k in local.components : k => k },
    {
      "api-server"            = "${var.target_repository}-api-server"
      "cache-server"          = "${var.target_repository}-cache-server"
      "metadata-writer"       = "${var.target_repository}-metadata-writer"
      "persistenceagent"      = "${var.target_repository}-persistenceagent"
      "scheduledworkflow"     = "${var.target_repository}-scheduledworkflow"
      "viewer-crd-controller" = "${var.target_repository}-viewer-crd-controller"
      "cache-deployer"        = "${var.target_repository}-cache-deployer"
    },
  )
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "dev" {
  source = "../../tflib/dev-subvariant"
}

module "latest" {
  for_each = local.repositories
  source   = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = each.value
  config            = file("${path.module}/configs/latest.${each.key}.apko.yaml")
}

module "latest-dev" {
  for_each = local.repositories
  source   = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = each.value
  config            = jsonencode(module.latest[each.key].config)
  extra_packages    = module.dev.extra_packages
}

module "version-tags" {
  for_each = local.packages
  source   = "../../tflib/version-tags"

  package = each.value
  config  = module.latest[each.key].config
}

module "test-latest" {
  source = "./tests"

  digests = { for k, v in module.latest : k => v.image_ref }
}

module "tagger" {
  for_each = local.components
  source   = "../../tflib/tagger"

  depends_on = [module.test-latest]

  tags = merge(
    { for t in toset(concat(["latest"], module.version-tags[each.key].tag_list)) : t => module.latest[each.key].image_ref },
    { for t in toset(concat(["latest"], module.version-tags[each.key].tag_list)) : "${t}-dev" => module.latest-dev[each.key].image_ref },
  )
}
