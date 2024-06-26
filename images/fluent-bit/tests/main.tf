terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "command" {
  description = "The command to run in the image."
  type        = string
  default     = "/usr/bin/fluent-bit"
}

variable "args" {
  description = "The arguments to pass to the command."
  type        = list(string)
  default     = ["--workdir=/fluent-bit/etc", "--config=/fluent-bit/etc/conf/fluent-bit.conf"]
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "fluent-bit"
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

  name      = "fluent-bit"
  repo      = "https://fluent.github.io/helm-charts"
  chart     = "fluent-bit"
  namespace = "fluent-bit"

  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }

    daemonSetVolumes = [
      {
        name = "varlog"
        hostPath = {
          path = "/var/log"
        }
      },
      {
        name = "varlibdockercontainers"
        hostPath = {
          path = "/var/lib/docker/containers"
        }
      }
    ]

    daemonSetVolumeMounts = [
      {
        name      = "varlog"
        mountPath = "/var/log"
      },
      {
        name      = "varlibdockercontainers"
        mountPath = "/var/lib/docker/containers"
        readOnly  = true
      }
    ]

    args = var.args

    # the helm chart rewrites the entrypoint to /fluent-bit/bin/fluent-bit so we explicitly set it to the path in our image
    command = ["${var.command}"]

    config = {
      outputs = <<-EOF
      [OUTPUT]
          Name stdout
          Match *
          Format json_lines
      EOF
      inputs  = <<-EOF
      [INPUT]
          Name forward
      EOF
    }
    extraPorts = [
      {
        port          = 24224
        containerPort = 24224
        protocol      = "TCP"
        name          = "tcp"
        nodePort      = 24224
      }
    ]
  }
}

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Basic fluent-bit Helm install test"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name = "wait until fluent-bit is up and running"
      cmd  = <<EOF
        kubectl -n fluent-bit rollout status daemonset/fluent-bit --timeout=120s
      EOF
    },
    {
      name = "check fluent-bit is actually working"
      cmd  = "/tests/check.sh"
    }
  ]

  labels = {
    type = "k8s",
  }
}
