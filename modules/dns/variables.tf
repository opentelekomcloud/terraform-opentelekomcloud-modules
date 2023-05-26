/*=================================
VARIABLES
==================================*/
variable "dns_zone_settings" {
  default = {
    /*Example:
    zone_name = { #You can use any string as key
      name        = "example.opentelekomcloud"             #Zone domain name
      description = "Example Zone"                         #zone description
      type        = "private|public"                       #type of the zone
      ttl         = 500                                    #Caching period of the SOA record set (in seconds)
      email       = "email1@example.com"                   #Email address of the administrator managing the zone
      vpc_id      = "19664294-0bf6-4271-ad3a-94b8c79c6558" #Id of used VPC
      region      = "eu-de"                                #Name of the current region
      tags        = {
                      "Environment" = "test"
                      "Managed_by"  = "terraform"
                    }
  }
    */
  }
  description = "Map with necessary for DNS zone settings (current values in top level vars file)"
}
