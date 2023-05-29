/*=================================
DNS PREPARED MAPS
==================================*/

dns_settings = {
  private = {
    name        = "example.opentelekomcloud"
    description = "Example Zone"
    type        = "private"
    ttl         = 500
    email       = "email_prv@example.com"
    vpc_id      = "REWRITE_IN_LOCALS"
    region      = "REWRITE_IN_LOCALS"
    tags        = {
      "Zone" = "test"
    }
    recordsets = [
      {
        subdomain   = "first_a"
        type        = "A"
        description = "a record set"
        ttl         = 380
        records     = ["10.1.0.0"]
        tags        = {
          "Recordset"   = "private_a"
        }
      },
    ]
  }
  private_another = {
    name        = "another.opentelekomcloud"
    description = "Example Zone other"
    type        = "private"
    ttl         = 450
    email       = "email_oth@example.com"
    vpc_id      = "REWRITE_IN_LOCALS"
    region      = "REWRITE_IN_LOCALS"
    tags        = {}
    recordsets = []
  }
  public = {
    name        = "public.opentelekomcloud"
    description = "Example Zone"
    type        = "public"
    ttl         = 300
    email       = "email_pub@example.com"
    vpc_id      = "REWRITE_IN_LOCALS"
    region      = "REWRITE_IN_LOCALS"
    tags        = {}
    recordsets = []
  }
}
