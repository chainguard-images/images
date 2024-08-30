terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["chromium"]
}

variable "environment" {
  default = {}
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 65532
  uid    = 65532
  gid    = 65532
  name   = "chrome"
}

output "config" {
  value = jsonencode({
    archs = ["x86_64"]
    contents = {
      packages = concat([
        "dash-binsh",
        "coreutils",
      ], var.extra_packages)
    }
    accounts = module.accts.block
    environment = merge({
      "CHROMIUM_USER_FLAGS" : "--headless --no-sandbox --disable-gpu"
    })
    entrypoint = {
      command = "/usr/bin/chromium-browser"
    }
    paths = [{
      path        = "/usr/lib/chromium"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
    }]
  })
}
