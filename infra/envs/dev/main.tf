##########################################
# Locals
##########################################
locals {
  eks_gateway_name = "eks-gateway"
  eks_backend_name = "eks-backend"
}

##########################################
# VPC: Gateway
##########################################
module "vpc_gateway" {
  source          = "../../modules/network"
  name            = "vpc-gateway"
  cidr_block      = var.vpc_gateway_cidr
  azs             = var.azs
  public_subnets  = var.vpc_gateway_public_subnets
  private_subnets = var.vpc_gateway_private_subnets
  cluster_name    = local.eks_gateway_name
  enable_single_nat = true

  tags = {
    Project = var.project
    Env     = var.env
    Name    = "vpc-gateway"
    Role    = "public-facing"
  }
}

##########################################
# VPC: Backend
##########################################
module "vpc_backend" {
  source          = "../../modules/network"
  name            = "vpc-backend"
  cidr_block      = var.vpc_backend_cidr
  azs             = var.azs
  public_subnets  = var.vpc_backend_public_subnets
  private_subnets = var.vpc_backend_private_subnets
  cluster_name    = local.eks_backend_name
  enable_single_nat = true

  tags = {
    Project = var.project
    Env     = var.env
    Name    = "vpc-backend"
    Role    = "internal-backend"
  }
}

##########################################
# VPC Peering (private routes)
##########################################
module "vpc_peering" {
  source = "../../modules/vpc-peering"

  requester_vpc_id           = module.vpc_gateway.vpc_id
  accepter_vpc_id            = module.vpc_backend.vpc_id
  requester_private_rt_ids   = module.vpc_gateway.private_route_table_ids
  accepter_private_rt_ids    = module.vpc_backend.private_route_table_ids
  requester_cidr_block       = module.vpc_gateway.vpc_cidr_block
  accepter_cidr_block        = module.vpc_backend.vpc_cidr_block

  tags = {
    Project = var.project
    Env     = var.env
  }
}

##########################################
# EKS: Gateway
##########################################
module "eks_gateway" {
  source = "../../modules/eks"

  cluster_name       = local.eks_gateway_name
  cluster_version    = var.k8s_version
  private_subnet_ids = module.vpc_gateway.private_subnet_ids
  vpc_id             = module.vpc_gateway.vpc_id
  instance_type      = var.gateway_instance_ty
  peer_cidrs         = [module.vpc_backend.vpc_cidr_block]

  tags = {
    Project = var.project
    Env     = var.env
    Name    = "eks-gateway"
  }
}

##########################################
# EKS: Backend
##########################################
module "eks_backend" {
  source = "../../modules/eks"

  cluster_name       = local.eks_backend_name
  cluster_version    = var.k8s_version
  private_subnet_ids = module.vpc_backend.private_subnet_ids
  vpc_id             = module.vpc_backend.vpc_id
  instance_type      = var.backend_instance_ty
  peer_cidrs         = [module.vpc_gateway.vpc_cidr_block]

  tags = {
    Project = var.project
    Env     = var.env
    Name    = "eks-backend"
  }
}
