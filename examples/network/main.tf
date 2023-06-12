/*=================================
NETWORK VARIABLES
==================================*/

variable "network_settings" {
  default     = {}
  description = "Main settings for private DNS."
}

/*=================================
NETWORK MODULES
==================================*/

module "network" {
  source = "../../modules/network"

  network_settings = var.network_settings
}

/*=================================
NETWORK OUTPUTS
==================================*/

output "router_ids" {
  value = { for k, v in module.network.router : k => v.id }
}

output "network_ids" {
  value = { for k, v in module.network.network : v.name => v.id }
}

output "subnet_ids" {
  value = { for k, v in module.network.subnet : v.name => v.id }

}
