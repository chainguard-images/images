variable "extra_packages" {
  description = "The additional packages to install (e.g. nvidia-device-plugin)."
  default     = ["nvidia-gpu-driver"]
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 0 # This image needs to run as root
}
variable "extra_repositories" {
  description = "The additional repositores to install from (e.g. extras)."
  default     = ["https://packages.cgr.dev/extras"]
}

variable "extra_keyring" {
  description = "The additional keys to use (e.g. extras)."
  default     = ["https://packages.cgr.dev/extras/chainguard-extras.rsa.pub"]
}

output "config" {
  value = jsonencode({
    contents = {
      packages     = concat(var.extra_packages)
      repositories = concat(var.extra_repositories)
      keyring      = concat(var.extra_keyring)
    }
    accounts = module.accts.block
    environment = {
      DRIVER_VERSION             = "550.54.14"
      DRIVER_TYPE                = "passthrough"
      VGPU_LICENSE_SERVER_TYPE   = "NLS"
      DISABLE_VGPU_VERSION_CHECK = "true"
      NVIDIA_VISIBLE_DEVICES     = "void"
      #User will have to set this
      # TARGETARCH                 = "aarch64"
    },
    # Can't use "nvidia-driver init" to configure the driver as given without a host node and helm chart 
    # that mounts all of the expected volumes from the host into the container
    entrypoint = {
      command = "sleep infinity"
    }
    paths = [{
      path        = "/usr/local/bin"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 493
      recursive   = true
      }, {
      path        = "/drivers"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 493
      recursive   = true
    }]
  })
}
