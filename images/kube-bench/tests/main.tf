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

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../tflib/imagetest/harnesses/k3s/"

  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  target_repository = var.target_repository
  cwd               = path.module
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation test"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Install kube-bench"
      cmd  = <<EOF
apk add curl yq

tmp="$(mktemp -d)"

# Retrieve the upstream-recommended job.yaml
job_file="$tmp/job.yaml"
curl -sSL -o "$job_file" 'https://raw.githubusercontent.com/aquasecurity/kube-bench/main/job.yaml'

yq -i ".spec.template.spec.containers[0].image |= \"${var.digest}\"" "$job_file"

kubectl apply -f "$job_file" -n default

kubectl wait --for=condition=complete job.batch/kube-bench -n default --timeout=120s
      EOF
    }
  ]

  labels = {
    type = "k8s"
  }
}
