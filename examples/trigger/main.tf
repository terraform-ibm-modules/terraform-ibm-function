#####################################################
# Action Configuration Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
}

module "trigger" {
  source = "terraform-ibm-modules/function/ibm//modules/trigger"

  trigger_name             = var.trigger_name
  namespace_name           = var.namespace_name
  provision_namespace      = var.provision_namespace
  resource_group_id        = data.ibm_resource_group.resource_group.id
  feed                     = var.feed
  user_defined_parameters  = var.user_defined_parameters
  user_defined_annotations = var.user_defined_annotations
}
