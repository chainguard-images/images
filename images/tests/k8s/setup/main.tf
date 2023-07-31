terraform {
  required_providers {
    k3d = {
      source  = "pvotal-tech/k3d"
      version = "0.0.7"
    }
  }
}

provider "k3d" {}

resource "random_pet" "name" {
  length = 2
}

resource "k3d_cluster" "this" {
  name = random_pet.name.id
}

resource "local_sensitive_file" "kubeconfig" {
  filename = "${path.module}/kubeconfig"
  content  = k3d_cluster.this.credentials[0].raw
}
