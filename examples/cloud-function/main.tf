#####################################################
# Cloud-Function Configuration Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
    ibmcloud_api_key=""
}

data "ibm_resource_group" "resource_group" {
  name = var.resource_group
}

module "cloud-function" {
  source = "terraform-ibm-modules/function/ibm//modules/cloud-function"

  action_name                        = var.action_name
  namespace_name                     = var.namespace_name
  resource_group_id                  = data.ibm_resource_group.resource_group.id
  provision_namespace                = var.provision_namespace
  create_package                     = var.create_package
  package_name                       = var.package_name
  package_publish                    = var.package_publish
  package_user_defined_annotations   = var.package_user_defined_annotations
  package_user_defined_parameters    = var.package_user_defined_parameters
  action_exec                        = var.action_exec
  action_limits                      = var.action_limits
  action_publish                     = var.action_publish
  action_user_defined_annotations    = var.action_user_defined_annotations
  action_user_defined_parameters     = var.action_user_defined_parameters
  trigger_name                       = var.trigger_name
  trigger_feed                       = var.trigger_feed
  trigger_user_defined_annotations   = var.trigger_user_defined_annotations
  trigger_user_defined_parameters    = var.trigger_user_defined_parameters 
  rule_name                          = var.rule_name

}
