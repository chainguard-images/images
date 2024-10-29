module "cmctl-versions" {
  package = "cert-manager-cmctl"
  source  = "../../tflib/versions"
}

module "cmctl-config" {
  extra_packages = [each.key]
  for_each       = module.versions.versions
  source         = "./config/cmctl"
}

module "cmctl" {
  build-dev         = true
  config            = module.cmctl-config[each.key].config
  eol               = each.value.eol
  for_each          = module.versions.versions
  main_package      = each.value.main
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = "${var.target_repository}-cmctl"
  update-repo       = each.value.is_latest
}

module "cmctl-tagger" {
  depends_on = [module.test]
  source     = "../../tflib/tagger"
  tags       = merge([for v in module.cmctl : v.latest_tag_map]...)
}

