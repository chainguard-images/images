terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "inventory" {}

locals { parsed = provider::oci::parse(var.digest) }


module "helm" {
  source    = "../../../tflib/imagetest/helm"
  name      = "neuvector-core"
  namespace = "neuvector"
  repo      = "https://neuvector.github.io/neuvector-helm"
  chart     = "core"
  values = {
    containerd = {
       enabled:true
      }
    }
}

resource "imagetest_harness_k3s" "k3s" {
  name      = "k3s"
  inventory = data.imagetest_inventory.inventory

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }
}

resource "imagetest_feature" "helm" {
  name        = "helm-test"
  description = "Basic Helm test"
  harness     = imagetest_harness_k3s.k3s

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
     {
      name = "Set image"
      cmd  = <<EOF
kubectl set image -n neuvector deployment/neuvector-controller-pod neuvector-controller-pod="${local.parsed.registry_repo}:${local.parsed.pseudo_tag}"
       EOF
    },
    {
      name  = "Ensure it comes up healthy"
      cmd   = <<EOF
kubectl logs -n neuvector --selector app=neuvector-controller-pod
kubectl rollout status -n neuvector deployment/neuvector-controller-pod --timeout=120s
kubectl wait -n neuvector --for=condition=ready pod --selector app=neuvector-controller-pod
EOF
      retry = { attempts = 3, delay = "2s", factor = 2 }
    },
  ]

  labels = {
    type = "k8s"
  }
}


/*
resource "imagetest_harness_docker" "docker" {
  name      = "docker"
  inventory = data.imagetest_inventory.inventory

  envs = {
    IMAGE_NAME : var.digest
  }
}

resource "imagetest_feature" "test" {
  name    = "docker-test"
  harness = imagetest_harness_docker.docker

  steps = [{
    name = "basic test"
    cmd  = "docker run --rm $IMAGE_NAME version"
  }]
}

// TODO: Run a simple K8s test to verify the image is working.
*/