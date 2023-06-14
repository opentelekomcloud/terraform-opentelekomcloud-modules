# OpenTelekomCloud Bastion Terraform module

![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/opentelekomcloud/terraform-opentelekomcloud-modules)
![Build (latest by date)](https://zuul.otc-service.com/api/tenant/eco/badge?project=opentelekomcloud/terraform-opentelekomcloud-modules&pipeline=check&branch=main)

_This module aims to create a module to create SSH Bastion Host OpenTelekomCloud provider._

## Where to find module documentations

You can find different documentations versioned by terraform registry [here](https://registry.terraform.io/modules/opentelekomcloud/modules/opentelekomcloud/latest).

## Terraform versions

Terraform 0.13 or higher.

## Usage

```hcl
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

module "bastion" {
  source = "../../modules/bastion"
  subnet = {
    id   = opentelekomcloud_vpc_subnet_v1.subnet_1.id
    cidr = opentelekomcloud_vpc_subnet_v1.subnet_1.cidr
  }
  user_data = file("default_cloud_init.sh")
}
```

## Examples

* [Bastion](https://github.com/opentelekomcloud/terraform-opentelekomcloud-modules/blob/main/examples/bastion)

## Requirements

| Name                                                                                           | Version   |
| ---------------------------------------------------------------------------------------------- |-----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform)                      | >= 0.13.0 |
| <a name="requirement_opentelekomcloud"></a> [opentelekomcloud](#requirement\_opentelekomcloud) | >= 1.23.9 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                                                               | Type        | Count     |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|-----------|
| [opentelekomcloud_compute_instance_v2.bastion](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/compute_instance_v2)                                                | resource    | 1         |
| [opentelekomcloud_compute_keypair_v2.pair](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/compute_keypair_v2)                                                     | resource    | 1         |
| [opentelekomcloud_images_image_v2.current_image](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/data-sources/images_image_v2)                                               | data source | 1         |
| [opentelekomcloud_networking_floatingip_v2.myip](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/networking_floatingip_v2)                                         | resource    | 1         |
| [opentelekomcloud_networking_floatingip_associate_v2.jumphost_eip_association](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/networking_floatingip_associate_v2) | resource    | 1         |
 | [opentelekomcloud_networking_secgroup_v2.secgroup_bastion](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/networking_secgroup_v2)                                 | resource    | 1         |
| [opentelekomcloud_networking_secgroup_rule_v2.bastion_sg_rules](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/networking_secgroup_rule_v2)                       | resource    | 1 or more |

## Inputs

| Name                                                                              | Description                                           | Type           | Default                                                                                                                             | Required |
|-----------------------------------------------------------------------------------|-------------------------------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------------|:--------:|
| <a name="instance_type"></a> [instance\_type](#input\_instance\_type)             | Bastion host instance type.                           | `string`       | `s2.large.4`                                                                                                                        |    no    |
| <a name="instance_name"></a> [instance\_name](#input\_instance\_name)             | Bastion instance name.                                | `string`       | `bastion-host`                                                                                                                      |    no    |
 | <a name="bastion_image"></a> [bastion\_image](#input\_bastion\_image)             | Bastion instance image.                               | `string`       | `Standard_Ubuntu_22.04_latest`                                                                                                      |    no    |
 | <a name="availability_zone"></a> [availability\_zone](#input\_availability\_zone) | Bastion availability zone.                            | `string`       | `""`                                                                                                                                |    no    |
| <a name="bastion_volume"></a> [bastion\_volume](#input\_bastion\_volume)          | Bastion EVS volume size.                              | `numer`        | `20`                                                                                                                                |    no    |
| <a name="input_tags"></a> [default\_tags\_set](#input\_tags)                      | Tags.                                                 | `map(any)`     | `{}`                                                                                                                                |    no    |
| <a name="input_key_pair"></a> [key\_pair](#input\_key\_pair)                      | Bastion keypair.                                      | `object`       | [Default values](https://github.com/opentelekomcloud/terraform-opentelekomcloud-modules/tree/main/modules/bastion/variables.tf#L97) |    no    |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data)                   | The user data to provide when launching the instance. | `string`       | `""`                                                                                                                                |    no    |
| <a name="input_subnet"></a> [subnet](#input\_subnet)                              | Subnet information.                                   | `object`       | `null`                                                                                                                              |   yes    |
| <a name="input_sg_rules"></a> [sg\_rules](#input\_sg\_rules)                      | List of security group rules.                         | `list(object)` | [Default values](https://github.com/opentelekomcloud/terraform-opentelekomcloud-modules/tree/main/modules/bastion/variables.tf#L34) |    no    |


### subnet

| Name                                                         | Description  | Type           | Default | Required |
|--------------------------------------------------------------|--------------|----------------|---------|:--------:|
| <a name="input_subnet_cidr"></a> [subnet.cidr](#input\_cidr) | Subnet CIDR. | `string`       | `null`  |   yes    |
| <a name="input_subnet_id"></a> [subnet.id](#input\_id)       | Subnet ID.   | `string`       | `null`  |   yes    |

### sg-rules

| Name                                                                                          | Description                                                              | Type     | Default | Required |
|-----------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|----------|---------|:--------:|
| <a name="input_direction"></a> [sg\-rules.direction](#input\_direction)                       | The direction of the rule, valid values are `ingress` or `egress`.       | `string` | `null`  |   yes    |
| <a name="input_ethertype"></a> [sg\-rules.ethertype](#input\ethertype)                        | The layer 3 protocol type, valid values are `IPv4` or `IPv6`.            | `string` | `null`  |   yes    |
| <a name="input_description"></a> [sg\-rules.description](#input\_description)                 | The description of the rule.                                             | `string` | `null`  |    no    |
| <a name="input_type"></a> [sg\-rules.type](#input\_type)                                      | Specifying this parameter as `sg` will create security group level rule. | `string` | `null`  |    no    |
| <a name="input_protocol"></a> [sg\-rules.protocol](#input\_protocol)                          | The layer 4 protocol type.                                               | `string` | `null`  |    no    |
| <a name="input_port_range_min"></a> [sg\-rules.port_range_min](#input\_port_range_min)        | The lower part of the allowed port range.                                | `string` | `null`  |    no    |
| <a name="input_port_range_max"></a> [sg\-rules.port_range_max](#input\_port_range_max)        | The higher part of the allowed port range.                               | `string` | `null`  |    no    |
| <a name="intput_remote_ip_prefix"></a> [sg\-rules.remote_ip_prefix](#input\_remote_ip_prefix) | The remote CIDR.                                                         | `string` | `null`  |    no    |

## Outputs

| Name                                                                                                | Description                |
|-----------------------------------------------------------------------------------------------------|----------------------------|
| <a name="output_bastion_sg_id"></a> [security_group_id](#output\_bastion_sg_id)                     | Bastion security group ID. |
| <a name="output_bastion_address"></a> [bastion_external_address](#output\_bastion_external_address) | Bastion EIP.               |
| <a name="output_bastion_address"></a> [bastion_private_address](#output\_bastion_private_address)   | Bastion private address.   |

## Authors

Module managed by [Artem Lifshits](https://github.com/artem-lifshits).

## License

Apache 2 Licensed. See LICENSE for full details.
