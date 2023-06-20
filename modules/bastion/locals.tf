/*=================================
LOCALS
==================================*/
locals {
  sg_list = tolist(var.sg_rules)
}

locals {
  bastion_local_ip = cidrhost(var.subnet.cidr, 2)
}
