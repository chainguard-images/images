variable "sandbox_ref" {
  description = "The image digest to use for the test sandbox, this should have at least helm and bash."
}

variable "values" {
  type    = any
  default = {}
}

variable "name" {}

variable "namespace" {
  default = "default"
}

variable "repo" {
  description = "The repository with the chart to install. This is empty (use var.chart) for oci sourced charts."
  default     = ""
}

variable "git_repo" {
  description = "The git repo to clone the chart from."
  default     = ""
}

variable "chart" {
  description = "The chart to install. When installing from an oci registry, this is the oci://repo of the chart."
}

variable "chart_version" {
  description = "When specified, will use a non-latest version"
  default     = ""
}

variable "wait" {
  default = true
}

variable "patches" {
  description = "Paths to patches to apply to the chart. Only used when installing from a git repo."
  default     = []
}

variable "sources" {
  description = "Aditional directories to include in the sandbox source."
  default     = []
  type = list(object({
    source = string
    target = optional(string, null)
  }))
}

output "test" {
  value = {
    name  = "helm install"
    image = var.sandbox_ref
    content = concat(
      [{ source = path.module }],

      # Ensure any additional sources are included
      var.sources,
    )
    cmd = "./helm.sh"
    envs = {
      IMAGETEST_HELM_VALUES        = jsonencode(var.values)
      IMAGETEST_HELM_CHART         = var.chart
      IMAGETEST_HELM_CHART_VERSION = var.chart_version
      IMAGETEST_HELM_GIT_REPO      = var.git_repo
      IMAGETEST_HELM_REPO          = var.repo
      IMAGETEST_HELM_PATCHES       = jsonencode(var.patches)
      IMAGETEST_HELM_NAME          = var.name
      IMAGETEST_HELM_NS            = var.namespace
      IMAGETEST_HELM_WAIT          = var.wait
    }
  }
}
