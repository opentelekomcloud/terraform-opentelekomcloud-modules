/*=================================
VARIABLES
==================================*/
variable "requester_vpc_peering_settings" {
  default = {
    /* Example variable value:
    peering_name_1 = {
      peer_tenant_id = "accepter_tenant_id_1"
      peer_vpc_id    = "accepter_vpc_id_1"
      vpc_id         = "requester_vpc_id_1"
    } # Example value 1

    peering_name_2 = {
      peer_tenant_id = "accepter_tenant_id_2"
      peer_vpc_id    = "accepter_vpc_id_2"
      vpc_id         = "requester_vpc_id_2"
    } # Example value 2
    */
  }
  type = map(object({
    peer_tenant_id = string
    peer_vpc_id    = string
    vpc_id         = string
  }))
  description = "Map of peering settings (current values in top level vars file)"
}

variable "accepter_vpc_peering_settings" {
  default = {
    /* Examples
    peering_name_1 = {
      peer_vpc_connection_id = "peer_vpc_connection_id_1"
      is_accept              = true
    } # Example value 1

    peering_name_2 = {
      peer_vpc_connection_id = "peer_vpc_connection_id_2"
      is_accept              = true
    } # Example value 2
    */
  }
  type = map(object({
    peer_vpc_connection_id = string
    is_accept              = bool
  }))
  description = "Map of peering accepter settings (current values in top level vars file)"
}
