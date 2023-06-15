vpc_settings = {
  simple_vpc = {
    description = "desc 1"
    cidr        = "10.0.0.0/8"
    snat_enable = "true"
    tags = {
      "Environment" = "test"
    }
    subnets = [
      {
        name       = "subnet_1"
        dns_list   = ["8.8.8.8", "1.1.1.1"]
        gateway_ip = "10.0.0.1"
        cidr       = "10.0.0.0/16"
      }
    ]
  }
}
