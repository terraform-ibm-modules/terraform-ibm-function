# Rule Module Example

This example illustrates how to use the `rule` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| is_new_namespace| Option whether to provision namespace | boolean | true | no |
| namespace_name | Namespace to which the rule is attached | string | n/a | yes |
| namespace_description | Namespace Description | string | n/a | no |
| resource\_group\_name | Name of the resource group | string | n/a | yes |
| is_new_package | Option whether to create a new package | bool | false | no |
| package_name | Name of package | string | n/a | no |
| is_new_action | Option whether to create a new action | bool | true | no |
| action\_name | The name of action | string | n/a | yes |
| is_new_trigger | Option whether to create a new trigger | bool | true | no |
| trigger\_name | The name of trigger | string | n/a | yes |
| is_new_rule | Option whether to create a new rule | bool | true | no |
| rule_name | Name of the rule | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| namespace_name | The name of namespace |
| action_name | The name of action |
| trigger_name | The name of trigger |
| rule_name | The name of rule |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.