# IBM Function Terraform Module

This module is used to create an IBM Cloud function with all the necesaary resources such as namespace , action, triggers and rule(Which connects the action with trigger).

## Features

- Create IAM namespace
- *Conditional creation*:
  * Create package
  * Create action
  * Create rule
  * Create trigger

## Compatibility

This module is meant for use with Terraform 0.13 or later.

## Requirements

### Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) 0.13 or later.
- [terraform-provider-ibm](https://github.com/IBM-Cloud/terraform-provider-ibm)

## Install

### Terraform

Be sure you have the correct Terraform version ( 0.13 or later), you can choose the binary here:
- https://releases.hashicorp.com/terraform/

### Terraform provider plugins

Be sure you have the compiled plugins on $HOME/.terraform.d/plugins/

- [terraform-provider-ibm](https://github.com/IBM-Cloud/terraform-provider-ibm)

## Usage

```
terraform init
```
```
terraform plan
```
```
terraform apply
```
```
terraform destroy
```

## Example Usage

```
provider "ibm" {
}

module "cloud-function" {
  source = "git::git@github.com:terraform-ibm-modules/terraform-ibm-function.git"

  ###################################################################
  # Namespace variables
  ###################################################################
  is_new_namespace    = var.is_new_namespace
  namespace_name      = var.namespace_name
  resource_group_name = var.resource_group_name

  ###################################################################
  # Package variables
  ###################################################################
  is_new_package                   = var.is_new_package
  package_name                     = var.package_name
  package_publish                  = var.package_publish
  package_user_defined_annotations = var.package_user_defined_annotations
  package_user_defined_parameters  = var.package_user_defined_parameters

  ###################################################################
  # Action variables
  ###################################################################
  is_new_action                   = var.is_new_action
  action_name                     = var.action_name
  action_exec                     = var.action_exec
  action_limits                   = var.action_limits
  action_publish                  = var.action_publish
  action_user_defined_annotations = var.action_user_defined_annotations
  action_user_defined_parameters  = var.action_user_defined_parameters

  ###################################################################
  # Trigger variables
  ###################################################################
  is_new_trigger                   = var.is_new_trigger
  trigger_name                     = var.trigger_name
  trigger_feed                     = var.trigger_feed
  trigger_user_defined_annotations = var.trigger_user_defined_annotations
  trigger_user_defined_parameters  = var.trigger_user_defined_parameters

  ###################################################################
  # Rule variables
  ###################################################################
  is_new_rule = var.is_new_rule
  rule_name   = var.rule_name
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| is_new_namespace| Option whether to provision namespace | boolean | true | no |
| resource\_group\_name | Name of the resource group | string | n/a | yes |
| namespace_name | Name of namespace | string | n/a | yes |
| namespace_description | Namespace Description | string | n/a | no |
| is_new_package | Option whether to create a new package | bool | false | no |
| is_package_enabled | Option whether to read existing pakage | bool | false | no |
| package_name | Name of package | string | n/a | no |
| package\_publish | Package visibility | string | n/a | no |
| is_new_action | Option whether to create a new action | bool | false | no |
| is_action_enabled | Option whether to read existing action | bool | false | no |
| action_name | Name of action | string | n/a | yes |
| action_exec | Execution Info | list(object{<br>image = string<br>init = string <br>code = string<br>code_path = string<br>kind = string<br>main = string<br>components = list(string)}) | n/a | yes |
| action_limits | Action runtime limits | list(object{<br>timeout = number<br>memory = number<br>log_size = number}) | n/a | no|
| action\_publish | Action visibility | string | n/a | no |
| action\_user\_defined\_annotations | Annotation values in KEY VALUE format. | string | "[]" | no |
| action\_user\_defined\_parameters | Parameters values in KEY VALUE format. Parameter bindings included in the context passed to the action | string | "[]" | no |
| is_new_trigger | Option whether to create a new trigger | bool | false | no |
| is_trigger_enabled | Option whether to read existing trigger | bool | false | no |
| trigger_name | Name of trigger | string | n/a | yes |
| trigger\_user\_defined\_annotations | Annotation values in KEY VALUE format. | string | "[]" | no |
| trigger\_user\_defined\_parameters | Parameters values in KEY VALUE format. Parameter bindings included in the context passed to the trigger | string | "[]" | no |
| is_new_rule | Option whether to create a new rule | bool | false | no |
| rule_name | Name of the rule | string | n/a | yes |

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
| namespace_id | The ID of namespace |
| namespace_name | The name of namespace |
| package_name | The name of package |
| action_name | The name of action |
| trigger_name | The name of trigger |
| rule_name | The name of rule |

## Pre-commit Hooks

Run the following command to execute the pre-commit hooks defined in `.pre-commit-config.yaml` file

  `pre-commit run -a`

We can install pre-coomit tool using

  `pip install pre-commit`

## How to input varaible values through a file

To review the plan for the configuration defined (no resources actually provisioned)

`terraform plan -var-file=./input.tfvars`

To execute and start building the configuration defined in the plan (provisions resources)

`terraform apply -var-file=./input.tfvars`

To destroy the VPC and all related resources

`terraform destroy -var-file=./input.tfvars`

All optional parameters by default will be set to null in respective example's varaible.tf file. If user wants to configure any optional paramter he has overwrite the default value.

