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
    controller            = string
    db-manager            = string
    earlystopping         = string
    file-metricscollector = string
    suggestion-goptuna    = string
    suggestion-hyperband  = string
    suggestion-hyperopt   = string
    suggestion-nas-darts  = string
    suggestion-optuna     = string
    suggestion-pbt        = string
    suggestion-skopt      = string
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
  description = "Basic installation test"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Run tests"
      cmd  = <<-EOF
        TMPDIR="$(mktemp -d)"
        NAMESPACE="kubeflow"

        cat <<YAML > "$TMPDIR/kubeflow-katib.yaml"
---
apiVersion: config.kubeflow.org/v1beta1
kind: KatibConfig
init:
  certGenerator:
    enable: true
  controller:
    webhookPort: 8443
    trialResources:
      - Job.v1.batch
      - TFJob.v1.kubeflow.org
      - PyTorchJob.v1.kubeflow.org
      - MPIJob.v1.kubeflow.org
      - XGBoostJob.v1.kubeflow.org
      - MXJob.v1.kubeflow.org
runtime:
  metricsCollectors:
    - kind: StdOut
      image: ${local.parsed["file-metricscollector"].registry_repo}:${local.parsed["file-metricscollector"].pseudo_tag}
    - kind: File
      image: ${local.parsed["file-metricscollector"].registry_repo}:${local.parsed["file-metricscollector"].pseudo_tag}
    - kind: TensorFlowEvent
      image: docker.io/kubeflowkatib/tfevent-metrics-collector:latest
      resources:
        limits:
          memory: 1Gi
  suggestions:
    - algorithmName: random
      image: ${local.parsed["suggestion-hyperopt"].registry_repo}:${local.parsed["suggestion-hyperopt"].pseudo_tag}
    - algorithmName: tpe
      image: ${local.parsed["suggestion-hyperopt"].registry_repo}:${local.parsed["suggestion-hyperopt"].pseudo_tag}
    - algorithmName: grid
      image: ${local.parsed["suggestion-optuna"].registry_repo}:${local.parsed["suggestion-optuna"].pseudo_tag}
    - algorithmName: hyperband
      image: ${local.parsed["suggestion-hyperband"].registry_repo}:${local.parsed["suggestion-hyperband"].pseudo_tag}
    - algorithmName: bayesianoptimization
      image: ${local.parsed["suggestion-skopt"].registry_repo}:${local.parsed["suggestion-skopt"].pseudo_tag}
    - algorithmName: cmaes
      image: ${local.parsed["suggestion-goptuna"].registry_repo}:${local.parsed["suggestion-goptuna"].pseudo_tag}
    - algorithmName: sobol
      image: ${local.parsed["suggestion-goptuna"].registry_repo}:${local.parsed["suggestion-goptuna"].pseudo_tag}
    - algorithmName: multivariate-tpe
      image: ${local.parsed["suggestion-optuna"].registry_repo}:${local.parsed["suggestion-optuna"].pseudo_tag}
    - algorithmName: enas
      image: docker.io/kubeflowkatib/suggestion-enas:latest
      resources:
        limits:
          memory: 200Mi
    - algorithmName: darts
      image: ${local.parsed["suggestion-nas-darts"].registry_repo}:${local.parsed["suggestion-nas-darts"].pseudo_tag}
    - algorithmName: pbt
      image: ${local.parsed["suggestion-pbt"].registry_repo}:${local.parsed["suggestion-pbt"].pseudo_tag}
      persistentVolumeClaimSpec:
        accessModes:
          - ReadWriteMany
        resources:
          requests:
            storage: 5Gi
  earlyStoppings:
    - algorithmName: medianstop
      image: ${local.parsed["earlystopping"].registry_repo}:${local.parsed["earlystopping"].pseudo_tag}
YAML

        cat <<YAML > "$TMPDIR/kustomization.yaml"
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - github.com/kubeflow/katib.git/manifests/v1beta1/installs/katib-standalone?ref=master
images:
  - name: docker.io/kubeflowkatib/katib-controller
    newName: ${local.parsed["controller"].registry_repo}
    newTag: ${local.parsed["controller"].pseudo_tag}
  - name: docker.io/kubeflowkatib/katib-db-manager
    newName: ${local.parsed["db-manager"].registry_repo}
    newTag: ${local.parsed["db-manager"].pseudo_tag}
namespace: $NAMESPACE
configMapGenerator:
  - name: katib-config
    behavior: replace
    files:
      - katib-config.yaml=kubeflow-katib.yaml
    options:
      disableNameSuffixHash: true
YAML

        kubectl apply -k "$TMPDIR"

        kubectl rollout status -n $NAMESPACE deployment/katib-db-manager --timeout=200s
        kubectl rollout status -n $NAMESPACE deployment/katib-controller --timeout=200s
      EOF
    }
  ]

  labels = {
    type = "k8s"
  }
}
