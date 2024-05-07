terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "imagetest_inventory" "this" {}


resource "imagetest_harness_k3s" "this" {
  name      = "fluent-bit-plugin-loki"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ],
  }
}

variable "loki_url" {
  type    = string
  default = "http://loki-gateway.loki.svc.cluster.local/loki/api/v1/push"
}

module "helm-fluent-bit" {
  source = "../../../tflib/imagetest/helm"

  name      = "fluent-bit"
  namespace = "fluent-bit"
  repo      = "https://fluent.github.io/helm-charts"
  chart     = "fluent-bit"

  values = {
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    },
    args = [
      "-e",
      "/fluent-bit/bin/out_grafana_loki.so",
      "--workdir=/fluent-bit/etc",
      "--config=/fluent-bit/etc/conf/fluent-bit.conf"
    ],
    env = [{
      name  = "FLUENT_LOKI_URL",
      value = var.loki_url
    }],
    daemonSetVolumes = [
      {
        name = "varlog",
        hostPath = {
          path = "/var/log"
        }
      },
      {
        name = "varlibdockercontainers",
        hostPath = {
          path = "/var/lib/docker/containers"
        }
      }
    ],
    daemonSetVolumeMounts = [
      {
        name      = "varlog",
        mountPath = "/var/log"
      },
      {
        name      = "varlibdockercontainers",
        mountPath = "/var/lib/docker/containers",
        readOnly  = true
      }
    ],
    config = {
      inputs  = "[INPUT]\n    Name tail\n    Tag kube.*\n    Path /var/log/containers/*.log\n    multiline.parser docker, cri\n    Mem_Buf_Limit 5MB\n    Skip_Long_Lines On\n",
      outputs = "[Output]\n    Name grafana-loki\n    Match kube.*\n    Url ${var.loki_url}\n    Labels {job=\"fluent-bit\"}\n    LabelKeys level,app\n    BatchWait 1\n    BatchSize 1001024\n    LineFormat json\n    LogLevel info\n    AutoKubernetesLabels true\n"
    },
    podSecurityContext = {
      fsGroup = 2000
    },
    securityContext = {
      allowPrivilegeEscalation = false,
      readOnlyRootFilesystem   = false,
      runAsUser                = 0,
      capabilities = {
        drop = ["ALL"],
        add  = ["DAC_READ_SEARCH"]
      }
    }
  }
}

module "helm-loki" {
  source = "../../../tflib/imagetest/helm"

  name      = "loki"
  namespace = "loki"
  repo      = "https://grafana.github.io/helm-charts"
  chart     = "loki"
  values = {
    deploymentMode = "SingleBinary",
    loki = {
      auth_enabled = false,
      commonConfig = {
        ring = {
          instance_addr = "127.0.0.1",
          kvstore = {
            store = "inmemory"
          }
        },
        replication_factor = 1,
        path_prefix        = "/tmp/loki"
      },
      storage = {
        type = "filesystem"
      },
      schemaConfig = {
        configs = [
          {
            from  = "2024-01-01",
            store = "tsdb",
            index = {
              prefix = "loki_index_",
              period = "24h"
            },
            object_store = "filesystem",
            schema       = "v13"
          }
        ]
      },
      storage_config = {
        filesystem = {
          directory = "/tmp/loki/chunks"
        }
      }
    },
    singleBinary = {
      replicas = 1
    },
    read = {
      replicas = 0
    },
    backend = {
      replicas = 0
    },
    write = {
      replicas = 0
    },
    chunksCache = {
      enabled = false
    },
    resultsCache = {
      enabled = false
    }
  }
}


resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "basic"
  description = "Functionality test for fluent-bit-plugin-loki installed in a Kubernetes cluster"

  steps = [
    {
      name = "Install loki"
      cmd  = module.helm-loki.install_cmd
    },

    {
      name = "Install fluent-bit"
      cmd  = module.helm-fluent-bit.install_cmd
    },
    {
      name    = "Query loki for fluent-bit logs"
      workdir = "/tests"
      cmd     = <<EOF
        ./query_logs.sh
      EOF
    }
  ]

  labels = {
    type = "k8s",
  }
}
