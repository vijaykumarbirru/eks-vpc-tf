output "vpc_gateway_id" {
  value = module.vpc_gateway.vpc_id
}

output "vpc_backend_id" {
  value = module.vpc_backend.vpc_id
}

output "peering_connection_id" {
  value = module.vpc_peering.peering_connection_id
}

output "gateway_sg_id" {
  value = module.security_groups.gateway_sg_id
}

output "backend_sg_id" {
  value = module.security_groups.backend_sg_id
}

output "eks_gateway_cluster_name" {
  value = module.eks_gateway.cluster_name
}

output "eks_gateway_cluster_endpoint" {
  value = module.eks_gateway.cluster_endpoint
}

output "eks_backend_cluster_name" {
  value = module.eks_backend.cluster_name
}

output "eks_backend_cluster_endpoint" {
  value = module.eks_backend.cluster_endpoint
}

# Optional: Uncomment if using Transit Gateway
# output "transit_gateway_id" {
#   value = module.transit_gateway.transit_gateway_id
# }