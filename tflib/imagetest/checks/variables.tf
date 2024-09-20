variable "check_openssl_fips" {
  type        = bool
  description = "Whether to test openssl to be FIPS hardenened"
  default     = false
}

variable "check_openssl_md5" {
  type        = bool
  description = "Whether to test if md5 is supported with openssl CLI"
  default     = false
}

variable "image_ref" {
  type        = string
  description = "The image reference to run checks over"
}

