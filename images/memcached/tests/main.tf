terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "k3s" {
  name      = "k3s"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name  = "memcached"
  chart = "oci://registry-1.docker.io/bitnamicharts/memcached"

  values = {
    image = {
      registry   = local.parsed.registry
      repository = local.parsed.repo
      digest     = local.parsed.digest
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Basic helm install test"
  harness     = imagetest_harness_k3s.k3s

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Install netcat"
      cmd  = "apk add --no-cache netcat-openbsd"
    },
    {
      name = "Start port-forward to access Memcached service on localhost"
      cmd  = "kubectl port-forward -n default svc/memcached 11211:11211 & "
    },
    {
      name = "Wait for port-forwarding to establish"
      cmd  = "sleep 5" # Give time for the connection to establish
    },
    {
      name = "Test Memcached functionality using nc with localhost"
      cmd  = <<-EOC
        echo "Testing connection to Memcached at localhost:11211"
        echo -e 'stats\nquit' | nc localhost 11211
      EOC
      assert = {
        success = "STAT pid"
        output_contains = [
          "STAT pid",
          "STAT uptime",
          "STAT version",
          "STAT curr_connections",
          "STAT cmd_get",
          "STAT bytes_read",
          "STAT threads",
          "STAT limit_maxbytes",
        ]
      }
    },
  ]

  labels = {
    type = "k8s"
  }
}
