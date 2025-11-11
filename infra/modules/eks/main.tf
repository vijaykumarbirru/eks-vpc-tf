module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.24"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = var.vpc_id
  subnet_ids      = var.private_subnet_ids

  enable_irsa                              = true
  enable_cluster_creator_admin_permissions = true
  cluster_endpoint_public_access           = false
  cluster_endpoint_private_access          = true

  eks_managed_node_groups = {
    default = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = [var.instance_type]
      min_size       = 1
      max_size       = 4
      desired_size   = 2
      disk_size      = 30
      capacity_type  = "ON_DEMAND"
    }
  }

  # Allow cross-VPC access between clusters
  cluster_security_group_additional_rules = {
    ingress_peer_cidrs_kube = {
      description = "Allow API traffic from peer VPCs"
      protocol    = "tcp"
      from_port   = 443
      to_port     = 443
      cidr_blocks = var.peer_cidrs
      type        = "ingress"
    }
  }

  node_security_group_additional_rules = {
    ingress_nodes_from_peers = {
      description = "Allow app traffic from peer VPCs"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_blocks = var.peer_cidrs
      type        = "ingress"
    }
  }

  tags = var.tags
}
