# Cloud-Function Module Example

This example illustrates how to use the `cloud-function` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| is_new_namespace| Option whether to provision namespace | boolean | false | no |
| namespace_name | Namespace to which the rule is attached | string | n/a | yes |
| resource\_group\_name | Name of the resource group | string | n/a | no |
| namespace_description | Namespace Description | string | n/a | no |
| is_new_package | Option whether to create a new package | bool | true | no |
| package_name | Name of package | string | n/a | yes |
| package\_publish | Package visibility | string | n/a | no |
| is_new_action | Option whether to create a new action | bool | true | no |
| action_name | Name of action. | string | n/a | yes |
| action_exec | Execution Info | list(object{<br>image = string<br>init = string <br>code = string<br>code_path = string<br>kind = string<br>main = string<br>components = list(string)}) | n/a | yes |
| action_limits | Action runtime limits | list(object{<br>timeout = number<br>memory = number<br>log_size = number}) | n/a | no|
| action\_publish | Action visibility | string | n/a | no |
| action\_user\_defined\_annotations | Annotation values in KEY VALUE format. | string | "[]" | no |
| action\_user\_defined\_parameters | Parameters values in KEY VALUE format. Parameter bindings included in the context passed to the trigger. | string | "[]" | no |
| is_new_trigger | Option whether to create a new trigger | bool | true | no |
| trigger_name | Name of trigger. | string | n/a | yes |
| trigger\_user\_defined\_annotations | Annotation values in KEY VALUE format. | string | "[]" | no |
| trigger\_user\_defined\_parameters | Parameters values in KEY VALUE format. Parameter bindings included in the context passed to the trigger. | string | "[]" | no |
| is_new_rule | Option whether to create a new rule | bool | true | no |
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
| namespace_name | The name of namespace |
| package_name | The name of package |
| action_name | The name of action |
| trigger_name | The name of trigger |
| rule_name | The name of rule |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.