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

resource "apko_build" "sandbox" {
  count  = local.skip_build ? 0 : 1
  repo   = var.target_repository
  config = data.apko_config.sandbox[0].config
}

output "image_ref" {
  value = local.skip_build ? "" : apko_build.sandbox[0].image_ref
}
