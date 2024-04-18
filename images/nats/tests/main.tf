terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "namespace" {
  default = "nats"
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "nats"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "nats"
  namespace = var.namespace
  repo      = "https://nats-io.github.io/k8s/helm/charts/"
  chart     = "nats"

  values = {

  }
}

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Test a basic installation of nats"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Tickle it"
      cmd  = <<EOF
apk add nats

kubectl exec -it deployment/nats-box -n ${var.namespace} -- nats pub test hi
      EOF
    },
    {
      name  = "Check port-forwards"
      cmd   = <<EOF
kubectl port-forward svc/nats -n ${var.namespace} 4222 &
until nats server check connection -s localhost:4222; do sleep 1; done
      EOF
      retry = { attempts = 3, delay = "5s" } # port forwards can be flakey
    },
    {
      name  = "Check pub/sub"
      cmd   = <<EOF
nats subscribe ">" -s localhost:4222 &
until nats pub hello world -s localhost:4222; do sleep 1; done
      EOF
      retry = { attempts = 3, delay = "5s" } # port forwards can be flakey
    },
  ]

  labels = {
    type = "k8s",
  }
}

