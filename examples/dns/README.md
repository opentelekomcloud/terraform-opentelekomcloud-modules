# DNS

Configuration in this directory creates a 2 Private DNS zones and one Public with a couple of record sets.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources which can cost money. Run `terraform destroy` when you don't need these resources.

## Requirements

| Name                                                                                           | Version   |
| ---------------------------------------------------------------------------------------------- |-----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform)                      | >= 0.13.0 |
| <a name="requirement_opentelekomcloud"></a> [opentelekomcloud](#requirement\_opentelekomcloud) | >= 1.23.9 |

## Modules

| Name                                          | Source                                                   | Version |
|-----------------------------------------------|----------------------------------------------------------|---------|
| <a name="module_dns"></a> [dns](#module\_dns) | "opentelekomcloud/modules/opentelekomcloud//modules/dns" | 0.0.1   |

## Resources

| Name                                                                                                                                                                   | Type        | Count |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|-------|
| [opentelekomcloud_identity_project_v3.current](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/data-sources/identity_project_v3) | data-source | 1     |
| [opentelekomcloud_vpc_subnet_v1.subnete](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/data-sources/vpc_subnet_v1)             | data-source | 1     |

## Outputs

| Name                                                                                                    | Description                      |
|---------------------------------------------------------------------------------------------------------|----------------------------------|
| <a name="output_dns_zone_ids"></a> [dns\_zone\_ids](#output\_dns\_zone\_ids)                            | The Ids of created Zones         |
| <a name="output_dns_zone_recordsets_names"></a> [dns\_recordset\_names](#output\_dns\_recordset\_names) | The Names of created Record sets |
