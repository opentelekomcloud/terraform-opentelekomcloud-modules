# OpenTelekomCloud VPC Terraform module

![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/opentelekomcloud/terraform-opentelekomcloud-modules)
![Build (latest by date)](https://zuul.otc-service.com/api/tenant/eco/badge?project=opentelekomcloud/terraform-opentelekomcloud-modules&pipeline=check&branch=main)

_This module aims to create a module to create VPC with subnets on OpenTelekomCloud provider._

_These types of resources are supported:_

* [VPC](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/vpc_v1)
* [Subnet](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/vpc_subnet_v1)


## Where to find module documentations

You can find different documentations versioned by terraform registry [here](https://registry.terraform.io/modules/opentelekomcloud/modules/opentelekomcloud/latest).

## Terraform versions

Terraform 0.13 and higher.

## Usage

```hcl

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

vpc_settings = {
  first_vpc = {
    description = "desc 1"
    cidr        = "10.0.0.0/8"
    snat_enable = "true"
    tags        = {
      "Environment" = "test"
    }
    subnets = [
      {
        name          = "example_opentelekomcloud_1_subnet_1"
        dns_list      = ["8.8.8.8", "1.1.1.1"]
        gateway_ip    = "10.0.0.1"
        cidr          = "10.0.0.0/16"
        description   = "desc subnet 1 of vpc 1"
        primary_dns   = "8.8.8.8"
        secondary_dns = "1.1.1.1"
        tags          = {
          "Resource" = "first-of-vpc-1"
        }
      },
    ]
  }
}

module "vpc" {
  source = "opentelekomcloud/modules/opentelekomcloud//modules/vpc"

  vpc_settings     = var.vpc_settings
  default_tags_set = var.default_tags_set
}
```


## Examples

* [vpc](https://github.com/opentelekomcloud/terraform-opentelekomcloud-modules/blob/main/examples/vpc)

## Requirements

| Name                                                                                           | Version   |
|------------------------------------------------------------------------------------------------|-----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform)                      | >= 0.13.0 |
| <a name="requirement_opentelekomcloud"></a> [opentelekomcloud](#requirement\_opentelekomcloud) | >= 1.35.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                   | Type     |
|--------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| [opentelekomcloud_vpc_v1.vpc](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/vpc_v1)                  | resource |
| [opentelekomcloud_vpc_subnet_v1.subnet](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/vpc_subnet_v1) | resource |

## Inputs

| Name                                                                                   | Description                                    | Type          | Default | Required |
|----------------------------------------------------------------------------------------|------------------------------------------------|---------------|---------|:--------:|
| <a name="input_vpc_settings"></a> [vpc\_settings](#input\_vpc\_settings)               | Map with necessary VPC settings.               | `map(object)` | `{}`    |   yes    |
| <a name="input_default_tags_set"></a> [default\_tags\_set](#input\_default\_tags\_set) | Set of default tags for most of all resources. | `map(string)` | `{}`    |    no    |

### vpc_settings

| Name                                                                                 | Description                                                       | Type           | Default | Required |
|--------------------------------------------------------------------------------------|-------------------------------------------------------------------|----------------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr)                        | Specifies the available IP address ranges for subnets in the VPC. | `string`       | `null`  |   yes    |
| <a name="input_description"></a> [description](#input\_description)   | Provides supplementary information about the VPC.                 | `string`       | `null`  |    no    |
| <a name="input_snat_enable"></a> [snat_enable](#input\_snat\_enable) | Specifies whether the shared SNAT function is enabled.            | `bool`         | `true`  |    no    |
| <a name="input_tags"></a> [tags](#input\_tags)                        | Tags (will be merged with default_tags_set).                      | `map(any)`     | `{}`    |    no    |
| <a name="input_subnets"></a> [subnets](#input\_subnets)               | List of subnets.                                                  | `list(object)` | `[]`    |    no    |

### vpc_settings.subnets

| Name                                                                               | Description                                                                                                             | Type           | Default | Required |
|------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------|----------------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name)                                     | Specifies the subnet name.                                                                                              | `string`       | `null`  |   yes    |
| <a name="input_dns_list"></a> [dns_list](#input\_dns\_list)                        | Specifies the DNS server address list of a subnet. This field is required if you need to use more than two DNS servers. | `list(string)` | `null`  |    no    |
| <a name="input_gateway_ip"></a> [gateway_ip](#input\_gateway\_ip)                  | Specifies the gateway of the subnet. If not set then gateway ip will be set based on VPC CIDR.                          | `string`       | `""`    |    no    |
| <a name="input_subnet_cidr"></a> [cidr](#input\_subnet\_cidr)                      | Specifies the subnet CIDR block. If not set then VPC CIDR will be used.                                                 | `string`       | `""`    |    no    |
| <a name="input_dhcp_enable"></a> [dhcp_enable](#input\_dhcp\_enable)               | Specifies whether DHCP is enabled for the subnet.                                                                       | `bool`         | `true`  |    no    |
| <a name="input_subnet_description"></a> [description](#input\_subnet\_description) | Provides supplementary information about the subnet.                                                                    | `string`       | `null`  |    no    |
| <a name="input_primary_dns"></a> [primary_dns](#input\_primary\_dns)               | Specifies the IP address of DNS server 1 on the subnet.                                                                 | `string`       | `null`  |    no    |
| <a name="input_secondary_dns"></a> [secondary_dns](#input\_secondary\_dns)         | Specifies the IP address of DNS server 2 on the subnet.                                                                 | `string`       | `null`  |    no    |
| <a name="input_ntp_addresses"></a> [ntp_addresses](#input\_ntp\_addresses)         | Specifies the NTP server address configured for the subnet. Multiple IP addresses must be separated using commas (,).   | `string`       | `null`  |    no    |
| <a name="input_subnet_tags"></a> [tags](#input\_subnet\_tags)                      | Tags (will be merged with default_tags_set).                                                                            | `map(any)`     | `{}`    |    no    |

## Outputs

| Name                                                   | Description     |
|--------------------------------------------------------|-----------------|
| <a name="output_vpc"></a> [vpc](#output\_vpc)          | The all VPC     |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | The all Subnets |


## Authors

Module managed by [Anton Sidelnikov](https://github.com/anton-sidelnikov).

## License

Apache 2 Licensed. See LICENSE for full details.
