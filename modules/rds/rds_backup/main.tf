resource "opentelekomcloud_rds_backup_v3" "test" {
  for_each = var.rds_backup_settings

  name        = each.key
  description = each.value["description"]
  databases   = each.value["databases"]
  instance_id = each.value["instance_id"]
}
