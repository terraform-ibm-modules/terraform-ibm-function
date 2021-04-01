# Namespace Module Example

This module is used to create a namespace

## Example Usage
```

data "ibm_resource_group" "resource_group" {
  name = var.resource_group
}

module "namespace" {
  source = "terraform-ibm-modules/function/ibm//modules/namespace"

  action                    = var.action
  name                      = var.name
  description               = var.description
  resource_group_id         = data.ibm_resource_group.resource_group.id
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| action | `create` a new namespace or `get` details of existing namespace | string | "create" | no |
| name | The name of namespace | string | n/a | yes |
| description | Namespace Description | string | n/a | yes |
| resource\_group\_id | ID of the resource group | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of namespace |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->