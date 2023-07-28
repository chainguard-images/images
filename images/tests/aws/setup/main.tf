terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.10.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.22.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.10.1"
    }
  }
}

resource "random_pet" "name" {
  length = 2
  prefix = "ekstest"
}

# Write the EKS kubeconfig to a file for ease of use by tests via KUBE_CONFIG_PATH
resource "null_resource" "kubeconfig" {
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name ${module.setup.cluster_name} --kubeconfig ${path.module}/kubeconfig"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "rm -f ${path.module}/kubeconfig"
  }
}

module "setup" {
  source = "../../../../tflib/test-harnesses/aws/eks"
  name   = random_pet.name.id
}

output "name" {
  value = random_pet.name.id
}

output "cluster_name" {
  value = module.setup.cluster_name
}

output "cluster_oidc_provider_arn" {
  value = module.setup.oidc_provider_arn
}

output "vpc_id" {
  value = module.setup.vpc_id
}

output "public_subnets" {
  value = module.setup.public_subnet_ids
}

output "private_subnets" {
  value = module.setup.private_subnet_ids
}
