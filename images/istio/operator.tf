module "operator-config" {
  for_each       = module.versions-istio-operator.versions
  source         = "./configs/operator"
  extra_packages = [each.key]
}

module "operator-versioned" {
  for_each = module.versions-istio-operator.versions
  source   = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = "${var.target_repository}-operator"
  config            = module.operator-config[each.key].config
  build-dev         = true
  main_package      = each.value.main
  update-repo       = each.value.is_latest
}

module "operator-tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-things]
  tags       = merge([for v in module.operator-versioned : v.latest_tag_map]...)
}
