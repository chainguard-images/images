variable "extra_packages" {
  default     = []
  description = "The additional packages to install"
  type        = list(string)
}

module "accts" {
  gid    = 65532
  run-as = 65532
  source = "../../../tflib/accts"
  uid    = 65532
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "py3-docker",
        "docker-cli",
        "scap-security-guide",
        "chainguard-security-guide",
        # oscap-docker hard codes /usr/bin/python3 as the interpreter
        "python3",
      ], var.extra_packages)
    }
    //
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/oscap"
    }
  })
}

