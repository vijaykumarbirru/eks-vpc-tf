###########################################################
# Environment: DEV
# Purpose: Deploy a complete EKS cluster + VPC using modules
###########################################################

######################
# Input Variables
######################
variable "project" {
  type = string
}

variable "env" {
  type = string
}

variable "region" {
  type = string
}

variable "aws_profile" {
  type    = string
  default = null
}

######################
# Network Module
######################
module "network" {
  source = "../../modules/network"

  name            = "${var.project}-${var.env}-vpc"
  cidr            = "10.0.0.0/16"
  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Project = var.project
    Env     = var.env
  }
}

######################
# EKS Cluster Module
######################
module "eks" {
  source = "../../modules/eks"

  cluster_name       = "${var.project}-${var.env}-eks"
  cluster_version    = "1.32"
  vpc_id             = module.network.vpc_id
  private_subnet_ids = module.network.private_subnet_ids
  public_subnet_ids  = module.network.public_subnet_ids
  region             = var.region

  node_desired_size = 2
  node_min_size     = 1
  node_max_size     = 4
  instance_types    = ["c7i-flex.large"]
  disk_size         = 30

  addon_versions = {
    vpc_cni                = "latest"
    kube_proxy             = "latest"
    coredns                = "latest"
    eks_pod_identity_agent = "latest"
  }

  tags = {
    Project = var.project
    Env     = var.env
  }
}

