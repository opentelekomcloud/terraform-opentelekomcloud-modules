/*=================================
PEERING VARIABLES
==================================*/
variable "requester_vpc_peering_settings" {
  default     = {}
  description = "Map of peering properties"
}

variable "accepter_vpc_peering_settings" {
  default     = {}
  description = "Map of peering accepter properties"
}

variable "main_vpc" {
  default     = "subnet-do-not-delete-pls"
  description = "Subnet for Peering."
}
/*=================================
PEERING LOCALS
==================================*/

locals {
  local_requester_vpc_peering_settings = {
    "REQUESTER_PROJECT_1_TO_ACCEPTER_PROJECT_1" = {
      peer_tenant_id = var.requester_vpc_peering_settings["REQUESTER_PROJECT_1_TO_ACCEPTER_PROJECT_1"]["peer_tenant_id"] # FIRST PROJECT
      peer_vpc_id    = var.requester_vpc_peering_settings["REQUESTER_PROJECT_1_TO_ACCEPTER_PROJECT_1"]["peer_vpc_id"]    # VPC ID TO PEER FROM FIRST PROJECT
      vpc_id         = data.opentelekomcloud_vpc_subnet_v1.subnet.vpc_id
    }
    "REQUESTER_PROJECT_2_TO_ACCEPTER_PROJECT_2" = {
      peer_tenant_id = var.requester_vpc_peering_settings["REQUESTER_PROJECT_2_TO_ACCEPTER_PROJECT_2"]["peer_tenant_id"] # SECOND PROJECT
      peer_vpc_id    = var.requester_vpc_peering_settings["REQUESTER_PROJECT_2_TO_ACCEPTER_PROJECT_2"]["peer_vpc_id"]    # VPC ID TO PEER FROM SECOND PROJECT
      vpc_id         = data.opentelekomcloud_vpc_subnet_v1.subnet.vpc_id
    }
  }
  requester_vpc_peering_settings = merge(var.requester_vpc_peering_settings, local.local_requester_vpc_peering_settings)
}
locals {
  local_accepter_vpc_peering_settings = {
    "ACCEPTER_PROJECT_1-WITH-REQUESTER_PROJECT_1" = {
      peer_vpc_connection_id = module.peering-requester.peering_connections["REQUESTER_PROJECT_1_TO_ACCEPTER_PROJECT_1"].id
      is_accept              = true
    }
  }
  accepter_vpc_peering_settings = merge(var.accepter_vpc_peering_settings, local.local_accepter_vpc_peering_settings)
}
/*=================================
PEERING MODULES
==================================*/
data "opentelekomcloud_vpc_subnet_v1" "subnet"  {
  name = var.main_vpc
}

module "peering-requester" {
  source = "../../modules/vpc-peering"

  requester_vpc_peering_settings = local.requester_vpc_peering_settings
}

module "peering-accepter" {
  source = "../../modules/vpc-peering"

  accepter_vpc_peering_settings = local.accepter_vpc_peering_settings

  providers = {
    opentelekomcloud = opentelekomcloud.second
  }
}
/*=================================
PEERING OUTPUTS
==================================*/

output "peering_connection_ids" {
  value = { for k, v in module.peering-requester.peering_connections : k => v.id }
}

output "peering_accepter_ids" {
  value = { for k, v in module.peering-accepter.peering_accepters : k => v.id }
}
