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

  repo      = "https://rke2-charts.rancher.io"
  chart     = "rke2-multus"
  namespace = "kube-system"

  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }

    config = {
      cni_conf = {
        confDir        = "/var/lib/rancher/k3s/agent/etc/cni/net.d"
        clusterNetwork = "/var/lib/rancher/k3s/agent/etc/cni/net.d/10-flannel.conflist"
        binDir         = "/var/lib/rancher/k3s/data/current/bin/"
        kubeconfig     = "/var/lib/rancher/k3s/agent/etc/cni/net.d/multus.d/multus.kubeconfig"
      }
    }
  }
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
      name = "Apply multus-test-pod using macvlan network interface"
      cmd  = <<EOF
kubectl apply -n multus-test -f $WORK/test-pod.yaml
kubectl wait -n multus-test --for=condition=Ready pod multus-test-pod --timeout=5m
      EOF
    },
    # NOTE: We use nslookup instead of ping because public GHA runners don't
    # allow it.
    # https://github.com/actions/runner-images/issues/1519#issuecomment-683790054
    {
      name  = "Verify test pod network connectivity"
      cmd   = <<EOF
kubectl exec -n multus-test multus-test-pod -- nslookup google.com
      EOF
      retry = { attempts = 5, delay = "10s", factor = 3 }
    }
  ]

  labels = {
    type = "k8s"
  }
}
