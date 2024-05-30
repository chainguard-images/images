terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "loki"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  namespace = "loki-system"
  chart     = "loki"
  repo      = "https://grafana.github.io/helm-charts"

  values = {
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
  }
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
