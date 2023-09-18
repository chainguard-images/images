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
    name  = "IMAGE_REPOSITORY_CONTROLLER"
    value = data.oci_string.ref["controller"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_CONTROLLER_TAG"
    value = data.oci_string.ref["controller"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_DB_MANAGER"
    value = data.oci_string.ref["db-manager"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_DB_MANAGER_TAG"
    value = data.oci_string.ref["db-manager"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_EARLYSTOPPING"
    value = data.oci_string.ref["earlystopping"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_EARLYSTOPPING_TAG"
    value = data.oci_string.ref["earlystopping"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_FILE_METRICSCOLLECTOR"
    value = data.oci_string.ref["file-metricscollector"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_FILE_METRICSCOLLECTOR_TAG"
    value = data.oci_string.ref["file-metricscollector"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_GOPTUNA"
    value = data.oci_string.ref["suggestion-goptuna"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_GOPTUNA_TAG"
    value = data.oci_string.ref["suggestion-goptuna"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_HYPERBAND"
    value = data.oci_string.ref["suggestion-hyperband"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_HYPERBAND_TAG"
    value = data.oci_string.ref["suggestion-hyperband"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_HYPEROPT"
    value = data.oci_string.ref["suggestion-hyperopt"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_HYPEROPT_TAG"
    value = data.oci_string.ref["suggestion-hyperopt"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_NAS_DARTS"
    value = data.oci_string.ref["suggestion-nas-darts"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_NAS_DARTS_TAG"
    value = data.oci_string.ref["suggestion-nas-darts"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_OPTUNA"
    value = data.oci_string.ref["suggestion-optuna"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_OPTUNA_TAG"
    value = data.oci_string.ref["suggestion-optuna"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_PBT"
    value = data.oci_string.ref["suggestion-pbt"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_PBT_TAG"
    value = data.oci_string.ref["suggestion-pbt"].pseudo_tag
  }

  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_SKOPT"
    value = data.oci_string.ref["suggestion-skopt"].registry_repo
  }
  env {
    name  = "IMAGE_REPOSITORY_SUGGESTION_SKOPT_TAG"
    value = data.oci_string.ref["suggestion-skopt"].pseudo_tag
  }
}

