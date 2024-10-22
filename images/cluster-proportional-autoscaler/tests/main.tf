terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "target_repository" {}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../tflib/imagetest/harnesses/k3s/"

  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  target_repository = var.target_repository
  cwd               = path.module
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name  = "cpa"
  repo  = "https://kubernetes-sigs.github.io/cluster-proportional-autoscaler"
  chart = "cluster-proportional-autoscaler"
  wait  = true

  values = {
    options = {
      target   = "deployment/nginx-autoscale-example"
      logLevel = 2
    }

    config = {
      linear = {
        coresPerReplica           = 2
        nodesPerReplica           = 1
        min                       = 1
        max                       = 3
        preventSinglePointFailure = true
        includeUnschedulableNodes = true
      }
    }

    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Deploy nginx-autoscale-example"
      cmd  = <<EOF
        kubectl create deployment nginx-autoscale-example --image=cgr.dev/chainguard/nginx --replicas=1
        kubectl wait --for=condition=available deployment/nginx-autoscale-example
      EOF
    },
    {
      name = "Helm Install"
      cmd  = module.helm.install_cmd
    },
    {
      name  = "Check the replica count"
      cmd   = <<EOF
        REPLICAS=$(kubectl get deployment nginx-autoscale-example -o jsonpath='{.spec.replicas}')
        if [ "$REPLICAS" -eq 3 ]; then
          echo "Replica count is 3!"
        else
          echo "Expected replica count is not 3. Actual: $REPLICAS"
          exit 1
        fi
      EOF
      retry = { attempts = 3, delay = "5s", factor = 3 }
    },
    {
      name = "Check expected logs"
      cmd  = <<EOF
        logs_to_expect="
        Scaling Namespace: default, Target: deployment/nginx-autoscale-example
        updating replicas from 1 to 3
        "

        logs=$(kubectl logs deployment/cpa-cluster-proportional-autoscaler)

        echo "$logs_to_expect" | while IFS= read -r log; do
          log=$(echo "$log" | xargs)
          if [ -z "$log" ]; then
            continue
          fi
          if ! echo "$logs" | grep -F -i "$log" > /dev/null; then
            echo "Current logs: $logs"
            echo "Expected log not found: $log"
            exit 1
          fi
        done
      EOF
    },
    {
      name = "Check unexpected logs"
      cmd  = <<EOF
        logs_to_not_expect="
        Update failure
        connection refused
        unable to load
        "

        logs=$(kubectl logs deployment/cpa-cluster-proportional-autoscaler)

        echo "$logs_to_not_expect" | while IFS= read -r log; do
          log=$(echo "$log" | xargs)
          if [ -z "$log" ]; then
            continue
          fi
          if echo "$logs" | grep -F -i "$log"; then
            echo "Current logs: $logs"
            echo "Unexpected log found: $log"
            exit 1
          fi
        done
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
