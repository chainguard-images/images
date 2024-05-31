terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "loki_version" {
  description = "The version of loki to test. Defaults to version 3"
  default     = ""
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "loki"
  inventory = data.imagetest_inventory.this
}

locals {
  parsed = provider::oci::parse(var.digest)

  // Default to loki version 3 if not specified, otherwise take the first digit
  // TODO(joshrwolf): This will fail if/when we get to double digit loki major versions, but that's 2050 josh's problem.
  loki_major_version = var.loki_version == "" ? "3" : substr(var.loki_version, 0, 1)

  values = {
    // Values for loki version 3.y
    "3" : {
      deploymentMode = "SingleBinary"
      loki = {
        commonConfig = {
          replication_factor = 1
        }
        image = {
          registry   = local.parsed.registry
          repository = local.parsed.repo
          tag        = local.parsed.pseudo_tag
        }
        storage = {
          type = "filesystem"
        }
        schemaConfig = {
          configs = [
            {
              from  = "2024-01-01"
              store = "tsdb"
              index = {
                prefix = "loki_index_"
                period = "24h"
              }
              object_store = "filesystem"
              schema       = "v13"
            }
          ]
        }
      }
      singleBinary = {
        replicas = 1
        persistence = {
          # Disable in favor of a temp emptyDir for testing
          enabled = false
        }
        image = {
          registry   = local.parsed.registry
          repository = local.parsed.repo
          tag        = local.parsed.pseudo_tag
        }
        # Without these extra mounts and the persistence disable, the chart 
        # creates host path mounts that conflict with multiple instances of
        # loki, even across multiple clusters on the same machine. These are
        # added in the chart instead of the image to mimic upstream's behavior.
        extraVolumeMounts = [
          {
            name      = "temp"
            mountPath = "/var/loki"
          }
        ]
        extraVolumes = [
          {
            name     = "temp"
            emptyDir = {}
          }
        ]
      }
      gateway = {
        eanbled = false
      }
      backend = {
        replicas = 0
      }
      read = {
        replicas = 0
      }
      write = {
        replicas = 0
      }
      ingester = {
        replicas = 0
      }
      querier = {
        replicas = 0
      }
      queryFrontend = {
        replicas = 0
      }
      queryScheduler = {
        replicas = 0
      }
      distributor = {
        replicas = 0
      }
      compactor = {
        replicas = 0
      }
      indexGateway = {
        replicas = 0
      }
      bloomCompactor = {
        replicas = 0
      }
      bloomGateway = {
        replicas = 0
      }
    },
    // Values for loki version 2.y
    "2" : {
      loki = {
        commonConfig = {
          replication_factor = 1
        }
        image = {
          registry   = local.parsed.registry
          repository = local.parsed.repo
          tag        = local.parsed.pseudo_tag
        }
        storage = {
          type = "filesystem"
        }
      }
      backend = {
        persistence = {
          size = "1Gi"
        }
      }
      singleBinary = {
        replicas = 1
        persistence = {
          size = "1Gi"
        }
        registry   = local.parsed.registry
        repository = local.parsed.repo
        tag        = local.parsed.pseudo_tag
      }
      write = {
        persistence = {
          size = "1Gi"
        }
      }
    },
  }
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  namespace = "loki-system"
  chart     = "loki"
  repo      = "https://grafana.github.io/helm-charts"

  // Use latest for loki major version 3, otherwise pin to last known state for 2.y
  chart_version = local.loki_major_version == "3" ? "" : "5.48.0"

  values = local.values[local.loki_major_version]
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the loki helm chart."

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
  ]

  labels = {
    type = "k8s"
  }
}
