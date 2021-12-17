#####################################################
# IBM Cloud Function - periodic reminder slack example
# Copyright 2020 IBM
#####################################################

output "namespace_name" {
  value = module.openwhisk-slack-package.namespace_name
}

output "package_name" {
  value = module.openwhisk-slack-package.package_name
}

output "action_name" {
  value = module.send-message-action.action_name
}

output "trigger_name" {
  value = module.periodic-reminder-slack-trigger.trigger_name
}

output "rule_name" {
  value = module.periodic-reminder-slack-rule.rule_name
}