locals {
  provision_namespace = var.provision_namespace
}

resource "ibm_function_namespace" "function_namespace" {
  count = var.provision_namespace ? 1 : 0
  name = var.namespace_name
  description = ( var.namespace_description != null ? var.namespace_description : null )
  resource_group_id = var.resource_group_id
}


resource "ibm_function_rule" "function_rule" {
  name         = var.rule_name
  namespace    = var.namespace_name
  trigger_name = var.trigger_name
  action_name  = var.action_name
}
