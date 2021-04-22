variable "rule_name" {
  description = "Name of rule."
  type        = string
}

variable "trigger_name" {
  description = "Name of trigger."
  type        = string
}

variable "action_name" {
  description = "Name of action"
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