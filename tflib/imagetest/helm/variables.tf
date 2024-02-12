variable "name" {
  description = "The name of the helm release. One will be generated if not provided"
  default     = ""
}

variable "namespace" {
  description = "The namespace to install the helm release into."
  default     = "default"
}

variable "chart" {
  description = "The name of, or path to the helm chart to install."
}

variable "repo" {
  description = "The helm repo to install the chart from. When not specified, a local helm chart will be assumed."
  default     = ""
}

variable "chart_version" {
  description = "The version of the helm chart to install. The latest will be used if none is provided."
  default     = ""
}

variable "values" {
  description = "A map of values to pass to the helm chart."
  type        = any
  default     = {}
}

variable "values_files" {
  description = "Path to values file on the local filesystem."
  type        = list(string)
  default     = []
}

variable "timeout" {
  description = "The timeout on the helm install."
  default     = "5m"
}
