terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "target_repository" {}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

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

  chart     = "oci://registry-1.docker.io/bitnamicharts/postgresql"
  namespace = "peb"

  values = {
    auth = {
      postgresPassword = "foobear"
      username         = "foobear"
      password         = "foobear"
      database         = "foobear"
    }
    metrics = {
      enabled = true
      image = {
        registry   = local.parsed.registry
        repository = local.parsed.repo
        tag        = local.parsed.pseudo_tag
      }
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
      name = "Test it"
      cmd  = <<EOF
kubectl apply -f - <<YAML
---
apiVersion: batch/v1
kind: Job
metadata:
  name: test
  namespace: peb
spec:
  backoffLimit: 5
  template:
    spec:
      containers:
        - name: test-container
          image: cgr.dev/chainguard/curl:latest-dev
          command: ["sh", "-c", "curl -s http://${module.helm.release_name}-postgresql-metrics.peb.svc.cluster.local:9187/metrics | grep 'pg_'"]
      restartPolicy: Never
YAML

kubectl wait --for=condition=complete -n peb --timeout=5m job/test
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
