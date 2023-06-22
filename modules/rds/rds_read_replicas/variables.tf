variable "read_replica_config" {
  type = list(
    object(
      {
        name                 = string,
        flavor               = string,
        availability_zone    = string,
        public_ips           = list(string),
        volume_type          = string,
        volume_encryption_id = string
      }
    )
  )
  description = "(optional) The configuration of RDSv3 db read replica instances"

  default = []
}
