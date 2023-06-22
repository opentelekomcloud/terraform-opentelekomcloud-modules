output "rds_backup_id" {
    value = try(opentelekomcloud_rds_backup_v3.this.*.id, "")
}

output "rds_backup_name" {
    value = try(opentelekomcloud_rds_backup_v3.this.*.name, "")
}

output "rds_backup_description" {
    value = try(opentelekomcloud_rds_backup_v3.this.*.description, "")
}

output "rds_backup_databases" {
    value = try(opentelekomcloud_rds_backup_v3.this.*.databases, "")
}

output "rds_backup_status" {
    value = try(opentelekomcloud_rds_backup_v3.this.*.status, "")
}

output "rds_backup_type" {
    value = try(opentelekomcloud_rds_backup_v3.this.*.type, "")
}

output "rds_backup_begin_time" {
    value = try(opentelekomcloud_rds_backup_v3.this.*.begin_time, "")
}
