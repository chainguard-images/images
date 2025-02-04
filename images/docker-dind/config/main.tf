module "accts" {
  name   = "root"
  run-as = 0
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

data "apko_config" "docker-package-info" {
  config_contents = jsonencode({
    contents = {
      packages = ["docker"]
    }
  })
}

data "apko_config" "docker-compose-package-info" {
  config_contents = jsonencode({
    contents = {
      packages = ["docker-compose"]
    }
  })
}

data "apko_config" "docker-buildx-package-info" {
  config_contents = jsonencode({
    contents = {
      packages = ["docker-cli-buildx"]
    }
  })
}

locals {
  docker_buildx_full_package_version           = split("=", local.docker_buildx_package_conf)[1]
  docker_buildx_package_conf                   = [for p in data.apko_config.docker-buildx-package-info.config.contents.packages : p if startswith(p, "docker-cli-buildx")][0]
  docker_buildx_package_version_without_epoch  = split("-", local.docker_buildx_full_package_version)[0]
  docker_compose_full_package_version          = split("=", local.docker_compose_package_conf)[1]
  docker_compose_package_conf                  = [for p in data.apko_config.docker-compose-package-info.config.contents.packages : p if startswith(p, "docker-compose")][0]
  docker_compose_package_version_without_epoch = split("-", local.docker_compose_full_package_version)[0]
  docker_full_package_version                  = split("=", local.docker_package_conf)[1]
  docker_package_conf                          = [for p in data.apko_config.docker-package-info.config.contents.packages : p if startswith(p, "docker")][0]
  docker_package_version_without_epoch         = split("-", local.docker_full_package_version)[0]
}

variable "extra_packages" {
  default = [
    "docker-dind",
    "dockerd-oci-entrypoint",
    "docker",
  ]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/dockerd-entrypoint.sh"
    },
    "accounts" : module.accts.block
    "environment" : {
      "DOCKER_VERSION" : "${local.docker_package_version_without_epoch}"
      "DOCKER_BUILDX_VERSION" : "${local.docker_buildx_package_version_without_epoch}"
      "DOCKER_COMPOSE_VERSION" : "${local.docker_compose_package_version_without_epoch}"
      "DOCKER_TLS_CERTDIR" : "/certs"
    }
    "volumes" = ["/var/lib/docker"]
    "paths" : [
      {
        "path" : "/certs/client",
        "type" : "directory",
        "uid"         = module.accts.uid
        "gid"         = module.accts.gid
        "permissions" = 511 // 0o777 (HCL explicitly does not support octal literals)
        "recursive"   = true
      },
      {
        "path" : "/var/lib/docker", // requires for fuse overlayfs
        "type" : "directory",
        "uid"         = module.accts.uid
        "gid"         = module.accts.gid
        "permissions" = 511 // 0o777 (HCL explicitly does not support octal literals)
        "recursive"   = true
      }
    ]
  })
}

