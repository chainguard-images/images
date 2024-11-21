terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install."
  default = [
    "apache-nifi",
    "apache-nifi-compat",
    "apache-nifi-toolkit"
  ]
}

variable "environment" {
  default = {}
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 1000
  uid    = 1000
  gid    = 1000
  name   = "nonroot"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    environment = merge({
      "LANG" : "en_US.UTF-8",
      "JAVA_HOME" : "/usr/lib/jvm/java-21-openjdk"
      "LANGUAGE" : "en_US:en"
      "LC_ALL" : "en_US.UTF-8"
      "NIFI_BASE_DIR" : "/usr/share/nifi"
      "NIFI_HOME" : "/usr/share/nifi/nifi-current"
      "NIFI_TOOLKIT_HOME" : "/usr/share/nifi/nifi-toolkit-current"
      "NIFI_PID_DIR" : "/usr/share/nifi/nifi-current/run"
      "NIFI_LOG_DIR" : "/usr/share/nifi/nifi-current/logs"
    }, var.environment)
    entrypoint = {
      command = "../scripts/start.sh"
    }
    work-dir = "/usr/share/nifi/nifi-current"
    paths = [{
      path        = "/usr/share/nifi"
      type        = "directory"
      uid         = module.accts.block.run-as
      gid         = module.accts.block.run-as
      permissions = 493 // 0o755 (HCL explicitly does not support octal literals)
      recursive   = true
    }]
    }
  )
}
