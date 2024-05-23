terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["zookeeper", "zookeeper-bitnami-compat"]
}

variable "environment" {
  default = {}
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 1001
  uid    = 1001
  gid    = 1001
  name   = "zookeeper"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    environment = merge({
      "BITNAMI_APP_NAME" : "zookeeper"
      "LANG" : "en_US.UTF-8"
      "JAVA_HOME" : "/usr/lib/jvm/default-jvm"
      "PATH" : "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/share/java/zookeeper/bin"
    }, var.environment)
    entrypoint = {
      command = "/opt/bitnami/scripts/zookeeper/entrypoint.sh"
    }
    cmd = "/opt/bitnami/scripts/zookeeper/run.sh"
    paths = [{
      path        = "/bitnami"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 493
      recursive   = true
      }, {
      path        = "/opt/bitnami/"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 493
      recursive   = true
      }, {
      path        = "/opt/bitnami/zookeeper/conf"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 493
      recursive   = true
      }, {
      path        = "/opt/bitnami/zookeeper/data"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 493
      recursive   = true
      }, {
      path        = "/opt/bitnami/zookeeper/logs"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 493
      recursive   = true
    }]
  })
}
