variable "config" {
}

variable "replacements" {
  type = map(string)
}

locals {
  replaced = merge(var.config,
    {
      contents = {
        packages = [
          for pkg in var.config.contents.packages : lookup(var.replacements, pkg, pkg)
        ]
      }
    },
  )
}

output "config" {
  value = local.replaced
}
