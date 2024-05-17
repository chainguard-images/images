terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install"
  default = [
    "keycloak-operator",
    "keycloak-operator-compat"
  ]
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 1000
  uid    = 1000
  gid    = 1000
  name   = "keycloak"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "java -Djava.util.logging.manager=org.jboss.logmanager.LogManager -jar quarkus-run.jar"
    },
    paths = [{
      path        = "/opt/keycloak"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 511
      recursive   = true
    }]
    work-dir = "/opt/keycloak"
  })
}