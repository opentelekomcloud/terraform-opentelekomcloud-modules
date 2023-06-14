# VPC

Configuration in this directory creates a 2 VPC first with 2 subnets, and second with one.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

## Requirements

| Name                                                                                           | Version    |
|------------------------------------------------------------------------------------------------|------------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform)                      | >= 0.12.21 |
| <a name="requirement_opentelekomcloud"></a> [opentelekomcloud](#requirement\_opentelekomcloud) | >= 1.23.9  |

## Providers

No providers.

## Modules


| Name                                          | Source                                                   | Version |
|-----------------------------------------------|----------------------------------------------------------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | "opentelekomcloud/modules/opentelekomcloud//modules/vpc" | 0.0.3   |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name                                                                 | Description                |
|----------------------------------------------------------------------|----------------------------|
| <a name="output_vpc_ids"></a> [vpc\_ids](#output\_vpc\_ids)          | The Ids of created VPCs    |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | The Ids of created Subnets |
