# VPCs
output "vpc_gateway_id"          { value = module.vpc_gateway.vpc_id }
output "vpc_backend_id"          { value = module.vpc_backend.vpc_id }
output "vpc_gateway_private_subnets" { value = module.vpc_gateway.private_subnet_ids }
output "vpc_backend_private_subnets" { value = module.vpc_backend.private_subnet_ids }

# Peering
output "vpc_peering_id"     { value = module.vpc_peering.id }
output "vpc_peering_status" { value = module.vpc_peering.status }

# EKS
output "eks_gateway_cluster_name"     { value = module.eks_gateway.cluster_name }
output "eks_backend_cluster_name"     { value = module.eks_backend.cluster_name }
output "eks_gateway_endpoint"         { value = module.eks_gateway.cluster_endpoint }
output "eks_backend_endpoint"         { value = module.eks_backend.cluster_endpoint }
