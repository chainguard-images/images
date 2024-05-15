terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["grafana-mimir"]
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    entrypoint = {
      command = "/usr/bin/grafana-mimir"
    }
  })
}
