module "proxy-config" {
  for_each = module.versions-istio-envoy.versions
  source   = "./configs/proxy"
  extra_packages = [
    each.key,
    "${each.key}-compat",

    # istio-pilot-agent-<version> and istio-pilot-agent-<version>-compat
    # get the appropriate key from the istio-pilot-agent version stream
    # where the version matches that of the current istio-envoy
    [for k, v in module.versions-istio-pilot-agent.versions : k if v.version == each.value.version][0],
    [for k, v in module.versions-istio-pilot-agent.versions : "${k}-compat" if v.version == each.value.version][0],
  ]
}

module "proxy-versioned" {
  for_each = module.versions-istio-envoy.versions
  source   = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = "${var.target_repository}-proxy"
  config            = module.proxy-config[each.key].config
  build-dev         = true
  main_package      = each.value.main
  update-repo       = each.value.is_latest
}

module "proxy-tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-things]
  tags       = merge([for v in module.proxy-versioned : v.latest_tag_map]...)
}
