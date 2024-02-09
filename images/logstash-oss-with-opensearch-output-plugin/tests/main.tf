terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    helm      = { source = "hashicorp/helm" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digests to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "prometheus-logstash-exporter"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }
}

module "helm_logstash" {
  source       = "../../../tflib/imagetest/helm"
  chart        = "logstash"
  repo         = "https://helm.elastic.co"
  name         = "logstash"
  values_files = ["/tests/values/logstash.values.yaml"]
}

module "helm_opensearch" {
  source       = "../../../tflib/imagetest/helm"
  chart        = "opensearch"
  repo         = "https://opensearch-project.github.io/helm-charts/"
  name         = "opensearch"
  values_files = ["/tests/values/opensearch.values.yaml"]
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the logstash image."

  steps = [
    {
      name = "Helm install prometheus"
      cmd  = module.helm_opensearch.install_cmd
    },
    {
      name = "Helm install logstash"
      cmd  = module.helm_logstash.install_cmd
    },
    {
      name  = "Query metrics with retry"
      cmd   = <<EOF
        apk add curl jq
        kubectl port-forward svc/opensearch-cluster-master-headless 9200:9200 &

        until curl -L https://localhost:9200/ -ku admin:admin; do sleep 1; done

        # Ensure we see logstash metrics
        curl --head --fail https://localhost:9200/heartbeats_cg -ku admin:admin
      EOF
      retry = { attempts = 10, delay = "10s" }
    },
  ]

  labels = {
    type = "k8s"
  }
}
