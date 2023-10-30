terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. nvidia-device-plugin)."
  default     = ["nvidia-device-plugin"]
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 0
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/nvidia-device-plugin"
    }
    environment = {
      "NVIDIA_VISIBLE_DEVICES" : "all",
      "NVIDIA_DRIVER_CAPABILITIES" : "utility",
      "NVIDIA_DISABLE_REQUIRE" : "true",
      "NVIDIA_MIG_MONITOR_DEVICES" : "all",
    }
  })
}
