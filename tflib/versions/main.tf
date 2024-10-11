variable "package" {
  description = "The name of the package to get version information for."
}

// Note: unused
variable "eol-grace-months" {
  description = "Length of time to allow EOL versions to be included in versions output. Default set to 1 month."
  default     = 0
}

// Note: unused
variable "variant" {
  default = ""
}

output "versions" {
  value = {
    "${var.package}" = {
      eol       = false
      is_latest = true
      main      = ""
      version   = ""
    }
  }
}

output "ordered_keys" {
  value = ["${var.package}"]
}
