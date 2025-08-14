variable "sandbox_ref" {
  description = "The image digest to use for the test sandbox, this should have at least helm and bash."
}

variable "values" {
  type        = any
  default     = {}
  description = "Use this to specify test related values for the chart. Do not include Chainguard Image values here."
}

variable "cg_values" {
  type        = any
  default     = {}
  description = "Values specified here will be exfiltrated from the test as a json inventory. Use this to define the Minimum Chainguard Values required for the chart."
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

variable "git_ref" {
  description = "The branch or tag to use chart from"
  default     = ""
}

variable "chart" {
  description = "The chart to install. When installing from an oci registry, this is the oci://repo of the chart."
}

variable "chart_version" {
  description = "When specified, will use a non-latest version"
  default     = ""
}

variable "app_version" {
  description = "When specified, will discover the chart version that matches this app version"
  default     = ""
}

variable "wait" {
  default = true
}

variable "timeout" {
  description = "Time to wait for helm install to complete (e.g., '30m', '1h')"
  default     = "5m"
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

variable "pre_install_script" {
  description = "Path to a script to run before helm install. The script should output additional helm values as YAML to stdout."
  default     = ""
}

variable "enforce_registry" {
  default     = false
  description = "When enabled, will enforce all images in var.namespace must be sourced from var.target_repository."
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
      IMAGETEST_HELM_VALUES             = jsonencode(var.values)
      IMAGETEST_HELM_CG_VALUES          = jsonencode(var.cg_values)
      IMAGETEST_HELM_CHART              = var.chart
      IMAGETEST_HELM_CHART_VERSION      = var.chart_version
      IMAGETEST_HELM_APP_VERSION        = var.app_version
      IMAGETEST_HELM_GIT_REPO           = var.git_repo
      IMAGETEST_HELM_GIT_REF            = var.git_ref
      IMAGETEST_HELM_REPO               = var.repo
      IMAGETEST_HELM_PATCHES            = jsonencode(var.patches)
      IMAGETEST_HELM_NAME               = var.name
      IMAGETEST_HELM_NS                 = var.namespace
      IMAGETEST_HELM_WAIT               = var.wait
      IMAGETEST_HELM_TIMEOUT            = var.timeout
      IMAGETEST_HELM_ENFORCE_REGISTRY   = var.enforce_registry
      IMAGETEST_HELM_PRE_INSTALL_SCRIPT = var.pre_install_script
    }
  }
}
