variable "extra_packages" {
  description = "The additional packages to install"
  type        = list(string)
  default     = []
}

module "accts" {
  source = "../../../tflib/accts"
  uid    = {{ .UserUid }}
  gid    = {{ .GroupGid }}
  run-as = {{ .RunAs }}
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        // TODO: Add any other packages here that are *always* needed.
      ], var.extra_packages)
    }
    //
    accounts = module.accts.block
    entrypoint = {
      command = "{{ .Entrypoint }}"
    }
    // TODO: Add paths, envs, etc., where necessary.
  })
}
