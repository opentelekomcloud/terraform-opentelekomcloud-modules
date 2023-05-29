/*=================================
OUTPUTS
==================================*/
output "zone" {
  value = opentelekomcloud_dns_zone_v2.zone
}

output "recordset" {
  value = opentelekomcloud_dns_recordset_v2.record
}
