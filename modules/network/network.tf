/*=================================
RESOURCES
==================================*/
data "opentelekomcloud_networking_network_v2" "admin_external_net" {
  name = "admin_external_net"
}

resource "opentelekomcloud_networking_router_v2" "router" {
  for_each = var.network_settings

  name             = each.key
  distributed      = each.value["distributed"]
  admin_state_up   = each.value["admin_state_up"]
  external_gateway = each.value["external_gateway"] != "" ? each.value["external_gateway"] : data.opentelekomcloud_networking_network_v2.admin_external_net.id
  enable_snat      = each.value["enable_snat"]
}

resource "opentelekomcloud_networking_network_v2" "network" {
  for_each = var.network_settings

  name           = each.value["network_name"]
  admin_state_up = "true"
}

resource "opentelekomcloud_networking_subnet_v2" "subnet" {
  for_each = {for k, v in local.subnets : k => v}

  name             = each.value["name"]
  no_gateway       = each.value["no_gateway"]
  dns_nameservers  = each.value["nameservers"]
  enable_dhcp      = "true"
  gateway_ip       = each.value["gateway_ip"]
  cidr             = each.value["cidr"]
  ip_version       = each.value["ip_version"]

  dynamic "allocation_pools" {
    for_each = each.value["allocation_pools"]
    content {
      start = each.value["allocation_pools"][each.key]["start"]
      end = each.value["allocation_pools"][each.key]["end"]
    }
  }

  network_id = each.value["network_id"]
}

#resource "opentelekomcloud_networking_router_interface_v2" "interface" {
#  for_each = opentelekomcloud_networking_subnet_v2.subnet
#  router_id = opentelekomcloud_networking_router_v2.router.id
#  subnet_id = each.value["id"]
#}
