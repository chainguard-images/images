terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
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
