variable "name" {
  description = "Name of namespace."
  type        = string
}

variable "description" {
  description = "Namespace Description."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "Resource Group name."
  type        = string
}

variable "action" {
  description = "Create a new namespace or get details of existing namespace - Enter create or get"
  type        = string
  default     = "create"

  validation {
    condition     = contains(["create", "get"], var.action)
    error_message = "Allowed values for action are \"create\", \"get\"."
  }
}