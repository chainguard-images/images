variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = []
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "bash",
        "busybox",
        "curl",
      ], var.extra_packages)
    }
    entrypoint = {
      command = "/bin/bash -c"
    }
  })
}
