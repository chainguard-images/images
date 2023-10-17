terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

resource "random_pet" "suffix" {}

resource "helm_release" "bitnami" {
  name       = "prometheus-mongodb-exporter-${random_pet.suffix.id}"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "mongodb"

  namespace        = "prometheus-mongodb-exporter-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
    image = {
      debug = true
    }
    metrics = {
      enabled = true
      image = {
        registry   = data.oci_string.ref.registry
        repository = data.oci_string.ref.repo
        digest     = data.oci_string.ref.digest
      }
    }
  })]

  wait = false
}

// The upstream helm chart does not become ready even using the upstream image.
// In any case, we only care about the metrics container, which should become ready with our image.
// So instead of waiting for the Helm chart to become ready, we only check the metrics container status.
// This won't be ready immediately, but it should be ready within 30 seconds, or else something is wrong.
data "oci_exec_test" "check-metrics-container" {
  depends_on = [helm_release.bitnami]
  digest     = var.digest
  script     = <<EOF
set -e
sleep 30
status=$(kubectl get pods -n prometheus-mongodb-exporter-${random_pet.suffix.id} -ojsonpath="{.items[0].status.containerStatuses[0].ready}")
if [ "$status" == "true" ]; then
  echo "Metrics container ready"
  exit 0
fi

echo "Metrics container not ready after 30 seconds!"
kubectl get pods -n prometheus-mongodb-exporter-${random_pet.suffix.id} -oyaml
EOF
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.check-metrics-container]

  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.bitnami.id
  namespace = helm_release.bitnami.namespace
}
