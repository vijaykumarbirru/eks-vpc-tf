##########################################
# VPC Peering Module Outputs
##########################################

output "id" {
  description = "The ID of the VPC peering connection"
  value       = aws_vpc_peering_connection.this.id
}

output "status" {
  description = "Current acceptance status of the VPC peering connection (active, pending-acceptance, failed, etc.)"
  value       = try(aws_vpc_peering_connection.this.accept_status, null)
}

output "requester_vpc_id" {
  description = "Requester (source) VPC ID"
  value       = var.requester_vpc_id
}

output "accepter_vpc_id" {
  description = "Accepter (destination) VPC ID"
  value       = var.accepter_vpc_id
}

output "requester_to_accepter_routes" {
  description = "List of route IDs added in requester VPC for accepter"
  value       = [for r in aws_route.requester_to_accepter : r.id]
}

output "accepter_to_requester_routes" {
  description = "List of route IDs added in accepter VPC for requester"
  value       = [for r in aws_route.accepter_to_requester : r.id]
}
