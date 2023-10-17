terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

provider "helm" {
  kubernetes {
    config_context = "k3d-cilium-test"
    config_path    = "~/.kube/config"
  }
}

variable "digests" {
  description = "The digests to run tests over."
  type = object({
    operator = string
  })
}

data "oci_exec_test" "operator-version" {
  script = "docker run --rm $IMAGE_NAME --version"
  digest = var.digests.operator
}

data "oci_exec_test" "create-cluster" {
  script = "${path.module}/create-cluster.sh"
  digest = var.digests.operator
}

resource "helm_release" "cilium" {
  depends_on = [data.oci_exec_test.create-cluster]
  repository = "https://helm.cilium.io"
  chart      = "cilium"
  name       = "cilium"
  namespace  = "kube-system"

  values = [jsonencode({
    operator = {
      image = {
        override = var.digests.operator
      }
      replicas = 1
    }
  })]
}

data "oci_exec_test" "wait-for-pods" {
  depends_on = [helm_release.cilium]
  # Due to lack of CNI, all pods in `kube-system` will be in `Pending` state.
  # If they are 'Ready', then our installation is working.
  script = "kubectl --context k3d-cilium-test wait --for condition=Ready -n kube-system pods --all --timeout=300s"
  digest = var.digests.operator
}

data "oci_exec_test" "delete-cluster" {
  depends_on = [data.oci_exec_test.wait-for-pods]
  script     = "k3d cluster delete cilium-test"
  digest     = var.digests.operator
}
