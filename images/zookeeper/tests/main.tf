terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

# somehow it didn't work on CI, it just hangs but it works locally
# data "oci_exec_test" "runs" {
#   digest      = var.digest
#   script      = "./02-runs.sh"
#   working_dir = path.module
# }

data "oci_string" "ref" { input = var.digest }

resource "random_pet" "suffix" {}
resource "helm_release" "bitnami" {
  name             = "zookeeper-bitnami-${random_pet.suffix.id}"
  repository       = "oci://registry-1.docker.io/bitnamicharts"
  chart            = "zookeeper"
  namespace        = "zookeeper-bitnami-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
    image = {
      registry   = data.oci_string.ref.registry
      repository = data.oci_string.ref.repo
      digest     = data.oci_string.ref.digest
    }
    command = ["/opt/bitnami/scripts/zookeeper/entrypoint.sh"]
    args    = ["/opt/bitnami/scripts/zookeeper/run.sh"]
  })]
}

module "helm-cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.bitnami.id
  namespace = helm_release.bitnami.namespace
}
