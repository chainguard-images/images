variable "values" {
  type = any

  default = {}
}

variable "tigera_version" {
  default = "3.28.0"
}

module "helm" {
  source = "../../../../tflib/imagetest/helm"

  namespace     = "tigera-operator"
  chart         = "tigera-operator"
  repo          = "https://docs.tigera.io/calico/charts"
  chart_version = var.tigera_version

  values = var.values
}

# Make it easy for the caller to get the version
output "tigera_version" {
  value = var.tigera_version
}

output "install_cmd" {
  value = module.helm.install_cmd
}
