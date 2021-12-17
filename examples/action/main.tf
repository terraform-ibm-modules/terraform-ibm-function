#####################################################
# IBM Cloud Function Action - Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "action" {
  source = "../.."

  is_new_namespace                = var.is_new_namespace
  namespace_name                  = var.namespace_name
  resource_group_name             = var.resource_group_name
  is_new_package                  = var.is_new_package
  is_package_enabled              = var.is_package_enabled
  package_name                    = var.package_name
  is_new_action                   = var.is_new_action
  action_name                     = var.action_name
  action_exec                     = var.action_exec
  action_limits                   = var.action_limits
  action_publish                  = var.action_publish
  action_user_defined_annotations = var.action_user_defined_annotations
  action_user_defined_parameters  = var.action_user_defined_parameters
}
