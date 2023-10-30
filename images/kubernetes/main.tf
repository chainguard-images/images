terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  components = {
    "kubectl" : {
      extra_packages = ["kubectl"],
      command        = "/usr/bin/kubectl"
      // TODO: replace last component of target_repository with "kubectl", so it stays at ttl.sh/jason/kubectl
      // TODO: run-as nonroot
      // TODO: cmd=help
    },
    "kubeadm" : {
      extra_packages = ["kubeadm"],
      command        = "/usr/bin/kubeadm"
    },
    "kubelet" : {
      extra_packages = ["kubelet"],
      command        = "/usr/bin/kubelet"
    },
    "kube-scheduler" : {
      extra_packages = ["kube-scheduler"],
      command        = "/usr/bin/kube-scheduler"
    },
    "kube-proxy" : {
      extra_packages = ["kube-proxy"],
      command        = "/usr/bin/kube-proxy"
    },
    "kube-controller-manager" : {
      extra_packages = ["kube-controller-manager"],
      command        = "/usr/bin/kube-controller-manager"
    },
    "kube-apiserver" : {
      extra_packages = ["kube-apiserver"],
      command        = "/usr/bin/kube-apiserver"
    },
    "pause" : {
      extra_packages = ["kubernetes-pause"],
      command        = "/pause" // TODO
    },
  }
}

module "config" {
  for_each       = local.components
  source         = "./config"
  extra_packages = each.value["extra_packages"]
  command        = each.value["command"]
}

module "latest" {
  for_each          = local.components
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = try(each.value["repository"], "${var.target_repository}-${each.key}")
  config            = module.config[each.key].config

  build-dev = true
}

module "test" {
  source  = "./tests"
  digests = { for k, v in module.latest : k => v.image_ref }
}

resource "oci_tag" "latest" {
  for_each   = local.components
  depends_on = [module.test]
  digest_ref = module.latest[each.key].image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  for_each   = local.components
  depends_on = [module.test]
  digest_ref = module.latest[each.key].dev_ref
  tag        = "latest-dev"
}
