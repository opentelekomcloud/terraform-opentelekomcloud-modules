/*=================================
DNS PREPARED MAPS
==================================*/

private_dns_settings = {
  private = {
    name        = "example.opentelekomcloud" #Zone domain name
    description = "Example Zone"             #zone description
    type        = "private"                  #type of the zone
    ttl         = 500                        #Caching period of the SOA record set (in seconds)
    email       = "email_prv@example.com"       #Email address of the administrator managing the zone
    vpc_id      = "REWRITE_IN_LOCALS"        #Id of used VPC
    region      = "REWRITE_IN_LOCALS"        #Name of the current region
    tags        = {
      "Environment" = "test"
      "Managed_by"  = "terraform"
    }
    recordsets = [
      {
        subdomain   = "first_a"
        type        = "A"
        description = "a record set"
        ttl         = 380
        records     = ["10.1.0.0"]
        tags        = {
          "Environment" = "test"
          "Managed_by"  = "terraform"
          "Recordset"   = "first"
        }
      },
    ]
  }
  private_another = {
    name        = "another.opentelekomcloud" #Zone domain name
    description = "Example Zone other"       #zone description
    type        = "private"                  #type of the zone
    ttl         = 450                        #Caching period of the SOA record set (in seconds)
    email       = "email_oth@example.com"    #Email address of the administrator managing the zone
    vpc_id      = "REWRITE_IN_LOCALS"        #Id of used VPC
    region      = "REWRITE_IN_LOCALS"        #Name of the current region
    tags        = {
      "Environment" = "test"
      "Managed_by"  = "terraform"
    }
    recordsets = []
  }
}

public_dns_settings = {
  public = {
    name        = "public.opentelekomcloud" #Zone domain name
    description = "Example Zone"             #zone description
    type        = "public"                   #type of the zone
    ttl         = 300                        #Caching period of the SOA record set (in seconds)
    email       = "email_pub@example.com"    #Email address of the administrator managing the zone
    vpc_id      = "REWRITE_IN_LOCALS"        #Id of used VPC
    region      = "REWRITE_IN_LOCALS"        #Name of the current region
    tags        = {
      "Environment" = "test"
      "Managed_by"  = "terraform"
    }
    recordsets = []
  }
}
