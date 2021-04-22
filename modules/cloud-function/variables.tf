variable "action_name" {
  description = "Name of action."
  type        = string
}

variable "action_limits" {
  description = "Action runtime limits"
  type        = list(any)
  default     = null
}

variable "action_exec" {
  description = "Execution info"
  type        = list(any)
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

variable "resource_group_id" {
  description = "Resource Group ID."
  type        = string
  default     = null
}

variable "provision_namespace" {
  description = "Provision Namespace"
  type        = bool
  default     = false
}

variable "create_package" {
  description = "Option whether to create a new package"
  type        = bool
  default     = true
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
  description = "Parameters values in KEY VALUE format. Parameter bindings included in the context passed to the package."
  type        = string
  default     = null
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

variable "rule_name" {
  description = "Name of rule."
  type        = string
}

