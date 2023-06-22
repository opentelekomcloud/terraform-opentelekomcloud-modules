resource "opentelekomcloud_rds_parametergroup_v3" "this" {
  count = length(var.parametergroup_values) > 0 ? 1 : 0

  name        = "${var.prefix}_parametergroup"
  description = var.parametergroup_description
  values      = var.parametergroup_values
  datastore {
    type    = lower(var.db_type)
    version = var.db_version
  }
}
