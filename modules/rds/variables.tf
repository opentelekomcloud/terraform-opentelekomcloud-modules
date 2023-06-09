variable "name" {
  description = "The name of the RDS instance"
  type        = string
}

variable "flavor" {
  description = "The flavor (size) of the RDS instance"
  type        = string
}

variable "storage" {
  description = "The storage size in GB for the RDS instance"
  type        = number
}

variable "network_id" {
  description = "The ID of the network where the RDS instance should be deployed"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the RDS instance should be deployed"
  type        = string
}

variable "password" {
  description = "The password for the RDS instance"
  type        = string
}

variable "availability_zone" {
    description = "The availability zone where the RDS instance should be deployed"
    type        = string
}

variable "db_availability_zones" {
  type        = set(string)
  description = "Availability zones for the RDS instance. One or two zones are supported for single and primary/standby instances respectively."
  default     = []
}

locals {
  valid_availability_zones = {
    eu-de = toset([
      "eu-de-01",
      "eu-de-02",
      "eu-de-03",
    ])
    eu-nl = toset([
      "eu-nl-01",
      "eu-nl-02",
      "eu-nl-03",
    ])
    eu-ch2 = toset([
      "eu-ch2a",
      "eu-ch2b",
    ])
  }

  region = data.opentelekomcloud_identity_project_v3.current.region
  default_zones = {
    eu-de  = formatlist("${local.region}%s", ["-01", "-02"])
    eu-nl  = formatlist("${local.region}%s", ["-01", "-02"])
    eu-ch2 = formatlist("${local.region}%s", ["a", "b"])
  }

  db_availability_zones = length(var.db_availability_zones) == 0 ? local.default_zones[local.region] : var.db_availability_zones
}