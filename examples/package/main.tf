#####################################################
# IBM Cloud Function Package - Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "package" {
  source = "../.."

  is_new_namespace                 = var.is_new_namespace
  namespace_name                   = var.namespace_name
  is_new_package                   = var.is_new_package
  package_name                     = var.package_name
  resource_group_name              = var.resource_group_name
  package_publish                  = var.publish
  package_user_defined_annotations = var.user_defined_annotations
  package_user_defined_parameters  = var.user_defined_parameters
}
