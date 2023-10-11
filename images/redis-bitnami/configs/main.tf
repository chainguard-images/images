variable "name" {
  description = "Package name (e.g. redis, redis-cluster, redis-sentinel)"
}

variable "extra_packages" {
  description = "The additional packages to install"
  type        = list(string)
  default     = []
}

module "accts" {
  source = "../../../tflib/accts"
  # Match upstream bitnami uid/gid
  uid    = 1001
  gid    = 1001
  run-as = 1001
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "${var.name}-bitnami-compat",
      ], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/opt/bitnami/scripts/${var.name}/entrypoint.sh /opt/bitnami/scripts/${var.name}/run.sh"
    }
    paths = [
      {
        path        = "/opt/bitnami"
        type        = "directory"
        permissions = 0755
        uid         = 1001
        gid         = 1001
      }
    ]
  })
}
