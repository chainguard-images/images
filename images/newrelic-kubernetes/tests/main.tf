terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "license_key" {}

variable "digest" {
  description = "The image digests to run tests over."
  type        = string
}

data "oci_string" "ref" {
  input = var.digest
}

resource "random_pet" "suffix" {}

resource "helm_release" "nri-bundle" {
  name             = "newrelic-kubernetes-${random_pet.suffix.id}"
  namespace        = "newrelic-kubernetes-${random_pet.suffix.id}"
  repository       = "https://helm-charts.newrelic.com"
  chart            = "nri-bundle"
  create_namespace = true

  values = [
    jsonencode({
      global = {
        cluster    = "test"
        licenseKey = var.license_key
      }

      newrelic-infrastructure = {
        privileged = true
        kubelet = {
          // We use some extra volume mounts needed when running in a docker-in-docker environment
          extraVolumeMounts = [{
            mountPath = "/var/run/newrelic-infra"
            name      = "var-run-newrelic-infra"
          }]
          extraVolumes = [{
            hostPath = {
              path = "/var/run/newrelic-infra"
            }
            name = "var-run-newrelic-infra"
          }]
        }
        images = {
          integration = {
            registry   = data.oci_string.ref.registry
            repository = data.oci_string.ref.repo
            tag        = data.oci_string.ref.pseudo_tag
          }
        }
      }
      kube-state-metrics = {
        enabled = true
      }

      nri-metadata-injection       = { enabled = false }
      newrelic-pixie               = { enabled = false }
      pixie-chart                  = { enabled = false }
      newrelic-infra-operator      = { enabled = false }
      newrelic-k8s-metrics-adapter = { enabled = false }
    })
  ]
}

data "oci_exec_test" "check-deployment" {
  digest      = var.digest
  script      = "./helm.sh"
  working_dir = path.module
  depends_on  = [helm_release.nri-bundle]

  env = [
    {
      name  = "NAMESPACE"
      value = helm_release.nri-bundle.namespace
    },
    {
      name  = "NAME"
      value = helm_release.nri-bundle.name
    }
  ]
}

module "helm_cleanup" {
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.nri-bundle.id
  namespace  = helm_release.nri-bundle.namespace
  depends_on = [data.oci_exec_test.check-deployment]
}
