# Trigger Module Example

This module is used to create a trigger

## Example Usage
```

data "ibm_resource_group" "resource_group" {
  name = var.resource_group
}

module "rule" {
  source = "terraform-ibm-modules/function/ibm//modules/trigger"

  namespace_name = var.namespace_name
  provision_namespace = true
  resource_group_id = data.ibm_resource_group.resource_group.id
  trigger_name = var.trigger_name
  namespace = var.namespace
  feed = var.feed
  user_defined_annotations = var.user_defined_annotations
  user_defined_parameters = var.user_defined_parameters
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| provision_namespace| Option whether to provision namespace | boolean | false | no |
| namespace_name | Namespace to which the rule is attached | string | n/a | yes |
| namespace_description | Namespace Description | string | n/a | no |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| trigger_name | The name of rule | string | n/a | yes |
| feed | Trigger feed | list(object{<br>name = string<br>parameters = string}) | n/a | no |
| user\_defined\_annotations | Annotation values in KEY VALUE format. | string | "[]" | no |
| user\_defined\_parameters | Parameters values in KEY VALUE format. Parameter bindings included in the context passed to the trigger. | string | "[]" | no |

## feed variable inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| name| Trigger Feed ACTION_NAME | string | n/a | yes |
| parameters| Parameters definitions in key value format. Parameter bindings are included in the context and passed when the action is invoked. | string | "[]" | no |
## Outputs

| Name | Description |
|------|-------------|
| name | The name of trigger |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->