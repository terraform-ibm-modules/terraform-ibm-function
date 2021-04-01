# Rule Module Example

This module is used to create a rule

## Example Usage
```

data "ibm_resource_group" "resource_group" {
  name = var.resource_group
}

module "rule" {
  source = "terraform-ibm-modules/function/ibm//modules/rule"

  namespace_name = var.namespace_name
  provision_namespace = true
  resource_group_id = data.ibm_resource_group.resource_group.id
  rule_name = var.rule_name
  namespace = var.namespace
  trigger_name = var.trigger_name
  action_name = var.action_name
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
| rule_name | The name of rule | string | n/a | yes |
| trigger\_name | The name of trigger | string | n/a | yes |
| action\_name | The name of action | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of rule |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->