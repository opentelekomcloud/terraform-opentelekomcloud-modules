/*=================================
RESOURCES
#==================================*/
data "opentelekomcloud_identity_project_v3" "current" {}

resource "opentelekomcloud_vpc_v1" "vpc" {
  for_each   = var.vpc_settings

  name        = each.key
  cidr        = each.value["cidr"]
  description = each.value["description"]

  shared = data.opentelekomcloud_identity_project_v3.current.region == "eu-de" ? each.value["snat_enable"] : false

  tags = merge(
    var.default_tags_set,
    each.value["tags"],
  )
}

resource "opentelekomcloud_vpc_subnet_v1" "subnet" {
  for_each = {
    for subnet in local.subnets : subnet["subnet_key"] => subnet
  }

  name          = each.value["name"]
  vpc_id        = each.value["vpc_id"]
  cidr          = each.value["cidr"] != "" ? each.value["cidr"] : replace(each.value["cidr"], "", opentelekomcloud_vpc_v1.vpc[each.value["vpc_key"]].cidr)
  gateway_ip    = each.value["gateway_ip"] != "" ? each.value["gateway_ip"] : cidrhost(replace(each.value["cidr"], "", opentelekomcloud_vpc_v1.vpc[each.value["vpc_key"]].cidr), 1)
  dns_list      = each.value["dns_list"]
  description   = each.value["description"]
  dhcp_enable   = each.value["dhcp_enable"]
  ntp_addresses = each.value["ntp_addresses"]
  primary_dns   = each.value["primary_dns"]
  secondary_dns = each.value["secondary_dns"]

  tags = merge(
    var.default_tags_set,
    each.value["tags"],
  )
}
