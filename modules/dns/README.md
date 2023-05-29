# OpenTelekomCloud DNS Terraform module

![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/opentelekomcloud/terraform-opentelekomcloud-modules)
![Build (latest by date)](https://zuul.otc-service.com/api/tenant/eco/badge?project=opentelekomcloud/terraform-opentelekomcloud-modules&pipeline=check&branch=main)

_This module aims to create a module to create public or private DNS zones with records on OpenTelekomCloud provider._

_These types of resources are supported:_

* [Zone](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/dns_zone_v2)
* [Record](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/dns_recordset_v2)


[//]: # (## Where to find module documentations)

[//]: # (You can find different documentations versioned by terraform registry [here]&#40;https://registry.terraform.io/modules/terraform-opentelekomcloud-modules/dns/latest&#41;.)

## Terraform versions

Terraform 0.13 or higher.

## Usage

```hcl
dns_settings = {
  private = {
    name        = "another.opentelekomcloud"
    description = "Example Zone other"
    type        = "private"
    ttl         = 450
    email       = "email_oth@example.com"
    vpc_id      = "REWRITE_IN_LOCALS"
    region      = "REWRITE_IN_LOCALS"
    tags        = {}
    recordsets  = [
      {
        subdomain   = "cname"
        type        = "cname"
        description = "cname record set"
        ttl         = 3600
        records     = ["server1.example.com."]
        tags        = {
          "Recordset" = "private_cname"
        }
      },
    ]
  }
}

data "opentelekomcloud_identity_project_v3" "current" {}

data "opentelekomcloud_vpc_subnet_v1" "subnet"  {
  name = "my-subnet"
}

locals {
  local_dns_settings = {
    private_one = {
      name        = var.dns_settings["private"]["name"]
      description = var.dns_settings["private"]["description"]
      type        = var.dns_settings["private"]["type"]
      ttl         = var.dns_settings["private"]["ttl"]
      email       = var.dns_settings["private"]["email"]
      vpc_id      = data.opentelekomcloud_vpc_subnet_v1.subnet.vpc_id
      region      = data.opentelekomcloud_identity_project_v3.current.region
      tags        = var.dns_settings["private"]["tags"]
      recordsets  = var.dns_settings["private"]["recordsets"]
    }
  }
  dns_settings = merge(var.dns_settings, local.local_dns_settings)
}

module "dns" {
  source = "../../modules/dns"
  
  dns_zone_settings = local.local_dns_settings
  default_tags_set  = var.default_tags_set
}
```

## Examples

* [DNS](https://github.com/opentelekomcloud/terraform-opentelekomcloud-modules/blob/main/examples/dns)

## Requirements

| Name                                                                                           | Version    |
| ---------------------------------------------------------------------------------------------- | ---------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform)                      | >= 0.12.21 |
| <a name="requirement_opentelekomcloud"></a> [opentelekomcloud](#requirement\_opentelekomcloud) | >= 1.23.9  |

## Modules

No modules.

## Resources

| Name                                                                                                                                                         | Type     | Count     |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-----------|
| [opentelekomcloud_dns_zone_v2.zone](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/dns_zone_v2)             | resource | 1 or more |
| [opentelekomcloud_dns_recordset_v2.record](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/dns_recordset_v2) | resource | 1 or more |

## Inputs

| Name                                                                                 | Description                                    | Type          | Default | Required |
|--------------------------------------------------------------------------------------|------------------------------------------------|---------------|---------|:--------:|
| <a name="input_dns_zone_settings"></a> [dns_zone_settings](#input\dns_zone_settings) | Map with necessary for DNS zone settings.      | `map(object)` | `{}`    |   yes    |
| <a name="input_default_tags_set"></a> [default_tags_set](#input\default_tags_set)    | Set of default tags for most of all resources. | `map(string)` | `{}`    |    no    |

### dns_zone_settings

| Name                                                                                 | Description                                           | Type           | Default | Required |
|--------------------------------------------------------------------------------------|-------------------------------------------------------|----------------|---------|:--------:|
| <a name="input_name"></a> [dns_zone_settings.name](#input\name)                      | Zone domain name.                                     | `string`       | `null`  |   yes    |
| <a name="input_description"></a> [dns_zone_settings.description](#input\description) | Zone description.                                     | `string`       | `""`    |    no    |
| <a name="input_type"></a> [dns_zone_settings.type](#input\type)                      | Type of the zone.                                     | `string`       | `null`  |   yes    |
| <a name="input_ttl"></a> [dns_zone_settings.ttl](#input\ttl)                         | Caching period of the SOA record set (in seconds).    | `number`       | `null`  |   yes    |
| <a name="input_email"></a> [dns_zone_settings.email](#input\email)                   | Email address of the administrator managing the zone. | `string`       | `null`  |   yes    |
| <a name="input_vpc_id"></a> [dns_zone_settings.vpc_id](#input\vpc_id)                | Id of VPC.                                            | `string`       | `""`    |    no    |
| <a name="input_region"></a> [dns_zone_settings.region](#input\region)                | Name of the current region.                           | `string`       | `""`    |    no    |
| <a name="input_tags"></a> [dns_zone_settings.tags](#input\tags)                      | Tags (will be merged with default_tags_set).          | `map(any)`     | `{}`    |    no    |
| <a name="input_recordsets"></a> [dns_zone_settings.recordsets](#input\recordsets)    | List of recordsets.                                   | `list(object)` | `[]`    |    no    |

### dns_zone_settings.recordsets

| Name                                                                                                                | Description                                  | Type           | Default | Required |
|---------------------------------------------------------------------------------------------------------------------|----------------------------------------------|----------------|---------|:--------:|
| <a name="input_subdomain"></a> [dns_zone_settings.recordsets.subdomain](#input\subdomain)                           | Name of the record subdomain.                | `string`       | `null`  |   yes    |
| <a name="input_recordset_type"></a> [dns_zone_settings.recordsets.type](#input\recordset_type)                      | Type of the record set.                      | `string`       | `null`  |   yes    |
| <a name="input_recordset_description"></a> [dns_zone_settings.recordsets.description](#input\recordset_description) | Description of the record set.               | `string`       | `null`  |    no    |
| <a name="input_recordset_ttl"></a> [dns_zone_settings.recordsets.ttl](#input\recordset_ttl)                         | Ttl of the record set.                       | `number`       | `null`  |    no    |
| <a name="input_recordset_records"></a> [dns_zone_settings.recordsets.records](#input\recordset_records)             | List of records.                             | `list(string)` | `[]`    |   yes    |
| <a name="input_recordsets_tags"></a> [dns_zone_settings.recordsets.tags](#input\recordsets_tags)                    | Tags (will be merged with default_tags_set). | `map(any)`     | `{}`    |    no    |

## Outputs

| Name                                                         | Description            |
|--------------------------------------------------------------|------------------------|
| <a name="zones"></a> [dns\zone](#output\zone)                | The all DNS zones      |
| <a name="recordsets"></a> [dns\recordset](#output\recordset) | The all DNS recordsets |

## Authors

Module managed by [Anton Sidelnikov](https://github.com/anton-sidelnikov).

## License

Apache 2 Licensed. See LICENSE for full details.
