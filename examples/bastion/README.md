# Bastion

Configuration in this directory creates:
- Bastion Host
- Security group with 6 default module rules
- VPC
- Subnet
- Key pair
- Elastic IP

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

## Providers

No providers.

## Modules

| Name                                                  | Source                                                      | Version |
|-------------------------------------------------------|-------------------------------------------------------------|---------|
| <a name="module_dns"></a> [bastion](#module\_bastion) | "opentelekomcloud/modules/opentelekomcloud/modules/bastion" | 0.0.1   |

## Resources

| Name                                                                               | Source                                                                                          |
|------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| <a name="resource_vpc"></a> [opentelekomcloud_vpc_v1](#resource\_vpc)              | "opentelekomcloud/terraform-provider-opentelekomcloud/blob/devel/opentelekomcloud/services/vpc" |
| <a name="resource_subnet"></a> [opentelekomcloud_vpc_subnet_v1](#resource\_subnet) | "opentelekomcloud/terraform-provider-opentelekomcloud/blob/devel/opentelekomcloud/services/vpc" |
## Inputs

No inputs.

## Outputs

| Name                                                                                                | Description                |
|-----------------------------------------------------------------------------------------------------|----------------------------|
| <a name="output_bastion_sg_id"></a> [security_group_id](#output\_bastion_sg_id)                     | Bastion security group ID. |
| <a name="output_bastion_address"></a> [bastion_external_address](#output\_bastion_external_address) | Bastion EIP.               |
| <a name="output_bastion_address"></a> [bastion_private_address](#output\_bastion_private_address)   | Bastion private address.   |
