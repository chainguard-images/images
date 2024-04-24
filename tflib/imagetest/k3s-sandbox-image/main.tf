terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
    oci  = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {}

data "apko_config" "this" {
  extra_packages = [
    "apk-tools",
    "busybox",
    "bash",
    "curl",
    "helm",
    "k9s",
    "kubectl",
    "kustomize",
  ]
  config_contents = jsonencode({
    accounts = {
      "run-as" : 0
    }
    entrypoint = {
      command = "tail -f /dev/null"
    }
  })
}

resource "apko_build" "this" {
  repo   = var.target_repository
  config = data.apko_config.this.config
}

output "image_ref" {
  value = apko_build.this.image_ref
}
