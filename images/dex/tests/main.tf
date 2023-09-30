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

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME dex -h"
}

data "oci_exec_test" "run" {
  digest      = var.digest
  script      = "./runs.sh"
  working_dir = path.module
}

resource "helm_release" "dex" {
  name = "dex"

  repository = "https://charts.dexidp.io"
  chart      = "dex"

  namespace        = "dex"
  create_namespace = true

  values = [
    <<EOF
config:
  image:
    tag: ${data.oci_string.ref.pseudo_tag}
    repository: ${data.oci_string.ref.registry_repo}

  issuer: "http://127.0.0.1:5556/dex"

  storage:
    type: memory

  web:
    http: 0.0.0.0:5556

  expiry:
    deviceRequests: "5m"
    signingKeys: "6h"
    idTokens: "24h"
    authRequests: "24h"

  logger:
    level: "info"
    format: "text"

  oauth2:
    responseTypes: [ "code" ]
    skipApprovalScreen: false
    alwaysShowLoginScreen: false

  enablePasswordDB: true

  connectors:
  - type: mockCallback
    id: mock
    name: Example
    EOF
  ]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.dex.id
  namespace = helm_release.dex.namespace
}
