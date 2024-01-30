variable "name" {
  default     = ""
  description = "The name of the helm release. One will be generated if not provided"
}

variable "namespace" {
  description = "The namespace to install the helm release into."
}

variable "chart" {
  description = "The name of the helm chart to install."
}

variable "repo" {
  description = "The helm repo to install the chart from."
}

variable "chart_version" {
  default     = ""
  description = "The version of the helm chart to install. The latest will be used if none is provided."
}

variable "values" {
  description = "A map of values to pass to the helm chart."
  type        = any
  default     = {}
}

variable "timeout" {
  description = "The timeout on the helm install."
  default     = "5m"
}

locals {
  install_cmd = <<-EOa
apk add helm
helm install ${var.name} ${var.chart} \
  --namespace ${var.namespace} --create-namespace \
  --repo ${var.repo} \
  --wait --wait-for-jobs \
  --timeout ${var.timeout} \
  %{if var.name == ""}--generate-name%{endif} \
  %{if var.chart_version != ""}--version ${var.chart_version}%{endif} \
  --values <(echo '${jsonencode(var.values)}')
  EOa

  uninstall_cmd = <<-EOb
helm uninstall ${var.name} --namespace ${var.namespace} \
  --wait \
  --timeout ${var.timeout}
  EOb
}

output "install_cmd" {
  value = local.install_cmd
}

output "uninstall_cmd" {
  value = local.uninstall_cmd
}
