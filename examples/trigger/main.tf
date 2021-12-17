#####################################################
# IBM Cloud Function Trigger - Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "trigger" {
  source = "../.."

  namespace_name                   = var.namespace_name
  is_new_namespace                 = var.is_new_namespace
  resource_group_name              = var.resource_group_name
  is_new_trigger                   = var.is_new_trigger
  trigger_name                     = var.trigger_name
  trigger_feed                     = var.trigger_feed
  trigger_user_defined_parameters  = var.trigger_user_defined_parameters
  trigger_user_defined_annotations = var.trigger_user_defined_annotations
}
