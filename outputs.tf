#####################################################
# IBM Cloud Function
# Copyright 2021 IBM
#####################################################

output "namespace_id" {
  value = var.is_new_namespace ? concat(ibm_function_namespace.function_namespace.*.id, [""])[0] : concat(data.ibm_function_namespace.function_namespace.*.id, [""])[0]
}

output "namespace_name" {
  value = var.is_new_namespace ? concat(ibm_function_namespace.function_namespace.*.name, [""])[0] : concat(data.ibm_function_namespace.function_namespace.*.name, [""])[0]
}

output "package_name" {
  value = var.is_new_package ? concat(ibm_function_package.function_package.*.name, [""])[0] : concat(data.ibm_function_package.function_package.*.name, [""])[0]
}

output "action_name" {
  value = var.is_new_action ? concat(ibm_function_action.function_action.*.name, [""])[0] : concat(data.ibm_function_action.function_action.*.name, [""])[0]
}

output "trigger_name" {
  value = var.is_new_trigger ? concat(ibm_function_trigger.function_trigger.*.name, [""])[0] : concat(data.ibm_function_trigger.function_trigger.*.name, [""])[0]
}

output "rule_name" {
  value = var.is_new_rule ? concat(ibm_function_rule.function_rule.*.name, [""])[0] : ""
}