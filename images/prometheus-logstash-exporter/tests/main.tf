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

module "helm_prometheus" {
  source = "../../../tflib/imagetest/helm"

  namespace = "default"
  chart     = "prometheus"
  repo      = "https://prometheus-community.github.io/helm-charts"
  name = "prometheus"

  values = {
    server = {
      global = {
        scrape_interval     = "5s",
        scrape_timeout      = "4s",
        evaluation_interval = "1m",
      }
      persistentVolume = {
        enabled = false
      }
    }
    serverFiles = {
      "prometheus.yml" = {
        scrape_configs = [
          {
            job_name        = "logstash-exporter"
            scrape_interval = "5s"
            scrape_timeout  = "5s"
            metrics_path    = "/metrics"
            scheme          = "http"
            static_configs = [
              {
                targets = ["exporter-logstash-exporter:9198"]
              }
            ]
          }
        ]
      }
    }
    alertmanager             = { enabled = false }
    kube-state-metrics       = { enabled = false }
    prometheus-node-exporter = { enabled = false }
    prometheus-pushgateway   = { enabled = false }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the logstash image."

  steps = [
    {
      name = "Helm install prometheus"
      cmd  = module.helm_prometheus.install_cmd
    },
    {
      name = "Helm install logstash"
      cmd  = <<EOF
        apk add helm
        helm repo add elastic https://helm.elastic.co
        helm upgrade --install logstash elastic/logstash \
            --values /tests/values/logstash.values.yaml \
            --wait \
            --wait-for-jobs
      EOF
    },
    {
      name = "Helm install logstash-exporter"
      cmd  = <<EOF
        apk add git helm
        git clone https://github.com/kuskoman/logstash-exporter.git
        helm upgrade --install exporter ./logstash-exporter/chart \
          --set logstash.urls[0]="http://logstash-logstash-headless:9600" \
          --set logstash.logging.level="debug" \
          --set image.repository="${data.oci_string.ref.registry_repo}" \
          --set image.tag="${data.oci_string.ref.pseudo_tag}" \
          --set image.pullPolicy="Always" \
          --wait \
          --wait-for-jobs
      EOF
    },
    {
      name = "Query metrics"
      cmd  = <<EOF
        apk add kubectl curl jq
        kubectl port-forward svc/prometheus-server 9090:80 & 

        # Wait for api to become available
        until curl http://localhost:9090/api/v1/label/__name__/values; do sleep 1; done

        # Ensure we see logstash metrics
        curl -L http://localhost:9090/api/v1/label/__name__/values | \
            jq -r '.data[]' | grep -E '^logstash_'
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
