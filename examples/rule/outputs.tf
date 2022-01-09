#####################################################
# IBM Cloud Function Package - Example
# Copyright 2020 IBM
#####################################################

output "namespace_name" {
  value = module.rule.namespace_name
}

output "action_name" {
  value = module.rule.action_name
}

output "trigger_name" {
  value = module.rule.trigger_name
}

output "rule_name" {
  value = module.rule.rule_name
}