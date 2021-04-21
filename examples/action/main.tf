#####################################################
# Action Configuration Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
}

module "action" {
  source = "terraform-ibm-modules/function/ibm//modules/action"

  action_name              = var.action_name
  namespace_name           = var.namespace_name
  provision_namespace      = var.provision_namespace
  create_package           = var.create_package
  package_name             = var.package_name
  resource_group_id        = data.ibm_resource_group.resource_group.id
  exec                     = var.exec
  limits                   = var.limits
  publish                  = var.publish
  user_defined_annotations = var.user_defined_annotations
  user_defined_parameters  = var.user_defined_parameters
}
