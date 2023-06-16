variable "parametergroup_values" {
  type        = map(string)
  description = "(optional) Map of the values of the RDSv3 db parameter group"

  default = {}
}

variable "parametergroup_description" {
  type        = string
  description = "(optional) Description of the RDSv3 parameter group to create"

  default = ""
}