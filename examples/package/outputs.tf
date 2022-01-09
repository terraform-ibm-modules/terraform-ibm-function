#####################################################
# IBM Cloud Function Package - Example
# Copyright 2020 IBM
#####################################################

output "namespace_name" {
  value = module.package.namespace_name
}

output "package_name" {
  value = module.package.package_name
}