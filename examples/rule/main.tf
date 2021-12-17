#####################################################
# IBM Cloud Function Rule - Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "rule" {
  source = "../.."

  is_new_namespace    = var.is_new_namespace
  namespace_name      = var.namespace_name
  resource_group_name = var.resource_group_name
  is_new_action       = var.is_new_action
  action_name         = var.action_name
  action_exec         = var.action_exec
  is_new_trigger      = var.is_new_trigger
  trigger_name        = var.trigger_name
  is_new_rule         = var.is_new_rule
  rule_name           = var.rule_name
}
