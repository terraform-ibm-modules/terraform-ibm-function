locals {
  provision_namespace = var.provision_namespace
}

resource "ibm_function_namespace" "function_namespace" {
  count             = var.provision_namespace ? 1 : 0
  name              = var.namespace_name
  description       = (var.namespace_description != null ? var.namespace_description : null)
  resource_group_id = var.resource_group_id
}

resource "ibm_function_package" "function_package" {
  name                     = var.package_name
  namespace                = var.namespace_name
  publish                  = (var.publish != null ? var.publish : false)
  user_defined_annotations = (var.user_defined_annotations != null ? var.user_defined_annotations : "[]")
  user_defined_parameters  = (var.user_defined_parameters != null ? var.user_defined_parameters : "[]")
  bind_package_name        = (var.bind_package_name != null ? var.bind_package_name : null)

  depends_on = [ibm_function_namespace.function_namespace]
}

