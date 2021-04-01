output "name" {
  description = "Action name"
  value       = ibm_function_action.function_action.name
}

output "package_name" {
  description = "package name"
  value       = ( var.create_package ? ibm_function_package.function_package[0].name : var.package_name )
}
