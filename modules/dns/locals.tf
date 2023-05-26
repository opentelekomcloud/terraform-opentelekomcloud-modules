/*=================================
LOCALS
==================================*/
locals {
  recordsets = flatten([
  for zone_key, zone in var.dns_zone_settings : [
  for recordset_key, recordset in zone["recordsets"] : {
    zone_index = zone_key
    domain = var.dns_zone_settings[zone_key].name
    subdomain   = recordset["subdomain"]
    type        = recordset["type"]
    description = recordset["description"]
    ttl         = recordset["ttl"]
    records     = recordset["records"]
    tags        = recordset["tags"]
  }
  ]
  ])
}
