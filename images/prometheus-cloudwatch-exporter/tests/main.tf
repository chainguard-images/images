terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "warn_on_failure" {
  description = "Whether to fail or warn if the test fails. Used only for EOL images."
  default     = false
}

variable "extra_testassertlogs" {
  description = "Extra test assert logs"
  type        = list(string)
  default     = []
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "k3s" {
  name      = "cloudwatch-exporter"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name  = "prometheus-cloudwatch-exporter"
  repo  = "https://prometheus-community.github.io/helm-charts"
  chart = "prometheus-cloudwatch-exporter"

  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  name            = "basic"
  description     = "Basic installation test for prometheus-cloudwatch-exporter helm chart"
  harness         = imagetest_harness_k3s.k3s
  warn_on_failure = var.warn_on_failure

  steps = [
    {
      name = "Install prometheus-cloudwatch-exporter"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Check expected logs"
      cmd  = <<EOF
          logs_to_expect="
          org.eclipse.jetty.server.Server doStart
          Started Server
          $(echo "${join("\n", var.extra_testassertlogs)}")
          "

          logs=$(kubectl logs deployment/prometheus-cloudwatch-exporter --all-containers)

          echo "$logs_to_expect" | while IFS= read -r log; do
            log=$(echo "$log" | xargs)
            if [ -z "$log" ]; then
              continue
            fi
            if ! echo "$logs" | grep -F -i "$log" > /dev/null; then
              echo "Current logs: $logs"
              echo "Expected log not found: $log"
              exit 1
            fi
          done
        EOF
    },
    {
      name = "Check unexpected logs"
      cmd  = <<EOF
          logs_to_not_expect="
          connection refused
          unable to load
          ERROR
          FAIL
          FATAL
          Traceback.*most.recent.call
          Exception in thread
          java.lang.NullPointerException
          java.lang.RuntimeException
          "

          logs=$(kubectl logs deployment/prometheus-cloudwatch-exporter --all-containers)

          echo "$logs_to_not_expect" | while IFS= read -r log; do
            log=$(echo "$log" | xargs)
            if [ -z "$log" ]; then
              continue
            fi
            if echo "$logs" | grep -F -i "$log"; then
              echo "Current logs: $logs"
              echo "Unexpected log found: $log"
              exit 1
            fi
          done
      EOF
    }
  ]

  labels = {
    type = "k8s"
  }
}
