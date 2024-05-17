terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digest to run tests over."
  type = object({
    console = string
    rotor   = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "jitsucom-bulker"
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

  name      = "jitsucom-jitsu"
  namespace = "jitsucom-jitsu"
  chart     = "oci://registry-1.docker.io/stafftasticcharts/jitsu"

  values = {
    console = {
      image = {
        repository = data.oci_string.ref["console"].registry_repo
        tag        = data.oci_string.ref["console"].pseudo_tag
      }
    }
    rotor = {
      image = {
        repository = data.oci_string.ref["rotor"].registry_repo
        tag        = data.oci_string.ref["rotor"].pseudo_tag
      }
    }
    tokenGenerator = {
      image = {
        tag = "1.30.0" # Latest is not exist.
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Basic Helm install for jitsucom-jitsu"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Display logs"
      cmd  = <<EOF
      kubectl logs deploy/jitsucom-jitsu-console -n jitsucom-jitsu | grep -i "HEALTHCHECK PASSED - 200"

      kubectl logs deploy/jitsucom-jitsu-rotor -n jitsucom-jitsu | grep -i "Listening on port 3401"
      EOF
    }
  ]

  labels = {
    type = "k8s"
  }
}
