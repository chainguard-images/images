module "install-cni-config" {
  for_each = module.versions-istio-cni.versions
  source   = "./configs/install-cni"
  extra_packages = [
    each.key,
    "${each.key}-compat",
    replace(each.key, "istio-cni", "istio-install-cni"),             # istio-install-cni-<version>
    "${replace(each.key, "istio-cni", "istio-install-cni")}-compat", # istio-install-cni-<version>-compat
  ]
}

module "install-cni-versioned" {
  for_each = module.versions-istio-cni.versions
  source   = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = "${var.target_repository}-install-cni"
  config            = module.install-cni-config[each.key].config
  build-dev         = true
  main_package      = replace(each.value.main, "istio-cni", "istio-install-cni")
  update-repo       = each.value.is_latest
}

module "install-cni-tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-things]
  tags       = merge([for v in module.install-cni-versioned : v.latest_tag_map]...)
}
