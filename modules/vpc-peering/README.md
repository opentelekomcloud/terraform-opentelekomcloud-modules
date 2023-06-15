# OpenTelekomCloud VPC Peering Terraform module

![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/opentelekomcloud/terraform-opentelekomcloud-modules)
![Build (latest by date)](https://zuul.otc-service.com/api/tenant/eco/badge?project=opentelekomcloud/terraform-opentelekomcloud-modules&pipeline=check&branch=main)

_This module aims to create a module to create and accept peering connection on OpenTelekomCloud provider._

_These types of resources are supported:_

* [Connection](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/vpc_peering_v2)
* [Accepter](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/vpc_peering_accepter_v2)


## Where to find module documentations

You can find different documentations versioned by terraform registry [here](https://registry.terraform.io/modules/opentelekomcloud/modules/opentelekomcloud/latest).

## Terraform versions

Terraform 0.13 or higher.

## Usage

```hcl
requester_vpc_peering_settings = {
  "REQUESTER_PROJECT_1_TO_ACCEPTER_PROJECT_1" = {
    peer_tenant_id = "5dd3c0b24cdc4d31952c49589182a80d"
    peer_vpc_id    = "a82d8c31-1f1b-4d55-bd45-e01ec3de417c"
    vpc_id         = "a82d8c31-1f1b-8889-bd45-e01ec3de417c"
  }
  "REQUESTER_PROJECT_2_TO_ACCEPTER_PROJECT_2" = {
    peer_tenant_id = "5dd3c0b24cdc4d31952c49589182a90d"
    peer_vpc_id    = "a82d8c31-t6nh-4d55-bd45-e01ec3de417c"
    vpc_id         = "a82d8c31-1f1b-8889-bd45-e01ec3de417c"
  }
}

accepter_vpc_peering_settings = {
  "ACCEPTER_PROJECT_1-WITH-REQUESTER_PROJECT_1" = {
    peer_vpc_connection_id = "3a9f8c14-a523-4736-beb6-b6275a52388a"
    is_accept              = true
  }
}

variable "requester_vpc_peering_settings" {
  default     = {}
  description = "Map of peering properties"
}

variable "accepter_vpc_peering_settings" {
  default     = {}
  description = "Map of peering accepter properties"
}

variable "main_vpc" {
  default     = "subnet-do-not-delete-pls"
  description = "Subnet for Peering."
}

module "peering" {
  source = "opentelekomcloud/modules/opentelekomcloud//modules/vpc-peering"

  requester_vpc_peering_settings = var.requester_vpc_peering_settings
  accepter_vpc_peering_settings  = var.accepter_vpc_peering_settings
}
```

## Examples

* [vpc-peering](https://github.com/opentelekomcloud/terraform-opentelekomcloud-modules/blob/main/examples/vpc-peering)

## Requirements

| Name                                                                                           | Version   |
| ---------------------------------------------------------------------------------------------- |-----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform)                      | >= 0.13.0 |
| <a name="requirement_opentelekomcloud"></a> [opentelekomcloud](#requirement\_opentelekomcloud) | >= 1.23.9 |

## Resources

| Name                                                                                                                                                                                                       | Type     | Count     |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-----------|
| [opentelekomcloud_vpc_peering_connection_v2.peering-connection](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/vpc_peering_v2)                            | resource | 1 or more |
| [opentelekomcloud_vpc_peering_connection_accepter_v2.peering-connection-accepter](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/vpc_peering_accepter_v2) | resource | 1 or more |

## Inputs

| Name                                                                                                                            | Description                       | Type          | Default | Required |
|---------------------------------------------------------------------------------------------------------------------------------|-----------------------------------|---------------|---------|:--------:|
| <a name="input_requester_vpc_peering_settings"></a> [requester_vpc_peering_settings](#input\_requester\_vpc\_peering\_settings) | Map of peering settings.          | `map(object)` | `{}`    |    no    |
| <a name="input_accepter_vpc_peering_settings"></a> [accepter_vpc_peering_settings](#input\_accepter\_vpc\_peering\_settings)    | Map of peering accepter settings. | `map(object)` | `{}`    |    no    |

### requester_vpc_peering_settings

| Name                                                                           | Description                                                                                    | Type     | Default | Required |
|--------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|----------|---------|:--------:|
| <a name="input_peer_tenant_id"></a> [peer_tenant_id](#input\_peer\_tenant\_id) | Specifies the ID of the project to which a VPC involved in the VPC peering connection belongs. | `string` | `null`  |   yes    |
| <a name="input_peer_vpc_id"></a> [peer_vpc_id](#input\_peer\_vpc\_id)          | Receiver VPC ID.                                                                               | `string` | `null`  |   yes    |
| <a name="input_vpc_id"></a> [vpc_id](#input\_vpc\_id)                          | Requester VPC ID.                                                                              | `string` | `null`  |   yes    |

### accepter_vpc_peering_settings

| Name                                                                                                    | Description                              | Type     | Default | Required |
|---------------------------------------------------------------------------------------------------------|------------------------------------------|----------|---------|:--------:|
| <a name="input_peer_vpc_connection_id"></a> [peer_vpc_connection_id](#input\_peer\_vpc\_connection\_id) | Specifies the VPC peering connection ID. | `string` | `null`  |   yes    |
| <a name="input_is_accept"></a> [is_accept](#input\_is\_accept)                                          | Accept connection or not                 | `bool`   | `null`  |   yes    |

## Outputs

| Name                                                                              | Description                     |
|-----------------------------------------------------------------------------------|---------------------------------|
| <a name="output_peering_connections"></a> [zones](#output\_peering\_connections)  | The all VPC Peering connections |
| <a name="output_peering_accepters"></a> [recordsets](#output\_peering\_accepters) | The all VPC Peering accepters   |

## Authors

Module managed by [Anton Sidelnikov](https://github.com/anton-sidelnikov).

## License

Apache 2 Licensed. See LICENSE for full details.
