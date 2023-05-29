/*=================================
RESOURCES
==================================*/

resource "opentelekomcloud_dns_zone_v2" "zone" {
  for_each    = var.dns_zone_settings
  name        = each.value["name"]
  description = each.value["description"]
  ttl         = each.value["ttl"]
  email       = each.value["email"]
  type        = each.value["type"]

  router {
    router_region = each.value["region"]
    router_id     = each.value["vpc_id"]
  }

  tags = merge(
    var.default_tags_set,
    each.value["tags"],
  )
}

resource "opentelekomcloud_dns_recordset_v2" "record" {
  for_each = {for k, v in local.recordsets : k => v}
  zone_id     = opentelekomcloud_dns_zone_v2.zone[each.value["zone_index"]].id
  name        = "${each.value["subdomain"]}.${each.value["domain"]}"
  description = each.value["description"]
  ttl         = each.value["ttl"]
  type        = each.value["type"]
  records     = each.value["records"]

  tags = merge(
    var.default_tags_set,
    each.value["tags"],
  )
}
