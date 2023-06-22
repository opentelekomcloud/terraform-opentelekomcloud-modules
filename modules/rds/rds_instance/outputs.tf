output "rds_instance_id" {
  value = opentelekomcloud_rds_instance_v3.this.*.id
}
  
output "rds_instance_name" {
  value = opentelekomcloud_rds_instance_v3.this.*.name
}

output "rds_instance_status" {
  value = opentelekomcloud_rds_instance_v3.this.*.status
}

output "rds_instance_availability_zone" {
  value = opentelekomcloud_rds_instance_v3.this.*.availability_zone
}

output "rds_instance_volume_size" {
  value = opentelekomcloud_rds_instance_v3.this.*.volume.0.size
}

output "rds_instance_volume_type" {
  value = opentelekomcloud_rds_instance_v3.this.*.volume.0.type
}

output "rds_instance_volume_encryption_id" {
  value = opentelekomcloud_rds_instance_v3.this.*.volume.0.disk_encryption_id
}

output "rds_private_ip" {
  value = opentelekomcloud_rds_instance_v3.this.*.private_ip
}

output "rds_instance_port" {
  value = opentelekomcloud_rds_instance_v3.this.*.db.0.port
}

output "rds_public_ip" {
  value = try(opentelekomcloud_rds_instance_v3.this.*.public_ips, "")
}

output "rds_instance_nodes" {
  value       = opentelekomcloud_rds_instance_v3.this.*.nodes
}

output "rds_root_username" {
  value = opentelekomcloud_rds_instance_v3.db_instance.db[0].user_name
}

output "rds_root_password" {
  value = try(opentelekomcloud_rds_instance_v3.db_instance.db[0].password, "")
  sensitive = true
}
