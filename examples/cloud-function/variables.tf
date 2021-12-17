#####################################################
# Cloud-Function Configuration Example
# Copyright 2020 IBM
#####################################################

###################################################################
# Namespace variables
###################################################################
variable "is_new_namespace" {
  description = "Option whether to create a new namespace"
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
  description = "Resource Group"
  type        = string
}

###################################################################
# Package variables
###################################################################
variable "is_new_package" {
  description = "Option whether to create a new package"
  type        = bool
  default     = true
}

variable "package_name" {
  description = "Package Name"
  type        = string
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
  description = "Parameters values in KEY VALUE format. Parameter bindings included in the context passed to the package."
  type        = string
  default     = null
}

###################################################################
# Action variables
###################################################################
variable "is_new_action" {
  description = "Option whether to create a new action"
  type        = bool
  default     = true
}

variable "action_name" {
  description = "Name of action."
  type        = string
}

variable "action_limits" {
  description = "Action runtime limits"
  type        = list(any)
  default = [{
    log_size = 5
    timeout  = 50000
    memory   = 256
  }]
}

variable "action_exec" {
  description = "Execution info"
  type        = list(any)
  default = [{
    kind      = "nodejs:10"
    code_path = "nodeaction.zip"
  }]
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

###################################################################
# Trigger variables
###################################################################
variable "is_new_trigger" {
  description = "Option whether to create a new trigger"
  type        = bool
  default     = true
}

variable "trigger_name" {
  description = "Name of Trigger."
  type        = string
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

###################################################################
# Rule variables
###################################################################
variable "is_new_rule" {
  description = "Option whether to create a new rule"
  type        = bool
  default     = true
}

variable "rule_name" {
  description = "Name of rule."
  type        = string
}