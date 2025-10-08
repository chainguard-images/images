variable "digest" {
  description = "The image digest to test."
  type        = string
}

variable "name" {
  description = "The name of the test harness."
  type        = string
}

variable "entrypoint" {
  description = "The non-default entrypoint command to run after breaking FIPS config. Note that this requires a shell."
  type        = string
  default     = ""
}

variable "expected_panic_message" {
  description = "The expected panic/error message when FIPS is broken."
  type        = string
  default     = "FIPS"
}

variable "container_name" {
  description = "Optional container name override."
  type        = string
  default     = "fips-break-test"
}

variable "bash_sandbox_image" {
  description = "The bash sandbox image to use for testing."
  type        = string
  default     = ""
}