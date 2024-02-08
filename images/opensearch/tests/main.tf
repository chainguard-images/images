terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
    helm      = { source = "hashicorp/helm" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

# data "oci_exec_test" "server" {
#   digest = var.digest
#   script = "${path.module}/server.sh"
# }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "opensearch"
  inventory = data.imagetest_inventory.this
}

module "helm_opensearch" {
  source = "../../../tflib/imagetest/helm"

  namespace = "opensearch"
  chart     = "opensearch"
  repo      = "https://opensearch-project.github.io/helm-charts"

  values = {
    singleNode = true
    majorVersion = "2"
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
    config = {
      "log4j2.properties" = <<-EOT
      status = error

      appender.console.type = Console
      appender.console.name = console
      appender.console.layout.type = PatternLayout
      appender.console.layout.pattern = [%d{ISO8601}][%-5p][%-25c{1.}] [%node_name]%marker %m%n

      rootLogger.level = info
      rootLogger.appenderRef.console.ref = console
      EOT
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the opensearch helm chart."

  steps = [
    {
      name = "Helm install Opensearch"
      cmd  = module.helm_opensearch.install_cmd
    },
  ]

  labels = {
    type = "k8s"
  }
}
