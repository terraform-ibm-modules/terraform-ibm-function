output "name" {
  description = "Namespace name"
  value       = ( var.action == "get" ? data.ibm_function_namespace.function_namespace[0].name : ibm_function_namespace.function_namespace[0].name )
}

output "id" {
  description = "Namespace name"
  value       = ( var.action == "get" ? data.ibm_function_namespace.function_namespace[0].id : ibm_function_namespace.function_namespace[0].id )
}