terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    bulker  = string
    ingest  = string
    syncctl = string
  })
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

variable "namespace" {
  default = "jitsucom-bulker"
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "jitsucom-bulker"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
    envs = {
      "K8S_NAMESPACE" = var.namespace
    }
  }
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "jitsucom-bulker"
  namespace = var.namespace
  chart     = "oci://registry-1.docker.io/stafftasticcharts/jitsu"

  values = {
    bulker = {
      image = {
        repository = local.parsed["bulker"].registry_repo
        tag        = local.parsed["bulker"].pseudo_tag
      }
    }
    ingest = {
      image = {
        repository = local.parsed["ingest"].registry_repo
        tag        = local.parsed["ingest"].pseudo_tag
      }
    }
    syncctl = {
      image = {
        repository = local.parsed["syncctl"].registry_repo
        tag        = local.parsed["syncctl"].pseudo_tag
      }
    }
    tokenGenerator = {
      image = {
        tag = "1.30.0" # Latest is not exist.
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Basic Helm install for bank-vaults"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name  = "Test bulker"
      cmd   = <<EOF
 /tests/log-checker.sh "jitsucom-bulker-bulker" "[metrics_server] Starting metrics server|Starting http server|[topic-manager] Created topic: destination-messages"
       EOF
      retry = { attempts = 3, delay = "5s" }
    },
    {
      name  = "Test ingest"
      cmd   = <<EOF
 /tests/log-checker.sh "jitsucom-bulker-ingest" "[metrics_server] Starting metrics server|Starting http server|[router] Data hosts"
       EOF
      retry = { attempts = 3, delay = "5s" }
    },
    {
      name  = "Test syncctl"
      cmd   = <<EOF
 /tests/log-checker.sh "jitsucom-bulker-syncctl" "Starting http server|Generated instance id"
       EOF
      retry = { attempts = 3, delay = "5s" }
    },
  ]

  labels = {
    type = "k8s"
  }
}
