# only for testing purposes`
terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
    }
  }
}

provider "random" {}
resource "random_string" "random" {
  length = 16
}

output "random" {
  value = random_string.random.result
}