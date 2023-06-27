terraform {
  required_providers {
    oci    = { source = "chainguard-dev/oci" }
    random = { source = "hashicorp/random" }
    helm   = { source = "hashicorp/helm" }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $${IMAGE_NAME} dex -h"
}

data "oci_exec_test" "run" {
  digest      = var.digest
  script      = "./runs.sh"
  working_dir = path.module
}

resource "random_pet" "suffix" {}

resource "helm_release" "dex" {
  name = "dex-${random_pet.suffix.id}"

  repository = "https://charts.dexidp.io"
  chart      = "dex"

  namespace        = "dex-${random_pet.suffix.id}"
  create_namespace = true

  values = [
    <<EOF
config:
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

  # Split the digest ref into repository and digest. The helm chart expects a
  # tag, but it just appends it to the repository again, so we just specify a
  # dummy tag and the digest to test.
  set {
    name  = "image.tag"
    value = "unused@${element(split("@", data.oci_exec_test.version.tested_ref), 1)}"
  }
  set {
    name  = "image.repository"
    value = element(split("@", data.oci_exec_test.version.tested_ref), 0)
  }
}
