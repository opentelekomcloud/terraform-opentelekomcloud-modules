/*=================================
OUTPUTS
==================================*/
output "peering_connections" {
  value = opentelekomcloud_vpc_peering_connection_v2.peering-connection
}

output "peering_accepters" {
  value = opentelekomcloud_vpc_peering_connection_accepter_v2.peering-connection-accepter
}
