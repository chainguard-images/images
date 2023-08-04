terraform {}

variable "name" {}

resource "random_pet" "name" {
  prefix = var.name
  length = 1
}

output "name" {
  value = random_pet.name.id
}
