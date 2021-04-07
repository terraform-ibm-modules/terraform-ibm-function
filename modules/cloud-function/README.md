# Cloud-Function Module Example

This module is used to create an IBM Cloud function with all the necesaary resources such as action, triggers, rule(Which connects the action with trigger) and optionally provision namespace and/or package

## Example Usage
```

data "ibm_resource_group" "resource_group" {
  name = var.resource_group
}

module "cloud-function" {
  source = "terraform-ibm-modules/function/ibm//modules/action"

  action_name                        = var.action_name
  namespace_name                     = var.namespace_name
  resource_group_id                  = data.ibm_resource_group.resource_group.id
  provision_namespace                = var.provision_namespace
  create_package                     = var.create_package
  package_name                       = var.package_name
  package_publish                    = var.package_publish
  package_user_defined_annotations   = var.package_user_defined_annotations
  package_user_defined_parameters    = var.package_user_defined_parameters
  action_exec                        = var.action_exec
  action_limits                      = var.action_limits
  action_publish                     = var.action_publish
  action_user_defined_annotations    = var.action_user_defined_annotations
  action_user_defined_parameters     = var.action_user_defined_parameters
  trigger_name                       = var.trigger_name
  trigger_user_defined_annotations   = var.trigger_user_defined_annotations
  trigger_user_defined_parameters    = var.trigger_user_defined_parameters 

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
| package\_publish | Package visibility | string | n/a | no |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| action_exec | Execution Info | list(object{<br>image = string<br>init = string <br>code = string<br>code_path = string<br>kind = string<br>main = string<br>components = list(string)}) | n/a | yes |
| action_limits | Action runtime limits | list(object{<br>timeout = number<br>memory = number<br>log_size = number}) | n/a | no|
| action\_publish | Action visibility | string | n/a | no |
| action\_user\_defined\_annotations | Annotation values in KEY VALUE format. | string | "[]" | no |
| action\_user\_defined\_parameters | Parameters values in KEY VALUE format. Parameter bindings included in the context passed to the trigger. | string | "[]" | no |
| trigger_name | Name of trigger. | string | n/a | yes |
| trigger\_user\_defined\_annotations | Annotation values in KEY VALUE format. | string | "[]" | no |
| trigger\_user\_defined\_parameters | Parameters values in KEY VALUE format. Parameter bindings included in the context passed to the trigger. | string | "[]" | no |
| rule_name | Name of the rule. | string | n/a | yes |

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
| action_name | The name of action |
| trigger_name | The name of trigger |
| rule_name | The name of rule |
| package_name | The name of package |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->