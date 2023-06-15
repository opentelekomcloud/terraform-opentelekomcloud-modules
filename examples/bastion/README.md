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

## Modules

| Name                                                      | Source                                                      | Version |
|-----------------------------------------------------------|-------------------------------------------------------------|---------|
| <a name="module_bastion"></a> [bastion](#module\_bastion) | "opentelekomcloud/modules/opentelekomcloud/modules/bastion" | 0.0.3   |
| <a name="module_vpc"></a> [vpc](#module\_vpc)             | "opentelekomcloud/modules/opentelekomcloud//modules/vpc"    | 0.0.3   |

## Outputs

| Name                                                                                                | Description                |
|-----------------------------------------------------------------------------------------------------|----------------------------|
| <a name="output_bastion_sg_id"></a> [security_group_id](#output\_bastion_sg_id)                     | Bastion security group ID. |
| <a name="output_bastion_address"></a> [bastion_external_address](#output\_bastion_external_address) | Bastion EIP.               |
| <a name="output_bastion_address"></a> [bastion_private_address](#output\_bastion_private_address)   | Bastion private address.   |
