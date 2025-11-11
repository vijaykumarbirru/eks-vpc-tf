##########################################
# EKS Module Outputs
##########################################

output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "cluster_arn" {
  description = "ARN of the EKS cluster"
  value       = module.eks.cluster_arn
}

output "cluster_version" {
  description = "EKS Kubernetes version"
  value       = module.eks.cluster_version
}

output "cluster_endpoint" {
  description = "EKS API endpoint"
  value       = module.eks.cluster_endpoint
}

output "oidc_provider_arn" {
  description = "OIDC provider ARN for IRSA"
  value       = module.eks.oidc_provider_arn
}

output "cluster_security_group_id" {
  description = "EKS control plane security group ID"
  value       = module.eks.cluster_security_group_id
}

output "node_security_group_id" {
  description = "Node group security group ID"
  value       = module.eks.node_security_group_id
}

output "eks_managed_node_group_role_arn" {
  description = "IAM role ARN for the default managed node group"
  value       = try(module.eks.eks_managed_node_groups["default"].iam_role_arn, null)
}

output "cluster_certificate_authority_data" {
  description = "Base64-encoded cluster CA data for kubeconfig"
  value       = module.eks.cluster_certificate_authority_data
}

output "kubeconfig" {
  description = "Map of minimal kubeconfig info"
  value = {
    name     = module.eks.cluster_name
    endpoint = module.eks.cluster_endpoint
    ca_data  = module.eks.cluster_certificate_authority_data
  }
}
