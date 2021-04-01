# Action Module Example

This example illustrates how to use the `namespace` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| action | `create` a new namespace or `get` details of existing namespace | string | "create" | no |
| name | The name of namespace | string | n/a | yes |
| description | Namespace Description | string | n/a | yes |
| resource\_group\_name | Nane of the resource group | string | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.