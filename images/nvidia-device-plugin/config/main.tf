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
    # Adding these environment variables to keep compatibility with
    # https://github.com/NVIDIA/k8s-device-plugin/blob/993fe2a27c9d85a5b75b451a9d26191ebffc01d7/deployments/container/Dockerfile.ubi8#L55C1-L57C39
    # and
    # https://github.com/NVIDIA/k8s-device-plugin/blob/993fe2a27c9d85a5b75b451a9d26191ebffc01d7/deployments/container/Dockerfile.ubuntu#L55-L57
    environment = {
      "NVIDIA_VISIBLE_DEVICES" : "all",
      "NVIDIA_DRIVER_CAPABILITIES" : "utility",
      "NVIDIA_DISABLE_REQUIRE" : "true",
    }
  })
}
