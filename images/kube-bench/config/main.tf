variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["kube-bench"]
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 0
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "procps",
        "kube-bench-configs",
      ], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/kube-bench"
    }
    cmd      = "help"
    work-dir = "/etc/kube-bench"
    environment = {
      "PATH" : "/usr/sbin:/sbin:/usr/bin:/bin:/usr/local/mount-from-host/bin"
    }
  })
}

