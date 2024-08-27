terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digests to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

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
  chart  = "prometheus"
  repo   = "https://prometheus-community.github.io/helm-charts"
  name   = "prometheus"
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

module "helm_logstash" {
  source       = "../../../tflib/imagetest/helm"
  chart        = "logstash"
  repo         = "https://helm.elastic.co"
  name         = "logstash"
  values_files = ["/tests/values/logstash.values.yaml"]
}

module "helm_logstash_exporter" {
  source = "../../../tflib/imagetest/helm"
  chart  = "./logstash-exporter/chart"
  name   = "exporter"
  values = {
    logstash = {
      urls = [
        "http://logstash-logstash-headless:9600"
      ]
      logging = {
        level = "debug"
      }
    }
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
      pullPolicy = "Always"
    }
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
      cmd  = module.helm_logstash.install_cmd
    },
    # The logstash-exporter project does not have an official helm chart. There
    # was progress on the official prometheus charts repo but that PR has been
    # stale for a while. This developer has taken over development for the
    # logstash-exporter and has included a chart but has not published it yet.
    # There is an issue to publish the chart https://github.com/kuskoman/logstash-exporter/issues/76
    # For now we just need to clone the repo and use the chart
    {
      name = "Helm install logstash-exporter"
      cmd  = <<EOF
        git clone https://github.com/kuskoman/logstash-exporter.git
        ${module.helm_logstash_exporter.install_cmd}
      EOF
    },
    {
      name  = "Query metrics with retry"
      cmd   = <<EOF
        apk add curl jq
        kubectl port-forward svc/prometheus-server 9090:80 &

        until curl -L http://localhost:9090/api/v1/label/__name__/values; do sleep 1; done

        # Ensure we see logstash metrics
        curl -L http://localhost:9090/api/v1/label/__name__/values | \
            jq -r '.data[]' | grep -E '^logstash_'
      EOF
      retry = { attempts = 5, delay = "10s" }
    },
  ]

  labels = {
    type = "k8s"
  }
}
