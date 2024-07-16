terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
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

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default = [
    "nvidia-container-toolkit",
    "nvidia-container-toolkit-nvidia-container-runtime",
    "nvidia-container-toolkit-nvidia-container-runtime-cdi",
    "nvidia-container-toolkit-nvidia-container-runtime-hook",
    "nvidia-container-toolkit-nvidia-container-runtime-legacy",
    "nvidia-container-toolkit-nvidia-cdi-hook",
    "nvidia-container-toolkit-nvidia-ctk",
    "nvidia-container-toolkit-containerd",
    "nvidia-container-toolkit-crio",
    "nvidia-container-toolkit-docker",
    "nvidia-container-toolkit-nvidia-toolkit",
    "nvidia-container-toolkit-operator",
    "nvidia-container-toolkit-toolkit",
    "libnvidia-container",
    "nvidia-cuda-cudart-12",
    "nvidia-cuda-nvml-dev-12",
    "bash",
    "busybox",
  ]
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
      PATH                       = "/work:/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/cuda-12.3/",
      CUDA_VERSION               = "12.3",
      LD_LIBRARY_PATH            = "/usr/local/nvidia/lib:/usr/local/nvidia/lib64:/usr/lib/:/usr/lib64:/usr/local/cuda-12.3/include:/usr/local/cuda-12.3/lib:/usr/local/cuda-12.3/lib64:/usr/local/cuda-12.3/lib64/stubs"
      NVIDIA_VISIBLE_DEVICES     = "all"
      NVIDIA_DRIVER_CAPABILITIES = "utility"
      NVIDIA_REQUIRE_CUDA        = "cuda>=11.2 brand=tesla,driver>=418,driver<419 brand=tesla,driver>=440,driver<441 driver>=450"
      NVIDIA_DISABLE_REQUIRE     = "true"
    },
    work-dir = "/work"
    entrypoint = {
      command = "/work/nvidia-toolkit"
    }
    paths = [{
      path        = "/bin"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 493
      recursive   = true
      }, {
      path        = "/run/nvidia"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 493
      recursive   = true
      }, {
      path        = "/host"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 493
      recursive   = true
    }]
    }
  )
}
