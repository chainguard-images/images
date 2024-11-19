variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  # get all the versions that operator is required for
  versions_supported_by_operator = [for k, v in module.versions-istio-operator.versions : v.version]

  # determine which versions should use the operator
  use_operator = {
    for k, v in module.versions-istio-pilot-agent.versions :
    "${v.version}" => contains(local.versions_supported_by_operator, v.version)
  }
}

module "test-things" {
  source = "./tests"
  # Pick something that is versioned with istio/istio, in this case, istio-operator
  for_each = module.versions-istio-operator.versions

  # Append -operator here (or any of the subcomponents) to ensure we
  # avoid creating a "top level" /istio repo
  target_repository = "${var.target_repository}-operator"

  warn_on_failure = each.value.eol

  use_operator = local.use_operator[each.value.version]

  digests = {
    install-cni = module.install-cni-versioned["istio-cni-${each.value.version}"].image_ref
    pilot       = module.pilot-versioned["istio-pilot-discovery-${each.value.version}"].image_ref
    proxy       = module.proxy-versioned["istio-envoy-${each.value.version}"].image_ref

    # only provide operator image digest if available ; otherwise provide an empty string
    operator = local.use_operator[each.value.version] ? module.operator-versioned["istio-operator-${each.value.version}"].image_ref : ""
  }

  # These charts are versioned to istio/istio, even though the images aren't
  chart_versions = {
    install-cni = each.value.version
    pilot       = each.value.version
    proxy       = each.value.version

    # only provide operator version if available ; otherwise provide an empty string
    operator = local.use_operator[each.value.version] ? each.value.version : ""
  }
}
