terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["rstudio"]
}

variable "environment" {
  default = {}
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 65532
  uid    = 65532
  gid    = 65532
  name   = "rstudio-server"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    environment = merge({
      "CRAN" : "https://cloud.r-project.org"
      "USER" : "rstudio-server"
      "LANG" : "en_US.UTF-8"
      "LANG_WHICH" : "en"
      "LANG_WHERE" : "US"
      "ENCODING" : "UTF-8"
      "LANGUAGE" : "en_US.UTF-8"
      "LC_CTYPE" : "en_US"
      "TZ" : "UTC"
    })
    entrypoint = {
      command = "/usr/bin/rserver"
    }
    paths = [{
      path        = "/etc/R"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
      }, {
      path        = "/etc/rstudio"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
      }, {
      path        = "/usr/lib/R"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
      }, {
      path        = "/usr/share/doc/R"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
      }, {
      path        = "/var/run/rstudio-server"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
      }, {
      path        = "/var/lib/rstudio-server"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 509
      recursive   = true
    }]
  })
}
