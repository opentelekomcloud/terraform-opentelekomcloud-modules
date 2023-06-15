/*=================================
OUTPUTS
==================================*/
output "bastion_sg_id" {
  value = opentelekomcloud_networking_secgroup_v2.secgroup_bastion.id
}

output "bastion_address" {
  value = opentelekomcloud_networking_floatingip_v2.myip.address
}

output "bastion_private_address" {
  value = opentelekomcloud_compute_instance_v2.bastion.access_ip_v4
}
