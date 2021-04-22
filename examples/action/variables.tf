variable "action_name" {
  description = "Name of action."
  type        = string
}

variable "limits" {
  description = "Action runtime limits"
  type        = list(any)
  default     = null
}

variable "exec" {
  description = "Execution info"
  type        = list(any)
}

variable "publish" {
  description = "Action visibilty."
  type        = bool
  default     = null
}

variable "user_defined_annotations" {
  description = "Annotation values in KEY VALUE format."
  type        = string
  default     = null
}

variable "user_defined_parameters" {
  description = "Parameters values in KEY VALUE format. Parameter bindings included in the context passed to the package."
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

variable "create_package" {
  description = "Option whether to create a new package"
  type        = bool
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

