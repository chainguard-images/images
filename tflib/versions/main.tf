variable "package" {
  description = "The name of the package to get version information for."
}

// Note: unused
variable "eol-grace-months" {
  default = 0
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
    }
  }
}
