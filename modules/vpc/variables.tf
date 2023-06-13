/*=================================
VARIABLES
==================================*/
variable "default_tags_set" {
  default     = {}
  description = "Set of default tags for most of all resources"
}

variable "vpc_settings" {
  default = {
    /*Example:
    vpc_name = { #You can use any string as key
      description = "desc"
      cidr        = "10.0.0.0/8"
      enable_snat = "true"
      tags        = {
        "Environment" = "test"
        "Managed_by"  = "terraform"
      }
      subnets = [
        {
          name          = "subnet_name"
          dns_list      = ["8.8.8.8", "1.1.1.1"]
          gateway_ip    = "10.0.0.1"
          cidr          = "10.0.0.0/16"
          dhcp_enable   = "true"
          description   = "desc"
          primary_dns   = "8.8.8.8"
          secondary_dns = "1.1.1.1"
          tags          = {
            "Resource" = "first"
          }
        },
    ]
  }
    */
  }
  type = map(object({
    cidr        = string
    description = optional(string)
    enable_snat = optional(bool, "true")
    tags        = optional(map(any))
    subnets     = optional(list(object({
      name          = string
      dns_list      = optional(list(string))
      gateway_ip    = optional(string, "")
      cidr          = optional(string, "")
      dhcp_enable   = optional(bool, "true")
      description   = optional(string)
      primary_dns   = optional(string)
      secondary_dns = optional(string)
      tags          = optional(map(any))
    })))
  }))
  description = "Map with necessary for VPC settings (current values in top level vars file)"
}
