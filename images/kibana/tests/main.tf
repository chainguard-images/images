terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

locals {
  parsed = provider::oci::parse(var.digest)
}

variable "elasticsearch_version" {
  description = "Version of elasticsearch to test with"
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "eck-operator"
  inventory = data.imagetest_inventory.this

  sandbox = {
    envs = {
      IMAGE : "${var.digest}"
    }
  }
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name = "eck-operator"

  repo  = "https://helm.elastic.co"
  chart = "eck-operator"

  values = {
    image = {
      repository = "cgr.dev/chainguard/eck-operator"
      tag        = "latest"
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Install ECK operator and add Kibana"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Helm install ECK"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Install tools"
      cmd  = "apk add curl jq"
    },
    {
      name = "Wait for elastic-operator sts"
      cmd  = "kubectl rollout status --watch --timeout=60s sts/elastic-operator"
    },
    {
      name = "Add Elasticsearch pod"
      cmd  = <<EOT
        VERSION=$(curl -s https://endoflife.date/api/kibana.json|jq -r ".[] |select(.cycle==\"${var.elasticsearch_version}\") .latest")
        cat <<EOF | kubectl apply -f -
apiVersion: elasticsearch.k8s.elastic.co/v1
kind: Elasticsearch
metadata:
  name: quickstart
spec:
  version: "$VERSION"
  nodeSets:
  - name: default
    count: 1
    config:
      node.store.allow_mmap: false
EOF
EOT
    },
    {
      name = "Add Kibana pod"
      cmd  = <<EOT
        VERSION=$(curl -s https://endoflife.date/api/kibana.json|jq -r ".[] |select(.cycle==\"${var.elasticsearch_version}\") .latest")
        cat <<EOF | kubectl apply -f -
apiVersion: kibana.k8s.elastic.co/v1
kind: Kibana
metadata:
  name: quickstart
spec:
  version: "$VERSION"
  count: 1
  elasticsearchRef:
    name: quickstart
EOF
EOT
    },
    {
      name  = "Scale down kibana deployment"
      cmd   = "kubectl scale --replicas=0 deployment/quickstart-kb"
      retry = { attempts = 3, delay = "5s" }
    },
    {
      name = "Use our Kibana image and scale up"
      cmd  = <<EOF
        kubectl set image deployment/quickstart-kb kibana=$IMAGE
        kubectl scale --replicas=1 deployment/quickstart-kb
      EOF
    },
    {
      name = "Wait for deployment to settle"
      cmd  = "kubectl rollout status --watch --timeout=300s deployment/quickstart-kb"
    },
    {
      name = "Port forward to Kibana"
      cmd  = "kubectl port-forward svc/quickstart-kb-http 5601&"
    },
    {
      name  = "Check Kibana dashboard is enabled via API"
      cmd   = <<EOF
        PASSWORD=$(kubectl get secret quickstart-es-elastic-user -o json |jq -r ".data .elastic" |base64 -d)
        curl -sk https://localhost:5601/api/features -u elastic:$PASSWORD |jq '.[] |select(.id=="dashboard")'        
      EOF
      retry = { attempts = 5, delay = "10s" }
    },
    {
      name  = "Look for active log"
      cmd   = "kubectl logs deployment/quickstart-kb |grep 'Kibana is now available'"
      retry = { attempts = 5, delay = "10s" }
    }
  ]
}
