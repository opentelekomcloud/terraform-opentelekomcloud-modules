/*=================================
LOCALS
==================================*/
locals {
  subnets = flatten([
    for network_key, network in var.network_settings : [
      for subnet_key, subnet in network["subnets"] : {
        network_id       = opentelekomcloud_networking_network_v2.network[network_key].id
        router_id        = opentelekomcloud_networking_router_v2.router[network_key].id
        name             = subnet["name"]
        no_gateway       = subnet["no_gateway"]
        nameservers      = subnet["nameservers"]
        enable_dhcp      = subnet["enable_dhcp"]
        gateway_ip       = subnet["gateway_ip"]
        cidr             = subnet["cidr"]
        ip_version       = subnet["ip_version"]
        allocation_pools = subnet["allocation_pools"]
        subnet_key       = subnet_key
        network_key      = network_key
        subnet_index     = "${network_key}.${subnet_key}"
      }
    ]
  ])
}
