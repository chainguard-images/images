module "versions-istio-cni" {
  package = "istio-cni"
  source  = "../../tflib/versions"
}

module "versions-istio-envoy" {
  package = "istio-envoy"
  source  = "../../tflib/versions"
}

module "versions-istio-operator" {
  package = "istio-operator"
  source  = "../../tflib/versions"
}

module "versions-istio-pilot-agent" {
  package = "istio-pilot-agent"
  source  = "../../tflib/versions"
}

module "versions-istio-pilot-discovery" {
  package = "istio-pilot-discovery"
  source  = "../../tflib/versions"
}
