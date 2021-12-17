#####################################################
# IBM Cloud Function
# Copyright 2021 IBM
#####################################################

##################################################
# Namepspace Variables
##################################################
variable "is_new_namespace" {
  description = "Option whether to provision namespace "
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
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

##################################################
# Package Variables
##################################################
variable "is_new_package" {
  description = "Option whether to create a new package"
  type        = bool
  default     = false
}

variable "is_package_enabled" {
  description = "Option whether to read existing package"
  type        = bool
  default     = false
}

variable "package_name" {
  description = "Package Name"
  type        = string
  default     = null
}

variable "package_publish" {
  description = "Package visibilty."
  type        = bool
  default     = null
}

variable "package_user_defined_annotations" {
  description = "Annotation values in KEY VALUE format."
  type        = string
  default     = null
}

variable "package_user_defined_parameters" {
  description = ";/"
  type        = string
  default     = null
}

variable "bind_package_name" {
  description = "Name of package to be binded."
  type        = string
  default     = null
}

##################################################
# Action Variables
##################################################
variable "is_new_action" {
  description = "Option whether to create a new action"
  type        = bool
  default     = false
}

variable "is_action_enabled" {
  description = "Option whether to read existing action"
  type        = bool
  default     = false
}

variable "action_name" {
  description = "Name of action."
  type        = string
  default     = null
}

variable "action_limits" {
  description = "Action runtime limits"
  type        = list(any)
  default     = null
}

variable "action_exec" {
  description = "Execution info"
  type        = list(any)
  default     = [{}]
}

variable "action_publish" {
  description = "Action visibilty."
  type        = bool
  default     = null
}

variable "action_user_defined_annotations" {
  description = "Annotation values in KEY VALUE format."
  type        = string
  default     = null
}

variable "action_user_defined_parameters" {
  description = "Parameters values in KEY VALUE format. Parameter bindings included in the context passed to the package."
  type        = string
  default     = null
}

##################################################
# Trigger Variables
##################################################
variable "is_new_trigger" {
  description = "Option whether to create a new trigger"
  type        = bool
  default     = false
}

variable "is_trigger_enabled" {
  description = "Option whether to read existing trigger"
  type        = bool
  default     = false
}

variable "trigger_name" {
  description = "Name of Trigger."
  type        = string
  default     = null
}

variable "trigger_feed" {
  description = "Trigger feed"
  type        = list(any)
  default     = null
}

variable "trigger_user_defined_annotations" {
  description = "Annotation values in KEY VALUE format."
  type        = string
  default     = null
}

variable "trigger_user_defined_parameters" {
  description = "Parameters values in KEY VALUE format. Parameter bindings included in the context passed to the package."
  type        = string
  default     = null
}

##################################################
# Resource Group Variables
##################################################
variable "is_new_rule" {
  description = "Option whether to create a new rule"
  type        = bool
  default     = false
}

variable "rule_name" {
  description = "Name of rule."
  type        = string
  default     = null
}

