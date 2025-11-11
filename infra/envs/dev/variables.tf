##########################################
# Root (env) variables
##########################################

variable "region" {
  description = "AWS region"
  type        = string
}

variable "aws_profile" {
  description = "AWS CLI profile name"
  type        = string
}

variable "project" {
  description = "Project tag/prefix"
  type        = string
}

variable "env" {
  description = "Environment name (dev/stage/prod)"
  type        = string
}

variable "azs" {
  description = "Two AZs for subnets"
  type        = list(string)
}

# Gateway VPC
variable "vpc_gateway_cidr" { type = string }
variable "vpc_gateway_private_subnets" { type = list(string) }
variable "vpc_gateway_public_subnets"  { type = list(string) }

# Backend VPC
variable "vpc_backend_cidr" { type = string }
variable "vpc_backend_private_subnets" { type = list(string) }
variable "vpc_backend_public_subnets"  { type = list(string) }

# EKS
variable "k8s_version"         { type = string }
variable "gateway_instance_ty" { type = string }
variable "backend_instance_ty" { type = string }
