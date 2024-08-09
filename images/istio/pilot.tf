module "pilot-config" {
  for_each       = module.versions-istio-pilot-discovery.versions
  source         = "./configs/pilot"
  extra_packages = [each.key, "${each.key}-compat"]
}

module "pilot-versioned" {
  for_each = module.versions-istio-pilot-discovery.versions
  source   = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = "${var.target_repository}-pilot"
  config            = module.pilot-config[each.key].config
  build-dev         = true
  main_package      = each.value.main
  update-repo       = each.value.is_latest
}

module "pilot-tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-things]
  tags       = merge([for v in module.pilot-versioned : v.latest_tag_map]...)
}
