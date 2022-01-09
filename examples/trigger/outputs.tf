#####################################################
# IBM Cloud Function Trigger - Example
# Copyright 2020 IBM
#####################################################

output "namespace_name" {
  value = module.trigger.namespace_name
}

output "trigger_name" {
  value = module.trigger.trigger_name
}