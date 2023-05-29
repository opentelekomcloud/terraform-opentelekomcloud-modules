/*=================================
DNS VARIABLES
==================================*/

variable "dns_settings" {
  default     = {}
  description = "Main settings for private DNS."
}

variable "dns_subnet" {
  default     = "subnet-do-not-delete-pls"
  description = "Main settings for public DNS."
}

variable "default_tags_set" {
  default     = {
    "Managed_by"  = "terraform"
  }
  description = "Set of default tags for most of all resources"
}

/*=================================
DNS LOCALS
==================================*/

locals {
  local_dns_settings = {
    private_one = {
      name        = var.dns_settings["private"]["name"]
      description = var.dns_settings["private"]["description"]
      type        = var.dns_settings["private"]["type"]
      ttl         = var.dns_settings["private"]["ttl"]
      email       = var.dns_settings["private"]["email"]
      vpc_id      = data.opentelekomcloud_vpc_subnet_v1.subnet.vpc_id
      region      = data.opentelekomcloud_identity_project_v3.current.region
      tags        = var.dns_settings["private"]["tags"]
      recordsets  = var.dns_settings["private"]["recordsets"]
    }
    private_two = {
      name        = var.dns_settings["private_another"]["name"]
      description = var.dns_settings["private_another"]["description"]
      type        = var.dns_settings["private_another"]["type"]
      ttl         = var.dns_settings["private_another"]["ttl"]
      email       = var.dns_settings["private_another"]["email"]
      vpc_id      = data.opentelekomcloud_vpc_subnet_v1.subnet.vpc_id
      region      = data.opentelekomcloud_identity_project_v3.current.region
      tags        = var.dns_settings["private_another"]["tags"]
      recordsets  = var.dns_settings["private_another"]["recordsets"]
    }
    public_one = {
      name        = var.dns_settings["public"]["name"]
      description = var.dns_settings["public"]["description"]
      type        = var.dns_settings["public"]["type"]
      ttl         = var.dns_settings["public"]["ttl"]
      email       = var.dns_settings["public"]["email"]
      vpc_id      = ""
      region      = ""
      tags        = var.dns_settings["public"]["tags"]
      recordsets  = var.dns_settings["public"]["recordsets"]
    }
  }
  dns_settings = merge(var.dns_settings, local.local_dns_settings)
}

/*=================================
DNS MODULES
==================================*/

data "opentelekomcloud_identity_project_v3" "current" {}

data "opentelekomcloud_vpc_subnet_v1" "subnet"  {
  name = var.dns_subnet
}

module "private_dns" {
  source = "../../modules/dns"
  dns_zone_settings = local.local_dns_settings
  default_tags_set  = var.default_tags_set
}

/*=================================
DNS OUTPUTS
==================================*/

output "dns_zone_ids" {
  value = { for k, v in module.private_dns.zone : k => v.id }
}

output "dns_zone_recordsets_names" {
  value = { for k, v in module.private_dns.recordset : k => v.name }
}
