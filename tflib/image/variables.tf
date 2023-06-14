variable "package_name" {
  description = "The name of the package to build."
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

variable "tag_suffix" {
  description = "The suffix to the tag for this image."
}

variable "extra_repositories" {
  type        = list(string)
  default     = ["https://packages.wolfi.dev/os"]
  description = "The list of additional repositories to append to the apko configuration."
}

variable "extra_keyring" {
  type        = list(string)
  default     = ["https://packages.wolfi.dev/os/wolfi-signing.rsa.pub"]
  description = "The list of additional keyring entries to append to the apko configuration."
}

variable "extra_packages" {
  type        = list(string)
  default     = ["wolfi-baselayout"]
  description = "The list of additional packages to append to the apko configuration."
}

variable "test_file_paths" {
  type = list(string)
  default = []
  description = "The list of paths to files containing image validation tests to run."
}