#####################################################
# Cloud-Function Configuration Example
# Copyright 2020 IBM
#####################################################

output "namespace_name" {
  value = module.cloud-function.namespace_name
}

output "package_name" {
  value = module.cloud-function.package_name
}

output "action_name" {
  value = module.cloud-function.action_name
}

output "trigger_name" {
  value = module.cloud-function.trigger_name
}

output "rule_name" {
  value = module.cloud-function.rule_name
}