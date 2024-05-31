variable "extra_packages" {
  description = "The additional packages to install"
  type        = list(string)
  default     = []
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 0 # This image needs to run as root
}

# data "external" "arch" {
#   program = ["./get_arch.sh"]
# }

# variable "target_arch" {
#   description = "The target architecture"
#   type        = string
#   default     = ""
# }

# locals {
#   arch_map = {
#     "x86_64"  = "amd64"
#     "aarch64" = "arm64"
#   }
#   TARGETARCH = lookup(local.arch_map, data.external.arch.result["arch"], var.target_arch)
# }

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
      # hardcoding it for now
      TARGETARCH                 = "aarch64"
    },
    entrypoint = {
      command = "nvidia-driver init"
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
