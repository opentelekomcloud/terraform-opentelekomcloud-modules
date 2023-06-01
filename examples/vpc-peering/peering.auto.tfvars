/*=================================
PEERING PREPARED MAP
==================================*/

requester_vpc_peering_settings = {
  "REQUESTER_PROJECT_1_TO_ACCEPTER_PROJECT_1" = {
    peer_tenant_id = "5dd3c0b24cdc4d31952c49589182a80d"
    peer_vpc_id    = "a82d8c31-1f1b-4d55-bd45-e01ec3de417c"
    vpc_id         = "REWRITE_IN_LOCALS"
  }
  "REQUESTER_PROJECT_2_TO_ACCEPTER_PROJECT_2" = {
    peer_tenant_id = "5dd3c0b24cdc4d31952c49589182a90d"
    peer_vpc_id    = "a82d8c31-t6nh-4d55-bd45-e01ec3de417c"
    vpc_id         = "REWRITE_IN_LOCALS"
  }
}

accepter_vpc_peering_settings = {
  "ACCEPTER_PROJECT_1-WITH-REQUESTER_PROJECT_1" = {
    peer_vpc_connection_id = "REWRITE_IN_LOCALS"
    is_accept              = true
  }
}
