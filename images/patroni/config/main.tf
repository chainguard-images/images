variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["patroni"]
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(var.extra_packages, [
      ])
    }
    paths = [{
      path : "/work",
      type : "directory",
      permissions = 511 // 0o777 (HCL explicitly does not support octal literals)
    }]
    entrypoint = {
      command = "/usr/bin/patroni"
    }
    cmd = "--help"
  })
}
