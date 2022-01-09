#####################################################
# IBM Cloud Function Action - Example
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

variable "is_package_enabled" {
  description = "Enabled for reading existing package details"
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