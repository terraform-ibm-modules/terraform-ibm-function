#####################################################
# Action Configuration Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
}

module "namespace" {
  source = "terraform-ibm-modules/function/ibm//modules/namespace"

  action            = var.action
  name              = var.name
  description       = var.description
  resource_group_id = data.ibm_resource_group.resource_group.id
}
