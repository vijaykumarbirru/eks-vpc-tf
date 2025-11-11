##########################################
# EKS Module Variables
##########################################

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version of the EKS cluster"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for worker nodes"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the managed node group"
  type        = string
}

variable "peer_cidrs" {
  description = "List of peer VPC CIDR blocks allowed for cross-VPC communication"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Map of tags to apply to EKS resources"
  type        = map(string)
  default     = {}
}
