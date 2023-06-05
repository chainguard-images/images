variable "config" {
  description = "The resolved apko configuration."
}

variable "package" {
  type        = string
  description = "The name of the package from which to extract version tags."
}

output "tag_list" {
    value = [
    for x in var.config.contents.packages : regexall("(((([a-z0-9]+)(?:[.][a-z0-9]+)?)(?:[.][a-z0-9]+)?)(?:[-][a-z0-9]+)?)", trimprefix(x, "${var.package}=")) if startswith(x, "${var.package}=")
  ][0][0]
}
