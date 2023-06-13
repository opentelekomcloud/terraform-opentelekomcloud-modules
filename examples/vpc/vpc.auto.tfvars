vpc_settings = {
  first_vpc = {
    description = "desc 1"
    cidr        = "10.0.0.0/8"
    enable_snat = "true"
    tags        = {
      "Environment" = "test"
      "Managed_by"  = "terraform"
    }
    subnets = [
      {
        name          = "example_opentelekomcloud_1_subnet_1"
        dns_list      = ["8.8.8.8", "1.1.1.1"]
        gateway_ip    = "10.0.0.1"
        cidr          = "10.0.0.0/16"
        description   = "desc subnet 1 of vpc 1"
        primary_dns   = "8.8.8.8"
        secondary_dns = "1.1.1.1"
        tags          = {
          "Resource" = "first-of-vpc-1"
        }
      },
      {
        name          = "example_opentelekomcloud_1_subnet_2"
        dns_list      = ["100.125.4.25", "100.125.129.199"]
        gateway_ip    = "10.20.0.1"
        cidr          = "10.20.0.0/24"
        description   = "desc subnet 2 of vpc 1"
        primary_dns   = "100.125.4.25"
        secondary_dns = "100.125.129.199"
        tags          = {
          "Resource" = "second-of-vpc-1"
        }
      }
    ]
  }
  second_vpc = {
    description = "desc 2"
    cidr        = "192.168.0.0/16"
    enable_snat = "true"
    tags        = {
      "Environment" = "test"
      "Managed_by"  = "terraform"
    }
    subnets = [
      {
        name          = "example_opentelekomcloud_2_subnet"
        dns_list      = ["8.8.8.8", "1.1.1.1"]
        description   = "desc subnet"
        tags          = {
          "Resource" = "first-of-second"
        }
      }
    ]
  }
}
