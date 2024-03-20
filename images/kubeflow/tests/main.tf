terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    jupyter-web-app = string
    volumes-web-app = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "kubeflow"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the kubeflow installation."

  steps = [
    {
      name = "Test",
      cmd = templatefile("${path.module}/test.sh.tpl",
        {
          jupyter_registry_repo = data.oci_string.ref["jupyter-web-app"].registry_repo,
          jupyter_tag           = data.oci_string.ref["jupyter-web-app"].pseudo_tag,
          volumes_registry_repo = data.oci_string.ref["volumes-web-app"].registry_repo,
          volumes_tag           = data.oci_string.ref["volumes-web-app"].pseudo_tag,
        }
      )
    },
    {
      name  = "Wait for Kubeflow to be ready",
      cmd   = "kubectl wait --for=condition=Ready --timeout=300s -n kubeflow --all pods"
      retry = { attempts = 4, delay = "5s", factor = 2 }
    },
  ]

  labels = {
    type = "k8s"
  }
}
