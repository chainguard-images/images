variable "extra_packages" {
  description = "The additional packages to install"
  type        = list(string)
  default     = []
}

module "accts" {
  source = "../../../tflib/accts"
  uid    = 65532
  gid    = 65532
  run-as = 65532
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "py3-docker",
        "docker-cli",
        "scap-security-guide",
      ], var.extra_packages)
    }
    //
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/oscap"
    }
  })
}
