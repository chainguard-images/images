terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "target_repository" {}

variable "digest" {
  description = "The image digests to run tests over."
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

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation test for kubeflow-centraldashboard"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Test"
      cmd  = <<EOF
tmpdir=$(mktemp -d)

cat <<YAML > $tmpdir/kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
- https://github.com/kubeflow/kubeflow/components/centraldashboard/manifests/base?ref=master
images:
- name: docker.io/kubeflownotebookswg/centraldashboard
  newName: ${local.parsed.registry_repo}
  newTag: ${local.parsed.pseudo_tag}
namespace: kubeflow
YAML

kubectl create namespace kubeflow

kubectl apply -k $tmpdir

kubectl rollout status deployment/centraldashboard -n kubeflow
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
