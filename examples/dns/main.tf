/*=================================
DNS VARIABLES
==================================*/

variable "private_dns_settings" {
#  type = map(object({
#    name        = string
#    description = string
#    type        = string
#    ttl         = number
#    email       = string
#    vpc_id      = string
#    region      = string
#    tags        = map(any)
#    recordsets    = map(object({
#      subdomain   = string
#      type        = string
#      description = string
#      ttl         = number
#      records     = list(string)
#      tags        = map(any)
#    }))
#  }))
  default     = {}
  description = "Main settings for private DNS."
}

variable "public_dns_settings" {
  default     = {}
  description = "Main settings for public DNS."
}

variable "dns_subnet" {
  default     = "subnet-do-not-delete-pls"
  description = "Main settings for public DNS."
}
/*=================================
DNS LOCALS
==================================*/

locals {
  local_private_dns_settings = {
    private_one = {
      name        = var.private_dns_settings["private"]["name"]
      description = var.private_dns_settings["private"]["description"]
      type        = var.private_dns_settings["private"]["type"]
      ttl         = var.private_dns_settings["private"]["ttl"]
      email       = var.private_dns_settings["private"]["email"]
      vpc_id      = data.opentelekomcloud_vpc_subnet_v1.subnet.vpc_id
      region      = data.opentelekomcloud_identity_project_v3.current.region
      tags        = var.private_dns_settings["private"]["tags"]
      recordsets  = var.private_dns_settings["private"]["recordsets"]
    }
    private_two = {
      name        = var.private_dns_settings["private_another"]["name"]
      description = var.private_dns_settings["private_another"]["description"]
      type        = var.private_dns_settings["private_another"]["type"]
      ttl         = var.private_dns_settings["private_another"]["ttl"]
      email       = var.private_dns_settings["private_another"]["email"]
      vpc_id      = data.opentelekomcloud_vpc_subnet_v1.subnet.vpc_id
      region      = data.opentelekomcloud_identity_project_v3.current.region
      tags        = var.private_dns_settings["private_another"]["tags"]
      recordsets  = var.private_dns_settings["private_another"]["recordsets"]
    }
  }
  private_dns_settings = merge(var.private_dns_settings, local.local_private_dns_settings)
}

locals {
  local_public_dns_settings = {
    public_one = {
      name        = var.public_dns_settings["public"]["name"]
      description = var.public_dns_settings["public"]["description"]
      type        = var.public_dns_settings["public"]["type"]
      ttl         = var.public_dns_settings["public"]["ttl"]
      email       = var.public_dns_settings["public"]["email"]
      vpc_id      = ""
      region      = ""
      tags        = var.public_dns_settings["public"]["tags"]
      recordsets  = var.public_dns_settings["public"]["recordsets"]
    }
  }
  public_dns_settings = merge(var.public_dns_settings, local.local_public_dns_settings)
}

/*=================================
DNS MODULES
==================================*/

data "opentelekomcloud_identity_project_v3" "current" {
}

data "opentelekomcloud_vpc_subnet_v1" "subnet"  {
  name = var.dns_subnet
}

module "private_dns" {
  source = "../../modules/dns"
  dns_zone_settings = local.local_private_dns_settings
}

module "public_dns" {
  source = "../../modules/dns"
  dns_zone_settings = local.local_public_dns_settings
}

/*=================================
DNS OUTPUTS
==================================*/

output "private_dns_zone_ids" {
  value = { for k, v in module.private_dns.zone : k => v.id }
}

output "public_dns_zone_ids" {
  value = { for k, v in module.public_dns.zone : k => v.id }
}

output "private_dns_zone_recordsets_ids" {
  value = { for k, v in module.private_dns.recordset : k => v.id }
}

output "public_dns_zone_recordsets_ids" {
  value = { for k, v in module.public_dns.recordset : k => v.id }
}
