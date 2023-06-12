/*=================================
NETWORK PREPARED MAP
==================================*/

network_settings = {
  first_router = {
    network_name     = "example_opentelekomcloud_1"
    admin_state_up   = "true"
    enable_snat      = "true"
    subnets          = [
      {
        name             = "first_subnet"
        nameservers      = ["8.8.8.8", "1.1.1.1"]
        gateway_ip       = "192.168.199.1"
        cidr             = "192.168.199.0/24"
        ip_version       = 4
        allocation_pools = [
          {
            start = "192.168.199.50"
            end   = "192.168.199.200"
          },
        ]
      }
    ]
  }
  second_router = {
    network_name     = "example_opentelekomcloud_2"
    distributed      = "false"
    admin_state_up   = "true"
    enable_snat      = "false"
    subnets          = [
      {
      name             = "second_subnet"
      nameservers      = ["8.8.8.8", "1.1.1.1"]
      gateway_ip       = "192.168.10.1"
      cidr             = "192.168.10.0/24"
      ip_version       = 4
    }
    ]
  }
}
