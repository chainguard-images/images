terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

# TODO: Convert to imagetest_harness_container when available
data "oci_exec_test" "manifest" {
  digest      = var.digest
  script      = "./02-curl-test.sh"
  working_dir = path.module
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "sqlpad"
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

module "helm" {
  source = "../../../tflib/imagetest/helm"
  chart  = "."
  name   = "sqlpad"
  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
  }
}

# Will work only when we use updated version postgresql 13.2.23 in upstream
# charts https://github.com/sqlpad/sqlpad/blob/master/sqlpad-charts/requirements.yaml#L3
resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the image."

  steps = [
    {
      name = "Helm install"
      cmd  = <<EOF
        apk add helm
        git clone https://github.com/sqlpad/sqlpad.git
        cd ./sqlpad/sqlpad-charts
        helm dependency update
        ${module.helm.install_cmd}
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
