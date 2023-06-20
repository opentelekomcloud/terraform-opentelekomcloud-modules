/*=================================
BASTION MODULES
==================================*/
module "bastion" {
  source = "../../modules/bastion"
  subnet = {
    id   = module.vpc.subnet["simple_vpc_subnet.0"].id
    cidr = module.vpc.subnet["simple_vpc_subnet.0"].cidr
  }
  user_data = file("default_cloud_init.sh")
  default_tags_set = {
    "Managed_by" = "terraform"
  }
}

/*=================================
VPC MODULE
==================================*/

module "vpc" {
  source       = "../../modules/vpc"
  vpc_settings = var.vpc_settings
}

/*=================================
VARIABLES
==================================*/
variable "vpc_settings" {
  default = {}
}

/*=================================
BASTION OUTPUTS
==================================*/
output "bastion_sg_id" {
  value = module.bastion.bastion_sg_id
}

output "bastion_address" {
  value = module.bastion.bastion_address
}

output "bastion_private_address" {
  value = module.bastion.bastion_private_address
}
