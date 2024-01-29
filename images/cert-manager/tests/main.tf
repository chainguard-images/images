terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    helm      = { source = "hashicorp/helm" }
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

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

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

module "helm" {
  source = "../../../tflib/imagetest/helm"

  namespace = "cert-manager"
  chart     = "cert-manager"
  repo      = "https://charts.jetstack.io"

  values = {
    installCRDs = true
    image = {
      repository = data.oci_string.ref["controller"].registry_repo
      tag        = data.oci_string.ref["controller"].pseudo_tag
    }
    acmesolver = {
      image = {
        repository = data.oci_string.ref["acmesolver"].registry_repo
        tag        = data.oci_string.ref["acmesolver"].pseudo_tag
      }
    }
    cainjector = {
      image = {
        repository = data.oci_string.ref["cainjector"].registry_repo
        tag        = data.oci_string.ref["cainjector"].pseudo_tag
      }
    }
    webhook = {
      image = {
        repository = data.oci_string.ref["webhook"].registry_repo
        tag        = data.oci_string.ref["webhook"].pseudo_tag
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
      cmd  = module.helm.install_cmd
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
