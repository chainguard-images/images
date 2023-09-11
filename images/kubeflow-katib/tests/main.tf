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

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "oci_exec_test" "smoke" {
  digest = var.digests["controller"] # This doesn't actually matter here, just pass it something valid
  script = "${path.module}/smoke-test.sh"

  env {
    name  = "PATH_MODULE"
    value = path.module
  }

  env {
    name  = "IMAGE_REPOSITORY_CONTROLLER"
    value = var.digests["controller"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_DB_MANAGER"
    value = var.digests["db-manager"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_EARLYSTOPPING"
    value = var.digests["earlystopping"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_FILE_METRICSCOLLECTOR"
    value = var.digests["file-metricscollector"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_GOPTUNA"
    value = var.digests["suggestion-goptuna"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_HYPERBAND"
    value = var.digests["suggestion-hyperband"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_HYPEROPT"
    value = var.digests["suggestion-hyperopt"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_NAS_DARTS"
    value = var.digests["suggestion-nas-darts"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_OPTUNA"
    value = var.digests["suggestion-optuna"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_PBT"
    value = var.digests["suggestion-pbt"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_SKOPT"
    value = var.digests["suggestion-skopt"].registry_repo
  }
  env {
    name  = "IMAGE_TAG"
    value = "latest"
  }
}

