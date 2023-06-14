/*=================================
BASTION MODULES
==================================*/
module "bastion" {
  source = "../../modules/bastion"
  subnet = {
    id   = opentelekomcloud_vpc_subnet_v1.subnet_1.id
    cidr = opentelekomcloud_vpc_subnet_v1.subnet_1.cidr
  }
  user_data = file("default_cloud_init.sh")
  default_tags_set = {
    "Managed_by" = "terraform"
  }
}

resource "opentelekomcloud_vpc_v1" "vpc_1" {
  name = "simple-vpc"
  cidr = "192.168.0.0/16"
}

resource "opentelekomcloud_vpc_subnet_v1" "subnet_1" {
  name              = "simple-subnet"
  description       = "some description"
  cidr              = "192.168.55.0/24"
  gateway_ip        = "192.168.55.1"
  vpc_id            = opentelekomcloud_vpc_v1.vpc_1.id
  availability_zone = "eu-de-02"
  ntp_addresses     = "10.100.0.33,10.100.0.34"
}
