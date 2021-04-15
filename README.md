# IBM Function Terraform Module

This is a collection of modules that make it easier to provision Function resources on IBM Cloud Platform:
* [namespace](modules/namespace)
* [package](modules/package)
* [action](modules/action)
* [rule](modules/rule)
* [trigger](modules/trigger)
* [cloud-function](modules/cloud-function)

## Compatibility 

This module is meant for use with Terraform 0.13. 

## Usage

Full examples are in the [examples](./examples/) folder, but basic usage is as follows for creation of namespace and action :

```hcl
provider "ibm" {
}

data "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
}

module "namespace" {
  source  = "terraform-ibm-modules/function/ibm//modules/namespace"

  name              = var.name
  tags              = var.tags
  description       = var.description
  resource_group_id = data.ibm_resource_group.resource_group.id
}

```

Creating action:

```hcl
provider "ibm" {
}

data "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
}

module "action" {
  source = "terraform-ibm-function/function/ibm//modules/action"

  action_name         = var.action_name
  namespace_name      = var.namespace_name
  provision_namespace = true
  resource_group_id   = data.ibm_resource_group.resource_group.id
  
  exec = [{
    main = var.main
    kind = var.kind
    code_path = var.code_path
  }]

  limits = [{
    timeout = var.timeout
  }]

}
```
## NOTE: 

If we want to make use of a particular version of module, then set the argument "version" to respective module version.

## Requirements

### Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) 0.13
- [terraform-provider-ibm](https://github.com/IBM-Cloud/terraform-provider-ibm) 

## Install

### Terraform

Be sure you have the correct Terraform version (0.13), you can choose the binary here:
- https://releases.hashicorp.com/terraform/

### Terraform plugins

Be sure you have the compiled plugins on $HOME/.terraform.d/plugins/

- [terraform-provider-ibm](https://github.com/IBM-Cloud/terraform-provider-ibm) 

## How to input varaible values through a file

To review the plan for the configuration defined (no resources actually provisioned)

`terraform plan -var-file=./input.tfvars`

To execute and start building the configuration defined in the plan (provisions resources)

`terraform apply -var-file=./input.tfvars`

To destroy the VPC and all related resources

`terraform destroy -var-file=./input.tfvars`

All optional parameters by default will be set to null in respective example's varaible.tf file. If user wants to configure any optional paramter he has overwrite the default value.

## Note

All optional fields should be given value `null` in respective resource varaible.tf file. User can configure the same by overwriting with appropriate values.