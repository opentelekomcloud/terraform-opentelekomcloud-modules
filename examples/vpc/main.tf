/*=================================
VPC VARIABLES
==================================*/

variable "vpc_settings" {
  default     = {}
  description = "Main settings for VPC."
}

variable "default_tags_set" {
  default     = {
    "Managed_by"  = "terraform"
  }
  description = "Set of default tags for most of all resources"
}

/*=================================
VPC MODULE
==================================*/

module "vpc" {
  source = "../../modules/vpc"

  vpc_settings     = var.vpc_settings
  default_tags_set = var.default_tags_set
}

/*=================================
VPC OUTPUTS
==================================*/

output "vpc_ids" {
  value = { for k, v in module.vpc.vpc : k => v.id }
}

output "subnet_ids" {
  value = { for k, v in module.vpc.subnet : k => v.id }
}
