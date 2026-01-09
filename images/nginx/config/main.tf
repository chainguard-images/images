terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. nginx-mainline)."
  type        = list(string)
  default     = []
}

variable "entrypoint" {
  description = "The entrypoint for the image."
  type        = string
  default     = "/usr/sbin/nginx"
}

variable "command" {
  description = "The command to be run as part of the entrypoint."
  type        = string
  default     = "-c /etc/nginx/nginx.conf -e /dev/stderr -g \"daemon off;\""
}

variable "extra_paths" {
  description = "Extra paths to mount in the image."
  default     = []
}

variable "uid" {
  description = "UID of the user the image should run as."
  type        = number
  default     = 65532
}

variable "gid" {
  description = "UID of the user the image should run as."
  type        = number
  default     = 65532
}

module "accts" {
  source = "../../../../tflib/accts"
  name   = "nginx"
  uid    = var.uid
  gid    = var.gid
}

output "config" {
  value = jsonencode({
    contents = { packages = var.extra_packages }

    accounts = module.accts.block

    paths = concat([
      {
        path        = "/var/lib/nginx"
        type        = "directory"
        uid         = var.uid
        gid         = var.gid
        permissions = 493 // 0755
        recursive   = true
      },
      {
        path = "/var/lib/nginx/tmp"
        uid  = var.uid
        gid  = var.gid
        type = "directory"
        # Wide permissions required for running with tmpfs. Seems to be related to Docker bug https://github.com/moby/moby/issues/40881
        permissions : 511 // 0777
        recursive = true
      },
      {
        path = "/var/run"
        uid  = var.uid
        gid  = var.gid
        type = "directory"
        # Wide permissions required for running with tmpfs. Seems to be related to Docker bug https://github.com/moby/moby/issues/40881
        permissions = 511 // 0777
        recursive   = false
      },
      {
        # The pid path was switched from /var/run/nginx.pid to /run/nginx.pid here
        # https://github.com/wolfi-dev/os/pull/62917
        path        = "/run"
        uid         = var.uid
        gid         = var.gid
        type        = "directory"
        permissions = 511 // 0777
        recursive   = false
      },
    ], var.extra_paths)

    entrypoint = {
      command = var.entrypoint
    }

    cmd = var.command

    stop-signal = "SIGQUIT"
  })
}
