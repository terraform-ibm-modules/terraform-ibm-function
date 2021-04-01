# Package Module Example

This module is used to create a package

## Example Usage
```

data "ibm_resource_group" "resource_group" {
  name = var.resource_group
}

module "package" {
  source = "terraform-ibm-modules/function/ibm//modules/package"

  namespace_name = var.namespace_name
  provision_namespace = true
  resource_group_id = data.ibm_resource_group.resource_group.id
  package_name = var.package_name
  namespace = var.namespace
  publish = var.publish
  user_defined_annotations = var.user_defined_annotations
  user_defined_parameters = var.user_defined_parameters
  bind_package_name = var.bind_package_name
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
| package_name | The name of namespace | string | n/a | yes |
| publish | Package visibility | string | n/a | no |
| user\_defined\_annotations | Annotation values in KEY VALUE format | string | "[]" | no |
| user\_defined\_parameters | Parameters values in KEY VALUE format. Parameter bindings included in the context passed to the package. | string | "[]" | no |
| bind_package_name | Name of package to be binded. | string | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of package |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->