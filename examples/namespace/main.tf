#####################################################
# IBM Cloud Function Namespace - Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "namespace" {
  source = "../.."

  is_new_namespace      = var.is_new_namespace
  namespace_name        = var.namespace_name
  namespace_description = var.namespace_description
  resource_group_name   = var.resource_group_name
}
