terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "target_repository" {}

locals {
  # Skip building sandbox when imagetest tests are being skipped
  skip_build = fileexists("${path.root}/.skip_imagetest")
}

data "apko_config" "sandbox" {
  count = local.skip_build ? 0 : 1

  config_contents = jsonencode({
    accounts = { run-as = 0 }
    contents = {
      packages = [
        "apk-tools",
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
        "tw",
        "wget",
        "yq",
      ]
    }
    environment = {}
    work-dir    = "/imagetest/work"
  })
}

# Build cache for the sandbox image, same pattern as x/cue/tflib/publisher/cache.tf
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
