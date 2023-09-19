locals {
  components = toset([
    "infrastructure-bundle",
    "fluent-bit-output",
    "k8s-events-forwarder",
    "prometheus-configurator",
    "kube-events",
    "kubernetes",
    "prometheus",
  ])

  packages = merge(
    { for k, v in local.components : k => "newrelic-${k}" },
    {
      "k8s-events-forwarder" : "newrelic-infrastructure-agent"
      "kube-events" : "newrelic-nri-kube-events"
      "kubernetes" : "nri-kubernetes"
      "prometheus" : "nri-prometheus"
    }
  )

  repositories = merge(
    { for k, v in local.components : k => "${var.target_repository}-${k}" },
  )
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

variable "license_key" {}

module "latest" {
  for_each = local.repositories
  source   = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = each.value
  config            = file("${path.module}/configs/latest.${each.key}.apko.yaml")
}

module "version-tags" {
  for_each = local.packages
  source   = "../../tflib/version-tags"

  package = each.value
  config  = module.latest[each.key].config
}

module "test-latest" {
  source = "./tests"

  digests     = { for k, v in module.latest : k => v.image_ref }
  license_key = var.license_key
}

module "tagger" {
  for_each = local.components
  source   = "../../tflib/tagger"

  depends_on = [module.test-latest]

  tags = merge(
    { for t in toset(concat(["latest"], module.version-tags[each.key].tag_list)) : t => module.latest[each.key].image_ref },
  )
}
