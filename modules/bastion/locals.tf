/*=================================
LOCALS
==================================*/
locals {
  sg-list = tolist(var.sg-rules)
}

locals {
  bastion_local_ip = cidrhost(var.subnet.cidr, 2)
}
