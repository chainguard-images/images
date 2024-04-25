terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "local-volume-provisioner"
  inventory = data.imagetest_inventory.this
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
      kubectl set image daemonset/local-volume-provisioner provisioner="${data.oci_string.ref.registry_repo}:${data.oci_string.ref.pseudo_tag}"
      EOF
    },
    {
      name = "Ensure it comes up healthy"
      cmd  = <<EOF
      kubectl rollout status daemonset/local-volume-provisioner --timeout=120s
      EOF
    }
  ]

  labels = {
    type = "k8s",
  }
}

