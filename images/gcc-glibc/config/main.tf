variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["build-base"]
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["busybox"], var.extra_packages)
    }
    paths = [{
      path        = "/work"
      type        = "directory"
      permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
    }]
    work-dir = "/work"
    entrypoint = {
      command = "/usr/bin/gcc"
    }
    cmd = "--help"
  })
}
