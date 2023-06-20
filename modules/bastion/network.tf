/*=================================
RESOURCES
==================================*/
resource "opentelekomcloud_networking_floatingip_v2" "myip" {
  timeouts {
    create = "5m"
    delete = "5m"
  }
}

resource "opentelekomcloud_networking_floatingip_associate_v2" "jumphost_eip_association" {
  floating_ip = opentelekomcloud_networking_floatingip_v2.myip.address
  port_id     = opentelekomcloud_compute_instance_v2.bastion.network[0].port
}

resource "opentelekomcloud_networking_secgroup_v2" "secgroup_bastion" {
  name                 = "secgroup_bastion"
  delete_default_rules = true
  description          = "My bastion security group"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "bastion_sg_rules" {
  for_each          = { for idx, value in local.sg_list : idx => value }
  direction         = each.value["direction"]
  ethertype         = each.value["ethertype"]
  protocol          = each.value["protocol"]
  port_range_min    = each.value["port_range_min"]
  port_range_max    = each.value["port_range_max"]
  description       = each.value["description"]
  security_group_id = opentelekomcloud_networking_secgroup_v2.secgroup_bastion.id
  remote_group_id   = each.value["type"] == "sg" ? opentelekomcloud_networking_secgroup_v2.secgroup_bastion.id : ""
}
