terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}


data "oci_string" "ref" {
  input = var.digest
}

resource "random_id" "hex" { byte_length = 4 }

resource "random_integer" "port" {
  min = 9100
  max = 60000
}

resource "helm_release" "kube-prometheus-stack" {
  name       = "prometheus-${random_id.hex.hex}"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"

  namespace        = "prometheus-${random_id.hex.hex}"
  create_namespace = true

  values = [
    jsonencode({
      prometheus-node-exporter = {
        service = {
          port       = random_integer.port.result
          nodePort   = random_integer.port.result
          targetPort = random_integer.port.result
        }
        image = {
          registry   = data.oci_string.ref.registry
          repository = data.oci_string.ref.repo
          digest     = data.oci_string.ref.digest
        }
      }
  })]
}

data "oci_exec_test" "node-runs" {
  depends_on = [helm_release.kube-prometheus-stack]

  digest      = var.digest
  script      = "./node-runs.sh ${random_id.hex.hex}"
  working_dir = path.module
  env = [{
    name  = "PROM_PORT"
    value = random_integer.port.result
  }]
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.node-runs]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.kube-prometheus-stack.id
  namespace  = helm_release.kube-prometheus-stack.namespace
}
