terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "target_repository" {}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    alertmanager    = string
    core            = string
    mysqld-exporter = string
    pushgateway     = string
  })
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../tflib/imagetest/harnesses/k3s/"

  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  target_repository = var.target_repository
  cwd               = path.module
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name  = "prometheus"
  repo  = "https://prometheus-community.github.io/helm-charts"
  chart = "kube-prometheus-stack"

  values = {
    prometheus = {
      prometheusSpec = {
        image = {
          registry   = local.parsed["core"].registry
          repository = local.parsed["core"].repo
          sha        = trimprefix(local.parsed["core"].digest, "sha256:")
        }
      }
    }
    alertmanager = {
      alertmanagerSpec = {
        image = {
          registry   = local.parsed["alertmanager"].registry
          repository = local.parsed["alertmanager"].repo
          sha        = trimprefix(local.parsed["alertmanager"].digest, "sha256:")
        }
      }
    }
    // Test with our kube-state-metrics, even if its not a fresh build.
    kube-state-metrics = {
      image = {
        registry   = "cgr.dev"
        repository = "chainguard/kube-state-metrics"
        tag        = "latest"
      }
    }
  }
}

module "helm_pushgateway" {
  source = "../../../tflib/imagetest/helm"

  name  = "grafana-agent-operator"
  repo  = "https://prometheus-community.github.io/helm-charts"
  chart = "prometheus-pushgateway"

  values = {
    image = {
      registry = local.parsed["pushgateway"].registry_repo
      sha      = trimprefix(local.parsed["pushgateway"].digest, "sha256:")
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Helm Install"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Helm Install prometheus-pushgateway"
      cmd  = module.helm_pushgateway.install_cmd
    }
  ]

  labels = {
    type = "k8s"
  }
}

resource "imagetest_harness_docker" "docker" {
  name      = "docker"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_feature" "image" {
  name        = "image"
  description = "Basic image test"
  harness     = imagetest_harness_docker.docker

  steps = [
    {
      name = "prometheus --version"
      cmd  = "docker run --rm ${var.digests["core"]} --version"
    },
    {
      name = "alertmanager --version"
      cmd  = "docker run --rm ${var.digests["alertmanager"]} --version"
    },
    {
      name = "mysqld-exporter --version"
      cmd  = "docker run --rm ${var.digests["mysqld-exporter"]} --version"
    },
    {
      name = "pushgateway --version"
      cmd  = "docker run --rm ${var.digests["pushgateway"]} --version"
    },
  ]

  labels = {
    type = "container"
  }
}