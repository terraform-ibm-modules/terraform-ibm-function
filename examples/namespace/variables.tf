#####################################################
# IBM Cloud Function Namespace - Example
# Copyright 2020 IBM
#####################################################
variable "is_new_namespace" {
  description = "Provision Namespace"
  type        = bool
  default     = true
}

variable "namespace_name" {
  description = "Name of namespace."
  type        = string
}

variable "namespace_description" {
  description = "Namespace Description."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "Resource Group name."
  type        = string
}