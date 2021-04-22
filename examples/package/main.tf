#####################################################
# Package Configuration Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
}

module "package" {
  source = "terraform-ibm-modules/function/ibm//modules/package"

  package_name             = var.package_name
  namespace_name           = var.namespace_name
  provision_namespace      = var.provision_namespace
  resource_group_id        = data.ibm_resource_group.resource_group.id
  publish                  = var.publish
  user_defined_annotations = var.user_defined_annotations
  user_defined_parameters  = var.user_defined_parameters
  bind_package_name        = var.bind_package_name
}
