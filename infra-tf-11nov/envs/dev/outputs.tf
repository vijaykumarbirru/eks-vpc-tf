output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS API endpoint"
  value       = module.eks.cluster_endpoint
}

output "vpc_id" {
  description = "VPC ID created for the environment"
  value       = module.network.vpc_id
}

output "private_subnets" {
  description = "Private subnet IDs"
  value       = module.network.private_subnet_ids
}

output "region" {
  description = "AWS region used"
  value       = var.region
}
