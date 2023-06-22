resource "opentelekomcloud_rds_instance_v3" "this" {
  count = var.create_rds ? 1 : 0

  availability_zone = var.availability_zone
  db {
    password = var.db_password
    type     = var.db_type
    version  = var.db_version
    port     = var.db_port
  }
  name              = "${var.prefix}_rds_instance"
  security_group_id = var.secgroup_id
  subnet_id         = var.network_id
  vpc_id            = var.vpc_id
  volume {
    type               = var.volume_type
    size               = var.volume_size
    disk_encryption_id = var.volume_encryption_id
  }
  flavor              = var.db_flavor
  ha_replication_mode = var.ha_replication_mode

  backup_strategy {
    start_time = var.backup_start_time
    keep_days  = var.backup_keep_days
  }

  tags = var.tags

  param_group_id = length(var.parametergroup_values) > 0 ? concat(opentelekomcloud_rds_parametergroup_v3.this.*.id)[0] : null
}
