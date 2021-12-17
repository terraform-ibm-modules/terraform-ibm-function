#####################################################
# IBM Cloud Function Rule - Example
# Copyright 2020 IBM
#####################################################

##################################################
# Namespace Variables
##################################################
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
  description = "Resource Group Name."
  type        = string
}

##################################################
# Package Variables
##################################################
variable "is_new_package" {
  description = "Provision Package"
  type        = bool
  default     = false
}

variable "package_name" {
  description = "Package Name"
  type        = string
  default     = null
}

##################################################
# Action Variables
##################################################
variable "is_new_action" {
  description = "Provision Action"
  type        = bool
  default     = true
}

variable "action_name" {
  description = "Name of action"
  type        = string
}

variable "action_exec" {
  description = "Execution info"
  type        = list(any)
  default = [{
    kind      = "nodejs:10"
    code_path = "nodeaction.zip"
  }]
}

##################################################
# Trigger Variables
##################################################
variable "is_new_trigger" {
  description = "Provision Trigger"
  type        = bool
  default     = true
}

variable "trigger_name" {
  description = "Name of trigger."
  type        = string
}

##################################################
# Rule Variables
##################################################
variable "is_new_rule" {
  description = "Provision Rule"
  type        = bool
  default     = true
}

variable "rule_name" {
  description = "Name of rule."
  type        = string
}