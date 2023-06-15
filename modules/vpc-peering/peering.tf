/*=================================
RESOURCES
#==================================*/
resource "opentelekomcloud_vpc_peering_connection_v2" "peering-connection" {
  for_each       = var.requester_vpc_peering_settings
  name           = each.key
  peer_vpc_id    = each.value["peer_vpc_id"]
  vpc_id         = each.value["vpc_id"]
  peer_tenant_id = each.value["peer_tenant_id"]
}

resource "opentelekomcloud_vpc_peering_connection_accepter_v2" "peering-connection-accepter" {
  for_each                  = var.accepter_vpc_peering_settings
  vpc_peering_connection_id = each.value["peer_vpc_connection_id"]
  accept                    = each.value["is_accept"]
}
