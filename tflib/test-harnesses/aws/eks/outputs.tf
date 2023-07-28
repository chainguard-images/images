output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
    value = module.vpc.public_subnets
}

output "private_subnet_ids" {
    value = module.vpc.private_subnets
}

output "cluster_name" {
  value = module.cluster.cluster_name
}

output "cluster_version" {
  value = module.cluster.cluster_version
}

output "oidc_issuer_url" {
  value = module.cluster.cluster_oidc_issuer_url
}

output "oidc_provider_arn" {
  value = module.cluster.oidc_provider_arn
}

output "cluster_endpoint" {
  value = module.cluster.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  value = module.cluster.cluster_certificate_authority_data
}
