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
        name             = "example_opentelekomcloud_1_subnet_1"
        nameservers      = ["8.8.8.8", "1.1.1.1"]
        gateway_ip       = "10.0.0.1"
        cidr             = "10.0.0.0/16"
        allocation_pools = [
          {
            start = "10.0.0.50"
            end   = "10.0.0.100"
          },
          {
            start = "10.0.0.110"
            end   = "10.0.0.200"
          },
          {
            start = "10.0.0.201"
            end   = "10.0.0.205"
          },
        ]
      },
      {
        name             = "example_opentelekomcloud_1_subnet_2"
        nameservers      = ["100.125.4.25", "100.125.129.199"]
        gateway_ip       = "10.20.0.1"
        cidr             = "10.20.0.0/24"
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
      name             = "example_opentelekomcloud_2_subnet"
      nameservers      = ["8.8.8.8", "1.1.1.1"]
      gateway_ip       = "192.168.10.1"
      cidr             = "192.168.10.0/24"
      ip_version       = 4
    }
    ]
  }
}
