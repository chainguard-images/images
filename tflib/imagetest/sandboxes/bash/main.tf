terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "target_repository" {}

data "apko_config" "sandbox" {
  config_contents = jsonencode({
    accounts = { run-as = 0 }
    contents = {
      packages = [
        "apk-tools",
        "bash",
        "busybox",
        "curl",
        "git",
        "helm",
        "jq",
        "kubectl",
        "kustomize",
        "patch",
        "socat",
        "wget",
        "yq",
      ]
    }
    environment = {}
    work-dir    = "/imagetest"
  })
}

resource "apko_build" "sandbox" {
  repo   = var.target_repository
  config = data.apko_config.sandbox.config
}

output "image_ref" {
  value = apko_build.sandbox.image_ref
}
