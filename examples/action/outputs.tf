#####################################################
# IBM Cloud Function Action - Example
# Copyright 2020 IBM
#####################################################

output "namespace_name" {
  value = module.action.namespace_name
}

output "action_name" {
  value = module.action.action_name
}