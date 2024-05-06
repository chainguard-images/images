terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "temporal-server"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
    envs = {
      "IMAGE_REGISTRY_REPO" = local.parsed.registry_repo
      "IMAGE_TAG"           = local.parsed.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the temporal-server helm chart."

  steps = [
    {
      name = "Install Helm CLI"
      cmd  = "apk add helm"
    },
    {
      name = "Install Helm chart"
      cmd  = <<EOF
        /tests/helm.sh
      EOF
    },
    {
      name = "Deploy the admin-tools image to the cluster"
      cmd  = <<EOF
        kubectl apply --filename /tests/admin-tools-pod.yaml
        kubectl wait --for=condition=ready pod --selector run=admin-tools --timeout 5m
      EOF
    },
    {
      name = "Configure the temporal environment"
      cmd  = <<EOF
        kubectl exec admin-tools -- temporal operator namespace create workflow-test
      EOF
    },
    {
      name = "Create a workflow run"
      cmd  = <<EOF
        # This won't do anything because there are no consumers available
        kubectl exec admin-tools -- \
          temporal workflow start \
            --task-queue hello-world \
            --type MyWorkflow \
            --workflow-id 123 \
            --input 456 \
            --namespace workflow-test
      EOF
    },
    {
      name = "Cancel the workflow run"
      cmd  = <<EOF
        # Just cancels the no-op workflow from the previous step
        kubectl exec admin-tools -- \
          temporal workflow cancel \
            --workflow-id 123 \
            --namespace workflow-test
      EOF
    },
    {
      name = "Clean up admin-tools pod"
      cmd  = <<EOF
        kubectl delete --filename /tests/admin-tools-pod.yaml
      EOF
    },
    {
      name = "Uninstall Helm chart"
      cmd  = <<EOF
        helm uninstall temporaltest --namespace temporaltest
      EOF
    }
  ]
}
