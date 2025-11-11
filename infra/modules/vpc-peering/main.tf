##########################################
# VPC Peering Connection
##########################################
resource "aws_vpc_peering_connection" "this" {
  vpc_id      = var.requester_vpc_id
  peer_vpc_id = var.accepter_vpc_id
  auto_accept = true
  tags        = merge(var.tags, { Name = "vpc-gateway-to-backend-peering" })
}

##########################################
# Routes from requester to accepter
##########################################
resource "aws_route" "requester_to_accepter" {
  count                     = length(var.requester_private_rt_ids)
  route_table_id            = var.requester_private_rt_ids[count.index]
  destination_cidr_block    = var.accepter_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}

##########################################
# Routes from accepter to requester
##########################################
resource "aws_route" "accepter_to_requester" {
  count                     = length(var.accepter_private_rt_ids)
  route_table_id            = var.accepter_private_rt_ids[count.index]
  destination_cidr_block    = var.requester_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}
