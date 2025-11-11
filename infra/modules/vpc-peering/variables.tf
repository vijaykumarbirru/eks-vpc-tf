##########################################
# VPC Peering Module Variables
##########################################

variable "requester_vpc_id" {
  description = "VPC ID of the requester (source VPC)"
  type        = string
}

variable "accepter_vpc_id" {
  description = "VPC ID of the accepter (destination VPC)"
  type        = string
}

variable "requester_private_rt_ids" {
  description = "List of private route table IDs for the requester VPC"
  type        = list(string)
}

variable "accepter_private_rt_ids" {
  description = "List of private route table IDs for the accepter VPC"
  type        = list(string)
}

variable "requester_cidr_block" {
  description = "CIDR block of the requester VPC"
  type        = string
}

variable "accepter_cidr_block" {
  description = "CIDR block of the accepter VPC"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the VPC peering connection"
  type        = map(string)
  default     = {}
}
