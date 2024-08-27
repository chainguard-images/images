terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digests to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

resource "random_password" "random" {
  length           = 64
  special          = true
  override_special = "_"
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "logstash-output-opensearch"
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

module "helm_logstash" {
  source = "../../../tflib/imagetest/helm"
  chart  = "logstash"
  repo   = "https://helm.elastic.co"
  name   = "logstash"
  values = {
    image           = local.parsed.registry_repo
    imageTag        = local.parsed.pseudo_tag
    imagePullPolicy = "Always"
    logstashConfig = {
      "logstash.yml" = <<eof
         http.host: 0.0.0.0
       eof
    }
    logstashPipeline = {
      "logstash.conf" = <<eof
         input {
           heartbeat { }
         }

         output {
           opensearch {
             hosts  => ["https://opensearch-cluster-master-headless:9200"]
             user => 'admin'
             password => '${random_password.random.result}'
             ssl_certificate_verification => false
             index => "heartbeats_cg"
             action => "create"
           }
         }
       eof
    }
  }
}

module "helm_opensearch" {
  source       = "../../../tflib/imagetest/helm"
  chart        = "opensearch"
  repo         = "https://opensearch-project.github.io/helm-charts/"
  name         = "opensearch"
  values_files = ["/tests/values/opensearch.values.yaml"]
  values = {
    extraEnvs = [
      {
        name  = "OPENSEARCH_INITIAL_ADMIN_PASSWORD",
        value = random_password.random.result
      },
    ]
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the logstash image."

  steps = [
    {
      name = "Helm install prometheus"
      cmd  = module.helm_opensearch.install_cmd
    },
    {
      name = "Helm install logstash"
      cmd  = module.helm_logstash.install_cmd
    },
    {
      name  = "Query metrics with retry"
      cmd   = <<EOF
        apk add curl
        kubectl port-forward svc/opensearch-cluster-master-headless 9200:9200 &

        until curl -L https://localhost:9200/ -ku 'admin:${random_password.random.result}'; do sleep 1; done

        # Ensure we see logstash metrics
        curl --head --fail https://localhost:9200/heartbeats_cg -ku 'admin:${random_password.random.result}'
      EOF
      retry = { attempts = 10, delay = "10s" }
    },
  ]

  labels = {
    type = "k8s"
  }
}
