variable "digest" {
  description = "The image digest to test."
  type        = string
}

variable "name" {
  description = "The name of the test harness."
  type        = string
}

variable "entrypoint" {
  description = "The non-default entrypoint command to run after breaking BC-FIPS JAR."
  type        = string
  default     = ""
}

variable "entrypoint_args" {
  description = "Optional args to pass to the entrypoint command."
  type        = string
  default     = ""
}

variable "expected_panic_message" {
  description = "The expected panic/error message when BC-FIPS JAR integrity is broken."
  type        = string
  default     = "FIPS"
}

variable "container_name" {
  description = "Optional container name override."
  type        = string
  default     = "bcfips-break-test"
}

variable "bash_sandbox_image" {
  description = "The bash sandbox image to use for testing."
  type        = string
  default     = ""
}

variable "env_vars" {
  description = "Space-separated environment variables to pass to the docker run command (e.g., 'VAR1=value1 VAR2=value2')."
  type        = string
  default     = ""
}
