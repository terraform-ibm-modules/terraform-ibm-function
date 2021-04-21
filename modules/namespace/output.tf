output "name" {
  description = "Namespace name"
  value       = (var.action == "get" ? (length(data.ibm_function_namespace.function_namespace) > 0 ? data.ibm_function_namespace.function_namespace[0].name : null) : ibm_function_namespace.function_namespace[0].name)
}

output "id" {
  description = "Namespace name"
  value       = (var.action == "get" ? (length(data.ibm_function_namespace.function_namespace) > 0 ? data.ibm_function_namespace.function_namespace[0].id : null) : ibm_function_namespace.function_namespace[0].id)
}