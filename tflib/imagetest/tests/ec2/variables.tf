# === Family selection ===

variable "family" {
  description = "The EC2 platform family. Supported: 'ubuntu', 'chainguard'. Each family provides a known AMI and setup configuration."
  type        = string
  default     = "ubuntu"

  validation {
    condition     = contains(["ubuntu", "chainguard"], var.family)
    error_message = "family must be 'ubuntu' or 'chainguard'"
  }
}

variable "custom_ami" {
  description = "Override with a custom AMI ID. When set, family is ignored and no automatic setup is provided."
  type        = string
  default     = ""
}

variable "chainguard_ami" {
  description = "The Chainguard EC2 AMI ID. Required when family='chainguard'. Set via TF_VAR_chainguard_ami."
  type        = string
  default     = ""
}

# === Test configuration (required) ===

variable "name" {
  description = "The name of the test."
  type        = string
  default     = null
}

variable "images" {
  description = "The map of images to test."
  type        = map(string)
}

variable "repo" {
  description = "The repository to push the images to. Should normally be ECR for this driver."
  type        = string
}

variable "tests" {
  description = "The list of tests to run."
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

variable "cwd" {
  description = "Path to current module; added to content for all tests if provided."
  type        = string
  default     = ""
}

variable "timeout" {
  description = "Timeout for the test."
  type        = string
  default     = "15m"
}

# === Instance configuration ===

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.medium"
}

variable "architecture" {
  description = "CPU architecture for AMI selection. Must match the instance type."
  type        = string
  default     = "x86_64"

  validation {
    condition     = contains(["x86_64", "arm64"], var.architecture)
    error_message = "architecture must be 'x86_64' or 'arm64'"
  }
}

variable "gpu" {
  description = "Enable GPU support. For 'ubuntu' family, installs NVIDIA drivers and container toolkit."
  type        = bool
  default     = false
}

variable "root_volume_size" {
  description = "Root volume size in GB."
  type        = number
  default     = 50
}

variable "aws_region" {
  description = "The AWS region to use."
  type        = string
  default     = "us-west-2"
}

variable "vpc_id" {
  description = "The VPC ID to use for EC2 instances."
  type        = string
  # "imagetest-shared" in the imgtest-infra account
  default = "vpc-00747e8b3d73bf716"
}

# === Family overrides (explicit values override family defaults) ===

variable "ssh_user" {
  description = "SSH user for connecting to the instance. If null, uses family default."
  type        = string
  default     = null
}

variable "user_data" {
  description = "Cloud-init user data. If null, uses family default (or none for custom_ami)."
  type        = string
  default     = null
}

variable "setup_commands" {
  description = "Commands to run on the instance before tests. For custom_ami, this is required if setup is needed."
  type        = list(string)
  default     = []
}

# === Pass-through driver configuration ===

variable "volume_mounts" {
  description = "Volume mounts for the test container (format: src:dst)."
  type        = list(string)
  default     = []
}

variable "device_mounts" {
  description = "Device mounts for the test container (format: src:dst)."
  type        = list(string)
  default     = []
}

variable "env" {
  description = "Environment variables for setup commands and container."
  type        = map(string)
  default     = {}
}

variable "instance_profile_name" {
  description = "IAM instance profile name. If not specified, one is created with ECR read-only permissions."
  type        = string
  default     = null
}
