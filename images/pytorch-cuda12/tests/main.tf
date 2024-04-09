terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "random_pet" "suffix" {}

resource "helm_release" "pytorch" {
  name             = "pytorch-${random_pet.suffix.id}"
  namespace        = "pytorch"
  create_namespace = true
  repository       = "oci://registry-1.docker.io/bitnamicharts"
  chart            = "pytorch"
  timeout          = 600

  values = [jsonencode({
    containerName = "pytorch"
    image = {
      registry   = data.oci_string.ref.registry
      repository = data.oci_string.ref.repo
      digest     = data.oci_string.ref.digest
    }
    containerSecurityContext = {
      runAsUser                = 0
      runAsGroup               = 0
      runAsNonRoot             = false
      allowPrivilegeEscalation = true
      readOnlyRootFilesystem   = false
    }
    resourcesPreset = "none"
    volumePermissions = {
      resourcesPreset = "none"
    }
    persistence = {
      size = "2Gi"
    }
  })]
}

data "oci_exec_test" "helm-install" {
  depends_on = [resource.helm_release.pytorch]
  digest     = var.digest
  script     = "${path.module}/pytorch-helm-install.sh"

  env = [
    {
      name  = "RELEASE_NAME"
      value = helm_release.pytorch.name
    },
    {
      name  = "RELEASE_NAMESPACE"
      value = helm_release.pytorch.namespace
    }
  ]
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.helm-install]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.pytorch.id
  namespace  = helm_release.pytorch.namespace
}
