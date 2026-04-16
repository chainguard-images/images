terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "target_repository" {}

variable "extra_packages" {
  description = "Additional APK packages to bake into the sandbox at build time, replacing runtime apk_add calls."
  type        = list(string)
  default     = []
}

variable "enable_runtime_packages" {
  description = "Include apk-tools to allow runtime apk add. Set to false to lock down the sandbox."
  type        = bool
  default     = true
}

locals {
  skip_build = fileexists("${path.root}/.skip_imagetest")

  # overlay2 caps at 127 layers; apko adds a top layer on top of budget.
  layer_budget = 125

  base_packages = [
    "bash",
    "binutils",
    "busybox",
    "curl",
    "gettext",
    "git",
    "helm<3.18",
    "jq",
    "kubectl",
    "kustomize",
    "patch",
    "socat",
    "stern",
    "tw",
    "wget",
    "yq",
  ]

  packages = concat(
    local.base_packages,
    var.enable_runtime_packages ? ["apk-tools"] : [],
    var.extra_packages,
  )
}

data "apko_config" "sandbox" {
  count = local.skip_build ? 0 : 1

  config_contents = jsonencode({
    accounts = { run-as = 0 }
    contents = {
      packages = local.packages
    }
    environment = {}
    work-dir    = "/imagetest/work"

    # Origin layering: one layer per source project. Budget of 125 is the
    # practical max (overlay2 caps at 127; apko adds a top layer). Actual
    # layer count is min(distinct_origins, 125) + 1.
    layering = {
      strategy = "origin"
      budget   = local.layer_budget
    }
  })
}

locals {
  cache_key = local.skip_build ? "" : sha256(jsonencode(data.apko_config.sandbox[0].config))
}

data "external" "cache_lookup" {
  count   = local.skip_build ? 0 : 1
  program = ["sh", "-c", "art cache get || echo '{\"image_ref\": \"\"}'"]
  query = {
    cache_key  = local.cache_key
    repository = var.target_repository
  }
}

locals {
  cached_ref  = local.skip_build ? "" : try(data.external.cache_lookup[0].result.image_ref, "")
  needs_build = !local.skip_build && local.cached_ref == ""
}

resource "apko_build" "sandbox" {
  count  = local.needs_build ? 1 : 0
  repo   = var.target_repository
  config = data.apko_config.sandbox[0].config
}

resource "null_resource" "cache_record" {
  count      = local.needs_build ? 1 : 0
  depends_on = [apko_build.sandbox]

  provisioner "local-exec" {
    command = <<-EOF
      echo '{"cache_key": "${local.cache_key}", "image_ref": "${apko_build.sandbox[0].image_ref}"}' | art cache put || true
    EOF
  }
}

output "image_ref" {
  value = local.skip_build ? "" : (local.needs_build ? apko_build.sandbox[0].image_ref : local.cached_ref)
}
