terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "name" {
  description = "The name of the test."
  default     = null
}

variable "images" {
  description = "The map of images to test."
  type        = map(string)
}

variable "repo" {
  description = "The repository to push the images to. Should normally be ACR for this driver."
  type        = string
}

variable "cwd" {
  description = "Path to current module ; added to content for all test if provided"
  default     = ""
}

variable "azure_location" {
  description = "The Azure region to use for the tests."
  type        = string
  default     = "eastus"
}

variable "azure_subscription_id" {
  description = "The Azure subscription ID."
  type        = string
  default     = ""
}

variable "azure_resource_group" {
  description = "The Azure resource group name."
  type        = string
}

variable "aks_node_resource_group" {
  description = "The Azure resource group used to hold AKS node resources."
  type        = string
  default     = ""
}

variable "tests" {
  description = "The list of tests to run with the AKS driver."
  type = list(object({
    name  = string
    image = string
    cmd   = string
    content = optional(list(object({
      source = string
      target = optional(string)
    })))
    envs    = optional(map(string), null)
    timeout = optional(string)
  }))
}

variable "attached_acrs" {
  description = "ACR registries exposed to the AKS cluster"
  type = list(object({
    name = string
  }))
}

variable "cluster_identity_associations" {
  description = "ACR registries exposed to the AKS cluster"
  type = list(object({
    identity_name = string
    role_assignments = list(object({
      scope              = string
      role_definition_id = string
    }))
  }))
  default = []
}

variable "pod_identity_associations" {
  description = "Pod workload identity associations"
  type = list(object({
    service_account_name = string
    namespace            = string
    role_assignments = list(object({
      scope              = string
      role_definition_id = string
    }))
  }))
  default = []
}

variable "node_vm_size" {
  description = "The Azure VM size used by the AKS cluster nodes."
  type        = string
  default     = "Standard_D2ds_v4"
}

variable "driver_config" {
  description = "Optional AKS driver configuration. The full supported configuration is documented here: https://registry.terraform.io/providers/chainguard-dev/imagetest/latest/docs/resources/tests#nested-schema-for-driversaks"
  type        = any
  default     = {}
}

variable "timeout" {
  description = "The maximum amount of time to wait for all tests to complete. This includes the time it takes to create and destroy the AKS cluster."
  type        = string
  default     = "30m"
}

locals {
  tests = [for test in var.tests : merge(test, {
    content = concat(test.content != null ? test.content : [],
      var.cwd != "" ? [{ source = var.cwd }] : [],
      [
        {
          source = "${path.module}/../../libs"
          target = "/imagetest/libs"
        }
      ],
    )
  })]
}

resource "imagetest_tests" "aks" {
  name   = var.name
  driver = "aks"

  drivers = {
    aks = merge({
      location                = var.azure_location
      resource_group          = var.azure_resource_group
      attached_acrs           = var.attached_acrs
      subscription_id         = var.azure_subscription_id
      aks_node_resource_group = var.aks_node_resource_group
      cluster_identity_associations = concat(
        # Always grant the kubelet Contributor at subscription scope so it can
        # manage disks and other resources in the dynamically created node RG.
        [{
          identity_name = "kubeletidentity"
          role_assignments = [{
            scope              = "/subscriptions/${var.azure_subscription_id}"
            role_definition_id = "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
          }]
        }],
        var.cluster_identity_associations,
      )
      pod_identity_associations = var.pod_identity_associations
      node_vm_size              = var.node_vm_size
    }, var.driver_config)
  }

  images = var.images
  repo   = var.repo

  tests   = local.tests
  timeout = var.timeout
}
