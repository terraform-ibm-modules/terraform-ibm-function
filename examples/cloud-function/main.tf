#####################################################
# Cloud-Function Configuration Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "cloud-function" {
  source = "../.."

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
