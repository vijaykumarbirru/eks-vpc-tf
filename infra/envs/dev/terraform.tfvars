# Provider
region      = "us-east-1"
aws_profile = "default"

# Tags
project = "comerapay"
env     = "dev"

# AZs (two)
azs = ["us-east-1a", "us-east-1b"]

# Gateway VPC
vpc_gateway_cidr            = "10.10.0.0/16"
vpc_gateway_private_subnets = ["10.10.1.0/24", "10.10.2.0/24"]
vpc_gateway_public_subnets  = ["10.10.101.0/24", "10.10.102.0/24"]

# Backend VPC
vpc_backend_cidr            = "10.20.0.0/16"
vpc_backend_private_subnets = ["10.20.1.0/24", "10.20.2.0/24"]
vpc_backend_public_subnets  = ["10.20.101.0/24", "10.20.102.0/24"]

# EKS
k8s_version         = "1.32"
gateway_instance_ty = "t3.micro"
backend_instance_ty = "t3.micro"
