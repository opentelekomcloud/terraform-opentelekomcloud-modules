/*=================================
VARIABLES
==================================*/
variable "default_tags_set" {
  default     = {}
  description = "Set of default tags for most of all resources"
}

variable "dns_zone_settings" {
  default = {
    /*Example:
    zone_name = { #You can use any string as key
      name        = "example.opentelekomcloud"             #Zone domain name
      description = "Example Zone"                         #Zone description
      type        = "private|public"                       #Type of the zone
      ttl         = 500                                    #Caching period of the SOA record set (in seconds)
      email       = "email1@example.com"                   #Email address of the administrator managing the zone
      vpc_id      = "19664294-0bf6-4271-ad3a-94b8c79c6558" #Id of VPC
      region      = "eu-de"                                #Name of the current region
      tags        = {                                      #Tags (will be merged with default_tags_set)
        "Environment" = "test"
        "Managed_by"  = "terraform"
      }
      recordsets = [
      {
        subdomain   = "subdomain"             #Name of the record subdomain
        type        = "cname"                 #Type of the record set
        description = "cname record set"      #Description of the record set
        ttl         = 3600                    #Ttl of the record set
        records     = ["server1.example.com"] #List of records
        tags        = {                       #Tags (will be merged with default_tags_set)
          "Recordset" = "private_cname"
        }
      },
    ]
  }
    */
  }
  type = map(object({
    name        = string
    description = optional(string, "")
    type        = string
    ttl         = number
    email       = string
    vpc_id      = optional(string, "")
    region      = optional(string, "")
    tags        = optional(map(any))
    recordsets    = optional(list(object({
      subdomain   = string
      type        = string
      description = optional(string)
      ttl         = number
      records     = optional(list(string))
      tags        = optional(map(any))
    })))
  }))
  description = "Map with necessary for DNS zone settings (current values in top level vars file)"
}
