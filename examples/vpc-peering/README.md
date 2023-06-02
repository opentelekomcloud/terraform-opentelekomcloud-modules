# VPC Peering

Configuration in this directory creates a 2 Peering connections and one of them will be accepted in second project.
Second project aliased in `settings.tf` also you should know `project_ids` and `vpc_ids` of peered projects which put in `peering.auto.tfvars`.

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

| Name                                                                  | Source                                                           | Version |
|-----------------------------------------------------------------------|------------------------------------------------------------------|---------|
| <a name="module_vpc-peering"></a> [vpc-peering](#module\_vpc-peering) | "opentelekomcloud/modules/opentelekomcloud//modules/vpc-peering" | 0.0.2   |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name                                                                                                       | Description                      |
|------------------------------------------------------------------------------------------------------------|----------------------------------|
| <a name="output_peering_connection_ids"></a> [peering\_connection\_ids](#output\_peering\_connection\_ids) | The Ids of created Zones         |
| <a name="output_peering_accepter_ids"></a> [peering\_accepter\_ids](#output\_peering\_accepter\_ids)       | The Names of created Record sets |
