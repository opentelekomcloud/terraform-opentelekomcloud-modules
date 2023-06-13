/*=================================
OUTPUTS
==================================*/
output "vpc" {
  value = opentelekomcloud_vpc_v1.vpc
}

output "subnet" {
  value = opentelekomcloud_vpc_subnet_v1.subnet
}
