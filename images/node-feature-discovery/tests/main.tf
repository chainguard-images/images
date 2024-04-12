terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

resource "random_pet" "suffix" {}

resource "helm_release" "test_helm_deploy" {
  name             = "node-feature-discovery-${random_pet.suffix.id}"
  repository       = "https://kubernetes-sigs.github.io/node-feature-discovery/charts"
  chart            = "node-feature-discovery"
  namespace        = "node-feature-discovery-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  })]
}

data "oci_exec_test" "test_validate_logs_gc" {
  depends_on  = [helm_release.test_helm_deploy]
  digest      = var.digest
  working_dir = path.module
  script      = "./test-pod-logs-gc.sh"

  env {
    name  = "K8S_NAME"
    value = "${helm_release.test_helm_deploy.id}-gc"
  }
  env {
    name  = "K8S_NAMESPACE"
    value = helm_release.test_helm_deploy.namespace
  }

}

data "oci_exec_test" "test_validate_logs_master" {
  depends_on  = [helm_release.test_helm_deploy]
  digest      = var.digest
  working_dir = path.module
  script      = "./test-pod-logs-master.sh"

  env {
    name  = "K8S_NAME"
    value = "${helm_release.test_helm_deploy.id}-master"
  }
  env {
    name  = "K8S_NAMESPACE"
    value = helm_release.test_helm_deploy.namespace
  }

}

data "oci_exec_test" "test_validate_logs_worker" {
  depends_on  = [helm_release.test_helm_deploy]
  digest      = var.digest
  working_dir = path.module
  script      = "./test-pod-logs-worker.sh"

  env {
    name  = "K8S_NAME"
    value = "${helm_release.test_helm_deploy.id}-worker"
  }
  env {
    name  = "K8S_NAMESPACE"
    value = helm_release.test_helm_deploy.namespace
  }

}

data "oci_exec_test" "test_validate_node_labels" {
  depends_on  = [helm_release.test_helm_deploy]
  digest      = var.digest
  working_dir = path.module
  script      = "./test-labels.sh"
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.test_validate_logs_gc, data.oci_exec_test.test_validate_logs_master, data.oci_exec_test.test_validate_logs_worker,data.oci_exec_test.test_validate_node_labels]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.test_helm_deploy.id
  namespace  = helm_release.test_helm_deploy.namespace
}