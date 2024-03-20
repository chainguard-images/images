terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    chains            = string
    cli               = string
    controller        = string
    entrypoint        = string
    events            = string
    nop               = string
    resolvers         = string
    sidecarlogresults = string
    webhook           = string
    workingdirinit    = string
  })
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "tekton"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]

    envs = {
      CHAINS_IMAGE            = var.digests["chains"]
      CLI_IMAGE               = var.digests["cli"]
      CONTROLLER_IMAGE        = var.digests["controller"]
      ENTRYPOINT_IMAGE        = var.digests["entrypoint"]
      EVENTS_IMAGE            = var.digests["events"]
      NOP_IMAGE               = var.digests["nop"]
      RESOLVERS_IMAGE         = var.digests["resolvers"]
      SIDECARLOGRESULTS_IMAGE = var.digests["sidecarlogresults"]
      WEBHOOK_IMAGE           = var.digests["webhook"]
      WORKINGDIRINIT_IMAGE    = var.digests["workingdirinit"]
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the cert-manager helm chart."

  steps = [
    {
      name = "Install Tekton"
      cmd  = "/tests/test.sh"
    },
    {
      name  = "Wait for Tekton"
      cmd   = <<EOF
kubectl wait --for=condition=Ready pods --all -n tekton-pipelines --timeout=300s
kubectl wait --for=condition=Ready pods --all -n tekton-pipelines-resolvers --timeout=300s
kubectl wait --for=condition=Ready pods --all -n tekton-chains --timeout=300s
      EOF
      retry = { attempts = 5, delay = "10s" }
    },
    {
      name = "Run a sample TaskRun"
      cmd  = <<EOF
cat <<EOtask | kubectl create -f -
apiVersion: tekton.dev/v1beta1
kind: TaskRun
metadata:
  name: test-taskrun
spec:
  taskSpec:
    steps:
      - image: cgr.dev/chainguard/busybox
        script: echo "hello world"
EOtask

kubectl wait --for=condition=succeeded taskrun test-taskrun --timeout=120s
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
