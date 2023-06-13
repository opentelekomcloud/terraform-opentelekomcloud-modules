resource "opentelekomcloud_rds_instance_v3" "this" {
  name             = each.value["name"]
  flavor           = each.value["flavor"]
  volume_size      = each.value["storage"]
  availability_zone = var.db_high_availability || var.db_flavor != "" ? local.db_availability_zones : [local.db_availability_zones[0]]
  vpc_id           = each.value["network_id"]
  subnet_id        = each.value["subnet_id"]
  password         = each.value["password"]
}

resource "opentelekomcloud_rds_read_replica_v3" "this" {
  count            = var.db_flavor != "" ? 1 : 0
  name             = each.value["name"]
  flavor           = each.value["flavor"]
  volume_size      = each.value["storage"]
  availability_zone = var.db_high_availability || var.db_flavor != "" ? local.db_availability_zones : [local.db_availability_zones[0]]
  vpc_id           = each.value["network_id"]
  subnet_id        = each.value["subnet_id"]
  password         = each.value["password"]
  replica_of_id    = opentelekomcloud_rds_instance_v3.this[0].id
}
