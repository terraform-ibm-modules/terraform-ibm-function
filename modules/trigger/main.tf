locals {
  provision_namespace = var.provision_namespace
}

resource "ibm_function_namespace" "function_namespace" {
  count = var.provision_namespace ? 1 : 0
  name = var.namespace_name
  description = ( var.namespace_description != null ? var.namespace_description : null )
  resource_group_id = var.resource_group_id
}

resource "ibm_function_trigger" "function_trigger" {
  name         = var.trigger_name
  namespace    = var.namespace_name
  dynamic "feed" {
    for_each = ( var.feed != null ? var.feed : null )
    content {
      name = feed.value.name
      parameters = ( lookup(feed.value, "parameters", null) != null ? feed.value.parameters : "[]" )
    }
  }
  user_defined_annotations  = ( var.user_defined_annotations != null ? var.user_defined_annotations : "[]")
  user_defined_parameters = ( var.user_defined_parameters !=null ? var.user_defined_parameters : "[]")
}
