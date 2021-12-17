# Package Module Example

This example illustrates how to use the `package` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| is_new_namespace| Option whether to provision namespace | boolean | true | no |
| namespace_name | Namespace to which the rule is attached | string | n/a | yes |
| namespace_description | Namespace Description | string | n/a | no |
| resource\_group\_name | Name of the resource group | string | n/a | yes |
| is_new_package | Option whether to create a new package | bool | true | no |
| package_name | Name of package | string | n/a | yes |
| publish | Package visibility | string | n/a | no |
| user\_defined\_annotations | Annotation values in KEY VALUE format | string | "[]" | no |
| user\_defined\_parameters | Parameters values in KEY VALUE format. Parameter bindings included in the context passed to the package. | string | "[]" | no |
| bind_package_name | Name of package to be binded. | string | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| namespace_name | The name of namespace |
| package_name | The name of package |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.