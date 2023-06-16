output "db_private_ip" {
  value = opentelekomcloud_rds_instance_v3.this[*].private_ip
}

output "db_public_ip" {
  value = try(opentelekomcloud_vpc_eip_v1.this[0].publicip[0].ip_address, "")
}

output "db_root_password" {
  value     = random_password.db_root_password.result
  sensitive = true
}

output "db_root_username" {
  value = opentelekomcloud_rds_instance_v3.this.db[0].user_name
}

output "sg_secgroup_id" {
  value = opentelekomcloud_rds_instance_v3.this.security_group_id
}

output "db_instance_ids" {
  value = opentelekomcloud_rds_instance_v3.this.nodes[*].id
}

output "db_read_replica_ids" {
  value = opentelekomcloud_rds_read_replica_v3.this[*].id
}

output "db_read_replica_private_ips" {
  value = opentelekomcloud_rds_read_replica_v3.this[*].private_ip
}

output "db_instance_private_ips" {
  value = opentelekomcloud_rds_instance_v3.this[*].private_ip
}

output "db_instance_public_ips" {
  value = opentelekomcloud_rds_instance_v3.this[*].public_ip
}
