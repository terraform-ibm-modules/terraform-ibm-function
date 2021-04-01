# Action Module Example

This module is used to create an action and optionally provision a namespace

## Example Usage
```

data "ibm_resource_group" "resource_group" {
  name = var.resource_group
}

module "action" {
  source = "terraform-ibm-modules/function/ibm//modules/action"

  action_name               = var.action_name
  namespace_name            = var.namespace_name
  resource_group_id         = data.ibm_resource_group.resource_group.id
  provision_namespace       = var.provision_namespace
  create_package            = var.create_package
  package_name              = var.package_name
  exec                      = var.exec
  limits                    = var.limits
  publish                   = var.publish
  user_defined_annotations  = var.user_defined_annotations
  user_defined_parameters   = var.user_defined_parameters

}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| action_name | Name of action. | string | n/a | yes |
| namespace_name | Namespace to which the rule is attached | string | n/a | yes |
| provision_namespace| Option whether to provision namespace | boolean | false | no |
| namespace_description | Namespace Description | string | n/a | no |
| create_package | Option whether to create a new package | bool | false | no |
| package_name | Name of package | string | n/a | no |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| exec | Execution Info | list(object{<br>image = string<br>init = string <br>code = string<br>code_path = string<br>kind = string<br>main = string<br>components = list(string)}) | n/a | yes |
| limits | Action runtime limits | list(object{<br>timeout = number<br>memory = number<br>log_size = number}) | n/a | no |
| publish | Action visibility | string | n/a | no |
| user\_defined\_annotations | Annotation values in KEY VALUE format. | string | "[]" | no |
| user\_defined\_parameters | Parameters values in KEY VALUE format. Parameter bindings included in the context passed to the trigger. | string | "[]" | no |

## exec variable inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| image| When using the blackbox executable, the name of the container image name. | string | n/a | no |
| init| When using nodejs, the optional zipfile reference | string | n/a | no |
| code| When not using the blackbox executable, the code to execute | string | n/a | no |
| code_path| When not using the blackbox executable, the file path of code to execute and it supports only .zip extension to create the action. | string | n/a | no |
| kind| The type of action. You can find supported kinds in the [IBM Cloud Functions docs](https://cloud.ibm.com/docs/openwhisk?topic=cloud-functions-runtimes) | string | n/a | yes |
| main| The name of the action entry point (function or fully-qualified method name, when applicable). | string | n/a | no |
| components| The list of fully qualified actions | list(string) | n/a | no |

## limits variable inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| timeout| When using the blackbox executable, the name of the container image name. | number | 60000 | no |
| memory| When using nodejs, the optional zipfile reference | number | 256 | no |
| log_size| When not using the blackbox executable, the code to execute | number | 10 | no |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of action |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->