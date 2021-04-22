#####################################################
# Action Configuration Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
}

module "rule" {
  source = "terraform-ibm-modules/function/ibm//modules/rule"

  rule_name           = var.rule_name
  namespace_name      = var.namespace_name
  provision_namespace = var.provision_namespace
  resource_group_id   = data.ibm_resource_group.resource_group.id
  trigger_name        = var.trigger_name
  action_name         = var.action_name
}
