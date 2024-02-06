variable "name" {
  description = "The name of the helm release. One will be generated if not provided"
  type        = string
  default     = ""

}

variable "namespace" {
  description = "The namespace to install the helm release into."
  type        = string
  default     = "default"
}

variable "chart" {
  description = "The name of the helm chart to install."
  type        = string
}

variable "repo" {
  description = "The helm repo to install the chart from."
  type        = string
  default     = ""
}

variable "chart_version" {
  description = "The version of the helm chart to install. The latest will be used if none is provided."
  type        = string
  default     = ""
}

variable "values" {
  description = "A map of values to pass to the helm chart."
  type        = any
  default     = {}
}

variable "values_file" {
  description = "Path to values file on the local filesystem."
  type        = string
  default     = ""
}

variable "timeout" {
  description = "The timeout on the helm install."
  type        = string
  default     = "5m"
}

locals {
  install_cmd = <<-EOa
apk add helm
helm install ${var.name} ${var.chart} \
  %{if var.namespace != "default"}--namespace ${var.namespace} --create-namespace%{endif} \
  %{if var.repo != ""}--repo ${var.repo}%{endif} \
  %{if var.name == ""}--generate-name%{endif} \
  %{if var.chart_version != ""}--version ${var.chart_version}%{endif} \
  --wait --wait-for-jobs \
  --timeout ${var.timeout} \
  --values <(echo '${jsonencode(var.values)}') \
  --values ${var.values_file}
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
