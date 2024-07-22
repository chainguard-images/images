terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "loki_version" {
  default     = ""
  description = "The version of loki to test. Defaults to version 3"
}

data "imagetest_inventory" "this" {
}

resource "imagetest_harness_k3s" "this" {
  inventory = data.imagetest_inventory.this
  name      = "loki"
}

locals {
  loki_major_version = var.loki_version == "" ? "3" : substr(var.loki_version, 0, 1)
  parsed             = provider::oci::parse(var.digest)
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
  chart         = "loki"
  chart_version = local.loki_major_version == "3" ? "" : "5.48.0"
  namespace     = "loki-system"
  repo          = "https://grafana.github.io/helm-charts"
  source        = "../../../tflib/imagetest/helm"
  values        = local.values[local.loki_major_version]
}

resource "imagetest_feature" "basic" {
  description = "Basic functionality of the loki helm chart."
  harness     = imagetest_harness_k3s.this
  labels = {
    type = "k8s"
  }
  name = "Basic"
  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
  ]
}

