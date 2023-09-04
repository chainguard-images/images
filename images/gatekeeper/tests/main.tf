terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

resource "helm_release" "gatekeeper" {
  name             = "gatekeeper"
  namespace        = "gatekeeper-system"
  create_namespace = true
  timeout          = 600

  repository = "https://open-policy-agent.github.io/gatekeeper/charts"
  chart      = "gatekeeper"


  values = [
    <<EOF
preInstall:
  crdRepository:
    image:
      repository: openpolicyagent/gatekeeper-crds
      tag: v3.13.0-beta.1
image:
  repository: ${data.oci_string.ref.registry_repo}
  release: ${data.oci_string.ref.pseudo_tag}

validatingWebhookCheckIgnoreFailurePolicy: Ignore
EOF
  ]
}
