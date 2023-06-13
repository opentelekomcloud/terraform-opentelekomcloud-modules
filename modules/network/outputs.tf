/*=================================
OUTPUTS
==================================*/
output "network" {
  value = opentelekomcloud_networking_network_v2.network
}

output "subnet" {
  value = opentelekomcloud_networking_subnet_v2.subnet
}

output "router" {
  value = opentelekomcloud_networking_router_v2.router
}

output "interface" {
  value = opentelekomcloud_networking_router_interface_v2.interface
}
