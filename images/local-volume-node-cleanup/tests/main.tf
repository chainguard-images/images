terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digest to run tests over."
  type = object({
    local-volume-node-cleanup = string
    local-volume-provisioner  = string
  })
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "local-volume-provisioner"
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

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Test a basic installation of the local-static-provisioner"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Deploy the local-static-provisioner"
      cmd  = <<EOF
      kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/sig-storage-local-static-provisioner/master/deployment/kubernetes/example/default_example_storageclass.yaml
      kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/sig-storage-local-static-provisioner/master/deployment/kubernetes/example/default_example_provisioner_generated.yaml
      kubectl set image daemonset/local-volume-provisioner provisioner="${local.parsed["local-volume-provisioner"].registry_repo}:${local.parsed["local-volume-provisioner"].pseudo_tag}"
      EOF
    },
    {
      name = "Ensure it comes up healthy"
      cmd  = <<EOF
      kubectl rollout status daemonset/local-volume-provisioner --timeout=120s
      EOF
    },
    {
      name = "Deploy Node Cleanup Controller"
      cmd  = <<EOF
        kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/sig-storage-local-static-provisioner/master/deployment/kubernetes/example/node-cleanup-controller/rbac.yaml
        kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/sig-storage-local-static-provisioner/master/deployment/kubernetes/example/node-cleanup-controller/deployment.yaml
        kubectl set image deployment/local-volume-node-cleanup-controller local-volume-node-cleanup-controller="${local.parsed["local-volume-node-cleanup"].registry_repo}:${local.parsed["local-volume-node-cleanup"].pseudo_tag}"
        kubectl patch deployment local-volume-node-cleanup-controller --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/args/0", "value":"--storageclass-names=fast-disks"}]'
      EOF
    },
    {
      name = "Ensure it comes up healthy"
      cmd  = <<EOF
        kubectl rollout status deployment/local-volume-node-cleanup-controller --timeout=120s
      EOF
    },
  ]

  labels = {
    type = "k8s",
  }
}

