/*=================================
LOCALS
==================================*/
locals {
  subnets = flatten([
  for vpc_key, vpc in var.vpc_settings : [
  for subnet_key, subnet in vpc["subnets"] : {
      vpc_id        = opentelekomcloud_vpc_v1.vpc[vpc_key].id
      vpc_key       = vpc_key
      name          = subnet["name"]
      dns_list      = subnet["dns_list"]
      gateway_ip    = subnet["gateway_ip"]
      cidr          = subnet["cidr"]
      dhcp_enable   = subnet["dhcp_enable"]
      description   = subnet["description"]
      primary_dns   = subnet["primary_dns"]
      secondary_dns = subnet["secondary_dns"]
      tags          = subnet["tags"]
      subnet_key    = "${vpc_key}.${subnet_key}"
    }]
  ])
}
