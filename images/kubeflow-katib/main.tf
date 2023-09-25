locals {
  components = toset([
    "controller",
    "db-manager",
    "earlystopping",
    "file-metricscollector",
    "suggestion-goptuna",
    "suggestion-hyperband",
    "suggestion-hyperopt",
    "suggestion-nas-darts",
    "suggestion-optuna",
    "suggestion-pbt",
    "suggestion-skopt",
  ])

  packages = merge(
    { for k in local.components : k => k },
    {
      "controller"            = "katib-controller"
      "db-manager"            = "katib-db-manager"
      "earlystopping"         = "katib-earlystopping"
      "file-metricscollector" = "katib-file-metricscollector"
      "suggestion-goptuna"    = "katib-suggestion-goptuna"
      "suggestion-hyperband"  = "katib-suggestion-hyperband"
      "suggestion-hyperopt"   = "katib-suggestion-hyperopt"
      "suggestion-nas-darts"  = "katib-suggestion-nas-darts"
      "suggestion-optuna"     = "katib-suggestion-optuna-enas"
      "suggestion-pbt"        = "katib-suggestion-pbt-enas"
      "suggestion-skopt"      = "katib-suggestion-skopt-enas"
    },
  )

  repositories = merge(
    { for k in local.components : k => k },
    {
      "controller"            = "${var.target_repository}-controller"
      "db-manager"            = "${var.target_repository}-db-manager"
      "earlystopping"         = "${var.target_repository}-earlystopping-medianstop"
      "file-metricscollector" = "${var.target_repository}-file-metrics-collector"
      "suggestion-goptuna"    = "${var.target_repository}-suggestion-goptuna"
      "suggestion-hyperband"  = "${var.target_repository}-suggestion-hyperband"
      "suggestion-hyperopt"   = "${var.target_repository}-suggestion-hyperopt"
      "suggestion-nas-darts"  = "${var.target_repository}-suggestion-darts"
      "suggestion-optuna"     = "${var.target_repository}-suggestion-optuna"
      "suggestion-pbt"        = "${var.target_repository}-suggestion-pbt"
      "suggestion-skopt"      = "${var.target_repository}-suggestion-skopt"
    },
  )
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest" {
  for_each          = local.repositories
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = each.value
  config            = file("${path.module}/configs/latest.${each.key}.apko.yaml")
  build-dev         = true
}

module "version-tags" {
  for_each = local.packages
  source   = "../../tflib/version-tags"
  package  = each.value
  config   = module.latest[each.key].config
}

module "test-latest" {
  source  = "./tests"
  digests = { for k, v in module.latest : k => v.image_ref }
}

module "tagger" {
  for_each = local.components
  source   = "../../tflib/tagger"

  depends_on = [module.test-latest]

  tags = merge(
    { for t in toset(concat(["latest"], module.version-tags[each.key].tag_list)) : t => module.latest[each.key].image_ref },
    { for t in toset(concat(["latest"], module.version-tags[each.key].tag_list)) : "${t}-dev" => module.latest[each.key].dev_ref },
  )
}
