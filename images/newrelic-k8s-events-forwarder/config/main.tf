terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["newrelic-infrastructure-agent"]
}

module "accts" {
  source = "../../../tflib/accts"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(var.extra_packages, [
        "tini",
        "curl",
      ])
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/sbin/tini --"
    }
    cmd = "/usr/bin/newrelic-infra-service"
    environment = {
      "NRIA_IS_CONTAINERIZED"       = true,
      "NRIA_OVERRIDE_HOST_ROOT"     = "",
      "NRIA_IS_SECURE_FORWARD_ONLY" = true,
      "NRIA_HTTP_SERVER_ENABLED"    = true,
    }
  })
}
