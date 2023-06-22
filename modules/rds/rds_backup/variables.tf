variable "rds_backup_settings" {
  default = {
    /*Example:
    #Here you set rds_backup name as key
    rds_backup_name = { 
      description = "desc"
      databases   = ["db1", "db2"]
      instance_id = "instance_id"
    }
    */
  }
  type = map(object({
    description = optional(string)
    databases   = optional(list(string))
    instance_id = optional(string)
  }))
}
