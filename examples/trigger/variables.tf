variable "trigger_name" {
  description = "Name of Trigger."
  type        = string
}

variable "feed" {
  description = "Trigger feed"
  type        = list(any)
  default     = null
}

variable "user_defined_annotations" {
  description = "Annotation values in KEY VALUE format."
  type        = string
  default     = null
}

variable "user_defined_parameters" {
  description = "Parameters values in KEY VALUE format. Parameter bindings included in the context passed to the trigger."
  type        = string
  default     = null
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

variable "provision_namespace" {
  description = "Provision Namespace"
  type        = bool
  default     = false
}
