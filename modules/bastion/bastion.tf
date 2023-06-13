/*=================================
RESOURCES
==================================*/
resource "opentelekomcloud_compute_instance_v2" "bastion" {
  name            = var.instance_name
  image_name      = data.opentelekomcloud_images_image_v2.current_image.name
  flavor_id       = var.instance_type
  key_pair        = opentelekomcloud_compute_keypair_v2.pair.name
  security_groups = [opentelekomcloud_networking_secgroup_v2.secgroup_bastion.name]
  availability_zone = var.availability_zone

  user_data = var.cloud_init != "" ? var.cloud_init : templatefile("${path.module}/default_cloud_init.sh", {
    cidr            = var.subnet.cidr,
    bastion_address = local.bastion_local_ip,
  })

  network {
    uuid           = var.subnet.id
    access_network = true
  }

  block_device {
    volume_size           = var.bastion_volume
    destination_type      = "volume"
    delete_on_termination = true
    source_type           = "image"
    uuid                  = data.opentelekomcloud_images_image_v2.current_image.id
  }

  tags = var.tags
}

resource "opentelekomcloud_compute_keypair_v2" "pair" {
  name       = var.key_pair.key_name
  public_key = var.key_pair.public_key
}

data "opentelekomcloud_images_image_v2" "current_image" {
  name        = var.bastion_image
  most_recent = true
}
