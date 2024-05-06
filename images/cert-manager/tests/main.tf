terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    acmesolver = string
    cainjector = string
    controller = string
    webhook    = string
  })
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "cert-manager"
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

module "install" {
  source = "./install"

  values = {
    installCRDs = true
    image = {
      repository = local.parsed["controller"].registry_repo
      tag        = local.parsed["controller"].pseudo_tag
    }
    acmesolver = {
      image = {
        repository = local.parsed["acmesolver"].registry_repo
        tag        = local.parsed["acmesolver"].pseudo_tag
      }
    }
    cainjector = {
      image = {
        repository = local.parsed["cainjector"].registry_repo
        tag        = local.parsed["cainjector"].pseudo_tag
      }
    }
    webhook = {
      image = {
        repository = local.parsed["webhook"].registry_repo
        tag        = local.parsed["webhook"].pseudo_tag
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the cert-manager helm chart."

  steps = [
    {
      name = "Helm install"
      cmd  = module.install.install_cmd
    },
    {
      name = "Ensure it passes cmctl readiness checks"
      cmd  = <<EOF
apk add cmctl
cmctl check api --wait=60s
      EOF
    },
    {
      name = "Create a SelfSigned Issuer"
      cmd  = <<EOF
kubectl apply -f /tests/manifests/issuer.yaml
      EOF
    },
    {
      name = "Create a Certificate"
      cmd  = <<EOF
kubectl apply -f /tests/manifests/certificate.yaml
      EOF
    },
    {
      name = "Check the certificate is valid"
      cmd  = <<EOF
kubectl wait --for=condition=Ready certificate/test -n sandbox --timeout=60s
cmctl status certificate -n sandbox test
cmctl inspect secret -n sandbox test-server-tls
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
