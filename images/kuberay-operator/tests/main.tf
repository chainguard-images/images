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
  source    = "../../../tflib/imagetest/helm"
  name      = "kuberay-operator"
  repo      = "https://ray-project.github.io/kuberay-helm/"
  chart     = "kuberay-operator"
  namespace = "kuberay-system"

  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
  }

  timeout = "5m"
}

module "helm-ray-cluster" {
  source    = "../../../tflib/imagetest/helm"
  name      = "ray-cluster"
  repo      = "https://ray-project.github.io/kuberay-helm/"
  chart     = "ray-cluster"
  namespace = "kuberay-system"

  timeout = "10m"
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Helm Install"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Helm Install RayCluster"
      cmd  = module.helm-ray-cluster.install_cmd
    },
    {
      name = "Let's wait until a RayCluster starts"
      cmd  = <<EOF
      kubectl get pods --selector=ray.io/cluster=ray-cluster-kuberay -n kuberay-system
      kubectl wait --for=condition=Ready pod --selector=ray.io/cluster=ray-cluster-kuberay --timeout 600s -n kuberay-system
EOF
    },
    {
      name = "Execute a Ray job in the head Pod"
      cmd  = <<EOF
      export HEAD_POD=$(kubectl get pods -n kuberay-system --selector=ray.io/node-type=head -o custom-columns=POD:metadata.name --no-headers)
      echo $HEAD_POD

      kubectl exec -n kuberay-system -it $HEAD_POD -- python -c "import ray; ray.init(); print(ray.cluster_resources())"
      sleep 3
      logs=$(kubectl logs --tail=-1 -n kuberay-system $HEAD_POD)

      if echo "$logs" | grep -iq 'Ray runtime started.'; then
        echo "Ray cluster connected successfully."
      else
        echo "Failed to connect to Ray cluster."
        echo "actual logs: $logs"
        exit 1
      fi
EOF
    }
  ]

  labels = {
    type = "k8s"
  }
}
