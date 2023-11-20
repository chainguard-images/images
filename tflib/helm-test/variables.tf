variable "name" {
  type        = string
  description = "Name of the Helm release to create"
}
variable "chart" {
  type        = string
  description = "Helm chart to install"
}
variable "namespace" {
  type        = string
  description = "Namespace to create the Helm release in"
}
variable "repository" {
  type        = string
  description = "Helm repository to install from"
}
variable "values" {
  default     = ""
  description = "Helm values to pass to the chart"
}
variable "flock_key" {
  default     = ""
  description = "If set, limit the execution of this module to a single instance at a time, for the given key"
}
variable "flock_timeout" {
  default     = 10 * 60 // 10 minutes
  description = "If flock_key is set, the maximum amount of time to wait for the lock to be acquired"
}
variable "crd_pattern" {
  default     = ""
  description = "If set, delete any CRDs matching this pattern after testing the chart"
}
variable "test_scripts" {
  default     = []
  description = "List of scripts to run after installing the chart, before tearing down"
}
