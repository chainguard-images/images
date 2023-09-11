terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    controller             = string
    db-manager             = string
    earlystopping          = string
    file-metricscollector  = string
    suggestion-goptuna     = string
    suggestion-hyperband   = string
    suggestion-hyperopt    = string
    suggestion-nas-darts   = string
    suggestion-optuna-enas = string
    suggestion-pbt-enas    = string
    suggestion-skopt-enas  = string
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
    name  = "IMAGE_REPOSITORY_CONTROLLER"
    value = var.digests["controller"]
  }
  env {
    name  = "IMAGE_REPOSITORY_DB_MANAGER"
    value = var.digests["db-manager"]
  }
  env {
    name  = "IMAGE_REPOSITORY_EARLYSTOPPING"
    value = var.digests["earlystopping"]
  }
  env {
    name  = "IMAGE_REPOSITORY_FILE_METRICSCOLLECTOR"
    value = var.digests["file-metricscollector"]
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_GOPTUNA"
    value = var.digests["suggestion-goptuna"]
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_HYPERBAND"
    value = var.digests["suggestion-hyperband"]
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_HYPEROPT"
    value = var.digests["suggestion-hyperopt"]
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_NAS_DARTS"
    value = var.digests["suggestion-nas-darts"]
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_OPTUNA_ENAS"
    value = var.digests["suggestion-optuna-enas"]
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_PBT_ENAS"
    value = var.digests["suggestion-pbt-enas"]
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_SKOPT_ENAS"
    value = var.digests["suggestion-skopt-enas"]
  }
  env {
    name  = "IMAGE_TAG"
    value = "latest"
  }
}

