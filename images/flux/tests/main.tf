terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "target_repository" {}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    cli                         = string
    helm-controller             = string
    kustomize-controller        = string
    notification-controller     = string
    source-controller           = string
    image-automation-controller = string
    image-reflector-controller  = string
  })
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

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
  description = "Basic installation test for flux"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Render yaml"
      cmd  = <<EOF
apk add flux

tmpdir=$(mktemp -d)

flux install --export >"$tmpdir/flux.yaml"

cat <<EOk >"$tmpdir/kustomization.yaml"
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - flux.yaml
images:
  - name: ghcr.io/fluxcd/source-controller
    newName: ${local.parsed["source-controller"].registry_repo}
    newTag: ${local.parsed["source-controller"].pseudo_tag}
  - name: ghcr.io/fluxcd/kustomize-controller
    newName: ${local.parsed["kustomize-controller"].registry_repo}
    newTag: ${local.parsed["kustomize-controller"].pseudo_tag}
  - name: ghcr.io/fluxcd/helm-controller
    newName: ${local.parsed["helm-controller"].registry_repo}
    newTag: ${local.parsed["helm-controller"].pseudo_tag}
  - name: ghcr.io/fluxcd/notification-controller
    newName: ${local.parsed["notification-controller"].registry_repo}
    newTag: ${local.parsed["notification-controller"].pseudo_tag}
  - name: ghcr.io/fluxcd/image-automation-controller
    newName: ${local.parsed["image-automation-controller"].registry_repo}
    newTag: ${local.parsed["image-automation-controller"].pseudo_tag}
  - name: ghcr.io/fluxcd/image-reflector-controller
    newName: ${local.parsed["image-reflector-controller"].registry_repo}
    newTag: ${local.parsed["image-reflector-controller"].pseudo_tag}
EOk

kubectl apply -k "$tmpdir"
      EOF
    },
    {
      name = "Run tests"
      cmd  = "$WORK/tests.sh"
    },
  ]

  labels = {
    type = "k8s"
  }
}
