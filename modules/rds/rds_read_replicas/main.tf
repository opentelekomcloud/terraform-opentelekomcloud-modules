resource "opentelekomcloud_rds_read_replica_v3" "this" {
  count = length(var.read_replica_config)

  name              = var.read_replica_config[count.index]["name"]
  flavor_ref        = var.read_replica_config[count.index]["flavor"]
  availability_zone = var.read_replica_config[count.index]["availability_zone"]
  replica_of_id     = local.rds_instance_id

  public_ips = var.read_replica_config[count.index]["public_ips"]

  volume {
    type               = var.read_replica_config[count.index]["volume_type"]
    disk_encryption_id = var.read_replica_config[count.index]["volume_encryption_id"]
  }
}
