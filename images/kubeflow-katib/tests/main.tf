terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    controller            = string
    db-manager            = string
    earlystopping         = string
    file-metricscollector = string
    suggestion-goptuna    = string
    suggestion-hyperband  = string
    suggestion-hyperopt   = string
    suggestion-nas-darts  = string
    suggestion-optuna     = string
    suggestion-pbt        = string
    suggestion-skopt      = string
  })
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

data "oci_exec_test" "smoke" {
  digest = var.digests["controller"] # This doesn't actually matter here, just pass it something valid
  script = "${path.module}/smoke-test.sh"

  env {
    name  = "IMAGE_REPOSITORY_CONTROLLER"
    value = local.parsed["controller"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_CONTROLLER_TAG"
    value = local.parsed["controller"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_DB_MANAGER"
    value = local.parsed["db-manager"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_DB_MANAGER_TAG"
    value = local.parsed["db-manager"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_EARLYSTOPPING"
    value = local.parsed["earlystopping"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_EARLYSTOPPING_TAG"
    value = local.parsed["earlystopping"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_FILE_METRICSCOLLECTOR"
    value = local.parsed["file-metricscollector"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_FILE_METRICSCOLLECTOR_TAG"
    value = local.parsed["file-metricscollector"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_GOPTUNA"
    value = local.parsed["suggestion-goptuna"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_GOPTUNA_TAG"
    value = local.parsed["suggestion-goptuna"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_HYPERBAND"
    value = local.parsed["suggestion-hyperband"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_HYPERBAND_TAG"
    value = local.parsed["suggestion-hyperband"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_HYPEROPT"
    value = local.parsed["suggestion-hyperopt"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_HYPEROPT_TAG"
    value = local.parsed["suggestion-hyperopt"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_NAS_DARTS"
    value = local.parsed["suggestion-nas-darts"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_NAS_DARTS_TAG"
    value = local.parsed["suggestion-nas-darts"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_OPTUNA"
    value = local.parsed["suggestion-optuna"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_OPTUNA_TAG"
    value = local.parsed["suggestion-optuna"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_PBT"
    value = local.parsed["suggestion-pbt"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_PBT_TAG"
    value = local.parsed["suggestion-pbt"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_SKOPT"
    value = local.parsed["suggestion-skopt"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_SKOPT_TAG"
    value = local.parsed["suggestion-skopt"].pseudo_tag
  }
}

