# Trigger Module Example

This example illustrates how to use the `trigger` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| is_new_namespace| Option whether to provision namespace | boolean | true | no |
| namespace_name | Namespace to which the rule is attached | string | n/a | yes |
| namespace_description | Namespace Description | string | n/a | no |
| is_new_trigger| Option whether to provision namespace | boolean | true | no |
| trigger_name | The name of trigger | string | n/a | yes |
| trigger_feed | Trigger feed | list(object{<br>name = string<br>parameters = string}) | n/a | no |
| trigger_user\_defined\_annotations | Annotation values in KEY VALUE format. | string | "[]" | no |
| trigger_user\_defined\_parameters | Parameters values in KEY VALUE format. Parameter bindings included in the context passed to the trigger. | string | "[]" | no |

## feed variable inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| name| Trigger Feed ACTION_NAME | string | n/a | yes |
| parameters| Parameters definitions in key value format. Parameter bindings are included in the context and passed when the action is invoked. | string | "[]" | no |

## Outputs

| Name | Description |
|------|-------------|
| namespace_name | The name of namespace |
| trigger_name | The name of trigger |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.