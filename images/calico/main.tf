locals {
  components = toset([
    "calicoctl",
    "node",
    "kube-controllers",
    "cni",
    "csi",
    "typha",
    "pod2daemon",
    "node-driver-registrar"
  ])

  // Normally the package is named like "calico-{component}"
  // But some packages are named differently:
  // - calicoctl             -> calicoctl
  // - calico-csi            -> calico-pod2daemon
  // - calico-typha          -> calico-typhad
  // - node-driver-registrar -> kubernetes-csi-node-driver-registrar
  packages = merge({
    for k, v in local.components : k => "calico-${k}"
    }, {
    "calicoctl" : "calicoctl",
    "csi" : "calico-pod2daemon",
    "typha" : "calico-typhad",
    "node-driver-registrar" : "kubernetes-csi-node-driver-registrar-2.9",
  })

  // Normally the repository is named like "calico-{component}"
  // But some repositories are named differently:
  // - calicoctl  -> calicoctl
  // - pod2daemon -> calico-pod2daemon-flexvol
  repositories = merge({
    for k, v in local.components : k => "${var.target_repository}-${k}"
    }, {
    "calicoctl" : "${var.target_repository}ctl",
    "pod2daemon" : "${var.target_repository}-pod2daemon-flexvol",
  })
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest" {
  for_each = local.components
  source   = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = local.repositories[each.key]
  config            = file("${path.module}/configs/latest.${each.key}.apko.yaml")
}

module "test-latest" {
  source = "./tests"

  digests = { for k, v in module.latest : k => v.image_ref }
}

module "tagger" {
  for_each = local.components
  source   = "../../tflib/tagger"

  depends_on = [module.test-latest]

  tags = { "latest" = module.latest[each.key].image_ref }
}
