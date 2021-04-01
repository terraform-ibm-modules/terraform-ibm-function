data "ibm_function_namespace" "function_namespace" {
  count = ( var.action == "get" ? 1 : 0 )
  name = var.name
}

resource "ibm_function_namespace" "function_namespace" {
  count = ( var.action == "create" ? 1 : 0 )
  name = var.name
  description = ( var.description != null ? var.description : null )
  resource_group_id = var.resource_group_id
}