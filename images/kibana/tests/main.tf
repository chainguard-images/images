terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

locals {
  namespace = "kibana"
  parsed    = provider::oci::parse(var.digest)
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "eck-operator"
  inventory = data.imagetest_inventory.this

  sandbox = {
    envs = {
      IMAGE : "${local.parsed.registry_repo}:${local.parsed.pseudo_tag}"
    }
  }
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name = "eck-operator"

  repo  = "https://helm.elastic.co"
  chart = "eck-operator"

  values = {
    image = {
      repository = "cgr.dev/chainguard/eck-operator"
      tag        = "latest"
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Install ECK operator and add Kibana"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Helm install ECK"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Wait for elastic-operator sts"
      cmd  = "kubectl rollout status --watch --timeout=60s sts/elastic-operator"
    },
    {
      name = "Add Elasticsearch pod"
      cmd  = <<EOT
        cat <<EOF | kubectl apply -f -
apiVersion: elasticsearch.k8s.elastic.co/v1
kind: Elasticsearch
metadata:
  name: quickstart
spec:
  version: 8.13.4
  nodeSets:
  - name: default
    count: 1
    config:
      node.store.allow_mmap: false
EOF
EOT
    },
    {
      name = "Add Kibana pod"
      cmd  = <<EOT
        cat <<EOF | kubectl apply -f -
apiVersion: kibana.k8s.elastic.co/v1
kind: Kibana
metadata:
  name: quickstart
spec:
  version: 8.13.4
  count: 1
  elasticsearchRef:
    name: quickstart
EOF
EOT
    },
    {
      name = "Use our Kibana image"
      cmd  = "sleep 5 && kubectl set image deployment/quickstart-kb kibana=$IMAGE"
    },
    {
      name = "Wait for deployment to settle"
      cmd  = "kubectl rollout status --watch --timeout=300s deployment/quickstart-kb"
    },
    {
      name = "Look for active log"
      cmd  = "sleep 30 && kubectl logs deployment/quickstart-kb |grep 'Kibana is now available'"
    }
  ]
}
