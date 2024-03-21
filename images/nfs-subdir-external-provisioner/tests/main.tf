terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "nfs_server" {
  description = "The IP Address of the NFS server"
  default     = "192.168.64.2"
}

variable "nfs_path" {
  description = "The path of the nfs share"
  default     = "/nfs"
}

data "oci_exec_test" "test_help_cmd" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --help"
}

data "oci_string" "ref" {
  input = var.digest
}

resource "random_pet" "suffix" {}

resource "helm_release" "test_helm_deploy" {
  name             = "nfs-subdir-external-provisioner-${random_pet.suffix.id}"
  repository       = "https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/"
  chart            = "nfs-subdir-external-provisioner"
  namespace        = "nfs-subdir-external-provisioner-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    },
    nfs = {
      server = var.nfs_server
      path   = var.nfs_path
    }

  })]
}

data "oci_exec_test" "test_validate_logs" {
  depends_on  = [helm_release.test_helm_deploy]
  digest      = var.digest
  working_dir = path.module
  script      = "./1_test_pod_logs.sh"

  env {
    name  = "K8S_NAME"
    value = helm_release.test_helm_deploy.id
  }
  env {
    name  = "K8S_NAMESPACE"
    value = helm_release.test_helm_deploy.namespace
  }

}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.test_validate_logs]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.test_helm_deploy.id
  namespace  = helm_release.test_helm_deploy.namespace
}